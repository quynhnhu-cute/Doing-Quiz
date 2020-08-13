/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhunnq.Users.UserCreateErrors;
import nhunnq.Users.UsersDAO;
import nhunnq.Users.UsersDTO;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author USER
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    private final String REGISTER_PAGE = "register.jsp";
    private final String LOGIN_PAGE = "login.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(RegisterServlet.class);
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("txtEmail");
        String fullname = request.getParameter("txtFullname");
        String password = request.getParameter("txtPassword");
        String passConfirm = request.getParameter("txtPasswordConfirm");
        String encryptPass = DigestUtils.sha256Hex(passConfirm);
        boolean foundError = false;
        String url = REGISTER_PAGE;
        UserCreateErrors errors = new UserCreateErrors();
        try{
            //1. Check validation for user's errors
            if(email.trim().length() < 12 || email.trim().length() > 50){
                foundError = true;
                errors.setUsernameLengthError("Email must be from 12 to 50 characters");  
            }   else if(!email.trim().matches("\\w{1,15}[@]\\w{1,6}[.]\\w{1,6}([.]\\w{1,6}){0,1}")){
                foundError = true;
                errors.setUsernameNotValid("Email is not valid");
            }
            if(fullname.trim().length() < 3 || fullname.trim().length() > 50){
                foundError = true;
                errors.setFullnameLengthError("Fullname must be from 3 to 50 characters");
            }
            if(password.trim().length() < 3 || password.trim().length() > 10){
                foundError = true;
                errors.setPasswordLengthError("Password must be from 3 to 10 characters");
            } else if(!passConfirm.trim().matches(password)){
                foundError = true;
                errors.setPasswordNotMatchingError("Password confirm must be the same as password");
            }
            //2. Handle errors from user
            if(foundError){
                request.setAttribute("CREATEERROR", errors);
            }else{
                UsersDTO user = new UsersDTO(email, fullname, encryptPass, false, 3);
                UsersDAO users = new UsersDAO();
                try {
                    boolean insert = users.insertAccount(user);
                    if(insert){
                        url = LOGIN_PAGE;
                    }
                } catch (NamingException ex) {
                    LOGGER.fatal("RegisterServlet_NamingException: " + ex.getMessage());
                } catch (SQLException ex) {
                    LOGGER.fatal("RegisterServlet_SQLException: " + ex.getMessage());
                    if(ex.getMessage().contains("duplicate")){
                        errors.setUsernameDuplicatedError("This email is already exist!");
                        request.setAttribute("CREATEERROR", errors);
                    }
                }
            }
        }finally{
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

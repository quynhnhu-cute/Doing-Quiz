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
import javax.servlet.http.HttpSession;
import nhunnq.Users.UsersDAO;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author USER
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private final String LOGIN_PAGE = "login.jsp";
    private final String ADMIN_PAGE = "admin.jsp";
    private final String STUDENT_PAGE = "LoadSubjectServlet";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(LoginServlet.class);
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
        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String encryptPass = DigestUtils.sha256Hex(password);
        String url = LOGIN_PAGE;
        String message = "Your username or password is not correct";
        HttpSession session = request.getSession();
        try{
            UsersDAO dao = new UsersDAO();
            try {
                String role = dao.checkLogin(username, encryptPass);
               
               
                if(role != null){
                    String fullName = dao.getFullName(username);
                    
                    session.setAttribute("FULLNAME", fullName);
                    session.setAttribute("EMAIL", username);
                }
                if(role == null){
                    request.setAttribute("LOGINFAIL", message);
                }
                else if(role.equals("Admin")){
                    url = ADMIN_PAGE;
                    session.setAttribute("ADMIN", role);
                }else if(role.equals("Student")){
                    url = STUDENT_PAGE;
                    session.setAttribute("STUDENT", role);
                    
                }
            } catch (SQLException ex) {
                LOGGER.fatal("LoginServlet_SQLException: " + ex.getMessage());
            } catch (NamingException ex) {
                LOGGER.fatal("LoginServlet_NamingExcetion: " + ex.getMessage());
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

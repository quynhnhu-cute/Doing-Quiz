/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nhunnq.Subject.SubjectDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "LoadSubjectServlet", urlPatterns = {"/LoadSubjectServlet"})
public class LoadSubjectServlet extends HttpServlet {

    private final String INSERT_PAGE = "insert.jsp";
    private final String STUDENT_PAGE = "student.jsp";
    private final String LOGIN_PAGE = "login.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(LoadSubjectServlet.class);

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
        String url = INSERT_PAGE;

        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                String student = (String) session.getAttribute("STUDENT");
                if (student != null) {
                    url = STUDENT_PAGE;
                }
                SubjectDAO subjects = new SubjectDAO();
                try {
                    List<String> subList = subjects.getSubjectList();
                    if (subList.size() > 0) {
                        request.setAttribute("SUBLIST", subList);
//                    request.setAttribute("ERROR", request.getAttribute("ERROR"));
                    }
                } catch (NamingException ex) {
                    LOGGER.fatal("LoadSubjectServlet_NamingException: " + ex.getMessage());
                } catch (SQLException ex) {
                    LOGGER.fatal("LoadSubjectServlet_SQLException: " + ex.getMessage());
                }
            }else{
                url = LOGIN_PAGE;
            }

        } finally {
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

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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhunnq.Questions.QuestionsDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {
    private final String DELETE_FAIL = "error.html";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(DeleteServlet.class);
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
        String url = DELETE_FAIL;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String quesId = request.getParameter("questionId").trim();
        int id = Integer.parseInt(quesId);
        String subject = request.getParameter("txtLastQuesSubject").trim();
        String quesName = request.getParameter("txtLastQuesContent").trim();
        String status = request.getParameter("txtLastStatus").trim();
        QuestionsDAO questions = new QuestionsDAO();
        try{
            try {
                boolean delete = questions.deleteQuesByStatus(id);
                if(delete){
                    url = "DispatcherController"
                            + "?btnAction=Search"
                            + "&txtSubject=" + subject
                            + "&txtQuestionContent=" +quesName
                            + "&statusDropDown=" + status;
                }
            } catch (NamingException ex) {
                LOGGER.fatal("DeleteServlet_NamingException: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("DeleteServlet_SQLException: " + ex.getMessage());
            }
        }finally{
            response.sendRedirect(url);
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

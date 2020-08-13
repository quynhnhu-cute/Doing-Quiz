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
import nhunnq.TestQuestions.TestQuestionsDAO;
import nhunnq.TestQuestions.TestQuestionsDTO;

/**
 *
 * @author USER
 */
@WebServlet(name = "ViewDetailsHistoryServlet", urlPatterns = {"/ViewDetailsHistoryServlet"})
public class ViewDetailsHistoryServlet extends HttpServlet {
    private final String DETAILS_PAGE = "detailsHistory.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(ViewDetailsHistoryServlet.class);
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
        String url = DETAILS_PAGE;
        int testId = Integer.parseInt(request.getParameter("testId").trim());
        TestQuestionsDAO details = new TestQuestionsDAO();
        try{
            try {
                List<TestQuestionsDTO> detailList = details.getListQues(testId);
                if(detailList != null){
                    request.setAttribute("DETAILS", detailList);
                }
            } catch (NamingException ex) {
                LOGGER.fatal("ViewDetailsHistoryServlet_NamingException: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("ViewDetailsHistoryServlet_SQLException: " + ex.getMessage());
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

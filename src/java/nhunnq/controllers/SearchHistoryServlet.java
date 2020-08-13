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
import nhunnq.Tests.TestsDAO;
import nhunnq.Tests.TestsDTO;

/**
 *
 * @author USER
 */
@WebServlet(name = "SearchHistoryServlet", urlPatterns = {"/SearchHistoryServlet"})
public class SearchHistoryServlet extends HttpServlet {
    private static final String SHOWING_PAGE = "history.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(SearchHistoryServlet.class);
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
        String url = SHOWING_PAGE;
        HttpSession session = request.getSession(false);
        String email = (String)session.getAttribute("EMAIL");
        String subject = request.getParameter("txtSubject");
        
        TestsDAO dao = new TestsDAO();
        if(subject == null){
            subject = "";
        }
        String subId = request.getParameter("txtSubId");
        System.out.println(subId);
        if(subId == null){
            subId = "";
        }
       
        try{
            try {
                int count = dao.getNumberOfSearchList(subject,email,subId);
                int maxNumber = (int)Math.ceil((double) count/5);
                request.setAttribute("PAGELIMIT", maxNumber);
                int currentNumber;
                String current = request.getParameter("numberPaging");
                
                if(current != null){
                    currentNumber = Integer.parseInt(request.getParameter("numberPaging").trim());
                    
                } else{
                    currentNumber = 1;
                }       
                System.out.println("curent: " +currentNumber);
                List<TestsDTO> listTest = dao.searchBySubject(subject, email, subId, currentNumber);
                
                if (listTest != null) {
                    request.setAttribute("SEARCHLIST", listTest);
                    
                }
                
            } catch (NamingException ex) {
                LOGGER.fatal("SearchHistoryServlet_NamingException: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("SearchHistoryServlet_SQLException: " + ex.getMessage());
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

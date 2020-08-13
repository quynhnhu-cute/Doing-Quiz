/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class DispatcherController extends HttpServlet {
    
    private final String LOGIN_PAGE = "login.jsp";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String REGISTER_SERVLET = "RegisterServlet";
    private final String SEARCH_SERVLET = "SearchServlet";
    private final String LOAD_SUBJECT_SERVLET = "LoadSubjectServlet";
    private final String UPDATE_SERVLET = "UpdateServlet";
    private final String DELETE_SERVLET = "DeleteServlet";
    private final String INSERT_SERVLET = "InsertServlet";
    private final String GET_QUESTION_SERVLET = "GetQuestionServlet";
    private final String PROCESS_QUIZ_SERVLET = "ProccessQuizServlet";
    private final String SUBMIT_QUIZ_SERVLET = "SubmitQuizServlet";
    private final String LOAD_NEXT_QUESTION_SERVLET = "LoadNextQuestionServlet";
    private final String LOAD_PREVIOUS_QUESTION_SERVLET ="LoadPreviousQuestion";
    private final String LOGOUT_SERVLET = "LogoutServet";
    private final String VIEW_HISTORY_SERVLET = "ViewHistoryServlet";
    private final String VIEW_HISTORY_PAGE = "history.jsp";
    private final String SEARCH_HISTORY_SERVLET = "SearchHistoryServlet";
    private final String DETAILS_HISTORY_SERVLET = "ViewDetailsHistoryServlet";
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
        String button = request.getParameter("btnAction");
        
        String url = LOGIN_PAGE;
        try{
            if(button == null){
                
            }else if(button.equals("Login")){
                
                url = LOGIN_SERVLET;
            }else if(button.equals("Register")){
                url = REGISTER_SERVLET;
            }else if(button.equals("Search")){
                url = SEARCH_SERVLET;
            } else if(button.equals("Insert New Question")){
//                HttpSession session = request.getSession();
//                session.removeAttribute("ERROR");
                url = LOAD_SUBJECT_SERVLET;
            } else if(button.equals("Update")){
                url = GET_QUESTION_SERVLET;
            } else if(button.equals("Delete")){
                url = DELETE_SERVLET;
            } else if(button.equals("Add")){
                url = INSERT_SERVLET;
            } else if(button.equals("Update Question")){
                url = UPDATE_SERVLET;
            }else if(button.equals("Start Quiz")){
                url = PROCESS_QUIZ_SERVLET;
            }else if(button.equals("Submit")){
                url = SUBMIT_QUIZ_SERVLET;
            } else if(button.equals("Next")){
                url = LOAD_NEXT_QUESTION_SERVLET;
            } else if(button.equals("Previous")){
                url = LOAD_PREVIOUS_QUESTION_SERVLET;
            } else if(button.equals("Logout")){
                url = LOGOUT_SERVLET;
            } else if(button.equals("View History")){
                url = VIEW_HISTORY_PAGE;
            } else if(button.equals("View All")){
                
                url = VIEW_HISTORY_SERVLET;
            } else if(button.equals("Search History")){
                url = SEARCH_HISTORY_SERVLET;
            } else if(button.equals("View Details")){   
                System.out.println("details");
                url = DETAILS_HISTORY_SERVLET;
            }
            
        }
        finally{
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

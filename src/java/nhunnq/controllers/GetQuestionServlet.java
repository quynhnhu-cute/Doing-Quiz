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
import nhunnq.Answer.AnswerDAO;
import nhunnq.Answer.AnswersDTO;
import nhunnq.Questions.QuestionCart;
import nhunnq.Questions.QuestionCreateErrors;
import nhunnq.Questions.QuestionsDAO;
import nhunnq.Questions.QuestionsDTO;
import nhunnq.Subject.SubjectDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "GetQuestionServlet", urlPatterns = {"/GetQuestionServlet"})
public class GetQuestionServlet extends HttpServlet {
    private final String UPDATE_PAGE = "update.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(GetQuestionServlet.class);
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
        String url = UPDATE_PAGE;
        String questionId = (String)request.getAttribute("QUESID");
        
        if(questionId == null){
            questionId = request.getParameter("quesId").trim();
        }
        
        int id = Integer.parseInt(questionId);
        System.out.println(id);
        try{
            QuestionsDAO questions = new QuestionsDAO();
            AnswerDAO answers = new AnswerDAO();
            SubjectDAO subjects = new SubjectDAO();
            List<AnswersDTO> ansList ;
            try {
               
                QuestionsDTO question = questions.getQuesForUpdating(id);
                 answers.getAnswerByQuesId(id);
                 ansList = answers.getAnswerList();
                 QuestionCart cart = new QuestionCart(id, ansList.get(0).getAnsContent(), ansList.get(1).getAnsContent(), ansList.get(2).getAnsContent(), ansList.get(3).getAnsContent());
                 List<String> subList = subjects.getSubjectList();
                 request.setAttribute("QUESTION", question);
                 request.setAttribute("ANSWER", cart);
                 request.setAttribute("SUBJECTS", subList);
                 QuestionCreateErrors errors = (QuestionCreateErrors) request.getAttribute("ERROR");
                 request.setAttribute("ERROR", errors);
            } catch (NamingException ex) {
                LOGGER.fatal("GetQuestionServlet_NamingException: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("GetQuestionServlet_SQLException: " + ex.getMessage());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nhunnq.Answer.AnswerDAO;
import nhunnq.Answer.AnswersDTO;
import nhunnq.Questions.QuestionCreateErrors;
import nhunnq.Questions.QuestionsDAO;
import nhunnq.Questions.QuestionsDTO;
import nhunnq.Subject.SubjectDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "InsertServlet", urlPatterns = {"/InsertServlet"})
public class InsertServlet extends HttpServlet {
    private final String INSERT_FAIL_PAGE = "LoadSubjectServlet";
    private final String INSERT_SUCCESS = "admin.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(InsertServlet.class);
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
        String url = INSERT_FAIL_PAGE;
        PrintWriter out = response.getWriter();
        String questionContent = request.getParameter("txtQuestionContent1");
        String answerA = request.getParameter("txtAnsA");
        String answerB = request.getParameter("txtAnsB");
        String answerC = request.getParameter("txtAnsC");
        String answerD = request.getParameter("txtAnsD");
        String subject = request.getParameter("dropDownSub");
        String correctAns = request.getParameter("txtAnsCorrect");
        
        boolean foundError = false;
        QuestionsDAO questions = new QuestionsDAO();
        AnswerDAO answers = new AnswerDAO();
        SubjectDAO subjects = new SubjectDAO();
        int quesId = 0;
        try{
            
            try {
                quesId = questions.getQuesIdByName(questionContent.trim());
            } catch (NamingException ex) {
                LOGGER.fatal("InsertServlet_NamingExceptionForFindingQuesId: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("InsertServlet_SQLExceptionForFindingQuesId: " + ex.getMessage());
            }
            
            QuestionCreateErrors errors = new QuestionCreateErrors();
            if(quesId != 0){
                foundError = true;
                errors.setQuestionAlreadyExisted("This question is already existed");
            }

            if(questionContent.length() < 3 || questionContent.length() > 500){
                foundError = true;
                errors.setQuesContentLengthError("Question content must be from 3 to 500 characters");
            }
            if(answerA.length() < 3 || answerA.length() > 500){
                foundError = true;
                errors.setAnswerALengthError("Answer A must be from 3 to 500 characters");
            }
            if(answerB.length() < 3 || answerB.length() > 500){
                foundError = true;
                errors.setAnswerBLengthError("Answer B must be from 3 to 500 characters");
            }
            if(answerC.length() < 3 || answerC.length() > 500){
                foundError = true;
                errors.setAnswerCLengthError("Answer C must be from 3 to 500 characters");
            }
            if(answerD.length() < 3 || answerD.length() > 500){
                foundError = true;
                errors.setAnswerDLengthError("Answer D must be from 3 to 500 characters");
            }
            
            if((!correctAns.trim().equalsIgnoreCase("A")) && (!correctAns.trim().equalsIgnoreCase("B")) && (!correctAns.trim().equalsIgnoreCase("C"))&& (!correctAns.trim().equalsIgnoreCase("D"))){
                foundError = true;
                errors.setCorrectAnsValid("Answer must be A or B or C or D");}
//            }else{
//                foundError = true;
//                errors.setCorrectAnsValid("Answer must be A or B or C or D");
//            }
            if(foundError){
//                HttpSession session = request.getSession();
//                session.setAttribute("ERROR", errors);

                request.setAttribute("ERROR", errors);
                
            }else{
                try {
                    String[] ansId = {"A", "B" ,"C" ,"D"};
                    String[] answer = {answerA, answerB, answerC, answerD};
                    Timestamp now = Timestamp.valueOf(LocalDateTime.now()); 
                    int subId = subjects.getSubIdByName(subject);
                    boolean insertAns = false;
                    
                    if(subId > 0){
                       
                        QuestionsDTO ques = new QuestionsDTO(questionContent, correctAns.toUpperCase(), subId, 1, now);
                        boolean insertQues = questions.insertQuestion(ques);
                        int idQuesInserted = questions.getQuesIdByName(questionContent);
                        for (int i = 0; i < 4; i++) {
                            AnswersDTO ans = new AnswersDTO(ansId[i], answer[i], idQuesInserted);
                            insertAns = answers.insertAnswer(ans);
                        }
                        if (insertQues == true && insertAns == true) {
                            url = INSERT_SUCCESS;
                                    
                        }
                    }
                    

                } catch (SQLException ex) {
                    LOGGER.fatal("InsertServlet_SQLException: " + ex.getMessage());
                } catch (NamingException ex) {
                    LOGGER.fatal("InsertServlet_NamingException: " + ex.getMessage());
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

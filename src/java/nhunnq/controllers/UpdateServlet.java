/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
import nhunnq.Questions.QuestionCreateErrors;
import nhunnq.Questions.QuestionsDAO;
import nhunnq.Questions.QuestionsDTO;
import nhunnq.Subject.SubjectDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {
    private final String UPDATE_FAIL_PAGE = "GetQuestionServlet";
    private final String UPDATE_SUCCESS_PAGE = "admin.jsp";
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(UpdateServlet.class);
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
        String quesContent = request.getParameter("txtQuesContent").trim();
        String answerA = request.getParameter("txtAnsA").trim();
        String answerB = request.getParameter("txtAnsB").trim();
        String answerC = request.getParameter("txtAnsC").trim();
        String answerD = request.getParameter("txtAnsD").trim();
        String correctAns = request.getParameter("txtCorrectAns").toUpperCase().trim();
        String subject = request.getParameter("dropDownSub").trim();
        String status = request.getParameter("dropDownStatus").trim();
        int statusId ;
        if(status.equals("Active")){
            statusId = 1;
        }else{
            statusId = 2;
        }
        String quesId = request.getParameter("txtQuesId").trim();
        int idQues = Integer.parseInt(quesId);
        boolean foundError = false;
        String url = UPDATE_FAIL_PAGE;
        QuestionCreateErrors errors = new QuestionCreateErrors();
        SubjectDAO subjects = new SubjectDAO();
        QuestionsDAO questions = new QuestionsDAO();
        AnswerDAO answers = new AnswerDAO();
        try{
            if(quesContent.length() < 3 || quesContent.length() > 500){
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
            if((!correctAns.equals("A")) && (!correctAns.equals("B")) && (!correctAns.equals("C")) && (!correctAns.equals("D"))){
                foundError =true;
                errors.setCorrectAnsValid("Answer must be A or B or C or D");
            }
            if(foundError){
                request.setAttribute("UPDATEERROR", errors);
                request.setAttribute("QUESID", quesId);
                url = UPDATE_FAIL_PAGE;
            }else{
                try {
                    int subId = subjects.getSubIdByName(subject);
                    QuestionsDTO question = new QuestionsDTO(idQues, quesContent, correctAns, subId, statusId);
                    boolean updateQues = questions.updateQuestion(question);
                    boolean updateAns = false;
                    AnswersDTO aAnswer = new AnswersDTO("A", answerA, idQues);
                    AnswersDTO bAnswer = new AnswersDTO("B", answerB, idQues);
                    AnswersDTO cAnswer = new AnswersDTO("C", answerC, idQues);
                    AnswersDTO dAnswer = new AnswersDTO("D", answerD, idQues);
                    List<AnswersDTO> ansList = new ArrayList<AnswersDTO>();
                    ansList.add(dAnswer);
                    ansList.add(aAnswer);
                    ansList.add(bAnswer);
                    ansList.add(cAnswer);
                    for (int i = 0; i < ansList.size(); i++) {
                         updateAns = answers.updateAnswer(ansList.get(i));
                    }
                    if(updateAns == true && updateQues == true){
                        url = UPDATE_SUCCESS_PAGE;
                    }
                } catch (SQLException ex) {
                   LOGGER.fatal("UpdateServlet_SQLException: " + ex.getMessage());
                } catch (NamingException ex) {
                    LOGGER.fatal("UpdateServlet_NamingException: " + ex.getMessage());
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

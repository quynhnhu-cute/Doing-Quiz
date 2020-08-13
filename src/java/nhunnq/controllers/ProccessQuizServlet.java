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
import javax.servlet.http.HttpSession;
import nhunnq.Answer.AnswerDAO;
import nhunnq.Answer.AnswersDTO;
import nhunnq.Questions.QuestionCart;
import nhunnq.Questions.QuestionsDAO;
import nhunnq.Questions.QuestionsDTO;
import nhunnq.Subject.SubjectDAO;

/**
 *
 * @author USER
 */
@WebServlet(name = "ProccessQuizServlet", urlPatterns = {"/ProccessQuizServlet"})
public class ProccessQuizServlet extends HttpServlet {

    private final String QUIZ_PAGE = "quiz.jsp";
    private org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(ProccessQuizServlet.class);
    private final String ERROR_PAGE = "errorQuiz.html";

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
        QuestionsDAO questions = new QuestionsDAO();
        AnswerDAO answers = new AnswerDAO();
        SubjectDAO subjects = new SubjectDAO();
        String subName = request.getParameter("subjectList");
        HttpSession session = request.getSession(false);
        String url = QUIZ_PAGE;
        try {
            try {
                int noOfQues = questions.countQuesInSubject(subName);
                System.out.println(noOfQues);
                String tickedAns = "";

                if (noOfQues >= 10) {
                    List<QuestionsDTO> questionList = questions.getQuesListForQuiz(subName);
                    int time = subjects.getTimeForDoingQuiz(subName) * 60;
                    List<QuestionCart> cartList = new ArrayList<>();
                    for (int i = 0; i < questionList.size(); i++) {
                        int quesId = questionList.get(i).getQuesId();
                        answers.getAnswerByQuesId(quesId);
                        List<AnswersDTO> answerList = answers.getAnswerList();
                        List<String> ansIdList = new ArrayList<>();
                        List<String> ansContentList = new ArrayList<>();
                        for (int j = 0; j < answerList.size(); j++) {
                            ansIdList.add(answerList.get(j).getAnsId());
                            ansContentList.add(answerList.get(j).getAnsContent());
                        }
                        QuestionCart cart = new QuestionCart(quesId, questionList.get(i).getQuesContent(), questionList.get(i).getCorrectAnsId(), answerList.get(0).getAnsContent(), answerList.get(1).getAnsContent(), answerList.get(2).getAnsContent(), answerList.get(3).getAnsContent(), answerList.get(0).getAnsId(), answerList.get(1).getAnsId(), answerList.get(2).getAnsId(), answerList.get(3).getAnsId(), tickedAns);
                        cartList.add(cart);
                    }
                    QuestionCart cartShow = cartList.get(0);
                    
                    request.setAttribute("TIME", time);
                    request.setAttribute("QUESTION", cartShow);
                    session.setAttribute("CARTLIST", cartList);
                    session.setAttribute("NUMBER", 0);
                    session.setAttribute("SUBJECT", subName);
                }else{
                    url = ERROR_PAGE;
                }
            } catch (NamingException ex) {
                LOGGER.fatal("ProccessQuizServlet_NamingException: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("ProccessQuizServlet_SQLException: " + ex.getMessage());
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

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
import nhunnq.Questions.QuestionCart;
import nhunnq.Questions.QuestionsDAO;
import nhunnq.Questions.QuestionsDTO;

/**
 *
 * @author USER
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {
    
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(SearchServlet.class);
    
    private final String ADMIN_PAGE = "admin.jsp";
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
        String content = request.getParameter("txtQuestionContent");
        String subject = request.getParameter("txtSubject");
        String status = request.getParameter("statusDropDown");
      
        if(status.trim().equals("All")){
            status = "";
        }
        if(status.trim().equals("Active")){
            status = "Activee";
        }
       String url = ADMIN_PAGE;
        try{
            QuestionsDAO dao = new QuestionsDAO();
            AnswerDAO answers = new AnswerDAO();
            try {
                
                int noOfQues = dao.countQuestionForPaging(content, status, subject);
                if(noOfQues > 0){
                    
                    int pageNum = (int)(Math.ceil((double)noOfQues/20));
                    
                    request.setAttribute("PAGENUMBER", pageNum);
                    int page = 1;
                    if(request.getParameter("pageNum") != null) {
                        page = Integer.parseInt(request.getParameter("pageNum").trim());
                    }
//                    for (int p = 0; p < pageNum; p++) {
//                    String pages = request.getParameter("txtPageNum").trim();
//                    int page = Integer.parseInt(pages);
//                    if(page <= pageNum){
                        dao.showSearchQuestion(content, status, subject, page);
                        List<QuestionsDTO> searchList = dao.getSearchList();
                        List<QuestionCart> showList = new ArrayList<>();

                        List<String> answer = new ArrayList<String>();
                        List<String> answerId = new ArrayList<String>();
                        if (searchList.size() > 0) {
                            for (int i = 0; i < searchList.size(); i++) {
                                int quesId = searchList.get(i).getQuesId();
                                answers.getAnswerByQuesId(quesId);
                                List<AnswersDTO> answerList = answers.getAnswerList();
                                //tesst

                                String quesContent = searchList.get(i).getQuesContent();
                                String correctAns = searchList.get(i).getCorrectAnsId();

                                for (int j = 0; j < answerList.size(); j++) {
                                    answer.add(answerList.get(j).getAnsContent());
                                    answerId.add(answerList.get(j).getAnsId());
                                }
                                QuestionCart question = new QuestionCart(quesId, quesContent, correctAns, answer.get(0), answer.get(1), answer.get(2), answer.get(3), answerId.get(0), answerId.get(1), answerId.get(2), answerId.get(3));
                                showList.add(question);
                                answer.clear();
                                answerId.clear();
                            }

                            request.setAttribute("SHOWLIST", showList);
                        } 
//                    }
                       
//                }
                
                }
            } catch (SQLException ex) {
                LOGGER.fatal("SearchServlet_SQLException: " +ex.getMessage());
            } catch (NamingException ex) {
                LOGGER.fatal("SearchServlet_NamingException: " +ex.getMessage());
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

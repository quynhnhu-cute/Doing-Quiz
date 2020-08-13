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
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nhunnq.Questions.QuestionCart;
import nhunnq.TestQuestions.TestQuestionsDAO;
import nhunnq.TestQuestions.TestQuestionsDTO;
import nhunnq.Tests.TestsDAO;
import nhunnq.Tests.TestsDTO;

/**
 *
 * @author USER
 */
@WebServlet(name = "SubmitQuizServlet", urlPatterns = {"/SubmitQuizServlet"})
public class SubmitQuizServlet extends HttpServlet {
    private final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(SubmitQuizServlet.class);
    private final String RESULT_PAGE = "result.jsp";
    private final String ERROR_PAGE = "error.html";
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
        String url = RESULT_PAGE;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        int number = Integer.parseInt(request.getParameter("number").trim());
        String ansTicked = request.getParameter("answer");
        if(ansTicked == null){
            ansTicked = "";
        }
        int mark = 0;
        TestsDAO tests = new TestsDAO();
        TestQuestionsDAO testQuestions = new TestQuestionsDAO();
        
        try{
            List<QuestionCart> cartList = (List)session.getAttribute("CARTLIST");
            QuestionCart cart = cartList.get(number);
            cart.setAnsTicked(ansTicked);
            for (int i = 0; i < cartList.size(); i++) {
                if(cartList.get(i).getAnsTicked().trim().equalsIgnoreCase(cartList.get(i).getQuesCorrectAnswer().trim())){
                    mark += 1;
                }
            }
            session.removeAttribute("CARTLIST");
            session.removeAttribute("NUMBER");
            request.setAttribute("MARK", mark);
            // insert into Tests and TestQuestions
            String subject = (String) session.getAttribute("SUBJECT");
            String email = (String) session.getAttribute("EMAIL");
            Timestamp createDate = Timestamp.valueOf(LocalDateTime.now());
            TestsDTO test = new TestsDTO(createDate, mark, subject, email);
            try {
                boolean insertTest = tests.insertTest(test);
                boolean insert = false;
                int testId = tests.getTestId(createDate);
                for (int i = 0; i < cartList.size(); i++) {
                    int quesId = cartList.get(i).getQuesId();
                    String ansId = cartList.get(i).getAnsTicked();
                    TestQuestionsDTO testQues = new TestQuestionsDTO(testId, quesId, ansId);
                    insert = testQuestions.insertTestQuestion(testQues);
                }
                if(insertTest == true && insert == true){
                    url = RESULT_PAGE;
                }else{
                    url = ERROR_PAGE;
                }
            } catch (NamingException ex) {
                LOGGER.fatal("SubmitQuizServlet_NamingException: " + ex.getMessage());
            } catch (SQLException ex) {
                LOGGER.fatal("SubmitQuizServlet_SQLException: " + ex.getMessage());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhunnq.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nhunnq.Questions.QuestionCart;

/**
 *
 * @author USER
 */
@WebServlet(name = "LoadPreviousQuestion", urlPatterns = {"/LoadPreviousQuestion"})
public class LoadPreviousQuestion extends HttpServlet {

    
    private final String QUIZ_PAGE = "quiz.jsp";

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
        String number = request.getParameter("number").trim();
        String timeNow = request.getParameter("timeNow");
        int hour = Integer.parseInt(timeNow.substring(0, 2));
        int minute = Integer.parseInt(timeNow.substring(3, 5));
        int second = Integer.parseInt(timeNow.substring(6));
        int timeProccess = hour * 3600 + minute * 60 + second;
        String url = QUIZ_PAGE;
        String tickedAns = request.getParameter("answer");

        if (tickedAns == null) {
            tickedAns = "";
        }
        try {

            int currentNum = Integer.parseInt(number) - 1;
            HttpSession session = request.getSession(false);
            List<QuestionCart> cartList = (List) session.getAttribute("CARTLIST");
            QuestionCart cartShow = cartList.get(currentNum);
            request.setAttribute("QUESTION", cartShow);
            session.setAttribute("NUMBER", currentNum);
            request.setAttribute("TIME", timeProccess);
            QuestionCart cartAfter = cartList.get(currentNum + 1);
            cartAfter.setAnsTicked(tickedAns);

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

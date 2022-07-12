/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Question;
import Models.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MarkQuestionController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MarkQuestionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarkQuestionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String raw_quizid = request.getParameter("quizid");
        String type = request.getParameter("type");

        String raw_justHaveAnswered = request.getParameter("oldQues");

        Quiz quiz = (Quiz) request.getSession().getAttribute("doingQuiz");

        int quizid = -1, quesnum = -1, justHaveAnswered = -1;
        if (raw_justHaveAnswered != null) {
            justHaveAnswered = Integer.parseInt(raw_justHaveAnswered);
        }
        if (raw_quizid != null) {
            quizid = Integer.parseInt(raw_quizid);
        }

        ArrayList<Integer> answers = new ArrayList<>();

        Question q = quiz.getQ().get(justHaveAnswered - 1);
        if (q.isMarked() == true) {
            quiz.getQ().get(justHaveAnswered - 1).setMarked(false);
        } else {
            quiz.getQ().get(justHaveAnswered - 1).setMarked(true);
        }

        ArrayList<Integer> markedAnswerNext = q.getMarkedAnswer();

        request.getSession().setAttribute("doingQuiz", quiz);

        request.setAttribute("mark", markedAnswerNext);
        request.setAttribute("ques", q);
        request.setAttribute("quiz", quiz);
        request.setAttribute("quesnum", justHaveAnswered);

        request.getRequestDispatcher("testquizhandle.jsp").forward(request, response);

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

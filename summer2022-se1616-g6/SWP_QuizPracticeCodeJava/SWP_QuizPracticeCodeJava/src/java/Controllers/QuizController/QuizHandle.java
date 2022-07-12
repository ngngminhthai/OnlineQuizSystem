/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.QuizController;

import DAL.QuizDAO;
import Models.Answer;
import Models.Question;
import Models.Quiz;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class QuizHandle extends HttpServlet {

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
            out.println("<title>Servlet QuizHandle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizHandle at " + request.getContextPath() + "</h1>");
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
        try {
            String raw_quizid = request.getParameter("quizid");
            String type = request.getParameter("type");
            String raw_quesnum = request.getParameter("quesnum");

            if (type.equalsIgnoreCase("entrance") || type.equalsIgnoreCase("quizHandle")) {
                String[] markedAnswer = request.getParameterValues("markedAnswer");

                String raw_justHaveAnswered = request.getParameter("oldQues");

                Quiz q = (Quiz) request.getSession().getAttribute("doingQuiz");

                int quizid = -1, quesnum = -1, justHaveAnswered = -1;
                if (raw_justHaveAnswered != null) {
                    justHaveAnswered = Integer.parseInt(raw_justHaveAnswered);
                }
                if (raw_quizid != null) {
                    quizid = Integer.parseInt(raw_quizid);
                }
                if (raw_quesnum != null) {
                    quesnum = Integer.parseInt(raw_quesnum);
                }

                ArrayList<Integer> answers = new ArrayList<>();

                justHaveAnswered -= 1;
                if (markedAnswer != null) {
                    for (String string : markedAnswer) {
                        answers.add(Integer.parseInt(string));
                    }
                    q.getQ().get(justHaveAnswered).setMarkedAnswer(answers);
                }

                Question ques = q.getQ().get(quesnum - 1);
                ArrayList<Integer> markedAnswerNext = ques.getMarkedAnswer();

                ques.getMarkedAnswer();
                ques.getCorrectAnswer();

                request.getSession().setAttribute("doingQuiz", q);

                if (request.getSession().getAttribute("time") != null) {
                    request.setAttribute("time", request.getSession().getAttribute("time"));
                }

                request.setAttribute("mark", markedAnswerNext);
                request.setAttribute("ques", ques);
                request.setAttribute("quiz", q);
                request.setAttribute("quesnum", quesnum);

                request.getRequestDispatcher("testquizhandle.jsp").forward(request, response);
            } else if (type.equalsIgnoreCase("review")) {

                String[] markedAnswer = request.getParameterValues("markedAnswer");

                String raw_justHaveAnswered = request.getParameter("oldQues");

                Quiz q = (Quiz) request.getSession().getAttribute("quizReview");

                int quizid = -1, quesnum = -1, justHaveAnswered = -1;
                if (raw_justHaveAnswered != null) {
                    justHaveAnswered = Integer.parseInt(raw_justHaveAnswered);
                }
                if (raw_quizid != null) {
                    quizid = Integer.parseInt(raw_quizid);
                }
                if (raw_quesnum != null) {
                    quesnum = Integer.parseInt(raw_quesnum);
                }

                ArrayList<Integer> answers = new ArrayList<>();

                justHaveAnswered -= 1;
                if (markedAnswer != null) {
                    for (String string : markedAnswer) {
                        answers.add(Integer.parseInt(string));
                    }
                    q.getQ().get(justHaveAnswered).setMarkedAnswer(answers);
                }

                Question ques = q.getQ().get(quesnum - 1);
                ArrayList<Integer> markedAnswerNext = ques.getMarkedAnswer();

                if (isCorrect(ques)) {
                    request.setAttribute("result", true);
                } else {
                    request.setAttribute("result", false);
                }

                QuizDAO qd = new QuizDAO();

                ArrayList<Integer> correctAnswers = qd.getCorrectAnswerByQuestionId(ques.getQuestionId());
                request.setAttribute("correctAnswer", correctAnswers);

                request.getSession().setAttribute("quizReview", q);

                request.setAttribute("mark", markedAnswerNext);
                request.setAttribute("ques", ques);
                request.setAttribute("quiz", q);
                request.setAttribute("quesnum", quesnum);

                request.getRequestDispatcher("QuizReview.jsp").forward(request, response);
            }
        } catch (Exception e) {
            User u = (User) request.getSession().getAttribute("user");
            response.sendRedirect("practicelist?id=" + u.getUserId() + "");
        }

    }

    public boolean isCorrect(Question question) {
        QuizDAO qd = new QuizDAO();
        boolean isCorrect = true;

        ArrayList<Integer> chooseAnswers = new ArrayList<>();
        ArrayList<Integer> correctAnswers = new ArrayList<>();
        Question ques = new Question();
        float totalCorrectAnswer = 0;
        int totalChoice = 0;

        correctAnswers = qd.getCorrectAnswerByQuestionId(question.getQuestionId());
        //5, 6
        if (question.getMarkedAnswer() != null) {
            for (Integer answer : question.getMarkedAnswer()) {
                // 5
                if (correctAnswers.contains(answer)) {
                    isCorrect = true;
                    totalChoice++;
                } else {
                    isCorrect = false;
                    break;
                }

            }
            if (isCorrect == true && totalChoice == correctAnswers.size()) {
                totalCorrectAnswer += 1;
                totalChoice = 0;
            }
        }
        return isCorrect;
    }

    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        if (list.contains(3)) {
            System.out.println("true");
        }
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

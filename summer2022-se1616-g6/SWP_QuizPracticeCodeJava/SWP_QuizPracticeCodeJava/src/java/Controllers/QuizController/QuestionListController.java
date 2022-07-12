/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.QuizController;

import DAL.QuestionDAO;
import Models.Dimension;
import Models.Lesson;
import Models.Question;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class QuestionListController extends HttpServlet {

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
        QuestionDAO qdao = new QuestionDAO();
        String keyword = request.getParameter("keyword");
        int sub = 0,les = 0,di = 0,sta = 0;
        String subject = request.getParameter("subject");
        String lesson = request.getParameter("lesson");
        String dimension = request.getParameter("dimension");
        String status = request.getParameter("status");
        if(subject != null){
            sub = Integer.parseInt(subject);
        }
        if(lesson != null){
            les = Integer.parseInt(lesson);
        }
        if(dimension != null){
            di = Integer.parseInt(dimension);
        }
        if(status != null){
            if(status.equals("1")) sta = 1;
            else if(status.equals("0")) sta = 0;
            else sta = -1;
        }

        ArrayList<Question> listQuestion = new ArrayList<>();
//        listQuestion = qdao.getAllQuestionByID(keyword);
        listQuestion = (ArrayList<Question>) qdao.searchQuestion(sub, les, di, sta);

        ArrayList<Subject> listSubject = new ArrayList<>();
        listSubject = qdao.getAllSubject();
        
        ArrayList<Lesson> listLesson = new ArrayList<>();
        listLesson = qdao.getAllLesson();
        
        ArrayList<Dimension> listDimension = new ArrayList<>();
        listDimension = qdao.getAllDimension();

        request.setAttribute("keyword", keyword);
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listLesson", listLesson);
        request.setAttribute("listDimension", listDimension);
        
        request.setAttribute("sub", sub);
        request.setAttribute("les", les);
        request.setAttribute("di", di);
        request.setAttribute("sta", sta);
        
        request.getRequestDispatcher("QuestionList.jsp").forward(request, response);
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

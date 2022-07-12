/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.QuizController;

import DAL.CustomerQuizDAO;
import DAL.SubjectDAO;
import Models.CustomerQuiz;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class PracticeController extends HttpServlet {

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
        CustomerQuizDAO customerquiz = new CustomerQuizDAO();
        int userId = Integer.parseInt(request.getParameter("id"));

        ArrayList<Subject> listSubject = customerquiz.getAllNameSubject();
        String subjectId = request.getParameter("subjectID");
//        int sID;
//        if (subjectId == null) {
//            sID = -1;
//        } else {
//            sID = Integer.parseInt(subjectId);
//        }
//        ArrayList<CustomerQuiz> list = new ArrayList<>();
//
//        if (sID == -1) {
//            list = customerquiz.getPageCustomerQuizbyID(userId);
//        } else {
//            list = customerquiz.getQuizBySubjectName(userId, sID);
//        }
        ArrayList<CustomerQuiz> list = new ArrayList<>();

        list = customerquiz.getPageCustomerQuizbyID(userId);

        SubjectDAO s = new SubjectDAO();
        ArrayList<Subject> slist = s.getAllSubjects();

//      Set Attribute
        boolean isDoingQuiz = false;
        if (request.getSession().getAttribute("doingQuiz") != null) {
            isDoingQuiz = true;
        }
        request.setAttribute("isDoingQuiz", isDoingQuiz);
        request.setAttribute("subjectList", slist);
        request.setAttribute("sId", subjectId);
        request.setAttribute("list", list);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("PracticeList_2.jsp").forward(request, response);

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

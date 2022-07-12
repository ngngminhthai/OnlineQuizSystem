/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.LessonDAO;
import DAL.SubjectDAO;
import Models.LessonType;
import Models.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "CreateLessonController", urlPatterns = {"/createLesson"})
public class CreateLessonController extends HttpServlet {

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
            out.println("<title>Servlet CreateLessonController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateLessonController at " + request.getContextPath() + "</h1>");
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
        ArrayList<Subject> listSubject = new SubjectDAO().getSubjectNameAndSubjectID();
        ArrayList<LessonType> listType = new LessonDAO().getAllLessonType();

        request.setAttribute("listType", listType);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("NewLesson.jsp").forward(request, response);
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
        String lessonName = request.getParameter("lessonName");
        String lessonType = request.getParameter("lessonType");
        String subjectName = request.getParameter("subjectName");
        String lessonContent = request.getParameter("lessonContent");
        String lessonOrder = request.getParameter("lessonOrder");
        String video = request.getParameter("video");
        int subId = Integer.parseInt(subjectName);
        int typeId = Integer.parseInt(lessonType);
        LessonDAO dao = new LessonDAO();
        dao.insertLesson(subId, lessonName, lessonOrder, typeId, video, lessonContent);
        request.getRequestDispatcher("lesson?search=&page=1&status=2").forward(request, response);
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

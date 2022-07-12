/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.CategoryDAO;
import Models.Category;
import Models.Expert;
import Models.Subject;
import Models.Category;
import DAL.SubjectCategoryDAO;
import DAL.SubjectDAO;
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
 * @author Admin
 */
public class SubjectDetailController extends HttpServlet {

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
            out.println("<title>Servlet SubjectDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectDetailController at " + request.getContextPath() + "</h1>");
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
        int sid = Integer.parseInt(request.getParameter("sid"));
        SubjectDAO sdb = new SubjectDAO();
        SubjectCategoryDAO scdb = new SubjectCategoryDAO();

        Subject subject = sdb.getSubjectById(sid);
        ArrayList<Category> categoryList = scdb.getElem();
        List<Subject> listAllSubject = sdb.getAllSubjectsWithPrice();
        List<Category> listCategory = new CategoryDAO().getAllCategory();
        ArrayList<Expert> exlist = sdb.getAllExpertBySubject(sid);
        ArrayList<Subject> featuredSubjectList = sdb.getFeaturedSubject();
        ArrayList<Subject> lastestSubject = sdb.getLastestSubject(sid);

        request.setAttribute("lastest", lastestSubject);
        request.setAttribute("features", featuredSubjectList);
        request.setAttribute("expert", exlist);
        request.setAttribute("subject", subject);
        request.setAttribute("listAllSubject", listAllSubject);
        request.setAttribute("subjectcategory", categoryList);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("subjectdetails.jsp").forward(request, response);
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

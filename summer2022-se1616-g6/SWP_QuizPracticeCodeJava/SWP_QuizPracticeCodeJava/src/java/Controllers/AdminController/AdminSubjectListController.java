/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.AdminController;

import DAL.CategoryDAO;
import DAL.LessonDAO;
import DAL.SubjectDAO;
import Models.Category;
import Models.Lesson;
import Models.Subject;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.security.pkcs11.wrapper.Functions;

/**
 *
 * @author LinhVT
 */
public class AdminSubjectListController extends HttpServlet {

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
        int catId = 12;
        int status = 2;
        int userId = 0;
        int roleId = 1;
        String search = "";
        HttpSession ss = request.getSession();
        if (ss.getAttribute("user") != null) {
            User user = (User) ss.getAttribute("user");
            userId = user.getUserId();
            roleId = user.getRoleId();
        }

        final int PAGE_SIZE = 4;
        int page = 1;
        SubjectDAO subjectDAO = new SubjectDAO();
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        if (request.getParameter("search") != null) {
            search = request.getParameter("search");
        }
        if (request.getParameter("catId") != null) {
            catId = Integer.parseInt(request.getParameter("catId"));
        }
        if (request.getParameter("status") != null) {
            status = Integer.parseInt(request.getParameter("status"));
        }
        
        int totalSubject = subjectDAO.getTotalFilteredSubject(search, roleId, userId, catId, status);
        int totalPage = totalSubject / PAGE_SIZE;
        if (totalSubject % PAGE_SIZE != 0) {
            totalPage += 1;
        }

        
        List<Category> listCategory = new CategoryDAO().getAllCategory();
        List<Subject> listSubject = subjectDAO.filterSubjectInPaging(search, roleId, userId, catId, status, page, PAGE_SIZE);
        System.out.println("hello" + listSubject);
        String url = "AdminSubjectList?search="+ search +"&catId=" + catId + "&status=" + status;
        
        request.setAttribute("search", search);
        request.setAttribute("url", url);
        request.setAttribute("userId", userId);
        request.setAttribute("catId", catId);
        request.setAttribute("stat", status);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("AdminSubjectList.jsp").forward(request, response);
//        final int PAGE_SIZE = 4;
//
//        SubjectDAO subjectDAO = new SubjectDAO();
//        int page = 1;
//
//        String pageStr = request.getParameter("page");
//        if (pageStr != null) {
//            page = Integer.parseInt(pageStr);
//        }
//        List<Category> listCategory = new CategoryDAO().getAllCategory();
//        List<Subject> listAllSubject = subjectDAO.getAllSubjectsWithPrice();
//        List<Subject> listSubject = subjectDAO.getSubjectInPaging(page, PAGE_SIZE);
//
//        int totalSubject = subjectDAO.getTotalSubject();
//        int totalPage = totalSubject / PAGE_SIZE;
//        if (totalSubject % PAGE_SIZE != 0) {
//            totalPage += 1;
//        }
//
//        request.setAttribute("listCategory", listCategory);
//        request.setAttribute("listAllSubject", listAllSubject);
//        request.setAttribute("page", page);
//        request.setAttribute("totalPage", totalPage);
//        request.setAttribute("listSubject", listSubject);
//
//        request.getRequestDispatcher("AdminSubjectList.jsp").forward(request, response);
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

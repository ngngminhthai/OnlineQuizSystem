/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.CategoryDAO;
import DAL.DimensionDAO;
import DAL.PricePackageDAO;
import DAL.SubjectDAO;
import DAL.UserDAO;
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
 * @author LinhVT
 */
public class UpdateSubjectDetailController extends HttpServlet {

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
            out.println("<title>Servlet UpdateSubjectDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSubjectDetailController at " + request.getContextPath() + "</h1>");
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
        //Overview
        int subjectId = Integer.parseInt(request.getParameter("subjectID"));
        SubjectDAO db = new SubjectDAO();
        CategoryDAO catDB = new CategoryDAO();
        UserDAO userDB = new UserDAO();

        List expertList = userDB.getAllExpert();
        List categoryList = catDB.getCategoryName();
        Subject subject = db.getSubjectWithOwnerById(subjectId);

        request.setAttribute("categoryList", categoryList);
        request.setAttribute("expertList", expertList);
        request.setAttribute("subject", subject);

        //Dimension
        DimensionDAO dmDAO = new DimensionDAO();
        List dimension = dmDAO.getSubjectDimension(subjectId);
        request.setAttribute("dimensionList", dimension);

        //Price Package
        PricePackageDAO packDAO = new PricePackageDAO();
        List packageList = packDAO.getSubjectPricePackage(subjectId);
        request.setAttribute("packageList", packageList);

        request.getRequestDispatcher("AdminSubjectDetail.jsp").forward(request, response);

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
        //Overview
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        String subjectName = request.getParameter("subjectName");
        int expertId = Integer.parseInt(request.getParameter("expertId"));
        int catId = Integer.parseInt(request.getParameter("catId"));
        boolean featured = request.getParameter("featured") == null ? false : true;
        boolean status = false;
        if (request.getParameterValues("status") != null) {
            status = Boolean.parseBoolean(request.getParameter("status"));
        } else {
            SubjectDAO db = new SubjectDAO();
            Subject subject = db.getSubjectWithOwnerById(subjectId);
            status = subject.isStatus();
        }
        String thumbnailURL = request.getParameter("thumbnail");
        String description = request.getParameter("description");
        System.out.println(thumbnailURL);

        SubjectDAO sDao = new SubjectDAO();
        CategoryDAO catDao = new CategoryDAO();
        UserDAO uDao = new UserDAO();

        if (request.getParameter("thumbnail") != "") {
            sDao.updateSubjectThumbnail(thumbnailURL, subjectId);
        };
        sDao.updateSubject(subjectName, description, featured, status, subjectId);
        catDao.updateSubjectCategory(catId, subjectId);
        uDao.updateSubjectExpert(expertId, subjectId);

        //Dimension
//        request.getRequestDispatcher("UpdateSubjectController").forward(request, response);
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

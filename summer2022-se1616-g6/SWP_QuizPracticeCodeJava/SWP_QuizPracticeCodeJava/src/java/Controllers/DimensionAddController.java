/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.DimensionDAO;
import DAL.SubjectDAO;
import Models.Dimension;
import Models.DimensionType;
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
public class DimensionAddController extends HttpServlet {

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
        DimensionDAO dimensiondao = new DimensionDAO();
        SubjectDAO sdao = new SubjectDAO();
        ArrayList<Subject> listSubject = sdao.getSubject();
        ArrayList<DimensionType> listType = dimensiondao.getDimensionType();

        request.setAttribute("listType", listType);
        request.setAttribute("listSubject", listSubject);

        request.getRequestDispatcher("DimensionAddNew.jsp").forward(request, response);
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
        DimensionDAO dimensiondao = new DimensionDAO();

        String name = request.getParameter("name");
        String descrip = request.getParameter("descrip");
        int type = Integer.parseInt(request.getParameter("type"));
        int subject = Integer.parseInt(request.getParameter("subject"));
        Dimension d = new Dimension();
        d.setDimensionName(name);
        d.setDescription(descrip);
        d.setTypeId(type);
        d.setSubjectId(subject);
        dimensiondao.insertDimension(d);
        response.sendRedirect("subjectdimension");
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

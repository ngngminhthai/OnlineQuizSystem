/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.DimensionDAO;
import Models.Dimension;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN: subjectdimension
 */
public class SubjectDimension extends HttpServlet {

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
        DimensionDAO dimensiondao = new DimensionDAO();
        String nameDimension = request.getParameter("nameDimension");
        String typeDimension = request.getParameter("typeDimension");
        int dimenID;
        if(nameDimension==null){
            dimenID = 0;
        } else{
            dimenID = Integer.parseInt(nameDimension);
        }
        
        int typeId;
        if(typeDimension == null){
            typeId = 0;
        } else {
            typeId = Integer.parseInt(typeDimension);
        }
        
        ArrayList<Dimension> listDimension = new ArrayList<>();

        listDimension = dimensiondao.getDimension(dimenID, typeId);
        
        ArrayList<Dimension> listName = new ArrayList<>();
        listName = (ArrayList<Dimension>) dimensiondao.getSubjectDimension();
        
        request.setAttribute("dimenID", dimenID);
        request.setAttribute("typeId", typeId);
        request.setAttribute("listDimension", listDimension);
        request.setAttribute("listName", listName);

        request.getRequestDispatcher("DimensionList.jsp").forward(request, response);
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

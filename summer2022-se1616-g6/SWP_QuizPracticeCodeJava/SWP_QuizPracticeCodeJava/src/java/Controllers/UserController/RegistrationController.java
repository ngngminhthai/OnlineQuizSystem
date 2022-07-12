/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.UserController;

import DAL.RegistrationDAO;
import Models.Registration;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class RegistrationController extends HttpServlet {

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
        try {
            String search = request.getParameter("search");
            String pageStr = request.getParameter("page");
            String sortName = request.getParameter("name");
            String sortType = request.getParameter("type");
            String subName = request.getParameter("subName");
            String status = request.getParameter("status");
            String from = request.getParameter("from");
            String to = request.getParameter("to");

            RegistrationDAO regDao = new RegistrationDAO();
            final int PAGE_SIZE = 5;
            int page = 1;
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            if (search == null) {
                search = "";
            }
            int totalPage = 0;
            int totalSubject = regDao.getTotalRegistration(search);
            totalPage = totalSubject / PAGE_SIZE;
            if (totalSubject % PAGE_SIZE != 0) {
                totalPage++;
            }
            ArrayList<Registration> listAll = regDao.SearchAndSortRegistrationPaging(search, subName, status, from, to, sortName, sortType, page, PAGE_SIZE);
            request.setAttribute("search", search);
            request.setAttribute("page", page);
            request.setAttribute("sortName", sortName);
            request.setAttribute("sortType", sortType);
            request.setAttribute("subName", subName);
            request.setAttribute("status", status);
            request.setAttribute("from", from);
            request.setAttribute("to", to);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("listAll", listAll);
            request.getRequestDispatcher("registrationList.jsp").forward(request, response);
            
            HttpSession session = request.getSession();
//            session.setAttribute("search", search);
//            session.setAttribute("page", page);
//            session.setAttribute("sortName", sortName);
//            session.setAttribute("sortType", sortType);
//            session.setAttribute("subName", subName);
//            session.setAttribute("status", status);
//            session.setAttribute("from", from);
//            session.setAttribute("to", to);
//            session.setAttribute("totalPage", totalPage);
            session.setAttribute("listAll", listAll);
        
        } catch (Exception e) {

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

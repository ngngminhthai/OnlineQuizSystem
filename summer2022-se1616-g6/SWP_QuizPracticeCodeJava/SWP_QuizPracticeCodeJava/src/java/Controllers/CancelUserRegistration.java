/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.RegistrationDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class CancelUserRegistration extends HttpServlet {

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
            out.println("<title>Servlet CancelUserRegistration</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelUserRegistration at " + request.getContextPath() + "</h1>");
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
        RegistrationDAO r = new RegistrationDAO();

        int pageindex = Integer.parseInt(request.getParameter("page"));
        String raw_order = request.getParameter("order");
        String raw_type = request.getParameter("type");

        String order = "";
        String type = "";

        if (raw_order != null && !raw_order.isEmpty()) {
            if (raw_order.equals("desc")) {
                raw_order = "asc";
            }
            else raw_order = "desc";
            order = raw_order;
        }
        if (raw_type != null && !raw_type.isEmpty()) {
            type = raw_type;
        }

        User user = (User) request.getSession().getAttribute("user");
        int uid = user.getUserId();

        int rid = Integer.parseInt(request.getParameter("rid"));

        if (r.checkConditionForCancel(rid)) {
            r.cancelRegistrationByUserId(uid, rid);
        }
        response.sendRedirect("userregistration?page=" + pageindex + "&order=" + type + "&sort=" + order + "");
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

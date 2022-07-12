/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.SliderDAO;
import Models.Slider;
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
 * @author ADMIN
 */
@WebServlet(name = "SliderListController", urlPatterns = {"/sliderlist"})
public class SliderListController extends HttpServlet {

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
        SliderDAO sliderdao = new SliderDAO();
        String keyword = request.getParameter("keyword");
        String status = request.getParameter("status");
//        String status = request.getParameter("status");
//        boolean stt;
//        if(status.equals("true")){
//            stt = false;
//        }
//        if(status.equals("false")){
//            stt = true;
//        }
        //paging
        final int pageSize = 5;
        int totalPage = 1;
        int pageIndex = 1;
        int totalAmount = 0;
        try {
            if (request.getParameter("page") != null) {
                pageIndex = Integer.parseInt(request.getParameter("page"));
            }
            totalAmount = sliderdao.getTotalSlider(keyword);
            totalPage = totalAmount / pageSize;
            if (totalAmount % pageSize != 0) {
                totalPage++;
            }
        } catch (NumberFormatException ex) {
            PrintWriter out = response.getWriter();
            request.getRequestDispatcher("SliderList.jsp").forward(request, response);
            out.println("Page index must be a number, try enter again");
        }
        
        ArrayList<Slider> listslider = sliderdao.getAllSliderBySliderIDPaging(keyword,status, pageIndex, pageSize);
        
        request.setAttribute("keyword", keyword);
        request.setAttribute("status", status);
        request.setAttribute("listslider", listslider);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", pageIndex);
        request.getRequestDispatcher("SliderList.jsp").forward(request, response);
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

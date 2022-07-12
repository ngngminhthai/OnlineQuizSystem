/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.UserController;

import DAL.BlogDAO;
import DAL.SliderDAO;
import DAL.SubjectDAO;
import Models.Blog;
import Models.Slider;
import Models.Subject;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SliderDAO sdao = new SliderDAO();
        SubjectDAO subDao = new SubjectDAO();
        BlogDAO blogDao = new BlogDAO();
        ArrayList<Slider> listSlider = sdao.getListSlider();
        ArrayList<Subject> listSubject = subDao.getAllSubject();
        ArrayList<Blog> listBlogUpdated = blogDao.getBlogsOrderByDate();
        request.setAttribute("listSlider", listSlider);
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listBlogUpdated", listBlogUpdated);
        request.getRequestDispatcher("home1.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.UserController;

import DAL.CategoryDAO;
import DAL.RegistrationDAO;
import DAL.SubjectCategoryDAO;
import DAL.SubjectDAO;
import Models.Category;
import Models.Count;
import Models.Registration;
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

/**
 *
 * @author Admin
 */
public class UserRegistration extends HttpServlet {

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
            out.println("<title>Servlet UserRegistration</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserRegistration at " + request.getContextPath() + "</h1>");
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
         SubjectDAO sdb = new SubjectDAO();
         SubjectCategoryDAO scdb = new SubjectCategoryDAO();
        User user = (User) request.getSession().getAttribute("user");
        int uid = user.getUserId();
        List<Category> listCategory = new CategoryDAO().getAllCategory();
        ArrayList<Subject> featuredSubjectList = sdb.getFeaturedSubject();
        ArrayList<Category> categoryList = scdb.getElem();
        String search = request.getParameter("s");
        String field = request.getParameter("order");
        String sort = request.getParameter("sort");

        RegistrationDAO r = new RegistrationDAO();
        int pagesize = 5;
        String page = request.getParameter("page");
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);

        if (field == null && sort == null) {
            field = "regId";
            sort = "asc";
        }

        ArrayList<Registration> rlist = r.getAllRegistrationByUserId(uid, pageindex, pagesize, field, sort, search);
        Count c = r.countRegistration(uid, pageindex, pagesize, field, page, search);
        
        int count = - 1;
        if (search == null || search.isEmpty()) {
            count = r.count(uid);
        }
        else count = c.getTotal();

        int totalpage = (count % pagesize == 0) ? (count / pagesize) : (count / pagesize) + 1;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("rlist", rlist);

        if (field != null && sort != null) {
            if (sort.equals("asc")) {
                sort = "desc";
            } else {
                sort = "asc";
            }
        }
        request.setAttribute("order", field);
        request.setAttribute("sort", sort);
        request.setAttribute("search", search);
        request.setAttribute("count", c);
        request.setAttribute("total", count);
        request.setAttribute("features", featuredSubjectList);
        request.setAttribute("subjectcategory", categoryList);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("UserRegistration.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        if (request.getSession().getAttribute("user") == null) {
            out.print("notlogin");
        } else {
            out.print("login");
        }
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

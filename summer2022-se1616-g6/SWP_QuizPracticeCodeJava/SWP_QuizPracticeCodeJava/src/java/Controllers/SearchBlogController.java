
package Controllers;

import DAL.BlogDAO;
import Models.Blog;
import Models.BlogCate;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchBlogController", urlPatterns = {"/searchBlog"})
public class SearchBlogController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String searchName = request.getParameter("searchBox");
        BlogDAO blogdao = new BlogDAO();
        ArrayList<Blog> list = blogdao.searchBlogTitle(searchName);
        ArrayList<Blog> listBlog = blogdao.getAllBlogsByDate();
        ArrayList<BlogCate> listCate = blogdao.getCategory();
        ArrayList<Blog> listRecentBlog = blogdao.getBlogAndAuthor();
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("listCate", listCate);
        request.setAttribute("recentBLog", listRecentBlog);
        request.setAttribute("listBlog", list);
        request.getRequestDispatcher("BlogList1.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

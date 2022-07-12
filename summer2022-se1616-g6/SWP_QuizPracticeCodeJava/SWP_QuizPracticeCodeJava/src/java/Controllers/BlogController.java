package Controllers;

import DAL.BlogDAO;
import Models.Blog;
import Models.BlogCate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BlogController", urlPatterns = {"/blog"})
public class BlogController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogdao = new BlogDAO();
        //pagination
        final int pageSize = 3;
        int totalPage = 1;
        int pageIndex = 1;
        try {
            if (request.getParameter("page") != null) {
                pageIndex = Integer.parseInt(request.getParameter("page"));
            }
            int totalAmount = blogdao.getTotalBlogs();
            totalPage = totalAmount / pageSize;
            if (totalAmount % pageSize != 0) {
                totalPage++;
            }
        } catch (NumberFormatException ex) {
            PrintWriter out = response.getWriter();
            request.getRequestDispatcher("BlogList.jsp").forward(request, response);
            out.println("Page index must be a number, try enter again");
        }
        ArrayList<Blog> listBlog = blogdao.getAllBlogsByDatePaging(pageIndex, pageSize);
        for (Blog blog : listBlog) {
            System.out.println(blog.getLastUpdated());
        }
        System.out.println(listBlog.size());
        ArrayList<BlogCate> listCate = blogdao.getCategory();
        ArrayList<Blog> listRecentBlog = blogdao.getBlogAndAuthor();

        request.setAttribute("listBlog", listBlog);
        request.setAttribute("listCate", listCate);
        request.setAttribute("recentBLog", listRecentBlog);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", pageIndex);
        request.getRequestDispatcher("BlogList1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}


package Controllers;

import DAL.BlogDAO;
import DAL.UserDAO;
import Models.Blog;
import Models.BlogCate;
import Models.User;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BlogDetailController", urlPatterns = {"/blogDetail"})
public class BlogDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int blogid = Integer.parseInt(request.getParameter("blogid"));
        BlogDAO bdao = new BlogDAO();
        UserDAO udao = new UserDAO();
        Blog b = bdao.getBlogByBlogID(blogid);
        System.out.println(b.getAuthorName());
        int blogAuthorID = b.getAuthorid();
        User author = udao.getUserByID(blogAuthorID);
        
        ArrayList<BlogCate> listCate = bdao.getCategory();
        ArrayList<Blog> listBlog = bdao.getBlogAndAuthor();
        
        request.setAttribute("blog", b);
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("author", author);
        request.setAttribute("cate", listCate);
        request.getRequestDispatcher("BlogDetail2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}

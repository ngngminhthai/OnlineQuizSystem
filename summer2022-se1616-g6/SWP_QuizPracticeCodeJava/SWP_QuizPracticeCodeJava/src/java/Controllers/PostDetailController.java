
package Controllers;

import DAL.PostDAO;
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

@WebServlet(name = "PostDetailController", urlPatterns = {"/postdetail"})
public class PostDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int blogid = Integer.parseInt(request.getParameter("blogid"));
        PostDAO pdao = new PostDAO();
        UserDAO udao = new UserDAO();
        Blog b = pdao.getBlogByBlogID(blogid);
        int blogAuthor = b.getAuthorid();
        User author = udao.getUserByID(blogAuthor);
        
        ArrayList<BlogCate> listCate = pdao.getCategory();
        ArrayList<Blog> listBlog = pdao.getBlogAndAuthor();
        
        request.setAttribute("blog", b);
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("author", author);
        request.setAttribute("cate", listCate);
        request.getRequestDispatcher("PostDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}

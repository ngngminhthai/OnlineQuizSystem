
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

@WebServlet(name = "PostCateController", urlPatterns = {"/postCate"})
public class PostCateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO bdao = new BlogDAO();
        int cateID = Integer.parseInt(request.getParameter("cateid"));
        String blogCateName = bdao.getBlogCateNameByCateid(cateID);
        ArrayList<Blog> listBlog = bdao.getBlogByCateID(cateID);
        ArrayList<BlogCate> listCate = bdao.getCategory();
        ArrayList<Blog> listRecent = bdao.getBlogAndAuthor();
        ArrayList<Blog> listAllBlog = bdao.getAllBlogsByDate();
                
        request.setAttribute("cate", listCate);
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("listRecent", listRecent);
        request.setAttribute("listAllBlog", listAllBlog);
        request.setAttribute("blogCateName",blogCateName);
        request.getRequestDispatcher("PostCategory2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

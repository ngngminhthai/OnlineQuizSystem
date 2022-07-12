
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

@WebServlet(name = "PostNewController", urlPatterns = {"/postnew"})
public class PostNewController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        /*load category and author */ 
        PostDAO postdao = new PostDAO();
        UserDAO udao = new UserDAO();

        ArrayList<User> user = udao.getUserByRoleID(2);
        ArrayList<BlogCate> listCate = postdao.getCategory();

        request.setAttribute("listUser", user);
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("PostNew.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String title = request.getParameter("title");
        int category = Integer.parseInt(request.getParameter("LCate"));
        /*img-thumbnail*/
        String file = request.getParameter("file");
        /*img*/
        /*last update*/
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        /*last update*/
        int author = Integer.parseInt(request.getParameter("LUser"));
        String brief = request.getParameter("brief");
        String detail = request.getParameter("detail");
        String status = request.getParameter("status");
        boolean stt = false;
        if(status!=null){
            stt = status.equals("checked");
        }
        
        
    //    boolean stt = status.equals("true");

        Blog b = new Blog(title, category, file, sqlDate, author, brief, detail, stt);
        PostDAO postdao = new PostDAO();
        postdao.insertBlog(b);
        response.sendRedirect("postlist");
    }

}

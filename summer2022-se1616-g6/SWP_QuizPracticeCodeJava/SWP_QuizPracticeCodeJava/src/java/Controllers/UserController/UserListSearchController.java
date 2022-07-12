
package Controllers.UserController;

import DAL.UserDAO;
import Models.User;
import Models.UserRole;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserListSearchController", urlPatterns = {"/userListSearch"})
public class UserListSearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        String name = "";
        String email = "";
        String phone = "";
        String key = "";
        if(request.getParameter("keyword") != null){
            key = request.getParameter("keyword");
        }
        if(request.getParameter("fullname") != null){
            name = request.getParameter("fullname");
        }
        if(request.getParameter("email") != null){
            email = request.getParameter("email");
        }
        if(request.getParameter("phone") != null){
            phone = request.getParameter("phone");
        }
        System.out.println("key: "+key);
        System.out.println("name: "+name);
        System.out.println("phone: "+phone);
        System.out.println(name.equals(""));
        final int pageSize = 15;
        int totalPage = 1;
        int pageIndex = 1;
        int totalAmount = 0;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }
        totalAmount = udao.getTotalUsersSearch(name, email, phone, key);
        System.out.println("total users: "+totalAmount);
        totalPage = totalAmount / pageSize;
        if (totalAmount % pageSize != 0) {
            totalPage++;
        }
        ArrayList<UserRole> listRole = udao.getUserRole();
        String currentURL = request.getRequestURI() + "?" + request.getQueryString();
        ArrayList<User> listUser = udao.searchUser(name, email, phone, key, pageIndex, pageSize);
        request.setAttribute("listUser", listUser);
        request.setAttribute("key", key);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("listRole", listRole);
        request.setAttribute("link", currentURL + "&page");        
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", pageIndex);
        request.getRequestDispatcher("UserList.jsp").forward(request, response);
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

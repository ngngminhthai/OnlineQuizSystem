package Controllers.UserController;

import DAL.UserDAO;
import Models.User;
import Models.UserRole;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserListController", urlPatterns = {"/admin/listUsers"})
public class UserListController_1 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        int gender = 2;
        int role = 6;
        int status = 2;
        if (request.getParameter("gender") != null) {
            gender = Integer.parseInt(request.getParameter("gender"));
        }
        if (request.getParameter("role") != null) {
            role = Integer.parseInt(request.getParameter("role"));
        }
        if (request.getParameter("status") != null) {
            status = Integer.parseInt(request.getParameter("status"));
        }

        final int pageSize = 15;
        int totalPage = 1;
        int pageIndex = 1;
        int totalAmount = 0;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }
        System.out.println("gender: "+gender);
        System.out.println("role: "+role);
        if (gender == 2 && role == 6 && status == 2) {
            totalAmount = udao.getTotalUsers();
        } else {
            totalAmount = udao.getTotalUsersFilter(gender, role, status);
        }
        System.out.println("total usrs: "+totalAmount);
        totalPage = totalAmount / pageSize;
        if (totalAmount % pageSize != 0) {
            totalPage++;
        }
        ArrayList<UserRole> listRole = udao.getUserRole();        
        String url = "listUsers?gender=" + gender + "&role=" + role + "&status=" + status + "&page";
        
        ArrayList<User> listUser = udao.getAllUsers();
        request.setAttribute("listUser", listUser);
        request.setAttribute("listRole", listRole);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("link", url);
        request.setAttribute("gen", gender);
        request.setAttribute("roleValue", role);
        request.setAttribute("stat", status);
        request.getRequestDispatcher("../UserList.jsp").forward(request, response);
//        request.getRequestDispatcher("../AdminSettingList.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        int gender = 2;
        int role = 6;
        int status = 2;
        if (request.getParameter("gender") != null) {
            gender = Integer.parseInt(request.getParameter("gender"));
        }
        if (request.getParameter("role") != null) {
            role = Integer.parseInt(request.getParameter("role"));
        }
        if (request.getParameter("status") != null) {
            status = Integer.parseInt(request.getParameter("status"));
        }
        System.out.println("gender: "+gender);
        System.out.println("role: "+role);
        ArrayList<User> listUser = udao.filterUser(gender, role, status);
        System.out.println("list user filter size: "+listUser.size());
        ArrayList<UserRole> listRole = udao.getUserRole();        
        
        request.setAttribute("listUser", listUser);
        request.setAttribute("listRole", listRole);
        request.setAttribute("gen", gender);
        request.setAttribute("roleValue", role);
        request.setAttribute("stat", status);
        request.getRequestDispatcher("../UserList.jsp").forward(request, response);
       
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

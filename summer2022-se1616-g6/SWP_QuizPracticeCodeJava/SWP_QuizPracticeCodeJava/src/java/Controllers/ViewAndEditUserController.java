
package Controllers;

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

@WebServlet(name = "ViewAndEditUserController", urlPatterns = {"/admin/viewEditUser"})
public class ViewAndEditUserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        ArrayList<UserRole> listRole = udao.getUserRole();
        int userid = Integer.parseInt(request.getParameter("uid"));

        //String userRole = request.getParameter("role");
        User user = udao.getUserByID(userid);
        int userRole = user.getRoleId();
        request.setAttribute("user", user);
        int status = (user.getStatus()) ? 1 : 0;
        request.setAttribute("roleValue", userRole);
        request.setAttribute("listRole", listRole);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../ViewEditUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        int userid = Integer.parseInt(request.getParameter("uid"));
        int userRole = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));
        udao.adminUpdateUser(userid, userRole, status);
        response.sendRedirect("viewEditUser?uid=" + userid);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

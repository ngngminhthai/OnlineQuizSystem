package Controllers;

import DAL.UserDAO;
import Models.User;
import Utils.HashPass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ChangePasswordController", urlPatterns = {"/changePassword"})
public class ChangePasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "");
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        int userid = u.getUserId();
        UserDAO udao = new UserDAO();
        User user = udao.getUserByID(userid); //get user by id from uid parameter on url
        HashPass hash = new HashPass();
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String confirmNewPass = request.getParameter("confirmPass");
        String hashPass = hash.hashPassword(oldPass);
        String message = "";
        if (user.getPassword().equals(hashPass)) {
            if (newPass.equals(confirmNewPass)) {
                String newHashPass = hash.hashPassword(confirmNewPass);
                udao.changePassword(userid, newHashPass);
                message = "Changed password successfully, log out then log in again with new password";
            } else {
                message = "Confirm password must match with new password";
            }
        } else {
            message = "Old password is incorrect";
        }
        System.out.println(message);
        //session.setAttribute("message", message);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" +message+ "');");
        out.println("location='home';");
        out.println("</script>");
        //response.sendRedirect("home");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

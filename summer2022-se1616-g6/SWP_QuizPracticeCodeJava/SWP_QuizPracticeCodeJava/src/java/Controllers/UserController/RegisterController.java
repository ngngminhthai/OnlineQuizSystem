package Controllers.UserController;

import SendEmail.SendEmail;
import SendEmail.Security;
import DAL.UserDAO;
import Models.User;
import Utils.HashPass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegisterController", urlPatterns = {"/signup"})
public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
//        request.setAttribute("role", listRole);
        String fullName = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPass = request.getParameter("confirmPass");
        String email = request.getParameter("email");
        int sex = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");
        HashPass hash = new HashPass();
        // String hashPass = hash.hashPassword(password);
        String confirmHashPass = hash.hashPassword(confirmPass);
        String message = "";
        SendEmail sendMail = new SendEmail();
        Security sec = new Security();
        HttpSession session = request.getSession();

        ArrayList<User> listUsername = udao.getAllUsers();
        if (udao.checkEmail(listUsername, email) == false && password.equals(confirmPass)) {
            sendMail.send(email, sec.getSubject(), sec.getBody(), sec.getAddress(), sec.getPassword());
            session.setAttribute("fullName", fullName);
            session.setAttribute("username", username);
            session.setAttribute("password", confirmHashPass);
            session.setAttribute("email", email);
            session.setAttribute("sex", sex);
            session.setAttribute("phone", phone);

            request.getRequestDispatcher("Verify.jsp").forward(request, response);
        } else if (!password.equals(confirmPass)) {
            message = "Confirm password must be identical to password";
//            response.setContentType("text/html;charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Confirm password must be identical to password');");
//            out.println("location='home';");
//            out.println("</script>");
        } else {
            message = "Email has already exsited, choose an other email";

        }
        System.out.println(message);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" +message+ "');");
        out.println("location='home';");
        out.println("</script>");
    }

}

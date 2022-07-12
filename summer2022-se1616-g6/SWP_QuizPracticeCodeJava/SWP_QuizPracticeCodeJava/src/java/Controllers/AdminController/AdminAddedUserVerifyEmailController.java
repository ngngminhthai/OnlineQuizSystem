package Controllers.AdminController;

import DAL.UserDAO;
import Utils.HashPass;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminAddedUserVerifyEmailController", urlPatterns = {"/addedUserVerifyEmail"})
public class AdminAddedUserVerifyEmailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("UserAddedEmailVerify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        HttpSession ses = request.getSession();
        String verify = request.getParameter("verify");
        request.setAttribute("verify2", verify);
        if (verify.equals("true")) {
            String fullname = ses.getAttribute("fullname").toString();
            String username = ses.getAttribute("username").toString();
            String password = ses.getAttribute("password").toString();
            String email = ses.getAttribute("email").toString();
            int role = Integer.parseInt(ses.getAttribute("role").toString());            
            int gender = Integer.parseInt(ses.getAttribute("gender").toString());
            String phone = ses.getAttribute("phone").toString();
            int status = Integer.parseInt(ses.getAttribute("status").toString());
            String address = ses.getAttribute("address").toString();
            HashPass hash = new HashPass();
            String passhash = hash.hashPassword(password);
            udao.adminAddUser(fullname, username, passhash, role, email, gender, phone, status, address);
            request.setAttribute("message", "Added successfully, you can now login into our system with password is " + password
                    + ", go back to <a href=\"home\">home</a>");
            request.getRequestDispatcher("UserAddedEmailVerify.jsp").forward(request, response);
            response.sendRedirect("addedUserVerifyEmail");
        } else {
            request.setAttribute("message", "Registered unsuccessfully, try again"
                    + ", go back to <a href=\"home\">home</a>");
            request.getRequestDispatcher("UserAddedEmailVerify.jsp").forward(request, response);
            response.sendRedirect("addedUserVerifyEmail");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

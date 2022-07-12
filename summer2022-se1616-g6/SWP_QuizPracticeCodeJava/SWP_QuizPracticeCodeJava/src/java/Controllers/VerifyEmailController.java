package Controllers;

import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "VerifyEmailController", urlPatterns = {"/verifyEmail"})
public class VerifyEmailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("VerifyEmail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        HttpSession ses = request.getSession();
        String verify = request.getParameter("verify");
        //request.getSession().setAttribute("verify2", verify);
        request.setAttribute("verify2", verify);
        if (verify.equals("true")) {
            String fullName = ses.getAttribute("fullName").toString();
            String username = ses.getAttribute("username").toString();
            String password = ses.getAttribute("password").toString();
            String email = ses.getAttribute("email").toString();
            int gender = Integer.parseInt(ses.getAttribute("sex").toString());
            String phone = ses.getAttribute("phone").toString();
            udao.registerUser(fullName, username, password, email, gender, phone);
            request.setAttribute("message", "Registered successfully, you can now login into our system"
                    + ", go back to <a href=\"home\">home</a>");
            request.getRequestDispatcher("VerifyEmail.jsp").forward(request, response);
            response.sendRedirect("verifyEmail");
        }
        else{
            request.setAttribute("message", "Registered unsuccessfully, try again"
                    + ", go back to <a href=\"home\">home</a>");
            request.getRequestDispatcher("VerifyEmail.jsp").forward(request, response);
            response.sendRedirect("verifyEmail");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

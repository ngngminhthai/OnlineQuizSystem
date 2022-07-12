package Controllers.AdminController;

import DAL.UserDAO;
import Models.User;
import Models.UserRole;
import SendEmail.Security;
import SendEmail.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminAddUserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        ArrayList<UserRole> listRole = udao.getUserRole();
        request.setAttribute("listRole", listRole);
        request.getRequestDispatcher("../AdminAddNewUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        int role = Integer.parseInt(request.getParameter("role"));
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");
        String address = "";
        if (request.getParameter("address") != null) {
            address = request.getParameter("address");
        }
        int status = Integer.parseInt(request.getParameter("status"));
        String password = request.getParameter("password");
        
        ArrayList<User> listEmail = udao.getUserEmail();
        boolean checkEmail = udao.checkEmail(listEmail, email);
        if (checkEmail == false) {
            session.setAttribute("fullname", fullname);
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("email", email);
            session.setAttribute("role", role);
            session.setAttribute("gender", gender);
            session.setAttribute("phone", phone);
            session.setAttribute("status", status);
            session.setAttribute("address", address);
            
            System.out.println("name: " + fullname + " role: " + role + " gender: " + gender + "status: " + status);
            //send email
            String bodyAddUser = "<div class=\"container\" style=\"width: 500px;height: 500px;background-color: pink;\">\n"
                    + "            <h1 class=\"logo\" style=\"color:yellow;text-align: center;padding-top: 50px;font-size: 30px\">Quizzy</h1>\n"
                    + "            <div class=\"content\" style=\"padding-right: 20px;padding-left: 40px;margin-top: 50px;\"><h4 style=\"font-family: calibri;font-size: 30px;\">Dear,</h4>\n"
                    + "                <p style=\"margin-bottom: 20px;line-height: 1.5;font-family: calibri; font-size: 16px\">You've just been added as a member of Quizzy!<br>\n"
                    + "                    Click the link below to verify your account.\n"
                    + "http://localhost:8084/SWP_QuizPracticeCodeJava/addedUserVerifyEmail"
                    + "            </div>\n"
                    + "        </div>\n";
            Security sec = new Security();
            SendEmail.send(email, "Added member announcement", bodyAddUser, sec.getAddress(), sec.getPassword());
            //success alert
            String message = "We have sent an email to " + email;
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + message + "');");
            out.println("location='addUser';");
            out.println("</script>");
           // System.out.println("hello admin add user");
        }else{
            String message = "The email " + email +" has already existed in the system";
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + message + "');");
            out.println("location='addUser';");
            out.println("</script>");
        }
        //response.sendRedirect("addUser");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

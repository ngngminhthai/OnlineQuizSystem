package Controllers;

import DAL.UserDAO;
import Models.User;
import SendEmail.SecurityReset;
import SendEmail.SendEmail;
import Utils.Generate;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ForgetPasswordController", urlPatterns = {"/forgetPassword"})
public class ForgetPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "");
        request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SendEmail send = new SendEmail();
        SecurityReset secReset = new SecurityReset();
        UserDAO udao = new UserDAO();
        String customerEmail = request.getParameter("email");
        //check if the email is in the DB or not
        ArrayList<User> listEmail = udao.getUserEmail();
        HttpSession session = request.getSession();
        boolean emailExistence = udao.checkEmail(listEmail, customerEmail);
        if (emailExistence == false) {
            request.setAttribute("message", "We cannot find your email in the system.");
            request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
        } else {
            String tokenReset; 
            while(true){
               Generate generate = new Generate();
               tokenReset = generate.generateResetToken();
               if(!udao.CheckResetToken(tokenReset)){
                   break; 
               }
            }
            //add new token for user
            System.out.println("token from email: "+tokenReset);
            udao.createToken(customerEmail, tokenReset);
            User userReset = udao.getUserByEmail(customerEmail);
            String emailBody = "<div class=\"container\" style=\"width: 500px;height: 500px;background-color: pink;\">\n"
                    + "            <h1 class=\"logo\" style=\"color:yellow;text-align: center;padding-top: 50px;font-size: 30px\">Quizzy</h1>\n"
                    + "            <div class=\"content\" style=\"padding-right: 20px;padding-left: 40px;margin-top: 50px;\"><h4 style=\"font-family: calibri;font-size: 30px;\">Dear customer,</h4>\n"
                    + "                <p style=\"margin-bottom: 20px;line-height: 1.5;font-family: calibri; font-size: 16px\">Looks like you forgot your password, here's the link to reset it, "
                    + "                   but keep in mind that this link will only be available for a short period of time.\n"
                    + "                <p style=\"font-weight: bold;font-size: 17px\">Click below to get there:</p></p><br>\n"
                    + "                <a href=\"http://localhost:8084/SWP_QuizPracticeCodeJava/resetPassword?token=" + tokenReset + "\"style=\"text-decoration: none;\">\n"
                    + "                    <p class=\"button\" style=\"width: 200px;height: 40px;border-radius: 20px;font-size: 20px;color: #0077b3;text-align: center;background-color: white;padding-top: 6px;\">Go now</p></a>\n"
                    + "            </div>\n"
                    + "        </div>\n";
            send.send(customerEmail, secReset.getSubject(), emailBody, secReset.getSenderAddress(), secReset.getPassword());
            session.setAttribute("customerMail", customerEmail);
            request.setAttribute("message", "We have sent you an email to " + customerEmail);
            session.setAttribute("userReset", userReset);
            request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

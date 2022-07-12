package Controllers;

import DAL.UserDAO;
import Models.User;
import Utils.HashPass;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet(name = "ResetPasswordController", urlPatterns = {"/resetPassword"})
public class ResetPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("userReset");
        request.setAttribute("user", u);
        String tokenValue = request.getParameter("token");
        System.out.println("Token: " + tokenValue);
        request.setAttribute("tokenGet", tokenValue);
        UserDAO udao = new UserDAO();
        User user = udao.getUserByToken(tokenValue);
        if (user != null) {
            try {
                long ExpirationTime = Long.parseLong(getServletConfig().getInitParameter("ExpirationTime"));
                SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date currentDate = new java.util.Date(); // current time went user click link 
                Date createTimeResetToken = sdfDate.parse(user.getCreateTimeResetToken()); // create time of token
                long duration = currentDate.getTime() - createTimeResetToken.getTime(); // Get msec of duration  
                long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration); // currentDate more than xMinute with createTimeResetToken 
                if (diffInMinutes <= ExpirationTime && diffInMinutes >= 0) {
                    request.setAttribute("resetToken", user.getToken());
                    request.getRequestDispatcher("ResetPassword2.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Time out, the link is no longer available");
                    request.getRequestDispatcher("404page.jsp").forward(request, response);
                }
            } catch (ParseException ex) {
                System.out.println("Parse ex: " + ex.getMessage());
            }
        } else {
            request.setAttribute("message", "This link does not exist");
            request.getRequestDispatcher("404page.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        HashPass hash = new HashPass();
        String token = request.getParameter("tokenValue");
        User user = udao.getUserByToken(token);
        if (user != null) {
            try {
                long ExpirationTime = Long.parseLong(getServletConfig().getInitParameter("ExpirationTime"));
                SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date currentDate = new java.util.Date(); // current time went user click link 
                Date createTimeResetToken = sdfDate.parse(user.getCreateTimeResetToken()); // create time of token
                long duration = currentDate.getTime() - createTimeResetToken.getTime(); // Get msec of duration  
                long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration); // currentDate more than xMinute with createTimeResetToken 
                if (diffInMinutes <= ExpirationTime && diffInMinutes >= 0) {
                    String password = request.getParameter("pass");
                    String passReset = hash.hashPassword(password);
                    udao.resetPassword(token, passReset);
                    request.setAttribute("message", "Reset successfully");
                    request.getRequestDispatcher("ResetPassword2.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Time out, this link is longer available");
                    request.getRequestDispatcher("404page.jsp").forward(request, response);
                }
            } catch (ParseException ex) {
                System.out.println(ex.getMessage());
            }
        } else {
            System.out.println("user null");
            request.getRequestDispatcher("404page.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package Controllers;

import DAL.UserDAO;
import Models.User;
import Utils.HashPass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cok = request.getCookies();
        String email = null;
        String password = null;
        for (Cookie cooky : cok) {
            if (cooky.getName().equals("username")) {
                email = cooky.getValue();
            }
            if (cooky.getName().equals("password")) {
                password = cooky.getValue();
            }
            if (email != null && password != null) {
                break;
            }
        }
        if (email != null && password != null) {
            User user = new UserDAO().userLogin(email, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("home");
                return;
            }
        }
        request.getRequestDispatcher("home").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean remember = request.getParameter("remember") != null;
        HashPass hash = new HashPass();
        String hashPass = hash.hashPassword(password);
        UserDAO udao = new UserDAO();
        User user = udao.userLogin(email, hashPass);
        HttpSession session = request.getSession();
        if (user != null) {
            if (remember) {
                Cookie userC = new Cookie("email", email);
                Cookie passC = new Cookie("password", password);
                userC.setMaxAge(60 * 60 * 24);
                passC.setMaxAge(60 * 60 * 24);
                response.addCookie(userC);
                response.addCookie(passC);
            }
            session.setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('User or password incorrect');");
            out.println("location='home';");
            out.println("</script>");
            //request.setAttribute("mess", "Incorrect email or password");
            //request.getRequestDispatcher("home").forward(request, response);
        }
    }

}

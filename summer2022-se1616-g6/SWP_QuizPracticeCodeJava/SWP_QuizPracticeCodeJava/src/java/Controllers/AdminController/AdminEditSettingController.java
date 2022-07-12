package Controllers.AdminController;

import DAL.QuizDAO;
import DAL.SettingDAO;
import Models.Quiz;
import Models.Setting;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminEditSettingController", urlPatterns = {"/admin/editSetting"})
public class AdminEditSettingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int settingid = Integer.parseInt(request.getParameter("sid"));
        SettingDAO sdao = new SettingDAO();
        Setting s = sdao.getSettingByID(settingid);
        int quizid = s.getQuizid();
        QuizDAO dao = new QuizDAO();
        Quiz q = dao.getQuizById(quizid);
        
        int status = (s.getStatus()) ? 1 : 0;
        request.setAttribute("setting", s);
        request.setAttribute("quiz", q);
        request.setAttribute("status", status);
        request.getRequestDispatcher("../AdminEditSetting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        SettingDAO sdao = new SettingDAO();
        int settingid = Integer.parseInt(request.getParameter("settingid"));
        int quizid = Integer.parseInt(request.getParameter("quizid"));
        int duration = 0;
        int questionNum = 0;
        try {
            if (request.getParameter("duration") != null || request.getParameter("duration") != "") {
                duration = Integer.parseInt(request.getParameter("duration"));
            }
            if (request.getParameter("quesNum") != null || request.getParameter("quesNum") != "") {
                questionNum = Integer.parseInt(request.getParameter("quesNum"));
            }
        } catch (NumberFormatException e) {
            
        }
        int status = Integer.parseInt(request.getParameter("status"));
        String url = "editSetting?sid="+settingid;
        if (duration > 0 && questionNum > 0 && questionNum < 61) {
            sdao.editSetting(settingid, duration, questionNum, status, quizid);        
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Edited successfully');");
            out.println("location='"+url+"';");
            out.println("</script>");
        }else{
            out.println("<script type=\"text/javascript\">");
            out.println("location='"+url+"';");
            out.println("</script>");
            
        }
        //response.sendRedirect("editSetting?sid=" + settingid);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

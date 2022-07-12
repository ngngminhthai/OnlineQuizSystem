package Controllers.AdminController;

import DAL.QuizDAO;
import DAL.SettingDAO;
import Models.Quiz;
import Models.SettingType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminAddSetiingController", urlPatterns = {"/admin/addSetting"})
public class AdminAddSetiingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingDAO sdao = new SettingDAO();
        QuizDAO qdao = new QuizDAO();
        ArrayList<Quiz> listQuiz = qdao.getQuizLeftToAddSetting();
        ArrayList<SettingType> listSettingType = sdao.getSettingType();
        request.setAttribute("settingType", listSettingType);
        request.setAttribute("listQuiz", listQuiz);
        request.getRequestDispatcher("../AdminAddSetting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingDAO sdao = new SettingDAO();
        String settingName = request.getParameter("settingname");
        int quizid = Integer.parseInt(request.getParameter("quizName"));
        int settingType = Integer.parseInt(request.getParameter("type"));
        int duration = 0;
        int numQuestion = 0;
        int maxAns = 0;
        if (request.getParameter("duration") != null) {
            duration = Integer.parseInt(request.getParameter("duration"));
        }
        if (request.getParameter("numberQuest") != null) {
            numQuestion = Integer.parseInt(request.getParameter("numberQuest"));
        }
        if (request.getParameter("maxAns") != null) {
            maxAns = Integer.parseInt(request.getParameter("maxAns"));
        }
        int status = Integer.parseInt(request.getParameter("status"));
        if (duration > 0 && numQuestion > 0 && maxAns > 0) {
            sdao.addSetting(quizid, settingType, settingName, duration, numQuestion, status, maxAns);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Add successfully');");
            out.println("location='addSetting';");
            out.println("</script>");
        }else{
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("location='addSetting';");
            out.println("</script>");
        }
//        response.sendRedirect("addSetting");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


package Controllers.AdminController;

import DAL.SettingDAO;
import Models.Setting;
import Models.SettingType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminSettingController", urlPatterns = {"/admin/setting"})
public class AdminSettingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingDAO sdao = new SettingDAO();
        ArrayList<Setting> listSetting = sdao.getAllSetting();
        ArrayList<SettingType> listType = sdao.getSettingType();
        
        request.setAttribute("listSetting", listSetting);
        request.setAttribute("listType", listType);
        request.getRequestDispatcher("../AdminSettingList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingDAO sdao = new SettingDAO();
        ArrayList<SettingType> listType = sdao.getSettingType();
        
        int typeid = Integer.parseInt(request.getParameter("type"));
        int status = Integer.parseInt(request.getParameter("status"));
        System.out.println("type: "+typeid);
        System.out.println("status: "+status);
        ArrayList<Setting> listSetting = sdao.filterSetting(typeid, status);
        request.setAttribute("listSetting", listSetting);
        request.setAttribute("listType", listType);
        request.setAttribute("typeChosen", typeid);
        request.setAttribute("statusChosen", status);
        request.getRequestDispatcher("../AdminSettingList.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

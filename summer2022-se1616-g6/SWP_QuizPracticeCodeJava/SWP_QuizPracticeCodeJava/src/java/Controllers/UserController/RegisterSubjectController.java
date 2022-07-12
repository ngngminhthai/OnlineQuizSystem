/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.UserController;

import DAL.PricePackageDAO;
import DAL.RegistrationDAO;
import Models.PricePackage;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RegisterSubjectController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterSubjectController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterSubjectController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("subjectId"));
        int pid = Integer.parseInt(request.getParameter("packageId"));
        User currUser = (User) request.getSession().getAttribute("user");
        RegistrationDAO r = new RegistrationDAO();

        PricePackageDAO pd = new PricePackageDAO();
        int duration = pd.getDurationOfPricePackage(pid);

        String raw_validTo = r.checkRegisterCondition2(sid, currUser.getUserId());
        if (!raw_validTo.isEmpty()) {
            Timestamp date = Timestamp.valueOf(raw_validTo);
            Timestamp validFrom = Timestamp.valueOf(raw_validTo);

            Calendar cal = new GregorianCalendar();
            cal.setTime(date);

            if (duration == 3) {
                cal.add(Calendar.MONTH, 3);

            } else if (duration == 6) {
                cal.add(Calendar.MONTH, 3);
            } else if (duration == 0) {
                r.updateOverrideRegistration(pid, sid, null, null, currUser.getUserId());
                return;
            }
            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

            String formatted = format1.format(cal.getTime());

            Timestamp validTo = Timestamp.valueOf(formatted);

            r.updateOverrideRegistration(pid, sid, validTo, validFrom, currUser.getUserId());

        } else {
            r.registerSubject(sid, pid, currUser.getUserId());
        }
        response.sendRedirect("subjectdetail?sid="+sid+"");
    }

    public static void main(String[] args) {

        Timestamp date = Timestamp.valueOf("2022-06-18 14:35:42.370");

        Calendar cal = new GregorianCalendar();
        cal.setTime(date);

        cal.add(Calendar.MONTH, 3);

        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        String formatted = format1.format(cal.getTime());
        System.out.println(formatted);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

package Controllers.UserController;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAL.UserDAO;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class UserProfileController extends HttpServlet {

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

        UserDAO userdb = new UserDAO();
        String phone = request.getParameter("phone");
        String fullName = request.getParameter("name");
        String raw_gender = request.getParameter("gender");
        User acc = (User) request.getSession().getAttribute("user");
        boolean isCorrect = true;
        boolean gender = true;
        if (raw_gender.equalsIgnoreCase("female")) {
            gender = false;
        }

        String name_msg = "";
        String phone_msg = "";

        if (!fullName.matches("[a-zA-Z ]+")) {
            name_msg = "Invalid name";
            isCorrect = false;
        }
        if (!phone.matches("((84)|0)[0-9]{9}")) {
            phone_msg = "Invalid phone number";
            isCorrect = false;
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(name_msg + "|" + phone_msg);
        }
        
        if(isCorrect == true){
        userdb.updateUser(fullName, phone, gender,acc.getUserId());
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
        processRequest(request, response);
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

//    public static void main(String[] args) {
//        String userimg = "user1.png";
//        File myObj = new File("C:\\Users\\Admin\\Documents\\NetBeansProjects\\FPTCommunity\\web\\img\\" + userimg);
//        if (myObj.delete()) {
//            System.out.println("Deleted the file: " + myObj.getName());
//        } else {
//            System.out.println("Failed to delete the file.");
//        }
//    }
}

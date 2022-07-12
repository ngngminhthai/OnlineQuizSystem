/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Controllers.UserController.UserProfileController2;
import DAL.SliderDAO;
import Models.Slider;
import Models.Subject;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author admin
 */
public class SliderDetailController extends HttpServlet {

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
            out.println("<title>Servlet SliderDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderDetailController at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        SliderDAO dao = new SliderDAO();
        Slider s = dao.getSliderById(id);
        ArrayList<Subject> listSubjetcName = dao.getAllSubjectNameInSlider();
        
        request.setAttribute("id", id);
        request.setAttribute("s", s);
        request.setAttribute("listSubjetcName", listSubjetcName);
        
        request.getRequestDispatcher("SliderDetail.jsp").forward(request, response);
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
        SliderDAO dao = new SliderDAO();
        int id = -1;
        String title = "";
        String note = "";
        String backlink = "";
        String status = "";
        boolean stt = false;
        Slider s = new Slider();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        User currUser = (User) request.getSession().getAttribute("user");

        String filename = null;
        boolean isUpload = true;
        try {
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);
//            Slider s = dao.getSliderById();
            status = items.get(1).getString();
            id = Integer.parseInt(items.get(2).getString());
            title = items.get(3).getString();
            backlink = items.get(4).getString();
            note = items.get(5).getString();
            s = dao.getSliderById(id);
            if (status != null) {
                stt = status.equals("checked");
            }
            Iterator<FileItem> iter = items.iterator();
            HashMap<String, String> fields = new HashMap<>();

            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (item.getName().isEmpty()) {
                    isUpload = false;
                    break;
                }
                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString());
                    String name = item.getFieldName();
                    String value = item.getString();
                    System.out.println(name + " " + value);
                } else {
                    filename = "u_" + s.getSliderId() + "_" + item.getName();
                    if (filename == null || filename.equals("")) {
                        break;
                    } else {
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/img/slider");
                        File uploadFile = new File(storePath + "/" + path.getFileName());
                        if (uploadFile.canRead()) {
                            uploadFile.delete();
                        }
                        item.write(uploadFile);
                    }
                    out.println(filename);
                }
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(UserProfileController2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UserProfileController2.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (isUpload == true) {
            s.setImage(filename);
            dao.updateSliderImg(s.getSliderId(), filename);
        }

        dao.UpdateSlider(title, backlink, note, stt, id);
        request.getRequestDispatcher("sliderlist?keyword=&page=1&status=").forward(request, response);
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

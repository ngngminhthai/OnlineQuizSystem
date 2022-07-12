package Controllers;

import Controllers.UserController.UserProfileController2;
import DAL.PostDAO;
import DAL.UserDAO;
import Models.Blog;
import Models.BlogCate;
import Models.User;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "PostEditController", urlPatterns = {"/postedit"})
public class PostEditController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int blogid = Integer.parseInt(request.getParameter("blogid"));
        PostDAO pdao = new PostDAO();
        UserDAO udao = new UserDAO();
        Blog b = pdao.getBlogByBlogID(blogid);
        int blogAuthor = b.getAuthorid();
        User author = udao.getUserByID(blogAuthor);

        ArrayList<Blog> listBlog = pdao.getBlogAndAuthor();
        ArrayList<Blog> list = pdao.getAllBlogsByDate();
        ArrayList<User> user = udao.getUserByRoleID(2);
        ArrayList<BlogCate> listCate = pdao.getCategory();

        request.setAttribute("listUser", user);
        request.setAttribute("listCate", listCate);
        request.setAttribute("blog", b);
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("list", list);
        request.setAttribute("author", author);
        //    response.getWriter().print(b.getBlogId());
        request.getRequestDispatcher("PostEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int blogid = Integer.parseInt(request.getParameter("blogid"));
//        String title = request.getParameter("title");
//        int category = Integer.parseInt(request.getParameter("LCate"));
//        /*img-thumbnail*/
//        /*img*/
//        /*last update*/
//        java.util.Date utilDate = new java.util.Date();
//        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//        /*last update*/
//        int author = Integer.parseInt(request.getParameter("LUser"));
//        String brief = request.getParameter("brief");
//        String detail = request.getParameter("detail");
//        String status = request.getParameter("status");
//        boolean stt = false;
//        if(status==null){
//            stt = false;
//        }
//        if(status!=null){
//            stt = true;
//        }
        PostDAO postdao = new PostDAO();
        Blog b = new Blog();
        
        int blogid = -1;
        String title = "";
        int category = -1;
        int author = -1;
        String brief = "";
        String detail = "";
        String status = "";
        boolean stt = false;

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
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
            category = Integer.parseInt(items.get(2).getString());
            blogid = Integer.parseInt(items.get(3).getString());
            title = items.get(4).getString();
            detail = items.get(5).getString();
            brief = items.get(6).getString();
            author = Integer.parseInt(items.get(7).getString());
            b = postdao.getBlogByBlogID(blogid);
            if(status==null){
                stt = false;
            }
            if (status != null) {
                stt = true;
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
                    filename = "u_" + b.getBlogId() + "_" + item.getName();
                    if (filename == null || filename.equals("")) {
                        break;
                    } else {
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/img/blog");
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
            b.setThumbnail(filename);
            postdao.updatePostImg(b.getBlogId(), filename);
        }

        postdao.updatePostBlog(title, category, sqlDate, author, brief, detail, stt, blogid);
        response.sendRedirect("postlist");
    }

}

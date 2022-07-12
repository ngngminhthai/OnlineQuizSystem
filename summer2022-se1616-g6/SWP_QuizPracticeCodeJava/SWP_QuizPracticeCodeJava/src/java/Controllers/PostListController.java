/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import DAL.PostDAO;
import Models.Blog;
import Models.BlogCate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class PostListController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PostDAO postdao = new PostDAO();
        String keyword = request.getParameter("keyword");

        //pagination
        final int pageSize = 3;
        int totalPage = 1;
        int pageIndex = 1;
        int totalAmount = 0;
        try {
            if (request.getParameter("page") != null) {
                pageIndex = Integer.parseInt(request.getParameter("page"));
            }
            totalAmount = postdao.getTotalBlogsKeyword(keyword);
            totalPage = totalAmount / pageSize;
            if (totalAmount % pageSize != 0) {
                totalPage++;
            }
        } catch (NumberFormatException ex) {
            PrintWriter out = response.getWriter();
            request.getRequestDispatcher("PostList.jsp").forward(request, response);
            out.println("Page index must be a number, try enter again");
        }
        ArrayList<Blog> listBlog = new ArrayList<>();

        listBlog = postdao.SearchAllBlogsByMarketingDatePaging(keyword, pageIndex, pageSize);

        ArrayList<BlogCate> listCate = postdao.getCategory();
        ArrayList<Blog> listRecentBlog = postdao.getBlogAndAuthor();

        request.setAttribute("keyword", keyword);
        request.setAttribute("listBlog", listBlog);
        request.setAttribute("listCate", listCate);
        request.setAttribute("recentBLog", listRecentBlog);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageIndex", pageIndex);
        request.getRequestDispatcher("PostList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

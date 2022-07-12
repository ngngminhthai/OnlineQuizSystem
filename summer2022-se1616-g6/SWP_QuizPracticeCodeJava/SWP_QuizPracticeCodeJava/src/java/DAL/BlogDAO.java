package DAL;

import Models.Blog;
import Models.BlogCate;
import Models.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BlogDAO extends DBContext {

    public ArrayList<Blog> getBlogsOrderByDate() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select b.blogId,b.blogTitle,b.blogThumbnail,b.lastUpdated,b.briefInfo,b.blogDetail,bc.*,u.userId, u.fullName from Blog b\n"
                + "join BlogCategory bc on b.blogCategoryId = bc.blogCategoryId\n"
                + "join [User] u on b.author = u.userId\n"
                + "order by b.lastUpdated desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        new BlogCate(rs.getInt(7), rs.getString(8)),
                        new User(rs.getInt(9), rs.getString(10)));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> getAllBlogsByDate() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT * from Blog\n"
                + "order by [Blog].lastUpdated";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> getAllBlogsByDatePaging(int pageIndex, int pageSize) {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT * from Blog\n"
                + "order by [Blog].lastUpdated \n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> getBlogByCateID(int cateid) {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select * from Blog \n"
                + "where blogCategoryId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cateid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Blog getBlogByBlogID(int blogid) {
        String sql = "select * from Blog where blogId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, blogid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<BlogCate> getCategory() {
        ArrayList<BlogCate> list = new ArrayList<>();
        String sql = "select * from BlogCategory";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BlogCate b = new BlogCate(rs.getInt(1),
                        rs.getString(2));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> getBlogCateName() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select * from BlogCategory";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1),
                        rs.getString(2));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> getBlogAndAuthor() {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select b.blogId, b.blogTitle, u.fullName\n"
                + "  from blog b, [User] u\n"
                + "  where b.author=u.userId\n"
                + "  order by b.lastUpdated desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> searchBlogTitle(String blogTitle) {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "  where blogTitle like ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + blogTitle + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalBlogs() {
        String sql = " select count(*) from Blog";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public String getBlogCateNameByCateid(int blogcateid){
        String sql = "select * from BlogCategory where blogCategoryId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, blogcateid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        BlogDAO blogdao = new BlogDAO();
//        ArrayList<Blog> list = blogdao.getBlogByCateID(5);
//        for (Blog blog : list) {
//            System.out.println(blog.getBlogId());
//        }
        
//        ArrayList<Blog> list = blogdao.searchBlogTitle("im");
//        for (Blog blog : list) {
//            System.out.println(blog.getBlogTitle());
//        }
        System.out.println(blogdao.getBlogCateNameByCateid(2));
    }

}

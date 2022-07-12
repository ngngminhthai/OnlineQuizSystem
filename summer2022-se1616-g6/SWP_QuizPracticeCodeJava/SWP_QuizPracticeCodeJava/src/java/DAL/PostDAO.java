package DAL;

import Models.Blog;
import Models.BlogCate;
import Models.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostDAO extends DBContext {
//  --LOAD DATA IN DB--

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
                        rs.getInt(3),/*blogCategory*/
                        rs.getString(4),/*thumbnail*/
                        rs.getDate(5),/*lastUpdated*/
                        rs.getInt(6),/*authorid*/
                        rs.getString(7),/*briefInfo*/
                        rs.getString(8),/*blogDetail*/
                        rs.getBoolean(9));/*status*/
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
                        rs.getString(8),
                        rs.getBoolean(9));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Blog> SearchAllBlogsByMarketingDatePaging(String keyword, int pageIndex, int pageSize) {
        ArrayList<Blog> list = new ArrayList<>();
        String sql = "SELECT * from Blog\n";
        if (keyword != null) {
            sql += " where blogTitle like ? \n";
        }
        sql += " order by [Blog].blogId ASC \n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if (keyword == null) {
                stm.setInt(1, pageIndex);
                stm.setInt(2, pageSize);
                stm.setInt(3, pageSize);
            }

            if (keyword != null) {
                stm.setString(1, "%" + keyword + "%");
                stm.setInt(2, pageIndex);
                stm.setInt(3, pageSize);
                stm.setInt(4, pageSize);
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(rs.getInt("blogID"),
                        rs.getString("blogTitle"),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9));
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
                        rs.getString(8),
                        rs.getBoolean(9));
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
                        rs.getString(8),
                        rs.getBoolean(9));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalBlogsKeyword(String keyword) {
        String sql = "SELECT count(*) from Blog\n";
        if (keyword != null) {
            sql += "where blogTitle like ?";
        }

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if (keyword != null) {
                stm.setString(1, "%" + keyword + "%");
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

//  --CREATE NEW BLOG--
    public void insertBlog(Blog b) {
        try {
            String sql = "INSERT INTO [dbo].[Blog]\n"
                    + "           ([blogTitle]\n"
                    + "           ,[blogCategoryId]\n"
                    + "           ,[blogThumbnail]\n"
                    + "           ,[lastUpdated]\n"
                    + "           ,[author]\n"
                    + "           ,[briefInfo]\n"
                    + "           ,[blogDetail]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, b.getBlogTitle());
            statement.setInt(2, b.getBlogCategoryId());
            statement.setString(3, b.getThumbnail());
            statement.setDate(4, b.getLastUpdated());
            statement.setInt(5, b.getAuthorid());
            statement.setString(6, b.getBriefInfo());
            statement.setString(7, b.getBlogDetail());
            statement.setBoolean(8, b.getBlogStatus());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//  --UPDATE NEW BLOG--
    public void updatePostBlog(String title, int catId, Date date, int author, String brief, String detail, boolean status, int blogId) {
        try {
            String sql = "UPDATE [dbo].[Blog]\n"
                    + "   SET [blogTitle] = ?\n"
                    + "      ,[blogCategoryId] = ?\n"
                    + "      ,[lastUpdated] = ?\n"
                    + "      ,[author] = ?\n"
                    + "      ,[briefInfo] = ?\n"
                    + "      ,[blogDetail] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE [blogId]=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,title);
            statement.setInt(2,catId);
            statement.setDate(3, date);
            statement.setInt(4, author);
            statement.setString(5, brief);
            statement.setString(6, detail);
            statement.setBoolean(7, status);
            statement.setInt(8, blogId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePostImg(int id, String img) {
        try {
            String sql = "Update Blog\n"
                    + "set blogThumbnail = ? where blogId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, img);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        PostDAO blogdao = new PostDAO();
        ArrayList<Blog> list = blogdao.SearchAllBlogsByMarketingDatePaging("wri", 1, 20);
        for (Blog blog : list) {
            System.out.println(blog);
        }

    }

}

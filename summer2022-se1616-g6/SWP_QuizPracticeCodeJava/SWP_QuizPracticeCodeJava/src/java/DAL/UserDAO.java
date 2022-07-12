package DAL;

import Models.User;
import Models.UserRole;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO extends DBContext {

    public User userLogin(String email, String password) {
        String sql = " select * from dbo.[User]\n"
                + "  where [email] = ? \n"
                + "  and [password] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                return user;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<User> getAllExpert() {
        List<User> listUser = new ArrayList<>();
        String sql = "select u.* from [User] u join UserRole r on u.roleId = r.roleId \n"
                + "where roleName = 'Expert'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                listUser.add(user);
            }
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listUser;
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> listUser = new ArrayList<>();
        String sql = " select * from dbo.[User]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                listUser.add(user);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listUser;
    }

    public ArrayList<User> getAllUsersPaging(int pageIndex, int pageSize) {
        ArrayList<User> listUser = new ArrayList<>();
        String sql = "select * from [User]\n"
                + "order by userId\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                listUser.add(user);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listUser;
    }

    public int getTotalUsers() {
        String sql = " select count(*) from [User]";
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

    public ArrayList<User> getUserEmail() {
        ArrayList<User> listUser = new ArrayList<>();
        String sql = " select email from dbo.[User]";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString(1));
                listUser.add(user);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listUser;
    }

    public boolean checkUserName(ArrayList<User> listUsername, String username) {
        for (User user : listUsername) {
            if (user.getUserName().equalsIgnoreCase(username)) {
                return true;
            }
        }
        return false;
    }

    public boolean checkEmail(ArrayList<User> listEmail, String email) {
        for (User user : listEmail) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }

    public void registerUser(String fullName, String username, String password, String email, int gender, String phone) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fullName],[userName]\n"
                + "           ,[password],[roleId]\n"
                + "           ,[profilePic],[email]\n"
                + "           ,[gender],[phone],[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,5\n"
                + "           ,'img/logo/avt2.png'\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,1)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fullName);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.setString(4, email);
            stm.setInt(5, gender);
            stm.setString(6, phone);
            stm.executeUpdate();
        } catch (Exception e) {

        }
    }

    public ArrayList<UserRole> getUserRole() {
        ArrayList<UserRole> listRole = new ArrayList<>();
        String sql = "select * from UserRole";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                UserRole user = new UserRole(rs.getInt(1), rs.getString(2), rs.getBoolean(3));
                listRole.add(user);
            }
        } catch (Exception e) {

        }
        return listRole;
    }

    public ArrayList<Integer> getUserGender() {
        ArrayList<Integer> listGender = new ArrayList<>();
        String sql = "select gender from [User] group by gender";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listGender.add(rs.getInt(1));
            }
        } catch (Exception e) {

        }
        return listGender;
    }

    public ArrayList<Integer> getUserStatus() {
        ArrayList<Integer> listGender = new ArrayList<>();
        String sql = "select status from [User] group by status";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listGender.add(rs.getInt(1));
            }
        } catch (Exception e) {

        }
        return listGender;
    }

    public User getUserByID(int userid) {
        String sql = "select * from [User] where userId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                return user;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public String findImg(int userid) {

        try {
            String sql = "select profilePic from [user] where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                if (rs.getString("profilePic") == null) {
                    return "";
                } else {
                    return rs.getString("profilePic");
                }
            }
            return "";
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public String finlEmail(int userid) {

        try {
            String sql = "select email from [user] where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                if (rs.getString("email") == null) {
                    return "";
                } else {
                    return rs.getString("email");
                }
            }
            return "";
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public boolean findGender(int userid) {

        try {
            String sql = "select gender from [user] where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getBoolean("gender");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public String findPhone(int userid) {

        try {
            String sql = "select phone from [user] where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                if (rs.getString("phone") == null) {
                    return "";
                } else {
                    return rs.getString("phone");
                }
            }
            return "";
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public String findName(int userid) {

        try {
            String sql = "select fullName from [user] where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                if (rs.getString("fullName") == null) {
                    return "";
                } else {
                    return rs.getString("fullName");
                }
            }
            return "";
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public void updateImg(int userid, String img) {

        try {
            String sql = "update [user] set profilePic = ? where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, userid);
            stm.setString(1, img);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUser(String fullName, String phone, boolean gender, int id) {

        try {
            String sql = "UPDATE dbo.[User] SET fullName = ? , phone = ? , gender = ?\n"
                    + "where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fullName);
            stm.setString(2, phone);
            stm.setBoolean(3, gender);
            stm.setInt(4, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUser(String fullName, String phone, boolean gender) {

        try {
            String sql = "UPDATE dbo.[User] SET fullName = ?, phone = ?, gender = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fullName);
            stm.setString(2, phone);
            stm.setBoolean(3, gender);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void adminUpdateUser(int userid, int roleid, int status) {

        try {
            String sql = "UPDATE [User]\n"
                    + "SET [roleId] = ?, [status] = ?\n"
                    + "WHERE userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleid);
            stm.setInt(2, status);
            stm.setInt(3, userid);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserById(int userId) {
        try {
            String sql = "select * from [user] where userId =";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateSubjectExpert(int userID, int subjectID) {
        try {
            String sql = "UPDATE [dbo].[Expert]\n"
                    + "   SET [userId] = ?\n"
                    + " WHERE subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.setInt(2, subjectID);

            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }

    public void changePassword(int userid, String newPass) {
        try {
            String sql = "UPDATE [dbo].[User] SET [password] = ? WHERE userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newPass);
            stm.setInt(2, userid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getStackTrace());
        }
    }

    public User getUserByEmail(String email) {
        String sql = "select * from [User] where email = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                return user;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public boolean CheckResetToken(String token) {
        try {
            String sql = "select * from [User] where token like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + token + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public User getUserByToken(String resetToken) {
        try {
            String sql = "select * from [User] where token = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, resetToken);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"),
                        rs.getString("token"),
                        rs.getString("createdTimeResetToken"));
                return user;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void resetPassword(String resetToken, String newPassword) {
        try {
            String sql = "UPDATE [User] \n"
                    + "SET \n"
                    + "[password] = ?\n"
                    + ",token = null\n"
                    + ",[createdTimeResetToken] = null\n"
                    + "WHERE token = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(2, resetToken);
            stm.setString(1, newPassword);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public void createToken(String email, String resetToken) {
        try {
            String sql = "UPDATE [User]\n"
                    + "   SET [token] = ? \n"
                    + "      ,[createdTimeResetToken] = GETDATE()\n"
                    + " WHERE email = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, resetToken);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public ArrayList<User> getUserByRoleID(int roleid) {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [OnlineQuizSystem].[dbo].[User] where roleId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, roleid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                list.add(user);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public int getTotalUsersFilter(int gender, int role, int status) {
        try {
            String sql = "select count(*) from (\n"
                    + "select * from [User]\n"
                    + "where userId > 0\n";

            if (gender == 2) {
                sql += "";
            } else {
                sql += " and gender = " + gender;
            }

            if (role == 6) {
                sql += "";
            } else {
                sql += " and roleId = " + role;
            }

            if (status == 2) {
                sql += "";
            } else {
                sql += " and status = " + status;
            }

            sql += ") tbl";
            if (gender == 2 && role == 6 && status == 2) {
                sql = "select count(*) from [User]";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
//            System.out.println(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int getTotalUsersSearch(String name, String email, String phone, String keyword) {
        try {
            String sql = "select count(*) from (\n"
                    + "select * from [User]\n"
                    + "where userId > 0\n";
            if (name.equals("fullname")) {
                sql += "and fullName like '%" + keyword + "%'";
            }
            if (email.equals("email")) {
                sql += "and email like '%" + keyword + "%'";
            }
            if (phone.equals("phone")) {
                sql += "and phone like '%" + keyword + "%'";
            }
            sql += ") tbl";
            if (name.equals("") && email.equals("") && phone.equals("") && keyword != "") {
                sql = "select count(*) from (\n"
                        + "  select * from [User] where userId > 0\n"
                        + "  and fullName like '%" + keyword + "%'"
                        + "  or email like '%" + keyword + "%'"
                        + "  or phone like '%" + keyword + "%' ) tbl";
            }
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

    public int getTotalUsersSearch(String option, String keyword) {
        try {
            String sql = "select count(*) from (\n"
                    + "select * from [User]\n"
                    + "where userId > 0\n";
            if (option.equals("fullname")) {
                sql += "and fullName like '%" + keyword + "%'";
            }
            if (option.equals("email")) {
                sql += "and email like '%" + keyword + "%'";
            }
            if (option.equals("phone")) {
                sql += "and phone like '%" + keyword + "%'";
            }
            sql += ") tbl";
            if (option.equals("") && keyword != "") {
                sql = "select count(*) from (\n"
                        + "  select * from [User] where userId > 0\n"
                        + "  and fullName like '%" + keyword + "%'"
                        + "  or email like '%" + keyword + "%'"
                        + "  or phone like '%" + keyword + "%' ) tbl";
            }
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

//    public ArrayList<User> filterUser(int gender, int role, int status, int pageIndex, int pageSize) {
//        ArrayList<User> list = new ArrayList<>();
//        try {
//            String sql = "select * from [User] where userId > -1";
//            if (gender == 2) {
//                sql += "";
//            } else {
//                sql += " and gender = " + gender;
//            }
//            if (role == 6) {
//                sql += "";
//            } else {
//                sql += " and roleId = " + role;
//            }
//            if (status == 2) {
//                sql += "";
//            } else {
//                sql += " and status = " + status;
//            }
//            sql += "\n order by userId offset (?-1)*? row fetch next ? rows only";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, pageIndex);
//            stm.setInt(2, pageSize);
//            stm.setInt(3, pageSize);
////            System.out.println(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                User user = new User(rs.getInt("userId"),
//                        rs.getString("fullName"),
//                        rs.getString("userName"),
//                        rs.getString("password"),
//                        rs.getInt("roleId"),
//                        rs.getString("profilePic"),
//                        rs.getString("email"),
//                        rs.getBoolean("gender"),
//                        rs.getString("phone"),
//                        rs.getBoolean("status"),
//                        rs.getString("address"));
//                list.add(user);
//            }
//        } catch (Exception e) {
//
//        }
//        return list;
//    }
    
    public ArrayList<User> filterUser(int gender, int role, int status) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "select * from [User] where userId > -1";
            if (gender == 2) {
                sql += "";
            } else {
                sql += " and gender = " + gender;
            }
            if (role == 6) {
                sql += "";
            } else {
                sql += " and roleId = " + role;
            }
            if (status == 2) {
                sql += "";
            } else {
                sql += " and status = " + status;
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            System.out.println(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                list.add(user);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<User> searchUser(String name, String email, String phone, String keyword, int pageIndex, int pageSize) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "select * from [User] where userId > -1";
            if (name.equals("fullname")) {
                sql += "and fullName like '%" + keyword + "%'";
            } else if (email.equals("email")) {
                sql += "and email like '%" + keyword + "%'";
            } else if (phone.equals("phone")) {
                sql += "and phone like '%" + keyword + "%'";
            } else if (name.equals("") && email.equals("") && phone.equals("")) {
                sql = "select * from [User] where userId > 0\n"
                        + "  and fullName like '%" + keyword + "%'"
                        + "  or email like '%" + keyword + "%'"
                        + "  or phone like '%" + keyword + "%'";
            }
            sql += "\n order by userId offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                list.add(user);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<User> searchUser(String option, String keyword, int pageIndex, int pageSize) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "select * from [User] where userId > -1";
            if (option.equals("fullname")) {
                sql += "and fullName like '%" + keyword + "%'";
            } else if (option.equals("email")) {
                sql += "and email like '%" + keyword + "%'";
            } else if (option.equals("phone")) {
                sql += "and phone like '%" + keyword + "%'";
            } else if (option.equals("")) {
                sql = "select * from [User] where userId > 0\n"
                        + "  and fullName like '%" + keyword + "%'"
                        + "  or email like '%" + keyword + "%'"
                        + "  or phone like '%" + keyword + "%'";
            }
            sql += "\n order by userId offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                list.add(user);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public ArrayList<User> sortUser(String sortType, int pageIndex, int pageSize) {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from [User] order by  ";
        try {
            if (sortType.equals("iddesc")) {
                sql += "userId desc";
            } else if (sortType.equals("idasc")) {
                sql += "userId asc";
            } else if (sortType.equals("nameaz")) {
                sql += "fullName asc";
            } else if (sortType.equals("nameza")) {
                sql += "fullName desc";
            } else if (sortType.equals("genderaz")) {
                sql += "gender asc";
            } else if (sortType.equals("genderza")) {
                sql += "gender desc";
            } else if (sortType.equals("emailaz")) {
                sql += "email asc";
            } else if (sortType.equals("emailza")) {
                sql += "email desc";
            } else if (sortType.equals("phonedesc")) {
                sql += "phone desc";
            } else if (sortType.equals("phoneasc")) {
                sql += "phone asc";
            } else if (sortType.equals("roleaz")) {
                sql += "select * from [User] u, UserRole ur\n"
                        + "where u.roleId = ur.roleId\n"
                        + "order by ur.roleName asc";
            } else if (sortType.equals("roleza")) {
                sql += "select * from [User] u, UserRole ur\n"
                        + "where u.roleId = ur.roleId\n"
                        + "order by ur.roleName desc";
            } else if (sortType.equals("statusaz")) {
                sql += "status desc";
            } else if (sortType.equals("statusza")) {
                sql += "status asc";
            }
            sql += "\noffset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            System.out.println(sql);
            while (rs.next()) {
                User user = new User(rs.getInt("userId"),
                        rs.getString("fullName"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getString("profilePic"),
                        rs.getString("email"),
                        rs.getBoolean("gender"),
                        rs.getString("phone"),
                        rs.getBoolean("status"),
                        rs.getString("address"));
                list.add(user);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void adminAddUser(String fullName, String username, String password,
            int roleid, String email, int gender, String phone, int status, String address) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fullName]\n"
                + "           ,[userName]\n"
                + "           ,[password]\n"
                + "           ,[roleId]\n"
                + "           ,[email]\n"
                + "           ,[gender]\n"
                + "           ,[phone]\n"
                + "           ,[status]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
//            System.out.println(sql);
            stm.setString(1, fullName);
            stm.setString(2, username);
            stm.setString(3, password);
            stm.setInt(4, roleid);
            stm.setString(5, email);
            stm.setInt(6, gender);
            stm.setString(7, phone);
            stm.setInt(8, status);
            stm.setString(9, address);
            stm.executeUpdate();
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();

        ArrayList<User> listUser = udao.filterUser(0, 4, 2);
        System.out.println(listUser.size());
        for (User user : listUser) {
            System.out.println(user.getFullName());
        }
    }

}

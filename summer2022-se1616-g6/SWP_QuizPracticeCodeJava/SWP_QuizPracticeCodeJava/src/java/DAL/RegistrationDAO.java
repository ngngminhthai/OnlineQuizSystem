/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Count;
import Models.PricePackage;
import Models.Registration;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class RegistrationDAO extends DBContext {

    public boolean isHaveLifeTime(int sid, int uid) {
        String sql2 = "select * from registration where subjectId = ? and userId = ? and validFrom is null";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, sid);
            stm.setInt(2, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean isRegistrated(int sid, int uid) {
        String sql2 = "select * from registration where subjectId = ? and userId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, sid);
            stm.setInt(2, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void updateRegistration(int pid, int sid) {
        String sql2 = "update registration set packageId = ? where subjectId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, pid);
            stm.setInt(2, sid);

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Count countRegistration(int userId, int pageindex, int pagesize, String field, String type, String search) {
        try {
            String sql = "						with t as		( 				SELECT ROW_NUMBER() OVER (ORDER BY tbl.regId asc) as row_index2 FROM\n"
                    + "                          (SELECT r.*,u.fullName,u.email,s.subjectName,s.[Description],p.packageName,s.thumbnailURL, ROW_NUMBER() OVER (ORDER BY r.regId asc) as row_index FROM dbo.Registration AS r JOIN dbo.[User] AS u ON u.userId = r.userId join pricepackage as p on p.packageId = r.packageId JOIN [subject] AS s ON s.subjectId = p.subjectId where u.userId = ?) tbl\n"
                    + "WHERE row_index >= (? -1)*? + 1 \n"
                    + "                                 AND row_index <= ? * ? ";
            String searchContent = "%" + search + "%";
            if (search != null && search != "") {
                sql += " and tbl.subjectName like ? )";
            } else {
                sql += " )";
            }
            sql += " select max(row_index2), MIN(row_index2), count(*) from t";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, pageindex);
            stm.setInt(3, pagesize);
            stm.setInt(4, pageindex);
            stm.setInt(5, pagesize);
            if (search != null && search != "") {
                stm.setString(6, searchContent);
            }
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Count c = new Count();
                c.setFrom(rs.getInt(1));
                c.setTo(rs.getInt(2));
                c.setTotal(rs.getInt(3));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Registration> getAllRegistrationByUserId(int userId, int pageindex, int pagesize, String field, String type, String search) {
        ArrayList<Registration> list = new ArrayList<>();
        //join subject as s on s.subjectId = r.subjectId join pricepackage as p on p.packageId = r.packageId
        PricePackageDAO p = new PricePackageDAO();
        String sql = "				SELECT * FROM\n"
                + "                     (SELECT r.*,u.fullName,u.email,s.subjectName,s.[Description],p.packageName,p.listPrice,s.thumbnailURL, ROW_NUMBER() OVER (ORDER BY r." + field + " " + type + ") as row_index FROM dbo.Registration AS r JOIN dbo.[User] AS u ON u.userId = r.userId join pricepackage as p on p.packageId = r.packageId JOIN [subject] AS s ON s.subjectId = p.subjectId where u.userId = ?) tbl\n"
                + "                         WHERE row_index >= (? -1)*? + 1 \n"
                + "                           AND row_index <= ? * ?";
        try {
            String searchContent = "%" + search + "%";
            if (search != null && search != "") {
                sql += " and tbl.subjectName like ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, pageindex);
            stm.setInt(3, pagesize);
            stm.setInt(4, pageindex);
            stm.setInt(5, pagesize);
            if (search != null && search != "") {
                stm.setString(6, searchContent);
            }
//            stm.setInt(1, pageindex);
//            stm.setInt(2, pagesize);
//            stm.setInt(3, pageindex);
//            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration();
                reg.setRegId(rs.getInt(1));
                reg.setEmail(rs.getString("email"));
                reg.setValidTo(rs.getDate("validTo"));
                reg.setValidFrom(rs.getDate("validFrom"));
                reg.setStatus(rs.getBoolean("status"));
                reg.setNote(rs.getString("note"));
                reg.setTotalCost(rs.getFloat("cost"));
                reg.setIsAccepted(rs.getBoolean("isAccepted"));

                PricePackage pk = new PricePackage();
                pk.setPackageId(rs.getInt("packageId"));
                pk.setPackageName(rs.getString("packageName"));
                pk.setListPrice(rs.getDouble("listPrice"));
                reg.setPricepackage(pk);

                Subject s = new Subject();
                s.setThumbnailURL(rs.getString("thumbnailURL"));
                s.setSubjectId(rs.getInt("subjectId"));
                s.setPricePackage(p.getPricePackageBySubject(rs.getInt("subjectId")));
                s.setSubjectName(rs.getString("subjectName"));
                s.setDescription(rs.getString("description"));
                reg.setSub(s);

                list.add(reg);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void updateOverrideRegistration(int pid, int sid, Timestamp validTo, Timestamp validFrom, int uid) {
        String sql2 = "INSERT INTO dbo.Registration(userId, regTime, packageId, cost, validFrom, validTo, lastUpdatedBy, note, status, isAccepted, subjectId)\n"
                + "	VALUES(?, -- userId - int\n"
                + "	GETDATE(), -- regTime - datetime\n"
                + "	?   , -- packageId - int\n"
                + "	0.0 , -- cost - float\n"
                + "	?, -- validFrom - datetime\n"
                + "	?, -- validTo - datetime\n"
                + "	0   , -- lastUpdatedBy - int\n"
                + "	N'' , -- note - nvarchar(255)\n"
                + "	0, -- status - bit\n"
                + "	0, -- isAccepted - bit\n"
                + "	?   -- subjectId - int\n"
                + "	    )";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, uid);
            stm.setInt(2, pid);
            stm.setTimestamp(3, validFrom);
            stm.setTimestamp(4, validTo);
            stm.setInt(5, sid);

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isValidForUpdate() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void registerSubject(int sid, int pid, int userid) {
        String sql2 = "INSERT INTO dbo.Registration(userId, regTime, packageId, cost, validFrom, validTo, lastUpdatedBy, note, status, isAccepted, subjectId)\n"
                + "	VALUES(?, -- userId - int\n"
                + "	GETDATE(), -- regTime - datetime\n"
                + "	?   , -- packageId - int\n"
                + "	0.0 , -- cost - float\n"
                + "	GETDATE(), -- validFrom - datetime\n"
                + "	GETDATE(), -- validTo - datetime\n"
                + "	0   , -- lastUpdatedBy - int\n"
                + "	N'' , -- note - nvarchar(255)\n"
                + "	0, -- status - bit\n"
                + "	0, -- isAccepted - bit\n"
                + "	?   -- subjectId - int\n"
                + "	    )";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, userid);
            stm.setInt(2, pid);
            stm.setInt(3, sid);

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkRegisterCondition(int sid, int userId) {
        String sql2 = "select * FROM Registration where subjectId = ? and userId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, sid);
            stm.setInt(2, userId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public String checkRegisterCondition2(int sid, int userId) {
        String sql2 = "select top 1 validTo FROM Registration where subjectId = ? and userId = ? order by validTo desc";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, sid);
            stm.setInt(2, userId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("validTo");
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public int getDurationOfPricePackage(int pid) {
        String sql2 = "select * from PricePackage where packageId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("duration");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Registration> getAllRegistration() {
        ArrayList<Registration> list = new ArrayList<>();
        String sql = "select r.regId,u.email,r.regTime,s.subjectName,p.packageName,r.cost, r.validFrom,r.validTo,\n"
                + "(select fullName from [User] where [User].userId = r.lastUpdatedBy) AS lastUpdateBy,r.[status]\n"
                + "from Registration r\n"
                + "Join [User] u on r.userId = u.userId\n"
                + "join PricePackage p on r.packageId = p.packageId\n"
                + "join Subject s on p.subjectId = s.subjectId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getBoolean(10));
                list.add(reg);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalRegistration(String search) {
        String sql = "select COUNT(regId)\n"
                + "from Registration r\n"
                + "Join [User] u on r.userId = u.userId\n"
                + "join PricePackage p on r.packageId = p.packageId\n"
                + "join Subject s on p.subjectId = s.subjectId\n"
                + "where s.subjectName Like ? or u.email Like ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setString(2, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

//    public ArrayList<Registration> getRegistrationPaging(int page, int PAGE_SIZE) {
//        ArrayList<Registration> list = new ArrayList<>();
//        String sql = "select r.regId,u.email,r.regTime,s.subjectName,p.packageName,r.cost, r.validFrom,r.validTo,\n"
//                + "(select fullName from [User] where [User].userId = r.lastUpdatedBy) AS lastUpdateBy,r.[status]\n"
//                + "from Registration r\n"
//                + "Join [User] u on r.userId = u.userId\n"
//                + "join PricePackage p on r.packageId = p.packageId\n"
//                + "join Subject s on p.subjectId = s.subjectId\n"
//                + "order by regId ASC\n"
//                + "offset (?-1)*? row fetch next ? rows only";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, page);
//            stm.setInt(2, PAGE_SIZE);
//            stm.setInt(3, PAGE_SIZE);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Registration reg = new Registration(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getDate(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getFloat(6),
//                        rs.getDate(7),
//                        rs.getDate(8),
//                        rs.getString(9),
//                        rs.getBoolean(10));
//                list.add(reg);
//            }
//            return list;
//        } catch (Exception ex) {
//            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//    public ArrayList<Registration> searchRegistration(String search, int page, int PAGE_SIZE) {
//        ArrayList<Registration> list = new ArrayList<>();
//        String sql = "select r.regId,u.email,r.regTime,s.subjectName,p.packageName,r.cost, r.validFrom,r.validTo,\n"
//                + "(select fullName from [User] where [User].userId = r.lastUpdatedBy) AS lastUpdateBy,r.[status]\n"
//                + "from Registration r\n"
//                + "Join [User] u on r.userId = u.userId\n"
//                + "join PricePackage p on r.packageId = p.packageId\n"
//                + "join Subject s on p.subjectId = s.subjectId\n"
//                + "where s.subjectName Like ? or u.email Like ?\n"
//                + "order by r.regId ASC\n"
//                + "offset (?-1)*? row fetch next ? rows only";
//        try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setString(1, "%" + search + "%");
//            stm.setString(2, "%" + search + "%");
//            stm.setInt(3, page);
//            stm.setInt(4, PAGE_SIZE);
//            stm.setInt(5, PAGE_SIZE);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Registration reg = new Registration(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getDate(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getFloat(6),
//                        rs.getDate(7),
//                        rs.getDate(8),
//                        rs.getString(9),
//                        rs.getBoolean(10));
//                list.add(reg);
//            }
//            return list;
//        } catch (Exception ex) {
//            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
//    select r.regId,u.email,r.regTime,s.subjectName,p.packageName,r.cost, r.validFrom,r.validTo,\n"
//                + "(select fullName from [User] where [User].userId = r.lastUpdatedBy) AS lastUpdateBy,r.[status]\n"
//                + "from Registration r\n"
//                + "Join [User] u on r.userId = u.userId\n"
//                + "join PricePackage p on r.packageId = p.packageId\n"
//                + "join Subject s on p.subjectId = s.subjectId\n"
//                + "where s.subjectName Like ? or u.email Like ?\n"
//                + "order by " + sortName + " " + sortType + "\n"
//                + "offset (?-1)*? row fetch next ? rows only
    public ArrayList<Registration> SearchAndSortRegistrationPaging(String search, String subName, String status, String from, String to, String sortName, String sortType, int page, int PAGE_SIZE) {
        ArrayList<Registration> list = new ArrayList<>();

        String sql = "select r.regId,u.email,r.regTime,s.subjectName,p.packageName,r.cost, r.validFrom,r.validTo,\n"
                + "(select fullName from [User] where [User].userId = r.lastUpdatedBy) AS lastUpdateBy,r.[status]\n"
                + "from Registration r\n"
                + "Join [User] u on r.userId = u.userId\n"
                + "join PricePackage p on r.packageId = p.packageId\n"
                + "join Subject s on p.subjectId = s.subjectId\n"
                + "where (s.subjectName Like ? or u.email Like ?)\n";
        if (status != null && !status.equals("")) {
            sql += "and r.[status] = ?\n";
        }
        if (subName != null && !subName.equals("")) {
            sql += "and subjectName = ?\n";
        }
        if ((from != null && !from.equals("")) && (to != null && !to.equals(""))) {
            sql += "and r.regTime between ? and ?\n";
        }

        sql += "order by " + sortName + " " + sortType + "\n"
                + " offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if ((status == null || status.equals("")) && (subName == null || subName.equals("")) && (from == null || from.equals("")) && (to == null || to.equals(""))) {
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "%" + search + "%");
                stm.setInt(3, page);
                stm.setInt(4, PAGE_SIZE);
                stm.setInt(5, PAGE_SIZE);
            } else if ((status != null || !status.equals("")) && (subName == null || subName.equals("")) && (from == null || from.equals("")) && (to == null || to.equals(""))) {
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "%" + search + "%");
                stm.setString(3, status);
                stm.setInt(4, page);
                stm.setInt(5, PAGE_SIZE);
                stm.setInt(6, PAGE_SIZE);
            } else if ((status == null || status.equals("")) && (subName != null || !subName.equals("")) && (from == null || from.equals("")) && (to == null || to.equals(""))) {
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "%" + search + "%");
                stm.setString(3, subName);
                stm.setInt(4, page);
                stm.setInt(5, PAGE_SIZE);
                stm.setInt(6, PAGE_SIZE);
            } else if ((status == null || status.equals("")) && (subName == null || subName.equals("")) && (from != null || !from.equals("")) && (to != null || !to.equals(""))) {
                stm.setString(1, "%" + search + "%");
                stm.setString(2, "%" + search + "%");
                stm.setString(3, from);
                stm.setString(4, to);
                stm.setInt(5, page);
                stm.setInt(6, PAGE_SIZE);
                stm.setInt(7, PAGE_SIZE);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getBoolean(10));
                list.add(reg);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Registration> getAllRegistrationByUserId(int userId, int pageindex, int pagesize, String field, String type) {
        ArrayList<Registration> list = new ArrayList<>();
        //join subject as s on s.subjectId = r.subjectId join pricepackage as p on p.packageId = r.packageId
        String sql = "SELECT * FROM\n"
                + "            (SELECT r.*,u.fullName,u.email,ROW_NUMBER() OVER (ORDER BY r." + field + " " + type + ") as row_index FROM dbo.Registration AS r JOIN dbo.[User] AS u ON u.userId = r.userId where u.userId = ?) tbl\n"
                + "            WHERE row_index >= (? -1)*? + 1 \n"
                + "                    AND row_index <= ? * ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, pageindex);
            stm.setInt(3, pagesize);
            stm.setInt(4, pageindex);
            stm.setInt(5, pagesize);
//            stm.setInt(1, pageindex);
//            stm.setInt(2, pagesize);
//            stm.setInt(3, pageindex);
//            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration();
                reg.setRegId(rs.getInt(1));
                reg.setEmail(rs.getString("email"));
                reg.setValidTo(rs.getDate("validTo"));
                reg.setValidFrom(rs.getDate("validFrom"));
                reg.setStatus(rs.getBoolean("status"));
                reg.setNote(rs.getString("note"));
                reg.setTotalCost(rs.getFloat("cost"));
                reg.setIsAccepted(rs.getBoolean("isAccepted"));
                list.add(reg);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int count(int userId) {
        try {
            String sql = "SELECT COUNT(*) as Total FROM Registration where userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void cancelRegistrationByUserId(int uid, int rid) {
        String sql2 = "delete from registration where regId = ? and userId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, rid);
            stm.setInt(2, uid);

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkConditionForCancel(int rid) {
        String sql2 = "select * from registration where regId = ? and isAccepted = 0";
        try {
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, rid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Registration getRegistrationById(int regid) {
        String sql = "select * registration where regId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, regid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Registration reg = new Registration(rs.getInt(1),
                        rs.getString(2),
                        rs.getDate(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getBoolean(10));
                return reg;
            }

        } catch (SQLException ex) {
        }
        return null;
    }

    public static void main(String[] args) {
        RegistrationDAO dao = new RegistrationDAO();

        ArrayList<Registration> list = dao.SearchAndSortRegistrationPaging("", "", "1", "", "", "regId", "ASC", 1, 5);
        for (Registration registration : list) {
            System.out.println(registration);
        }
        Registration r = dao.getRegistrationById(1);
        System.out.println(r.getEmail());
    }

}

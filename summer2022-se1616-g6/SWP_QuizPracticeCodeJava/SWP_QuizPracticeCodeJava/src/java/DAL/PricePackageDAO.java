/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;
import Models.PricePackage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Admin
 */
public class PricePackageDAO extends DBContext{
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
        public String checkRegisterCondition2(int sid, int userId) {
        String sql2 = "select validTo FROM Registration where subjectId = ? and userId = ?";
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
     public ArrayList<PricePackage> getPricePackageBySubject(int sid)
    {
        ArrayList<PricePackage> depts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.PricePackage AS p JOIN dbo.Subject AS s ON s.subjectId = p.subjectId WHERE s.subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                PricePackage d = new PricePackage();
                d.setPackageId(rs.getInt("packageId"));
                d.setPackageName(rs.getString("packageName"));
                d.setListPrice(rs.getDouble("listPrice"));
                d.setSalePrice(rs.getDouble("salePrice"));
                d.setStatus(rs.getBoolean("status"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PricePackageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }
     
    public List<PricePackage> getSubjectPricePackage(int sid) {
        List<PricePackage> list = new ArrayList<>();
        String sql = "select * from PricePackage where subjectId =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                PricePackage pricePackage = new PricePackage(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getDouble(3), /* description */
                        rs.getDouble(4), /* thumbnailURL */
                        rs.getBoolean(5), /* featured */
                        rs.getInt(6),
                        rs.getInt(7));
                list.add(pricePackage);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void activatePackage(int packID) {
        try {
            String sql = "UPDATE [dbo].[PricePackage]\n"
                    + "   SET [status] = 1"
                    + " WHERE PricePackage.packageId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, packID);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(PricePackageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    public void deactivatePackage(int packID) {
        try {
            String sql = "UPDATE [dbo].[PricePackage]\n"
                    + "   SET [status] = 0"
                    + " WHERE PricePackage.packageId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, packID);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(PricePackageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}

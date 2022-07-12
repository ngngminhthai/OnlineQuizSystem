/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Dimension;
import Models.DimensionType;
import Models.PricePackage;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LinhVT
 */
public class DimensionDAO extends DBContext {

    public List<Dimension> getSubjectDimension(int sid) {
        List<Dimension> list = new ArrayList<>();
        String sql = "select d.*,typeName from Dimension d join DimensionType t on d.typeId = t.typeId where subjectID = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Dimension dimension = new Dimension(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getInt(4), /* thumbnailURL */
                        rs.getInt(5), /* featured */
                        rs.getString(6));
                list.add(dimension);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Dimension getDimesionByID(int id) {
        String sql = "select d.*,typeName from Dimension d join DimensionType t on d.typeId = t.typeId where dimensionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Dimension dimension = new Dimension(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getInt(4), /* thumbnailURL */
                        rs.getInt(5), /* featured */
                        rs.getString(6));
                return dimension;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Dimension> getSubjectDimension() {
        List<Dimension> list = new ArrayList<>();
        String sql = "select d.*,typeName from Dimension d join DimensionType t on d.typeId = t.typeId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Dimension dimension = new Dimension(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getInt(4), /* thumbnailURL */
                        rs.getInt(5), /* featured */
                        rs.getString(6));
                list.add(dimension);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Dimension> getDimensionSubjectName() {
        List<Dimension> list = new ArrayList<>();
        String sql = "select d.*, s.subjectName from Dimension d inner join Subject s\n"
                + "  on d.subjectID = s.subjectId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                Dimension d = new Dimension();
                d.setDimensionId(rs.getInt(1));
                d.setDimensionName(rs.getString(2));
                d.setDescription(rs.getString(3));
                d.setTypeId(rs.getInt(4));
                d.setSubjectId(rs.getInt(5));
                d.setSubjectName(rs.getString(6));
                list.add(d);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<DimensionType> getDimensionType() {
        ArrayList<DimensionType> list = new ArrayList<>();
        String sql = "select * from DimensionType";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                DimensionType d = new DimensionType();
                d.setTypeId(rs.getInt(1));
                d.setTypeName(rs.getString(2));
                list.add(d);
            }
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Dimension> getDimension(int dimenID, int typeId) {
        ArrayList<Dimension> list = new ArrayList<>();
        String sql = "  select d.*,typeName from Dimension d join DimensionType t on d.typeId = t.typeId where (1=1)\n";
        if (dimenID != 0) {
            sql += " and d.dimensionId = ? \n";
        }
        if (typeId != 0) {
            sql += " and d.typeId = ? \n";
        }

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            //kh cai nao
            if (dimenID == 0 && typeId == 0) {

            }
            // 1 cai name
            if (dimenID != 0 && typeId == 0) {
                stm.setInt(1, dimenID);

            }
            //1 domain
            if (dimenID == 0 && typeId != 0) {
                stm.setInt(1, typeId);

            }
            //ca 2
            if (dimenID != 0 && typeId != 0) {
                stm.setInt(1, dimenID);
                stm.setInt(2, typeId);

            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Dimension dimension = new Dimension(rs.getInt(1), /* id */
                        rs.getString(2), /* name */
                        rs.getString(3), /* description */
                        rs.getInt(4), /* thumbnailURL */
                        rs.getInt(5), /* featured */
                        rs.getString(6));
                list.add(dimension);
            }
        } catch (Exception ex) {
            Logger.getLogger(DimensionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalDimensionKeyword(int dimenID, int typeId) {
        String sql = "SELECT count(*) from Dimension where (1=1)\n";
//        if (dimenID == 0 && typeId == 0) {
//
//        }
        // 1 cai name
        if (dimenID != 0 && typeId == 0) {
            sql += " and dimensionId = ? \n";
        }
        //1 domain
        if (dimenID == 0 && typeId != 0) {
            sql += " and typeId = ? \n";
        }
        //ca 2
        if (dimenID != 0 && dimenID != 0) {
            sql += " and dimensionId = ? and typeId = ? ";
        }

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            if (dimenID != 0 && typeId == 0) {
                stm.setInt(1, dimenID);
            }
            //1 domain
            if (dimenID == 0 && typeId != 0) {
                stm.setInt(1, typeId);
            }
            //ca 2
            if (dimenID != 0 && dimenID != 0) {
                stm.setInt(1, dimenID);
                stm.setInt(2, typeId);
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

    public void updateDimension(int id, String name, String descrip, int type, int subjectId) {
        try {
            String sql = "UPDATE [dbo].[Dimension]\n"
                    + "   SET [dimensionName] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[typeId] = ?\n"
                    + "      ,[subjectID] = ?\n"
                    + " WHERE dimensionId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, descrip);
            stm.setInt(3, type);
            stm.setInt(4, subjectId);
            stm.setInt(5, id);

            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }

    public void insertDimension(Dimension d) {
        try {
            String sql = "INSERT INTO [dbo].[Dimension]\n"
                    + "           ([dimensionName]\n"
                    + "           ,[description]\n"
                    + "           ,[typeId]\n"
                    + "           ,[subjectID])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, d.getDimensionName());
            statement.setString(2, d.getDescription());
            statement.setInt(3, d.getTypeId());
            statement.setInt(4, d.getSubjectId());

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DimensionDAO db = new DimensionDAO();
//        ArrayList<Dimension> d = (ArrayList<Dimension>) db.getDimension(1,1,10);
//        for (Dimension dimension : d) {
//            System.out.println(dimension);
//        }
System.out.println(db.getDimension(1, 0));
//        System.out.println(db.getTotalDimensionKeyword(1, 0));
    }
}

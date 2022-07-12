/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Expert;
import Models.Subject;
import Models.Category;
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
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getElem() {
        ArrayList<Category> depts = new ArrayList<>();
        try {
            String sql = "SELECT TOP 3 * FROM Category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category d = new Category();
                d.setCatId(rs.getInt("catId"));
                d.setCatName(rs.getString("catName"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select Category.catId, catName, COUNT(subjectId) as [NumberOfSubject]  from SubjectCategory join Category\n"
                + "on Category.catId = SubjectCategory.catId\n"
                + "group by Category.catId, catName";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1), rs.getString(2), rs.getInt(3));
                /* catID, catName, numberOfSubject */
                list.add(category);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void updateSubjectCategory(int catId, int subjectID) {
        try {
            String sql = "UPDATE [dbo].[SubjectCategory]\n"
                    + "   SET [catId] = ?\n"
                    + " WHERE subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, catId);
            stm.setInt(2, subjectID);

            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);

        }
    }
    
    public List<Category> getCategoryName() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt(1), rs.getString(2));
                /* catID, catName, numberOfSubject */
                list.add(category);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}

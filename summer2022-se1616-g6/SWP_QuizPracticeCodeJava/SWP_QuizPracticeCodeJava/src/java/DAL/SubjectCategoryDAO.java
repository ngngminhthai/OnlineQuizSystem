/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Category;
import Models.Expert;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class SubjectCategoryDAO extends DBContext {

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
            Logger.getLogger(SubjectCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }


}

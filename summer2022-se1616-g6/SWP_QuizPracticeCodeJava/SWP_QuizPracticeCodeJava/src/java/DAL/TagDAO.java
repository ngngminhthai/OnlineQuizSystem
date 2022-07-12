/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Tag;
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
public class TagDAO extends DBContext {

    public ArrayList<Tag> getTagBySubjectId(int subjectId) {
        ArrayList<Tag> depts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Tag AS t JOIN Tag_Subject AS ts ON t.tagId = ts.tagId JOIN [subject] AS s ON ts.subjectId = s.subjectId WHERE s.subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Tag d = new Tag();
                d.setTagId(rs.getInt("tagId"));
                d.setTagName(rs.getString("tagName"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TagDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }
}

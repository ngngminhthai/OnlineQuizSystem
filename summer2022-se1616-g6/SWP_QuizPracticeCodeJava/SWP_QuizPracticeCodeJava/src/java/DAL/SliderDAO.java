/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Slider;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class SliderDAO extends DBContext {

    public ArrayList<Slider> getListSlider() {
        ArrayList<Slider> list = new ArrayList<>();
        String sql = "select * from Slider";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Slider getSliderById(int id) {

        String sql = "select * from Slider where sliderId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Slider> getAllSliderById() {
        ArrayList<Slider> list = new ArrayList<>();
        String sql = "select s.*, sb.subjectName from Slider s inner join Subject sb\n"
                + "on s.backlink = sb.subjectId\n";
//                + "where sliderId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void UpdateSlider(String title, String backlink, String note, boolean status, int id) {
        try {
            String sql = "Update Slider \n"
                    + "set sliderTitle = ?, backlink = ?, note = ?, status = ?\n"
                    + "where sliderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, title);
            stm.setString(2, backlink);
            stm.setString(3, note);
            stm.setBoolean(4, status);
            stm.setInt(5, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateSliderImg(int id, String img) {
        try {
            String sql = "Update Slider\n"
                    + "set image = ? where sliderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, img);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Slider> getListSliderAndSubjectName() {
        ArrayList<Slider> list = new ArrayList<>();
        String sql = "select s.*, sb.subjectName from Slider s inner join Subject sb\n"
                + "on s.backlink = sb.subjectId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Slider> getAllSliderBySliderIDPaging(String keyword, String status, int pageIndex, int pageSize) {
        ArrayList<Slider> list = new ArrayList<>();
        String sql = "select s.*, sb.subjectName from Slider s inner join Subject sb\n"
                + "on s.backlink = sb.subjectId \n"
                + " where s.sliderTitle like ? \n";
        if (status != null && !status.equals("")) {
            sql += "and s.status = ?\n";
        }
        sql += "order by s.sliderId\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            if (status == null || status.equals("")) {
                stm.setString(1, "%" + keyword + "%");
                stm.setInt(2, pageIndex);
                stm.setInt(3, pageSize);
                stm.setInt(4, pageSize);
            } else {
                stm.setString(1, "%" + keyword + "%");
                stm.setString(2, status);
                stm.setInt(3, pageIndex);
                stm.setInt(4, pageSize);
                stm.setInt(5, pageSize);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Slider> getAllSliderByStatus(boolean status, int pageIndex, int pageSize) {
        ArrayList<Slider> list = new ArrayList<>();
        String sql = "select s.*, sb.subjectName from Slider s inner join Subject sb\n"
                + "on s.backlink = sb.subjectId \n";
        if (status == true) {
            sql += " where s.status = 1 \n";
        }
        if (status == false) {
            sql += " where s.status = 0 \n";
        }
        sql += "order by s.sliderId\n"
                + "offset (?-1)*? row fetch next ? rows only";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageIndex);
            stm.setInt(2, pageSize);
            stm.setInt(3, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalSlider(String keyword) {
        String sql = "select count(*) from Slider \n";
        if (keyword != null) {
            sql += "where sliderTitle like ?";
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

    public ArrayList<Subject> getAllSubjectNameInSlider() {
        ArrayList<Subject> list = new ArrayList<>();
        String sql = "select * from Subject";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject sb = new Subject(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getBoolean(6),
                        rs.getDate(7));
                list.add(sb);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        SliderDAO s = new SliderDAO();
//        System.out.println(s.getSliderById(1));
//        s.UpdateSlider("Introduction to Management", "1", "This is the slider",true, 1);
        ArrayList<Slider> list = s.getAllSliderBySliderIDPaging("", "1", 1, 5);
        for (Slider registration : list) {
            System.out.println(registration);
        }
    }
}

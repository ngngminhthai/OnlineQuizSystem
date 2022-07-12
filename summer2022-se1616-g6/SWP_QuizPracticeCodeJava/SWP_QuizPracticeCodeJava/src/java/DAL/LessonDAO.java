/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Lesson;
import Models.LessonType;
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
public class LessonDAO extends DBContext {

    public ArrayList<LessonType> getAllLessonType() {
        ArrayList<LessonType> lessonType = new ArrayList<>();
        String sql = "select * from LessonType";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LessonType les = new LessonType(rs.getInt(1), rs.getString(2));
                lessonType.add(les);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessonType;
    }

    public ArrayList<Lesson> getElem(int subjectId) {
        ArrayList<Lesson> depts = new ArrayList<>();
        try {
            String sql = "SELECT l.* FROM dbo.Lesson AS l JOIN dbo.Subject AS s ON s.subjectId = l.subjectId WHERE l.subjectId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
//    int lessonId;
//    int subjectId;
//    String lessonName;
//    int lessonOrder;
//    int lessonTypeId;
//    String videoLink;
//    String content;
//    boolean status;
                Lesson d = new Lesson();
                d.setLessonId(rs.getInt("lessonId"));
                d.setLessonName(rs.getString("lessonName"));
                d.setLessonOrder(rs.getInt("lessonOrder"));
                d.setVideoLink(rs.getString("videoLink"));
                d.setContent(rs.getString("content"));
                d.setStatus(rs.getBoolean("status"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    public static void main(String[] args) {
        LessonDAO ld = new LessonDAO();
//        ArrayList<LessonType> list = ld.getAllLessonType();
//        for (LessonType lesson : list) {
//            System.out.println(lesson);
//        }
        System.out.println(ld.getLessonById(6));
    }

    public int getTotalLesson(String search) {
        String sql = "Select COUNT(lessonId) from Lesson l\n"
                + "join LessonType lt\n"
                + "on l.lessonTypeId = lt.lessonTypeId\n"
                + "join Subject s on l.subjectId = s.subjectId\n"
                + "where lessonName Like ? or lessonTypeName Like ?";
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

    public Lesson getLessonById(int id) {
        String sql = "Select l.lessonId,l.lessonName,s.subjectId,s.subjectName,l.content,lt.lessonTypeId,lt.lessonTypeName,l.lessonOrder, l.status from Lesson l\n"
                + "join LessonType lt\n"
                + "on l.lessonTypeId = lt.lessonTypeId\n"
                + "join Subject s on l.subjectId = s.subjectId\n"
                + "where l.lessonId = ?";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson les = new Lesson(rs.getInt(1),
                        rs.getString(2),
                        new Subject(rs.getInt(3), rs.getString(4)),
                        rs.getString(5),
                        new LessonType(rs.getInt(6), rs.getString(7)),
                        rs.getInt(8),
                        rs.getBoolean(9));
                return les;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Lesson> getAllLesson() {
        ArrayList<Lesson> lesson = new ArrayList<>();
        String sql = "Select l.lessonId,l.lessonName,s.subjectName,l.content,lt.lessonTypeName,l.lessonOrder, l.status from Lesson l\n"
                + "join LessonType lt\n"
                + "on l.lessonTypeId = lt.lessonTypeId\n"
                + "join Subject s on l.subjectId = s.subjectId\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson les = new Lesson(rs.getInt(1),
                        rs.getString(2),
                        new Subject(rs.getString(3)),
                        rs.getString(4),
                        new LessonType(rs.getString(5)),
                        rs.getInt(6),
                        rs.getBoolean(7));
                lesson.add(les);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lesson;
    }

    public ArrayList<Lesson> getAllLessonWithFilterStatus(String status) {
        ArrayList<Lesson> lesson = new ArrayList<>();
        String sql = "Select l.lessonId,l.lessonName,s.subjectName,l.content,lt.lessonTypeName,l.lessonOrder, l.status from Lesson l\n"
                + "join LessonType lt\n"
                + "on l.lessonTypeId = lt.lessonTypeId\n"
                + "join Subject s on l.subjectId = s.subjectId\n"
                + "where l.[status] = ?\n";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson les = new Lesson(rs.getInt(1),
                        rs.getString(2),
                        new Subject(rs.getString(3)),
                        rs.getString(4),
                        new LessonType(rs.getString(5)),
                        rs.getInt(6),
                        rs.getBoolean(7));
                lesson.add(les);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lesson;
    }

    public int countLessonBySubjectId(int sid) {
        //SELECT COUNT(*) FROM dbo.Lesson AS l JOIN dbo.Subject AS s ON s.subjectId = l.subjectId GROUP BY l.subjectId
        int total = 0;
        try {
            String sql = "SELECT COUNT(*) FROM dbo.Lesson AS l JOIN dbo.Subject AS s ON s.subjectId = l.subjectId where S.subjectId = ? GROUP BY l.subjectId";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
                return total;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public void insertLesson(int subId, String lessonName, String lessonOrder, int typeId, String video, String lessonContent) {
        try {
            String sql = "INSERT INTO [dbo].[Lesson]\n"
                    + "           ([subjectId]\n"
                    + "           ,[lessonName]\n"
                    + "           ,[lessonOrder]\n"
                    + "           ,[lessonTypeId]\n"
                    + "           ,[videoLink]\n"
                    + "           ,[content]\n"
                    + "           ,[status])\n"
                    + "VALUES (?,?,?,?,?,?,0)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, subId);
            statement.setString(2, lessonName);
            statement.setString(3, lessonOrder);
            statement.setInt(4, typeId);
            statement.setString(5, video);
            statement.setString(6, lessonContent);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateLesson(int subId, String lessonName, String lessonOrder, int typeId, String video, String lessonContent, boolean sta, int id) {
        try {
            String sql = "UPDATE [dbo].[Lesson]\n"
                    + "   SET [subjectId] = ?\n"
                    + "      ,[lessonName] = ?\n"
                    + "      ,[lessonOrder] = ?\n"
                    + "      ,[lessonTypeId] = ?\n"
                    + "      ,[videoLink] = ?\n"
                    + "      ,[content] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE lessonId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, subId);
            statement.setString(2, lessonName);
            statement.setString(3, lessonOrder);
            statement.setInt(4, typeId);
            statement.setString(5, video);
            statement.setString(6, lessonContent);
            statement.setBoolean(7, sta);
            statement.setInt(8, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteLesson(int id) {
        try {
            String sql = "delete from Lesson\n"
                    + "where lessonId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

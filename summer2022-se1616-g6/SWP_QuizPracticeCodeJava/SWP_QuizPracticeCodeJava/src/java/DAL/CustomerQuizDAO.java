/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.CustomerQuiz;
import Models.Dimension;
import Models.DimensionType;

import Models.Quiz;
import Models.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class CustomerQuizDAO extends DBContext {

    public ArrayList<CustomerQuiz> getAllQuiz() {
        ArrayList<CustomerQuiz> list = new ArrayList<>();
        String sql = "select cq.quizTakeId, cq.quizId, cq.userId, cq.point, cq.time, cq.submitted, \n"
                + "q.quizName, q.numOfQuestion,q.passRate, q.duration, s.subjectName\n"
                + "from CustomerQuiz cq inner join Quiz q \n"
                + "on cq.quizId = q.quizId \n"
                + "inner join Subject s \n"
                + "on q.subjectId = s.subjectId";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CustomerQuiz p = new CustomerQuiz(
                        rs.getInt(1),
                        new Quiz(rs.getInt(2), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10),
                                new Subject(rs.getString(11))),
                        rs.getInt(3),
                        rs.getFloat(4),
                        rs.getInt(5),
                        rs.getDate(6)
                );
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Quiz getQuizByID(int quizId) {
        try {
            String sql = "select * from Quiz \n"
                    + "where quizId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quizId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz q = new Quiz(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), s);
                return q;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Subject getSubjectByQuiz(int quizId) {
        try {
            String sql = "SELECT        *\n"
                    + "FROM            dbo.Quiz INNER JOIN\n"
                    + "                         dbo.Subject "
                    + "ON dbo.Quiz.subjectId = dbo.Subject.subjectId where quizId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quizId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Subject s = new Subject(rs.getInt(9), rs.getString(11), rs.getString(12), rs.getString(13), rs.getBoolean(14), rs.getBoolean(15), rs.getDate(16));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Dimension getDimensionBySubject(int subjectId) {
        try {
            String sql = "select * from Dimension \n"
                    + "where subjectID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, subjectId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Dimension d = new Dimension(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return d;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public DimensionType getDimensionTypeByDimension(int typeId) {
        try {
            String sql = "select * from DimensionType\n"
                    + "where typeId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, typeId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                DimensionType dt = new DimensionType(rs.getInt(1), rs.getString(2));
                return dt;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getCount(int userID) {

        try {
            String sql = "  select Count(*) AS TOTAL from CustomerQuiz where userId = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getCountBySubject(int userID, int subjetcID) {

        try {
            String sql = "select Count(*) AS TOTAL from\n"
                    + "(SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY quizTakeId ASC) AS [Row], * FROM\n"
                    + "(select cq.quizTakeId, cq.quizId, cq.userId, cq.point, cq.time, cq.submitted, \n"
                    + "q.quizName, q.numOfQuestion,q.passRate, q.duration, s.subjectName, s.subjectId\n"
                    + "from CustomerQuiz cq inner join Quiz q \n"
                    + "on cq.quizId = q.quizId \n"
                    + "inner join Subject s \n"
                    + "on q.subjectId = s.subjectId) AS T) AS X\n"
                    + "where userId = ?\n"
                    + "and subjectId = ?     \n"
                    + ") as M";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, subjetcID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<CustomerQuiz> getPageCustomerQuizbyID(int userID) {
        ArrayList<CustomerQuiz> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY quizTakeId ASC) AS [Row], * FROM\n"
                    + "(select cq.quizTakeId, cq.quizId, cq.userId, cq.point, cq.time, cq.submitted, \n"
                    + "q.quizName, q.numOfQuestion,q.passRate, q.duration, s.subjectName\n"
                    + "from CustomerQuiz cq inner join Quiz q \n"
                    + " on cq.quizId = q.quizId \n"
                    + "inner join Subject s \n"
                    + "on q.subjectId = s.subjectId) AS T) AS X\n"
                    + "where userId = ?\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                CustomerQuiz p = new CustomerQuiz(
                        rs.getInt(2),
                        new Quiz(rs.getInt(3), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11),
                                new Subject(rs.getString(12))),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getInt(6),
                        rs.getDate(7)
                );
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuiz.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
    
    public static void main(String[] args) {
        CustomerQuizDAO q = new CustomerQuizDAO();
        ArrayList<CustomerQuiz> quiz = q.getPageCustomerQuizbyID(1);
        for (CustomerQuiz customerQuiz : quiz) {
            System.out.println(customerQuiz.getQuizTakeId());
        }
    }

    public ArrayList<Subject> getAllNameSubject() {
        ArrayList<Subject> list = new ArrayList<>();
        try {
            String sql = "   select subjectId, subjectName from Subject";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(1));
                s.setSubjectName(rs.getString(2));
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<CustomerQuiz> getQuizBySubjectName(int userID, int subjectId) {
        ArrayList<CustomerQuiz> customerQuiz = new ArrayList<>();
        try {
            String sql = "SELECT * FROM\n"
                    + "                    (SELECT ROW_NUMBER() OVER (ORDER BY quizTakeId ASC) AS [Row], * FROM\n"
                    + "                    (select cq.quizTakeId, cq.quizId, cq.userId, cq.point, cq.time, cq.submitted, \n"
                    + "                    q.quizName, q.numOfQuestion,q.passRate, q.duration, s.subjectName, s.subjectId\n"
                    + "                    from CustomerQuiz cq inner join Quiz q \n"
                    + "                    on cq.quizId = q.quizId \n"
                    + "                    inner join Subject s \n"
                    + "                    on q.subjectId = s.subjectId) AS T) AS X\n"
                    + "                    where userId = ? \n";
            if (subjectId > 0) {
                sql += " and subjectId = ?";
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            if (subjectId > 0) {
                statement.setInt(1, userID);
                statement.setInt(2, subjectId);
            }
            if (subjectId < 0) {
                statement.setInt(1, userID);
            }
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(13));
                s.setSubjectName(rs.getString(12));
                CustomerQuiz p = new CustomerQuiz(
                        rs.getInt(2),
                        new Quiz(rs.getInt(3), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11),
                                s),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getInt(6),
                        rs.getDate(7)
                );
                customerQuiz.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customerQuiz;
    }

    public ArrayList<CustomerQuiz> searchQuizBySubjectName(int userID, String txt, int pageindex, int pagesize) {
        ArrayList<CustomerQuiz> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY quizTakeId ASC) AS [Row], * FROM\n"
                    + "(select cq.quizTakeId, cq.quizId, cq.userId, cq.point, cq.time, cq.submitted, \n"
                    + "q.quizName, q.numOfQuestion,q.passRate, q.duration, s.subjectName\n"
                    + "from CustomerQuiz cq inner join Quiz q \n"
                    + "on cq.quizId = q.quizId \n"
                    + "inner join Subject s \n"
                    + "on q.subjectId = s.subjectId) AS T) AS X\n"
                    + "where userId = ? and subjectName like ?\n"
                    + "order by Row\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setString(2, "%" + txt + "%");
            statement.setInt(3, pageindex);
            statement.setInt(4, pagesize);
            statement.setInt(5, pagesize);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                CustomerQuiz p = new CustomerQuiz(
                        rs.getInt(2),
                        new Quiz(rs.getInt(3), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11),
                                new Subject(rs.getString(12))),
                        rs.getInt(4),
                        rs.getFloat(5),
                        rs.getInt(6),
                        rs.getDate(7)
                );
                list.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuiz.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public int countSearchQuizBySubjectName(int userID, String txt) {

        try {
            String sql = "select Count(*) AS TOTAL from\n"
                    + "(SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY quizTakeId ASC) AS [Row], * FROM\n"
                    + "(select cq.quizTakeId, cq.quizId, cq.userId, cq.point, cq.time, cq.submitted, \n"
                    + "q.quizName, q.numOfQuestion,q.passRate, q.duration, s.subjectName\n"
                    + "from CustomerQuiz cq inner join Quiz q \n"
                    + "on cq.quizId = q.quizId \n"
                    + "inner join Subject s \n"
                    + "on q.subjectId = s.subjectId) AS T) AS X\n"
                    + "where userId = ? and subjectName like ?\n"
                    + ") as M";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setString(2, '%'+txt+'%');
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TOTAL");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerQuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

}

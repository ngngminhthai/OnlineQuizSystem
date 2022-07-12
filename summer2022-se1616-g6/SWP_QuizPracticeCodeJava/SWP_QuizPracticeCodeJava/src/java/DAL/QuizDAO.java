package DAL;

import Models.Answer;
import Models.Question;
import Models.Quiz;
import Models.Subject;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class QuizDAO extends DBContext {
    
    
   private Random rand;

    public QuizDAO() {
       try {
           this.rand = SecureRandom.getInstanceStrong();
       } catch (NoSuchAlgorithmException ex) {
           Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public String getRandomQuestion(int numberOfQuestion, int totalQuestion, int minQues) {
     
        String questionId = "(";
        for (int i = 0; i < numberOfQuestion; i++) {
            int qId = rand.nextInt(totalQuestion - minQues) + minQues;
            if (i == numberOfQuestion) {
                questionId += qId;
            }
            questionId += qId + ",";
        }
        return questionId;
    }

    public Quiz getPracticeQuizCustom(int subjectid, int duration, int numberQ) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "    SELECT * FROM dbo.Quiz where subjectId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setDuration(rs.getInt("duration"));
                q.setDuration(duration * 60);
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuiz(rs.getInt("quizId"), numberQ));

                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Quiz getPracticeQuizExamination(int subjectid) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "    SELECT * FROM dbo.Quiz where subjectId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setDuration(rs.getInt("duration"));
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuizExamination(rs.getInt("quizId")));

                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Quiz getQuizReview(int quizid) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "SELECT * FROM dbo.CustomerQuiz AS cq JOIN dbo.Quiz AS q ON q.quizId = cq.quizId WHERE cq.quizTakeId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setTime(rs.getInt("time"));
                q.setPoint(rs.getFloat("point"));
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuiz(rs.getInt("quizTakeId")));

                return q;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Answer> getCorrectAnswer(int questionId) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "SELECT * FROM  dbo.Question AS q JOIN dbo.Answer AS a ON a.questionId = q.questionId WHERE a.questionId = ? AND a.isCorrect = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Answer a = new Answer();
                a.setAnswerContent(rs.getString("answerContent"));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Answer> getTakenAnswer(int questionId) {
        ArrayList<Answer> list = new ArrayList<>();
        String sql = "SELECT * FROM  dbo.Question AS q JOIN dbo.Answer AS a ON a.questionId = q.questionId WHERE a.questionId = ? AND a.isCorrect = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Answer a = new Answer();
                a.setAnswerContent(rs.getString("answerContent"));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Quiz> getAllQuiz() {
        ArrayList<Quiz> list = new ArrayList<>();
        String sql = "Select * from Quiz";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        s);
                list.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void editQuizDuration(int settingid, int value, int status) {
        String sql = "UPDATE [dbo].[Setting]\n"
                + "   SET [Value] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(3, settingid);
            stm.setInt(1, value);
            stm.setInt(2, status);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Quiz getQuizById(int quizid) {
        String sql = "select * from Quiz where quizid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        s);
                return quiz;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Quiz> getQuizLeftToAddSetting() {
        ArrayList<Quiz> list = new ArrayList<>();
        String sql = "select * from Quiz where quizId not in (SELECT quizID FROM Setting)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectId(rs.getInt(9));
                Quiz quiz = new Quiz(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        s);
                list.add(quiz);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();
//        ArrayList<Quiz> listQuiz = dao.getAllQuiz();
//        for (Quiz quiz : listQuiz) {
//            System.out.println(quiz);
//        }
        Quiz q = dao.getQuizById(1);
        System.out.println(q.getQuizName());
    }

    public Quiz getPracticeQuizByLesson(int subjectId, int lessonId) {
        QuestionDAO qd = new QuestionDAO();
        String sql = "SELECT * FROM dbo.Quiz WHERE lessonId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lessonId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Quiz q = new Quiz();
                q.setDuration(rs.getInt("duration"));
                q.setQuizId(rs.getInt("quizId"));
                q.setQuizName(rs.getString("quizName"));

                q.setQ(qd.getQuesByQuizLesson(rs.getInt("quizId")));

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

//    public int createQuestion(int userid, String title, String summary, String createdAt, String content, String maintag) {
//        int quesid = -1;
//        try {
//            String sql_insert_ques = "insert into question(UserID,title,summary,createdAt,content,lastActive) VALUES(?,?,?,?,?,GETDATE())";
//            connection.setAutoCommit(false);
//            PreparedStatement stm_insert_ques = connection.prepareStatement(sql_insert_ques);
//
//            stm_insert_ques.setInt(1, userid);
//            stm_insert_ques.setString(2, title);
//            stm_insert_ques.setString(3, summary);
//            stm_insert_ques.setString(4, createdAt);
//            stm_insert_ques.setString(5, content);
//
//            stm_insert_ques.executeUpdate();
//
//            String sql_get_id = "select @@IDENTITY as QuestionID";
//            PreparedStatement stm_get_id = connection.prepareStatement(sql_get_id);
//
//            ResultSet rs = stm_get_id.executeQuery();
//            if (rs.next()) {
//                quesid = rs.getInt("QuestionID");
//            }
//
//            String sql = "INSERT INTO dbo.MainTag_Question(mtid, questionid)\n"
//                    + "VALUES(?,?)";
//
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(2, quesid);
//            stm.setString(1, maintag);
//
//            stm.executeUpdate();
//
//            connection.commit();
//        } catch (SQLException ex) {
//            Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            try {
//                connection.rollback();
//            } catch (SQLException ex1) {
//                Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
//            }
//        } finally {
//            try {
//                connection.setAutoCommit(true);
//                return quesid;
//            } catch (SQLException ex) {
//                Logger.getLogger(QuestionDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            //close connection
//        }
//        return 0;
//    }
    public void calculateScore(Quiz q) {

        boolean isCorrect = true;

        ArrayList<Integer> chooseAnswers = new ArrayList<>();
        ArrayList<Integer> correctAnswers = new ArrayList<>();
        Question ques = new Question();
        float totalCorrectAnswer = 0;
        int totalChoice = 0;

        for (Question question : q.getQ()) {
            correctAnswers = getCorrectAnswerByQuestionId(question.getQuestionId());
            //5, 6
            if (question.getMarkedAnswer() != null) {
                for (Integer answer : question.getMarkedAnswer()) {
                    // 5
                    if (correctAnswers.contains(answer)) {
                        isCorrect = true;
                        totalChoice++;
                    } else {
                        isCorrect = false;
                        break;
                    }

                }
                if (isCorrect == true && totalChoice == correctAnswers.size()) {
                    totalCorrectAnswer += 1;
                    totalChoice = 0;
                }
                isCorrect = true;
            }
        }
        float point = totalCorrectAnswer / (float) q.getQ().size();
        point = point * 100;

        String sql2 = "INSERT INTO dbo.CustomerQuiz(quizId, userId, point, time, submitted)\n"
                + "VALUES(?, \n"
                + "?   ,\n"
                + "? , \n"
                + "?   , \n"
                + "GETDATE()\n"
                + "    )";
        try {
            connection.setAutoCommit(false);
            PreparedStatement stm = connection.prepareStatement(sql2);
            stm.setInt(1, q.getQuizId());
            stm.setInt(2, q.getUserid());
            stm.setFloat(3, point);
            stm.setDouble(4, q.getTimeTaken());

            stm.executeUpdate();

            String sql_get_id = "select @@IDENTITY as quizTakeId";
            PreparedStatement stm_get_id = connection.prepareStatement(sql_get_id);

            ResultSet rs = stm_get_id.executeQuery();
            int justTakenQuizId = -1;
            if (rs.next()) {
                justTakenQuizId = rs.getInt("quizTakeId");
            }

            //insert answer
            for (Question question : q.getQ()) {
                for (int markedAnswer : question.getMarkedAnswer()) {
                    String sql = "INSERT INTO dbo.TakeAnswer(quizTakeId, questionId, answerId, [status])\n"
                            + "VALUES(?,\n"
                            + "?   ,\n"
                            + "?   , \n"
                            + "NULL \n"
                            + "    )";
                    PreparedStatement stm_answer = connection.prepareStatement(sql);
                    stm_answer.setInt(1, justTakenQuizId);
                    stm_answer.setInt(2, question.getQuestionId());
                    stm_answer.setInt(3, markedAnswer);
                    stm_answer.executeUpdate();
                }
            }

            connection.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public ArrayList<Integer> getCorrectAnswerByQuestionId(int questionId) {
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT * FROM  dbo.Question AS q JOIN dbo.Answer AS a ON a.questionId = q.questionId WHERE a.questionId = ? AND a.isCorrect = 1";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("answerId"));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    ArrayList<Integer> getMarkedAnswer(int questionId) {
        ArrayList<Integer> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.Question AS q Right JOIN dbo.TakeAnswer AS ta ON ta.questionId = q.questionId WHERE ta.questionId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, questionId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("answerId"));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
}


package Models;

import java.sql.Date;

public class CustomerQuiz {
    private int quizTakeId;
    private Quiz quizId;
    private int userId;
    private float point;
    private int time;
    private Date submitted;

    public CustomerQuiz() {}

    public CustomerQuiz(int quizTakeId, Quiz quizId, int userId, float point, int time, Date submitted) {
        this.quizTakeId = quizTakeId;
        this.quizId = quizId;
        this.userId = userId;
        this.point = point;
        this.time = time;
        this.submitted = submitted;
    }

    public int getQuizTakeId() {
        return quizTakeId;
    }

    public void setQuizTakeId(int quizTakeId) {
        this.quizTakeId = quizTakeId;
    }

    public Quiz getQuizId() {
        return quizId;
    }

    public void setQuizId(Quiz quizId) {
        this.quizId = quizId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public Date getSubmitted() {
        return submitted;
    }

    public void setSubmitted(Date submitted) {
        this.submitted = submitted;
    }

    @Override
    public String toString() {
        return "CustomerQuiz{" + "quizTakeId=" + quizTakeId + ", quizId=" + quizId + ", userId=" + userId + ", point=" + point + ", time=" + time + ", submitted=" + submitted + '}';
    }
    
    

    
    
    
}

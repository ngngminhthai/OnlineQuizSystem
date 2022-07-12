
package Models;

public class TakeAnswer {
    private int takeAnswerId;
    private int quizTakeId;
    private int questionId;
    private int answerId;
    private boolean status;

    public TakeAnswer() {}

    public TakeAnswer(int takeAnswerId, int quizTakeId, int questionId, int answerId, boolean status) {
        this.takeAnswerId = takeAnswerId;
        this.quizTakeId = quizTakeId;
        this.questionId = questionId;
        this.answerId = answerId;
        this.status = status;
    }

    public int getTakeAnswerId() {
        return takeAnswerId;
    }

    public void setTakeAnswerId(int takeAnswerId) {
        this.takeAnswerId = takeAnswerId;
    }

    public int getQuizTakeId() {
        return quizTakeId;
    }

    public void setQuizTakeId(int quizTakeId) {
        this.quizTakeId = quizTakeId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}

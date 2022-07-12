package Models;

import java.util.ArrayList;

public class Question {

    private int questionId;
    private int subjectId;
    private String questionContent;
    private int dimensionId;
    private int lessonId;
    private boolean status;
    private String image;
    private String audio;
    private String video;
    private String explanation;
    ArrayList<Answer> answer;
    ArrayList<Integer> markedAnswer;
    ArrayList<Answer> correctAnswer;

    public ArrayList<Answer> getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(ArrayList<Answer> correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    boolean marked;

    public boolean isMarked() {
        return marked;
    }

    public void setMarked(boolean marked) {
        this.marked = marked;
    }

    public ArrayList<Answer> getAnswer() {
        return answer;
    }

    public void setAnswer(ArrayList<Answer> answer) {
        this.answer = answer;
    }

    public ArrayList<Integer> getMarkedAnswer() {
        return markedAnswer;
    }

    public void setMarkedAnswer(ArrayList<Integer> markedAnswer) {
        this.markedAnswer = markedAnswer;
    }

    private String subjectName;
    private String dimensionName;
    private String lessonName;

    public Question() {
    }

    public Question(int questionId, int subjectId, String questionContent, int dimensionId, int lessonId, boolean status, String image, String audio, String video, String explanation) {
        this.questionId = questionId;
        this.subjectId = subjectId;
        this.questionContent = questionContent;
        this.dimensionId = dimensionId;
        this.lessonId = lessonId;
        this.status = status;
        this.image = image;
        this.audio = audio;
        this.video = video;
        this.explanation = explanation;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public String getDimensionName() {
        return dimensionName;
    }

    public void setDimensionName(String dimensionName) {
        this.dimensionName = dimensionName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public int getDimensionId() {
        return dimensionId;
    }

    public void setDimensionId(int dimensionId) {
        this.dimensionId = dimensionId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    @Override
    public String toString() {
        return "Question{" + "questionId=" + questionId + ", subjectId=" + subjectId + ", questionContent=" + questionContent + ", dimensionId=" + dimensionId + ", lessonId=" + lessonId + ", status=" + status + ", image=" + image + ", audio=" + audio + ", video=" + video + ", explanation=" + explanation + ", subjectName=" + subjectName + ", dimensionName=" + dimensionName + '}';
    }

}

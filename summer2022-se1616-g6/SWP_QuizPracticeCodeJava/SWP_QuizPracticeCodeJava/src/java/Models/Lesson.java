package Models;

public class Lesson {

    private int lessonId;
    private int subjectId;
    private String lessonName;
    private Subject subject;
    private LessonType lessonType;
    private int lessonOrder;
    private int lessonTypeId;
    private String videoLink;
    private String content;
    private boolean status;

    public Lesson() {
    }

    public Lesson(int lessonId, String lessonName, Subject subject, String content, LessonType lessonType, int lessonOrder, boolean status) {
        this.lessonId = lessonId;
        this.lessonName = lessonName;
        this.subject = subject;
        this.lessonType = lessonType;
        this.lessonOrder = lessonOrder;
        this.content = content;
        this.status = status;
    }

    public Lesson(int lessonId, String lessonName, int subjectId, Subject subject, String content, LessonType lessonType, int lessonOrder, boolean status) {
        this.lessonId = lessonId;
        this.subjectId = subjectId;
        this.lessonName = lessonName;
        this.subject = subject;
        this.lessonType = lessonType;
        this.lessonOrder = lessonOrder;
        this.content = content;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Lesson{" + "lessonId=" + lessonId + ", subjectId=" + subjectId + ", lessonName=" + lessonName + ", subject=" + subject + ", lessonType=" + lessonType + ", lessonOrder=" + lessonOrder + ", lessonTypeId=" + lessonTypeId + ", videoLink=" + videoLink + ", content=" + content + ", status=" + status + '}';
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public LessonType getLessonType() {
        return lessonType;
    }

    public void setLessonType(LessonType lessonType) {
        this.lessonType = lessonType;
    }

    public Lesson(int lessonId, int subjectId, String lessonName, int lessonOrder, int lessonTypeId, String videoLink, String content, boolean status) {
        this.lessonId = lessonId;
        this.subjectId = subjectId;
        this.lessonName = lessonName;
        this.lessonOrder = lessonOrder;
        this.lessonTypeId = lessonTypeId;
        this.videoLink = videoLink;
        this.content = content;
        this.status = status;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public int getLessonOrder() {
        return lessonOrder;
    }

    public void setLessonOrder(int lessonOrder) {
        this.lessonOrder = lessonOrder;
    }

    public int getLessonTypeId() {
        return lessonTypeId;
    }

    public void setLessonTypeId(int lessonTypeId) {
        this.lessonTypeId = lessonTypeId;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}

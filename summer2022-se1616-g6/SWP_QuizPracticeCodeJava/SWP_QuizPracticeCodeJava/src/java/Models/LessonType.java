package Models;

public class LessonType {

    private int lessonTypeId;
    private String lessonTypeName;

    public LessonType() {
    }

    public LessonType(String lessonTypeName) {
        this.lessonTypeName = lessonTypeName;
    }

    public LessonType(int lessonTypeId, String lessonTypeName) {
        this.lessonTypeId = lessonTypeId;
        this.lessonTypeName = lessonTypeName;
    }

    @Override
    public String toString() {
        return "LessonType{" + "lessonTypeId=" + lessonTypeId + ", lessonTypeName=" + lessonTypeName + '}';
    }

    public int getLessonTypeId() {
        return lessonTypeId;
    }

    public void setLessonTypeId(int lessonTypeId) {
        this.lessonTypeId = lessonTypeId;
    }

    public String getLessonTypeName() {
        return lessonTypeName;
    }

    public void setLessonTypeName(String lessonTypeName) {
        this.lessonTypeName = lessonTypeName;
    }

}

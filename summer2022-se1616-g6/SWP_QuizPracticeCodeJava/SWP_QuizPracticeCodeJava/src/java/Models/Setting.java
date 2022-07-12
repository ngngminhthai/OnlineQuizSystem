
package Models;

public class Setting {
    private int settingID;
    private int quizid;
    private int typeID;
    private String settingName;
    private int quizDuration;
    private int numberOfQuestion;
    private int maxNumAnswerPerQuest;
    private boolean status;

//    public Setting(int settingID, int typeID, String settingName, int settingValue, boolean status) {
//        this.settingID = settingID;
//        this.typeID = typeID;
//        this.settingName = settingName;
//        this.settingValue = settingValue;
//        this.status = status;
//    }

    public Setting(int settingID,int quizid, int typeID, String settingName, int quizDuration, int numberOfQuestion, boolean status, int maxNumAnswerPerQuest) {
        this.settingID = settingID;
        this.quizid = quizid;
        this.typeID = typeID;
        this.settingName = settingName;
        this.quizDuration = quizDuration;
        this.numberOfQuestion = numberOfQuestion;
        this.status = status;
        this.maxNumAnswerPerQuest = maxNumAnswerPerQuest;
    }

    public int getSettingID() {
        return settingID;
    }

    public void setSettingID(int settingID) {
        this.settingID = settingID;
    }

    public int getQuizid() {
        return quizid;
    }

    public void setQuizid(int quizid) {
        this.quizid = quizid;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getSettingName() {
        return settingName;
    }

    public void setSettingName(String settingName) {
        this.settingName = settingName;
    }

    public int getQuizDuration() {
        return quizDuration;
    }

    public void setQuizDuration(int quizDuration) {
        this.quizDuration = quizDuration;
    }

    public int getNumberOfQuestion() {
        return numberOfQuestion;
    }

    public void setNumberOfQuestion(int numberOfQuestion) {
        this.numberOfQuestion = numberOfQuestion;
    }

    public int getMaxNumAnswerPerQuest() {
        return maxNumAnswerPerQuest;
    }

    public void setMaxNumAnswerPerQuest(int maxNumAnswerPerQuest) {
        this.maxNumAnswerPerQuest = maxNumAnswerPerQuest;
    }
 
    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getSettingTypeName(int typeid){
        String typename = "";
        switch(typeid){
            case 1:
                typename = "Quiz Setting";
                break;
            case 2:
                typename = "Exam Setting";
                break;
        }
        return typename;
    }
}

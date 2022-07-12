package DAL;

import Models.Blog;
import Models.Setting;
import Models.SettingType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SettingDAO extends DBContext {

    public ArrayList<Setting> getAllSetting() {
        ArrayList<Setting> list = new ArrayList<>();
        String sql = "SELECT * from Setting\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4),
                        rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Setting> filterSetting(int typeid, int status) {
        ArrayList<Setting> list = new ArrayList<>();
        String sql = "SELECT * from Setting where SettingID > 0\n";
        if (typeid == 0) {
            sql += "";
        } else {
            sql += "and SettingTypeID = " + typeid;
        }
        if (status == 2) {
            sql += "";
        } else {
            sql += "and status = " + status;
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4),
                        rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9));
                list.add(s);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<SettingType> getSettingType() {
        ArrayList<SettingType> list = new ArrayList<>();
        String sql = "SELECT * from Setting_Type\n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SettingType st = new SettingType(rs.getInt(1), rs.getString(2));
                list.add(st);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Setting getSettingByID(int settingid) {
        String sql = "SELECT * from Setting where settingid = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, settingid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting(rs.getInt(1), rs.getInt(2),
                        rs.getInt(3), rs.getString(4),
                        rs.getInt(6), rs.getInt(7), rs.getBoolean(8), rs.getInt(9));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void editSetting(int settingid, int duration, int numberQuestion, int status, int quizid) {
        String sql = "UPDATE [dbo].[Setting]\n"
                + "  SET QuizDuration = ?\n"
                + "  ,numberofquestion = ?\n"
                + "  ,[Status] = ?\n"
                + "  WHERE settingid = ?"
                + "\nUPDATE [dbo].[Quiz]\n"
                + "   SET [numOfQuestion] = ?\n"
                + "      ,[duration] = " + duration * 60
                + " WHERE quizId = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, duration);
            stm.setInt(2, numberQuestion);
            stm.setInt(3, status);
            stm.setInt(4, settingid);
            stm.setInt(5, numberQuestion);
            stm.setInt(6, quizid);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void addSetting(int quizid, int settingType, String settingName, int duration, int numberQuestion, int status, int maxAnsNum) {
        String sql = "INSERT INTO [dbo].[Setting]\n"
                + "           ([QuizID]\n"
                + "           ,[SettingTypeID]\n"
                + "           ,[SettingName]\n"
                + "           ,[QuizDuration]\n"
                + "           ,[NumberOfQuestion]\n"
                + "           ,[Status]\n"
                + "           ,[MaxNumAnswersPerQuest])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quizid);
            stm.setInt(2, settingType);
            stm.setString(3, settingName);
            stm.setInt(4, duration);
            stm.setInt(5, numberQuestion);
            stm.setInt(6, status);
            stm.setInt(7, maxAnsNum);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        SettingDAO sdao = new SettingDAO();
        ArrayList<Setting> list = sdao.getAllSetting();
        for (Setting s : list) {
            System.out.println(s.getQuizDuration());
        }
        sdao.addSetting(2, 1, "Setting 3", 15, 15, 1, 5);
        //sdao.editSetting(1, 15, 1);
//        Setting s = sdao.getSettingByID(1);
//        System.out.println(s.getSettingName());

    }
}

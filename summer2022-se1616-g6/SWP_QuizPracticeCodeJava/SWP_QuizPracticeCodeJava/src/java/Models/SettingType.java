
package Models;

public class SettingType {
    private int typeid;
    private String typeName;

    public SettingType(int typeid, String typeName) {
        this.typeid = typeid;
        this.typeName = typeName;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    
}

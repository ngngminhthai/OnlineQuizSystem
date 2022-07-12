
package Models;

public class UserRole {
    private int roleId;
    private String roleName;
    private boolean status;

    public UserRole() {}

    public UserRole(int roleId, String roleName, boolean status) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.status = status;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}

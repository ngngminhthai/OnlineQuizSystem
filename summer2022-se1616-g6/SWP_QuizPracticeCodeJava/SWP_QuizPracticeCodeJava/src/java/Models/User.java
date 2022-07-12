
package Models;

public class User {
    private int userId;
    private String fullName;
    private String userName;
    private String password;
    private int roleId;
    private String profilePic;
    private String email;
    private boolean gender;
    private String phone;
    private boolean status;
    private String address;
    private String token;
    private String createTimeResetToken;
    public User() {}

    public User(String email) {
        this.email = email;
    }

    public User(int userId, String fullName) {
        this.userId = userId;
        this.fullName = fullName;
    }

    public User(int userId, String fullName, String userName, String password, int roleId, String profilePic, String email, boolean gender, String phone, boolean status, String address, String token, String createTimeResetToken) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.roleId = roleId;
        this.profilePic = profilePic;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.status = status;
        this.address = address;
        this.token = token;
        this.createTimeResetToken = createTimeResetToken;
    }
   
    public User(int userId, String fullName, String userName, String password, int roleId, String profilePic, String email, boolean gender, String phone, boolean status) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.roleId = roleId;
        this.profilePic = profilePic;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.status = status;
    }

    public User(int userId, String fullName, String userName, String password, int roleId, String profilePic, String email, boolean gender, String phone, boolean status, String address) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.roleId = roleId;
        this.profilePic = profilePic;
        this.email = email;
        this.gender = gender;
        this.phone = phone;
        this.status = status;
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    
    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getCreateTimeResetToken() {
        return createTimeResetToken;
    }

    public void setCreateTimeResetToken(String createTimeResetToken) {
        this.createTimeResetToken = createTimeResetToken;
    }
    
    public String getUserRole(int roleid){
        String role = "";
        switch(roleid){
            case 1:
                role = "Admin";
                break;
            case 2:
                role = "Marketing";
                break;
            case 3:
                role = "Sale";
                break;
            case 4:
                role = "Expert";
                break;
            case 5:
                role = "Customer";
                break;
        }
        return role;
    }
    
    public String getUserGender(boolean boolGender){
        String gender = "";
        int intGender = (boolGender) ? 1 : 0;
        switch(intGender){
            case 0:
                gender = "Female";
                break;
            case 1:
                gender = "Male";
                break;
        }
        return gender;
    }
    
    public String getUserStatus(boolean boolStatus){
        String status = "";
        int intstatus = (boolStatus) ? 1 : 0;
        switch(intstatus){
            case 0:
                status = "Deactive";
                break;
            case 1:
                status = "Active";
                break;
        }
        return status;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", fullName=" + fullName + ", userName=" + userName + ", password=" + password + ", roleId=" + roleId + ", profilePic=" + profilePic + ", email=" + email + ", gender=" + gender + ", phone=" + phone + ", status=" + status + '}';
    }
    
}

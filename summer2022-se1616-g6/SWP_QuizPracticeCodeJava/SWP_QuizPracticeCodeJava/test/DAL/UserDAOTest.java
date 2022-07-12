
package DAL;

import Models.User;
import Models.UserRole;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

public class UserDAOTest {
    UserDAO udao = new UserDAO();
    
    @Test
    public void testGetAllUsers() {
        ArrayList<User> list = udao.getAllUsers();
        int rs = list.size();
        int expected = 52;
        assertEquals(expected, rs);
    }

    @Test
    public void testGetUserEmail() {
        ArrayList<User> list = udao.getUserEmail();
        int rs = list.size();
        int expected = 52;
        assertEquals(expected, rs);
    }

    @Test
    public void testGetUserRole() {
        ArrayList<UserRole> list = udao.getUserRole();
        int rs = list.size();
        int expected = 5;
        assertEquals(expected, rs);
    }
    
    @Test
    public void testGetUserRole2() {
        ArrayList<UserRole> list = udao.getUserRole();
        ArrayList<Integer> id = new ArrayList<>();
        int rs = list.size();
        int expected = 5;
        assertEquals(expected, rs);
    }

    @Test
    public void testGetUserByID() {
    }

    @Test
    public void testFindImg() {
    }

    @Test
    public void testFinlEmail() {
    }

    @Test
    public void testFindGender() {
    }

    @Test
    public void testFindPhone() {
    }

    @Test
    public void testFindName() {
    }

    @Test
    public void testUpdateImg() {
    }

    @Test
    public void testUpdateUser() {
    }

    @Test
    public void testGetUserById() {
    }

    @Test
    public void testChangePassword() {
    }

    @Test
    public void testMain() {
    }
    
}

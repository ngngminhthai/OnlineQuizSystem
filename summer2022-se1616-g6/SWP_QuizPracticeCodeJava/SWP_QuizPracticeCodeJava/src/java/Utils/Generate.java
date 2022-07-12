
package Utils;

import java.util.UUID;

public class Generate {
    public String generateResetToken() {
        String uuid = UUID.randomUUID().toString(); 
        return uuid;
    }
    public static void main(String[] args) {
        System.out.println(new Generate().generateResetToken());
    }
}

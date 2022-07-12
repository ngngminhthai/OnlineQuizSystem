package SendEmail;

public class SecurityReset {

    private final String senderAddress = "duynnhe163128@fpt.edu.vn";
    private final String password = "vuthuylinh2709";
    private final String subject = "Reset password";
    private final String body = "<!DOCTYPE html>\n"
            + "<html>\n"
            + "    <head>\n"
            + "        <title>TODO supply a title</title>\n"
            + "        <meta charset=\"UTF-8\">\n"
            + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
            + "    </head>\n"
            + "    <body>\n"
            + "        <div class=\"container\" style=\"width: 500px;height: 500px;background-color: pink;\">\n"
            + "            <h1 class=\"logo\" style=\"color:yellow;text-align: center;padding-top: 50px;font-size: 30px\">Quizzy</h1>\n"
            + "            <div class=\"content\" style=\"padding-right: 20px;padding-left: 40px;margin-top: 50px;\"><h4 style=\"font-family: calibri;font-size: 30px;\">Dear,</h4>\n"
            + "                <p style=\"margin-bottom: 20px;line-height: 1.5;font-family: calibri; font-size: 16px\">Hi there, here is the link to reset your password\n"
            + "                    ,but keep in mind that this link will only be available in a short period of time.\n"
            + "                <p style=\"font-weight: bold;font-size: 17px\">Click below to get there:</p></p><br>\n"
            + "                <a href=\"http://localhost:8084/SWP_QuizPracticeCodeJava/resetPassword\" style=\"text-decoration: none;\">\n"
            + "                    <p class=\"button\" style=\"width: 200px;height: 40px;border-radius: 20px;font-size: 20px;color: #0077b3;text-align: center;background-color: white;padding-top: 6px;\">Go now</p></a>\n"
            + "            </div>\n"
            + "        </div>\n"
            + "    </body>\n"
            + "</html>\n";

    public String getSenderAddress() {
        return senderAddress;
    }

    public String getPassword() {
        return password;
    }

    public String getSubject() {
        return subject;
    }

    public String getBody() {
        return body;
    }
    
    

}

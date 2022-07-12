package SendEmail;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail {

    public static void send(String receiver, String mailSubject,
            String mailBody, final String sender, final String senderPassword) {
        //create an instance of Properties Class   
        Properties props = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, senderPassword);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
            message.setSubject(mailSubject);
            message.setContent(mailBody, "text/html");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String subject = "Test send email.";
        String message = "<!DOCTYPE html>\n"
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
                + "                <p style=\"margin-bottom: 20px;line-height: 1.5;font-family: calibri; font-size: 16px\">Hi there, here is the link to reset your password<br>\n"
                + "                    ,<br>but keep in mind that this link will be available in a short period of time.<br>\n"
                + "                <p style=\"font-weight: bold;font-size: 17px\">Click below to get there:</p></p><br>\n"
                + "                <a href=\"http://localhost:8084/SWP_QuizPracticeCodeJava/verifyEmail#\" style=\"text-decoration: none;\">\n"
                + "                    <p class=\"button\" style=\"width: 200px;height: 40px;border-radius: 20px;font-size: 20px;color: #0077b3;text-align: center;background-color: white;padding-top: 6px;\">Go now</p></a>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </body>\n"
                + "</html>\n";
        SendEmail.send("halinh240402@gmail.com", subject, message, "duynnhe163128@fpt.edu.vn", "vuthuylinh2709");
    }

}

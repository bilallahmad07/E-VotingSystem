package bilal;

import java.util.Properties;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class SendMail {
     public static void sendMail(String to,String sub,String body) throws Exception {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session s = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("evotingsystems@gmail.com", "Bilal@123");
                    }
                });

        Message m = new MimeMessage(s);
        m.setFrom(new InternetAddress("evotingsystems@gmail.com"));
        m.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

        m.setSubject(sub);

        m.setText(body);

          Transport.send(m);

    }

}

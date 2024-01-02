package ch.ecoRent.utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EmailUtil {

    /**
     * Utility method to send simple HTML email
     *
     * @param session
     * @param toEmail
     * @param subject
     * @param body
     */
    public static void sendEmail(Session session, String toEmail, String subject, String body) {
        try {
            MimeMessage msg = new MimeMessage(session);
            //set message headers
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("abc@xyz.com", "NoReply-JD"));

            msg.setReplyTo(InternetAddress.parse("abc@xyz.com", false));

            msg.setSubject(subject, "UTF-8");

            msg.setText(body, "UTF-8");

            msg.setSentDate(new Date());

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            System.out.println("\nSending Mail Now...");
            Transport.send(msg);

            System.out.println("\nEMail Sent Successfully!");
        } catch (Exception e) {
            e.printStackTrace();

        }

    }
    public static void sendAttachmentEmail(Session session, String toEmail, String subject, String body){
        try{
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("abc@xyz.com", "Your friend"));
            msg.setReplyTo(InternetAddress.parse("abc@xyz.com", false));
            msg.setSubject(subject, "UTF-8");
            msg.setSentDate(new Date());
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));

            //Create the message body part
            BodyPart messageBodyPart = new MimeBodyPart();

            //Fill the message body part
            messageBodyPart.setText(body);

            //Create a multipart message for attachment
            Multipart multipart = new MimeMultipart();

            //Set text message part
            multipart.addBodyPart(messageBodyPart);

            //second part is attachment
            messageBodyPart = new MimeBodyPart();
            System.out.println("File path: ");

            String filename = "";
            try{
            filename = new BufferedReader(new InputStreamReader(System.in)).readLine();
            }catch(IOException e){
                System.out.println("Error while reading filename");
            }

            DataSource source = new FileDataSource(filename);   //filename is the loation of the file here
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName("Attached File");

            //add the second part
            multipart.addBodyPart(messageBodyPart);

            //Set the content
            msg.setContent(multipart);

            System.out.println("Attaching Files...");
            //Send message
            Transport.send(msg);
            System.out.println("EMail Sent Successfully with attachment!");
        }catch(MessagingException e){
            e.printStackTrace();
        }catch(UnsupportedEncodingException e){
            e.printStackTrace();
        }
    }
}
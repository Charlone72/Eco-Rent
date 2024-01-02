/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ch.ecoRent.utility;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import ch.ecoRent.beans.Manager;

/**
 *
 * @author Carlo Martinenghi
 */
public class Emailer {
    private String host = "mail.eco-rent.ch";
    private String user = "info@eco-rent.ch";
    private String pass = "Possessione.3";

    public Emailer(String host, String user, String password) {
        this.host = host;
        this.user = user;
        this.pass = password;
    }

    public void sendEmail(String emailTo, String subject, String messageText) throws MessagingException {


        String to = emailTo;
        String from = "info@eco-rent.ch";

        Properties prop = new Properties();
        //prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.host", "localhost");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user, pass);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            message.setRecipients(Message.RecipientType.TO, address);

            message.setSubject(subject);
            message.setSentDate(new Date());
            message.setText(messageText);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void sendEmailSSL(String emailTo, String subject, String messageText) throws MessagingException {

        final String fromEmail = "info@eco-rent.ch";
        final String password = "Possessione.3";
        final String toEmail = emailTo; // can be any email id

        System.out.println("SSLEmail Start");
        Properties props = new Properties();
        props.put("mail.smtp.host", host); //SMTP Host
        props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
        props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
        props.put("mail.smtp.port", "465"); //SMTP Port

        Authenticator auth = new Authenticator() {
            //override the getPasswordAuthentication method
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getDefaultInstance(props, auth);
        System.out.println("Session created");

        EmailUtil.sendEmail(session, toEmail, subject, messageText);


    }

    public void sendEmailLH(String emailTo, String subject, String messageText) throws MessagingException {

        String HOSTNAME = "localhost";
        String USERNAME = "info@eco-rent.ch";
        String PASSWORD = "Possessione.3";


        try {
            String to = emailTo;
            String from = "info@eco-rent.ch";
            Properties properties = System.getProperties();

            properties.setProperty("mail.smtp.host",HOSTNAME);
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(subject);


                // This mail has 2 part, the BODY and the embedded image
                MimeMultipart multipart = new MimeMultipart("related");

                // first part (the html)
                BodyPart messageBodyPart = new MimeBodyPart();
                String htmlText = messageText + "<BR><img src=\"cid:image\">";
                messageBodyPart.setContent(htmlText, "text/html");
                // add it
                multipart.addBodyPart(messageBodyPart);

                // second part (the image)
                messageBodyPart = new MimeBodyPart();
                DataSource fds = new FileDataSource("/home/ecorent/public_html/ecorent/pictures/logoER2.png");

                messageBodyPart.setDataHandler(new DataHandler(fds));
                messageBodyPart.setHeader("Content-ID", "<image>");

                // add image to the multipart
                multipart.addBodyPart(messageBodyPart);

                // put everything together
                message.setContent(multipart);

                //message.setText(messageText);
                Transport.send(message);
                System.out.println("Message Sending Completed");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }

    public void sendMultipleEmailLH(List<Manager> managers, String subject, String messageText) {

        String HOSTNAME = "localhost";
        String USERNAME = "info@eco-rent.ch";
        String PASSWORD = "Possessione.3";


        try {

            String from = "info@eco-rent.ch";
            Properties properties = System.getProperties();

            properties.setProperty("mail.smtp.host",HOSTNAME);
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(from));
                for (Manager manager : managers) {
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(manager.getEmail()));
                }

                message.setSubject(subject);


                // This mail has 2 part, the BODY and the embedded image
                MimeMultipart multipart = new MimeMultipart("related");

                // first part (the html)
                BodyPart messageBodyPart = new MimeBodyPart();
                String htmlText = messageText + "<BR><img src=\"cid:image\">";
                messageBodyPart.setContent(htmlText, "text/html");
                // add it
                multipart.addBodyPart(messageBodyPart);

                // second part (the image)
                messageBodyPart = new MimeBodyPart();
                DataSource fds = new FileDataSource("/home/ecorent/public_html/ecorent/pictures/logoER2.png");

                messageBodyPart.setDataHandler(new DataHandler(fds));
                messageBodyPart.setHeader("Content-ID", "<image>");

                // add image to the multipart
                multipart.addBodyPart(messageBodyPart);

                // put everything together
                message.setContent(multipart);

                //message.setText(messageText);
                Transport.send(message);
                System.out.println("Message Sending Completed");
        } catch (MessagingException mex) {
                mex.printStackTrace();
        }

    }
}

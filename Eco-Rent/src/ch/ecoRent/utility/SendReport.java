package ch.ecoRent.utility;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.ResourceBundle;
import java.util.TimerTask;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;

//import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.log4j.Logger;

import ch.ecoRent.beans.Manager;
import ch.ecoRent.beans.Riservazione;
import ch.ecoRent.db.DBEngine;

public class SendReport extends TimerTask {
    private static final int C_SCHEDULE_HOUR = 5;
    private static final int DAYS_LEFT = 5;
    private static boolean isRunning = false;
    private ServletContext context = null;
    private DBEngine dbe;
    ResourceBundle captions;
    Emailer emailer;

    private Logger log = Logger.getLogger(this.getClass());

    public SendReport(ServletContext context, DBEngine dbe, ResourceBundle captions, Emailer emailer) {
        this.context = context;
        this.dbe = dbe;
        this.captions = captions;
        this.emailer = emailer;
    }

    public void run() {
        Calendar cal = Calendar.getInstance();
        if (!isRunning) {
                //System.out.println("cal.get(Calendar.HOUR_OF_DAY) = " + cal.get(Calendar.HOUR_OF_DAY));
                log.info("cal.get(Calendar.HOUR_OF_DAY) = " + cal.get(Calendar.HOUR_OF_DAY));

                if (C_SCHEDULE_HOUR == cal.get(Calendar.HOUR_OF_DAY)) {
                    isRunning = true;
                    doReportTask();// you can write your sendmail task there
                    isRunning = false;
                }
        } else {
            context.log("the prevenient task is still running!");
        }
    }

    public void doReportTask() {
        List<Manager> listM = dbe.listManagerInfoPre();

        ArrayList<Riservazione> reservations = dbe.getRiservazioni();
        ArrayList<Riservazione> resPending = new ArrayList<Riservazione>();

        for (Riservazione riservazione : reservations) {
            if (riservazione.getDaysleft() == DAYS_LEFT ) {
                resPending.add(riservazione);
            }
        }

        //creare sql per avvisare clienti in scadenza.
        //Utente u = dbe.getUser(fk_utente);
        if (resPending.size() > 0) {
            sendEmailToManagers(listM, resPending);
        }

    }

    private void sendEmailToManagers(List<Manager> listM, ArrayList<Riservazione> reservations) {
        String subject = captions.getString("SendReport.email.subject");
        String body = captions.getString("SendReport.email.body");

        StringBuffer sbBody = new StringBuffer();

        sbBody.append(body);

        for (Riservazione riservazione : reservations) {

            sbBody.append("E-Mail: ").append(riservazione.getFk_utente());
            sbBody.append(" - Id scooter: ").append(riservazione.getFk_oggetto());
            sbBody.append(" - Scadenza tra: ").append(riservazione.getDaysleft());
            sbBody.append(" - Data fine prenotazione: ").append(riservazione.getData_fine());
            sbBody.append("<BR>");

            //send email to client
            sendEmailToClient(riservazione.getFk_utente());
        }

        sbBody.append("<BR>");
        body = sbBody.toString();

        //emailer.sendEmail(email, subject, body);
        emailer.sendMultipleEmailLH(listM, subject, body);


    }

    private void sendEmailToClient(String email) {
        String subject = captions.getString("SendReport.emailClient.subject");
        String body = captions.getString("SendReport.emailClient.body");

        try {
            emailer.sendEmailLH(email, subject, body);
        } catch (MessagingException mex) {
            mex.printStackTrace();
            log.error(mex.getMessage());
        }


    }
}
package ch.ecoRent.controller;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import ch.ecoRent.db.DBEngine;
import ch.ecoRent.utility.Emailer;
import ch.ecoRent.utility.SendReport;

public class ServletListenerTimer implements ServletContextListener {
    private java.util.Timer timer = null;
    private Logger log = Logger.getLogger(this.getClass());
    private DBEngine dbe;
    Locale locale;
    ResourceBundle captions;
    private Emailer emailer;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        timer = new java.util.Timer(true);
        dbe = new DBEngine();

        ServletContext ctx = event.getServletContext();


        String emailH = ctx.getInitParameter("emailHost");
        String emailU = ctx.getInitParameter("emailUser");
        String emailP = ctx.getInitParameter("emailPassword");
        emailer = new Emailer(emailH, emailU, emailP);
        locale = new Locale(ctx.getInitParameter("locale"));

        locale = new Locale(ctx.getInitParameter("locale"));
        captions = ResourceBundle.getBundle("messages",locale);
        log.info("timmer is started");
        timer.schedule(new SendReport(event.getServletContext(), dbe, captions, emailer), 0, 60 * 60 * 1000);
        log.info("add sendmail task");
    }
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        timer.cancel();
        log.info("timmer destoryed");
    }

}

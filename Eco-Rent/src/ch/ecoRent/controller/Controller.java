package ch.ecoRent.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import ch.ecoRent.beans.ListaFoto;
import ch.ecoRent.beans.Manager;
import ch.ecoRent.beans.Oggetto;
import ch.ecoRent.beans.Prezzi;
import ch.ecoRent.beans.Riservazione;
import ch.ecoRent.beans.Utente;
import ch.ecoRent.db.DBEngine;
import ch.ecoRent.exception.DataBaseException;
import ch.ecoRent.exception.DeleteReservationException;
import ch.ecoRent.utility.Emailer;
import ch.ecoRent.utility.Utility;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HttpSession session;
    String userPath;
    private DBEngine dbe;
    private Emailer emailer;
    Locale locale;
    ResourceBundle captions;
    private Utente utente;
    private final String URL_TO_ENABLE = "www.eco-rent.ch/ecorent/Controller?Command=newUserOk&";

    private Logger log = Logger.getLogger(Controller.class);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();

    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        dbe = new DBEngine();

        locale = new Locale(getServletContext().getInitParameter("locale"));
        captions = ResourceBundle.getBundle("messages",locale);

        String emailH = getServletContext().getInitParameter("emailHost");
        String emailU = getServletContext().getInitParameter("emailUser");
        String emailP = getServletContext().getInitParameter("emailPassword");
        emailer = new Emailer(emailH, emailU, emailP);

    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("Command");

        //String lang = request.getParameter("lang");

        log.debug("command befor to call methods: " + command);

        session = request.getSession(true);

        String lang = (String)session.getAttribute("lang");
        log.debug("lang: " + lang);

        if(lang == null || lang.equals("")) {
            session.setAttribute("lang", "it");
        }

        if(command == null) {
            command = "changeLang";
        }


        if (command.equals("createUser")) {
            createUser(request);
        } else if(command.equals("changeLang")) {
            changeLang(request);
        } else if(command.equals("viewCreateUser")) {
            viewCreateUser(request);
        } else if(command.equals("viewLogin")) {
            viewLogin(request);
        } else if(command.equals("login")) {
            login(request);
        } else if(command.equals("userMain")) {
            userMain(request);
        } else if(command.equals("myHome")) {
            myHome(request);
        } else if(command.equals("logout")) {
            logout(request);
        } else if (command.equals("editUserOk")) {
            editUserOk(request);
        } else if (command.equals("newUserOk")) {
            newUserOk(request);
        } else if (command.equals("sendPassword")) {
            sendPassword(request);
        } else if (command.equals("viewList")) {
            viewList(request);
        } else if (command.equals("viewObject")) {
            viewObject(request);
        } else if (command.equals("rentObject")) {
            rentObject(request);
        } else if (command.equals("viewPrice")) {
            viewPrice(request);
        } else if (command.equals("setRiservazione")) {
            setRiservazione(request);
        } else if (command.equals("deleteReservation")) {
            deleteReservation(request);
        } else if (command.equals("showInfoRiservazione")) {
            showInfoRiservazione(request);
        }else if (command.equals("viewForgotPassword")) {
            viewForgotPassword(request);
        }
        String url = userPath + ".jsp";

        log.debug("userPath after methods: " + userPath);
        log.debug("url: " + url);

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            log.error("exception: " + ex.getMessage());
        }
    }

    private void viewLogin(HttpServletRequest request) {
        userPath = "/login";

    }

    private void changeLang(HttpServletRequest request) {
        String lang = request.getParameter("lang");
        session.setAttribute("lang", lang);

        userPath = "/index";
    }

    private void showInfoRiservazione(HttpServletRequest request) {
        Integer fk_oggetto = Integer.parseInt(request.getParameter("fk_oggetto"));
        String fk_utente = request.getParameter("fk_utente");
        Integer stato = Integer.parseInt(request.getParameter("stato"));
        String data_inizio = request.getParameter("data_inizio");
        String data_fine = request.getParameter("data_fine");

        Riservazione r = new Riservazione();
        r.setFk_oggetto(fk_oggetto);
        r.setFk_utente(fk_utente);
        r.setStato(stato);
        r.setData_inizio(new Date(data_inizio));
        r.setData_fine(new Date(data_fine));

        boolean areReservations = dbe.checkPre(fk_oggetto, r);

        if(areReservations) {
            //no possible to add reservation, if already present.
            String msg1 = captions.getString("Controller.showInfoRiservazione.ex.msg1");
            String msg2 = captions.getString("Controller.showInfoRiservazione.ex.msg2");

            callError(request, msg1, msg2);
        }else {

            r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
            r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

            Prezzi prezzi = dbe.getPrezzi(r.getFk_oggetto());
            if(prezzi != null) {
                r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
            }

            Oggetto o = dbe.getOggetto("" + fk_oggetto);

            request.setAttribute("Oggetto", o);
            request.setAttribute("Riservazione", r);

            userPath = "/infoReservation";
        }

    }

    private void viewCreateUser(HttpServletRequest request) {
        userPath = "/createUser";

    }

    private void logout(HttpServletRequest request) {
        session.invalidate();
        userPath = "/index";
    }

    private void setRiservazione(HttpServletRequest request) {
        Integer fk_oggetto = Integer.parseInt(request.getParameter("fk_oggetto"));
        String fk_utente = request.getParameter("fk_utente");
        Integer stato = Integer.parseInt(request.getParameter("stato"));
        String data_inizio = request.getParameter("data_inizio");
        String data_fine = request.getParameter("data_fine");

        Riservazione r = new Riservazione();
        r.setFk_oggetto(fk_oggetto);
        r.setFk_utente(fk_utente);
        r.setStato(stato);
        r.setData_inizio(new Date(data_inizio));
        r.setData_fine(new Date(data_fine));

        boolean areReservations = dbe.checkPre(fk_oggetto, r);

        if(areReservations) {
            //no possible to add reservation, if already present.
            DataBaseException dbex = new DataBaseException("Inserimento dati non riuscito!");
            callError(request, dbex, "Inserimento riservazione fallito. Esiste gia una prenotazione");
        }else {
            if(dbe.setRiservazione(r)) {

                Oggetto o = dbe.getOggetto(request.getParameter("fk_oggetto"));

                ArrayList<Riservazione> listR = dbe.getRiservazioni(fk_oggetto);

                //invia mail ai managers
                List<Manager> listM = dbe.listManagerInfoPre();
                Utente u = dbe.getUser(fk_utente);
                sendEmailToManagers(listM, u);

                request.setAttribute("Oggetto", o);
                request.setAttribute("Riservazioni", listR);

                userPath = "/calendar";
            }else {
                DataBaseException dbex = new DataBaseException("Inserimento dati non riuscito!");
                callError(request, dbex, "Inserimento riservazione fallito. Chiamare un amministratore.");
            }
        }

    }

    private void sendEmailToManagers(List<Manager> listM, Utente u) {
        String subject = captions.getString("Controller.sendEmailToManagers.email.subject") + " - " + u.getCognome() + " " + u.getNome();
        String body = captions.getString("Controller.sendEmailToManagers.email.body");

        //emailer.sendEmail(email, subject, body);
        emailer.sendMultipleEmailLH(listM, subject, body);


    }

    private void viewPrice(HttpServletRequest request) {
        String key = request.getParameter("key");


        Prezzi p = dbe.getPrezzi(Integer.parseInt(key));
        Oggetto o = dbe.getOggetto(key);


        request.setAttribute("oggetto", o);
        request.setAttribute("prezzi", p);

        userPath = "/prices";
    }

    private void rentObject(HttpServletRequest request)  {
        if (session == null || (Utente)session.getAttribute("utente") == null){

            /*String newMsg1 = captions.getString("Controller.login.err3");
            String newMsg2 = captions.getString("Controller.login.err4");

            request.setAttribute("msg1", newMsg1);
            request.setAttribute("msg2", newMsg2);

            userPath = "/login";*/
            String key = request.getParameter("key");
            Oggetto o = dbe.getOggetto(key);
            ArrayList<Riservazione> listR = dbe.getRiservazioni(Integer.parseInt(key));

            request.setAttribute("Oggetto", o);
            request.setAttribute("Riservazioni", listR);

            userPath = "/calendar";
        }else{
            utente = (Utente)session.getAttribute("utente");
            String key = request.getParameter("key");
            Oggetto o = dbe.getOggetto(key);
            ArrayList<Riservazione> listR = dbe.getRiservazioni(Integer.parseInt(key));

            request.setAttribute("Oggetto", o);
            request.setAttribute("Riservazioni", listR);

            userPath = "/calendar";
        }


    }

    private void viewObject(HttpServletRequest request) {
        String key = request.getParameter("key");
        ListaFoto foto = new ListaFoto();
        foto.setListaFoto(dbe.getListaFoto(Integer.parseInt(key)));
        Oggetto o = dbe.getOggetto(key);


        request.setAttribute("foto", foto);
        request.setAttribute("Oggetto", o);

        userPath = "/object";

    }

    private void viewList(HttpServletRequest request) {

        String cat = request.getParameter("cat");

        if (cat == null) {
            userPath = "/scooters";
        }else {
            ArrayList<Oggetto> objectsFree = dbe.listObject(cat, true);
            ArrayList<Oggetto> objectsNotFree = dbe.listObject(cat, false);
            boolean viewPicture = true;

            request.setAttribute("viewPicture", viewPicture);
            request.setAttribute("objectsFree", objectsFree);
            request.setAttribute("objectsNotFree", objectsNotFree);

            userPath = "/listObject";
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    private void sessionExpired (HttpServletRequest request){
        String newMsg1 = captions.getString("Controller.sessionExpired.msg1");
        String newMsg2 = captions.getString("Controller.sessionExpired.msg2");
        request.setAttribute("msg1", newMsg1);
        request.setAttribute("msg2", newMsg2);

        userPath = "/error";
    }

    private void sessionExpiredWithMsg (HttpServletRequest request, String caption1, String caption2){
        String newMsg1 = captions.getString(caption1);
        String newMsg2 = captions.getString(caption2);
        request.setAttribute("msg1", newMsg1);
        request.setAttribute("msg2", newMsg2);

        userPath = "/error";
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //metodi chiamati dal controller:

    /*private void newUser(HttpServletRequest request) {
        String newMsg1 = captions.getString("Controller.newUser.msg1");
        String newMsg2 = captions.getString("Controller.newUser.msg2");

        request.setAttribute("newMsg1", newMsg1);
        request.setAttribute("newMsg2", newMsg2);
    }*/

    private void createUser(HttpServletRequest request) {
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String domicilio = request.getParameter("domicilio");
        String cap = request.getParameter("cap");
        String via = request.getParameter("via");

        //creare password per abilitare utente
        String password = Utility.createPassword(10);

        utente = new Utente();
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setEmail(email);
        utente.setDomicilio(domicilio);
        utente.setCap(cap);
        utente.setVia(via);
        utente.setPassword(password);

        try {
            dbe.setUser(utente);

            String urlToEnable = URL_TO_ENABLE + "email=" + email + "&code=" + password;
            System.out.println(urlToEnable);

            //if(true){
            if(sendCheckEmail(email, urlToEnable, password)){
                String newMsg1 = captions.getString("Controller.createUser.msg1");
                String newMsg2 = captions.getString("Controller.createUser.msg2");
                String newMsg3 = captions.getString("Controller.createUser.msg3");


                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);
                request.setAttribute("newMsg3", newMsg3);
                request.setAttribute("statusR", "success");

                session.setAttribute("utente", utente);

                userPath = "/enableUser";
            }else{
                //errore non visualizzo enableUser perchè l'utente non ha ricevuto la email.
                userPath = "/error";
                String newMsg1 = captions.getString("Controller.createUser.err1");
                String newMsg2 = captions.getString("Controller.createUser.err2");
                //String newMsg3 = captions.getString("Controller.createUser.err3");

                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);
                //request.setAttribute("newMsg3", newMsg3);
                request.setAttribute("statusR", "warning");
            }
        } catch (DataBaseException ex) {
            //errore ripeto l'inserimento.
            userPath = "/createUser";
            String newMsg1 = captions.getString("Controller.createUser.err4");
            String newMsg2 = null;
            if(dbe.getUser(email.toLowerCase()) != null){
                newMsg2 = captions.getString("Controller.createUser.err5");
            }else{
                newMsg2 = captions.getString("Controller.createUser.err3");
            }

            log.error(ex.getMessage());
            request.setAttribute("statusR", "error");
            request.setAttribute("newMsg1", newMsg1);
            request.setAttribute("newMsg2", newMsg2);
        }
    }

    private void deleteReservation(HttpServletRequest request) {
       String key = request.getParameter("key");

       if (session == null || (Utente)session.getAttribute("utente") == null){
           sessionExpired(request);
       }else{

           try {
               dbe.deleteRiservazione(Integer.parseInt(key));

               utente = (Utente)session.getAttribute("utente");

               ArrayList<Riservazione> riservazioni = dbe.getRiservazioni(utente.getEmail());
               request.setAttribute("riservazioni", riservazioni);

               request.setAttribute("subMenu", "Riservazioni");

               userPath = "/userMain" ;

           } catch (DeleteReservationException ex) {
               callError(request, ex, "DeleteReservationException");
           }


       }




    }

    private void login(HttpServletRequest request) {


        String email = request.getParameter("email");
        String password = request.getParameter("password");

        utente = new Utente();
        utente.setEmail(email);
        utente.setPassword(password);

        utente = dbe.login(utente);

        if(utente != null){
            if(utente.getEnabled()){
                //creo nuova sessione.
                session = request.getSession(true);

                session.setAttribute("utente", utente);

                String newMsg1 = captions.getString("Controller.login.msg1");
                String newMsg2 = captions.getString("Controller.login.msg2");

                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);

                request.setAttribute("subMenu", "Profilo");

                userPath = "/userMain" ;

            } else {
                String newMsg1 = captions.getString("Controller.login.disable1");
                String newMsg2 = captions.getString("Controller.login.disable2");

                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);

                request.setAttribute("utente", utente);

                userPath = "/enableUser" ;
            }
        }else{
            String newMsg1 = captions.getString("Controller.login.err1");
            String newMsg2 = captions.getString("Controller.login.err2");

            request.setAttribute("newMsg1", newMsg1);
            request.setAttribute("newMsg2", newMsg2);

            userPath = "/error";
        }

    }

    private void userMain(HttpServletRequest request) {

        if (session == null || (Utente)session.getAttribute("utente") == null){
            sessionExpired(request);
        }else{
            utente = (Utente)session.getAttribute("utente");

            if(utente != null){
                if(utente.getEnabled()){
                    //creo nuova sessione.
                    session = request.getSession(true);

                    session.setAttribute("utente", utente);

                    String newMsg1 = captions.getString("Controller.login.msg1");
                    String newMsg2 = captions.getString("Controller.login.msg2");

                    request.setAttribute("newMsg1", newMsg1);
                    request.setAttribute("newMsg2", newMsg2);

                    String subMenu = request.getParameter("subMenu");
                    if(subMenu == null) {
                        subMenu = "Profilo";
                    }

                    if(subMenu.equals("Riservazioni")) {
                        ArrayList<Riservazione> riservazioni = dbe.getRiservazioni(utente.getEmail());
                        request.setAttribute("riservazioni", riservazioni);
                    }

                    request.setAttribute("subMenu", subMenu);

                    userPath = "/userMain" ;

                } else {
                    String newMsg1 = captions.getString("Controller.login.disable1");
                    String newMsg2 = captions.getString("Controller.login.disable2");

                    request.setAttribute("newMsg1", newMsg1);
                    request.setAttribute("newMsg2", newMsg2);

                    request.setAttribute("utente", utente);

                    userPath = "/enableUser" ;
                }
            }else{
                String newMsg1 = captions.getString("Controller.login.err1");
                String newMsg2 = captions.getString("Controller.login.err2");

                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);

                userPath = "/error";
            }
        }

    }


    private void editUserOk(HttpServletRequest request) {
        if (session == null || (Utente)session.getAttribute("utente") == null){
            sessionExpired(request);
        }else{
            utente = (Utente)session.getAttribute("utente");

            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String password = request.getParameter("password");
            String domicilio = request.getParameter("domicilio");
            String cap = request.getParameter("cap");
            String via = request.getParameter("via");

            utente = (Utente)session.getAttribute("utente");
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setPassword(password);
            utente.setDomicilio(domicilio);
            utente.setCap(cap);
            utente.setVia(via);

            boolean check = dbe.updateUser(utente);

            if(check){
                session.setAttribute("utente", utente);

                String newMsg1 = captions.getString("Controller.editUserOk.msg1");
                request.setAttribute("newMsg1", newMsg1);

                request.setAttribute("subMenu", "Profilo");

                userPath = "/userMain";
            }else {
                String newMsg1 = captions.getString("Controller.editUserOk.err1");
                String newMsg2 = captions.getString("Controller.editUserOk.err2");
                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);

                userPath = "/userMain";
            }
        }
    }

    private void myHome(HttpServletRequest request) {
        if (session == null || (Utente)session.getAttribute("utente") == null){
            sessionExpired(request);
        }else{

            request.setAttribute("subMenu", "Profilo");
            userPath = "/userMain";

        }
    }

    private boolean sendCheckEmail(String email, String urlToEnable, String code) {
        boolean isSended = false;

        try {
            String subject = captions.getString("Controller.sendCheckEmail.email.subject");

            //<br> or \n in messages.properties!
            String messageBody = captions.getString("Controller.sendCheckEmail.email.body1") +
                                 captions.getString("Controller.sendCheckEmail.email.body2") +
                                 code +
                                 captions.getString("Controller.sendCheckEmail.email.body3") +
                                 urlToEnable +
                                 captions.getString("Controller.sendCheckEmail.email.body4");

            //emailer.sendEmail(email, subject, messageBody);
            //emailer.sendEmailSSL(email, subject, messageBody);
            emailer.sendEmailLH(email, subject, messageBody);
            isSended = true;
        } catch (MessagingException ex) {
            log.error("invio email Fallita:" + ex.getMessage());
        }

        return isSended;
    }

    private void newUserOk(HttpServletRequest request) {
        String password = request.getParameter("code");
        String email = request.getParameter("email");

        if (dbe.setEnabled(email, password)){

            utente = new Utente();
            utente.setEmail(email);
            utente.setPassword(password);

            utente = dbe.login(utente);

            if(utente != null){
                //creo nuova sessione.
                session = request.getSession(true);
                session.setAttribute("utente", utente);


                String newMsg1 = captions.getString("Controller.newUserOk.msg1");
                String newMsg2 = captions.getString("Controller.newUserOk.msg2");
                String newMsg3 = captions.getString("Controller.newUserOk.msg3");

                request.setAttribute("statusR", "success");
                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);
                request.setAttribute("newMsg3", newMsg3);

                request.setAttribute("subMenu", "Profilo");

                userPath = "/userMain";
            } else {
                String wrn1 = captions.getString("Controller.newUserOk.wrn1");
                String wrn2 = captions.getString("Controller.newUserOk.wrn2");

                request.setAttribute("newMsg1", wrn1);
                request.setAttribute("newMsg2", wrn2);

                userPath = "/error";
            }
        }else{
            String newMsg1 = captions.getString("Controller.newUserOk.err1");
            String newMsg2 = captions.getString("Controller.newUserOk.wrn2");

            request.setAttribute("statusR", "error");
            request.setAttribute("newMsg1", newMsg1);
            request.setAttribute("newMsg2", newMsg2);

            userPath = "/enableUser";
        }
    }

    private void viewForgotPassword(HttpServletRequest request) {
        String newMsg1 = captions.getString("Controller.forgotPassword.msg1");
        String newMsg2 = captions.getString("Controller.forgotPassword.msg2");

        request.setAttribute("newMsg1", newMsg1);
        request.setAttribute("newMsg2", newMsg2);

        userPath = "/forgotPassword";
    }


    private void sendPassword(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = dbe.getPassword(email);

        //System.out.println(captions.getString("slogan"));

        if(password != null){
            if(sendPassword(email, password)){
                String msg1 = captions.getString("Controller.sendPassword.msg1");
                String msg2 = captions.getString("Controller.sendPassword.msg2");
                String msg3 = captions.getString("Controller.sendPassword.msg3");

                request.setAttribute("newMsg1", msg1);
                request.setAttribute("newMsg2", msg2);
                request.setAttribute("newMsg3", msg3);

                request.setAttribute("statusR", "success");

                userPath = "/generalInfo";
            }else {
                String err1 = captions.getString("Controller.sendPassword.err1");
                String err2 = captions.getString("Controller.sendPassword.err2");
                String err3 = captions.getString("Controller.sendPassword.err3");

                request.setAttribute("newMsg1", err1);
                request.setAttribute("newMsg2", err2);
                request.setAttribute("newMsg3", err3);

                request.setAttribute("statusR", "error");

                userPath = "/generalInfo";
            }
        }else{

            String err4 = captions.getString("Controller.sendPassword.err4");
            String err5 = captions.getString("Controller.sendPassword.err5");
            String err3 = captions.getString("Controller.sendPassword.err3");

            request.setAttribute("newMsg1", err4);
            request.setAttribute("newMsg2", err5);
            request.setAttribute("newMsg3", err3);

            request.setAttribute("statusR", "error");

            userPath = "/generalInfo";
        }
    }

    private boolean sendPassword(String email, String password) {

        boolean isSended = false;

        try {
            String subject = captions.getString("Controller.sendPassword.email.subject");
            String body = captions.getString("Controller.sendPassword.email.body1") +
                          password +
                          captions.getString("Controller.sendPassword.email.body2");

            //emailer.sendEmail(email, subject, body);
            emailer.sendEmailLH(email, subject, body);
            isSended = true;
        } catch (MessagingException e) {
            log.error("MessagingException: " + e.getMessage());
        }

        return isSended;
    }

    private void callError(HttpServletRequest request, Exception ex, String nameEx) {
        log.error(ex.getMessage());
        String msg1 = nameEx;
        String msg2 = ex.getMessage();

        request.setAttribute("msg1", msg1);
        request.setAttribute("msg2", msg2);

        userPath = "/error";
    }

    private void callError(HttpServletRequest request, String msg1, String msg2) {


        request.setAttribute("msg1", msg1);
        request.setAttribute("msg2", msg2);

        userPath = "/error";
    }



}

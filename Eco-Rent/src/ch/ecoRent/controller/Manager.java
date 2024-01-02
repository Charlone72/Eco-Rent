package ch.ecoRent.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import ch.ecoRent.beans.Documento;
import ch.ecoRent.beans.Foto;
import ch.ecoRent.beans.ListaFoto;
import ch.ecoRent.beans.Oggetto;
import ch.ecoRent.beans.OggettoVenduto;
import ch.ecoRent.beans.Prezzi;
import ch.ecoRent.beans.Riservazione;
import ch.ecoRent.beans.Utente;
import ch.ecoRent.db.DBEngine;
import ch.ecoRent.exception.DataBaseException;
import ch.ecoRent.exception.PrivilegesException;
import ch.ecoRent.exception.TableNotFoundException;
import ch.ecoRent.utility.Emailer;
import ch.ecoRent.utility.Utility;
import ch.ecoRent.exception.DeleteManagerException;
import ch.ecoRent.exception.DeleteReservationException;
import ch.ecoRent.exception.UpdateDBException;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Manager")
public class Manager extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HttpSession session;
    private int diritti;
    String userPath;
    private DBEngine dbe;
    private Emailer emailer;
    Locale locale;
    ResourceBundle captions;
    private static final int DAYS_LEFT = 5;


    private Logger log = Logger.getLogger(Manager.class);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manager() {
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

        log.debug("command befor to call methods: " + command);

        session = request.getSession (false);

        if (command.equals("viewLogin")) {
            viewLogin(request);
        } else if (command.equals("main")) {
            main(request);
        } else if (command.equals("login")) {
            login(request);
        } else if (command.equals("viewUpdateManager")) {
            viewUpdateManager(request);
        } else if (command.equals("viewInsertManager")) {
            viewInsertManager(request);
        } else if (command.equals("insertManager")) {
            insertManager(request);
        } else if (command.equals("viewObject")) {
            viewObject(request);
        } else if (command.equals("viewInsertObject")) {
            viewInsertObject(request);
        } else if (command.equals("insertObject")) {
            insertObject(request);
        } else if (command.equals("deleteObject")) {
            deleteObject(request);
        } else if (command.equals("deleteDoc")) {
            deleteDoc(request);
        } else if (command.equals("viewUpdateObject")) {
            viewUpdateObject(request);
        } else if (command.equals("updateObject")) {
            updateObject(request);
        } else if(command.equals("updateManager")) {
            updateManager(request);
        } else if(command.equals("deleteManager")) {
            deleteManager(request);
        } else if(command.equals("listManager")) {
            listManager(request);
        } else if(command.equals("listObject")) {
            listObject(request);
        } else if(command.equals("photoManagement")) {
            photoManagement(request);
        } else if(command.equals("preparePhoto")) {
            preparePhoto(request);
        } else if(command.equals("deletePhoto")) {
            deletePhoto(request);
        } else if(command.equals("viewUpdatePhoto")) {
            viewUpdatePhoto(request);
        } else if(command.equals("priceManagement")) {
            priceManagement(request);
        } else if(command.equals("insertPrice")) {
            insertPrice(request);
        } else if(command.equals("updatePrice")) {
            updatePrice(request);
        } else if(command.equals("copyPrice")) {
            copyPrice(request);
        } else if(command.equals("pastePrice")) {
            pastePrice(request);
        } else if(command.equals("userList")) {
            userList(request);
        } else if(command.equals("userReservations")) {
            userReservations(request);
        } else if(command.equals("updateUser")) {
            updateUser(request);
        } else if(command.equals("updateUserOk")) {
            updateUserOk(request);
        } else if(command.equals("newUser")) {
            newUser(request);
        } else if(command.equals("createUser")) {
            createUser(request);
        } else if(command.equals("reservations")) {
            reservations(request);
        } else if(command.equals("objectReservations")) {
            objectReservations(request);
        } else if(command.equals("deleteReservation")) {
            deleteReservation(request);
        } else if(command.equals("updateStatusReservation")) {
            updateStatusReservation(request);
        } else if(command.equals("viewReservation")) {
            viewReservation(request);
        } else if(command.equals("viewUpdateReservation")) {
            viewUpdateReservation(request);
        } else if(command.equals("updateReservation")) {
            updateReservation(request);
        } else if(command.equals("uploadPdf")) {
            uploadPdf(request);
        } else if(command.equals("uploadPdfUpdate")) {
            uploadPdfUpdate(request);
        }else if(command.equals("listDocs")) {
            listDocs(request);
        }else if(command.equals("padreDocs")) {
            padreDocs(request);
        }else if(command.equals("deleteUser")) {
            deleteUser(request);
        }else if(command.equals("logout")) {
            logout(request);
        }else if(command.equals("viewQuery")) {
            viewQuery(request);
        }else if(command.equals("newReservation")) {
            newReservation(request);
        }else if(command.equals("setReservation")) {
            setRiservazione(request);
        }else if(command.equals("runQuery")) {
            runQuery(request);
        }else if(command.equals("objectsFree")) {
            objectsFree(request);
        }else if(command.equals("objectsNotFree")) {
            objectsNotFree(request);
        }else if(command.equals("objectsNotWorking")) {
            objectsNotWorking(request);
        }else if(command.equals("resPending")) {
            resPending(request);
        }else if(command.equals("earningByCategory")) {
            earningByCategory(request);
        }else if(command.equals("ListEarningByCategory")) {
            listEarningByCategory(request);
        }

        String url = "/manager" + userPath + ".jsp";

        log.debug("userPath after methods: " + userPath);
        log.debug("url: " + url);

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            log.error("exception: " + ex.getMessage());
        }
    }

    private void userReservations(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            String email = request.getParameter("email");

            ArrayList<Riservazione> reservations = dbe.getRiservazioni(email);

            Utente u = dbe.getUser(email);

            request.setAttribute("Utente", u);
            request.setAttribute("reservations", reservations);

            userPath = "/userReservations";

        }

    }

    private void listEarningByCategory(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            String cat = request.getParameter("cat");

            ArrayList<Oggetto> objects = dbe.listScooterWithEarnings(cat);
            boolean viewPicture = true;

            Integer earning = dbe.earningsByCategory(cat);

            request.setAttribute("viewPicture", viewPicture);
            request.setAttribute("objects", objects);
            request.setAttribute("earning", earning);
            request.setAttribute("titolo", "Lista guadagni scooters categoria " + cat);

            userPath = "/listObjectEarning";

        }

    }

    private void earningByCategory(HttpServletRequest request) {


        /*ArrayList<Oggetto> scooter25 = dbe.listScooterWithEarnings("25");
        ArrayList<Oggetto> scooter30 = dbe.listScooterWithEarnings("30");
        ArrayList<Oggetto> scooter45 = dbe.listScooterWithEarnings("45");*/

        Integer earning25 = dbe.earningsByCategory("25");
        Integer earning30 = dbe.earningsByCategory("30");
        Integer earning45 = dbe.earningsByCategory("45");

        request.setAttribute("earning25", earning25);
        request.setAttribute("earning30", earning30);
        request.setAttribute("earning45", earning45);

        request.setAttribute("titolo", "Guadagni scooter per categoria");

        userPath = "/earningByCat";

    }

    private void pastePrice(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){

                String key = request.getParameter("key");

                Prezzi prezzi = (Prezzi)session.getAttribute("prices");

                if (prezzi != null){
                    try {
                        prezzi.setFk_oggetto(Integer.parseInt(key));


                        if(dbe.setPrice(prezzi)) {
                            Prezzi p = dbe.getPrezzi(Integer.parseInt(key));
                            Oggetto o = dbe.getOggetto(key);
                            String subCommand = "updatePrice";

                            request.setAttribute("oggetto", o);
                            request.setAttribute("command", subCommand);
                            request.setAttribute("prezzi", p);

                            userPath = "/priceManagement";
                        }else {
                            DataBaseException dbex = new DataBaseException("Inserimento Prezzi nel DB ha generato un eccezione.");
                            callManagerError(request, dbex, "Formato prezzi non valido. Deve essere numerico !");
                        }
                    }catch (Exception e) {
                        callManagerError(request, e, "Formato prezzi non valido. Deve essere numerico !");
                    }
                }else {
                    DataBaseException sex = new DataBaseException("Copia prezzi ha generato un eccezione.");
                    callManagerError(request, sex, "Oggetto prezzi non presente nella sessione.");
                }

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire prezzi.");
            }
        }

    }

    private void copyPrice(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){
                String key = request.getParameter("key");
                Prezzi p = dbe.getPrezzi(Integer.parseInt(key));

                session.setAttribute("prices", p);

                listObject(request);

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }

    }

    private void newReservation(HttpServletRequest request) {

        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){
                Integer fk_oggetto = Integer.parseInt(request.getParameter("key"));
                Oggetto o = dbe.getOggetto("" + fk_oggetto);
                List<Utente> users = dbe.getListUser();

                request.setAttribute("users", users);

                request.setAttribute("Oggetto", o);

                userPath = "/newReservation";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }

    }

    private void setRiservazione(HttpServletRequest request) {
        Integer fk_oggetto = Integer.parseInt(request.getParameter("fk_oggetto"));
        String fk_utente = request.getParameter("fk_utente");
        Integer stato = Integer.parseInt(request.getParameter("stato"));
        String data_inizio = request.getParameter("data_inizio");
        String data_fine = request.getParameter("data_fine");
        Double prezzo_finale = Double.parseDouble(request.getParameter("prezzo_finale"));

        String metodo_pagamento = request.getParameter("metodo_pagamento");
        String fattura_num = request.getParameter("fattura_num");
        Integer da_km = Integer.parseInt(request.getParameter("da_km"));
        Integer a_km = Integer.parseInt(request.getParameter("a_km"));
        String procurato = request.getParameter("procurato");
        String note = request.getParameter("note");

        Riservazione r = new Riservazione();
        r.setFk_oggetto(fk_oggetto);
        r.setFk_utente(fk_utente);
        r.setStato(stato);
        r.setFinal_price(prezzo_finale);
        r.setMetodo_pagamento(metodo_pagamento);
        r.setFattura_num(fattura_num);
        r.setDa_km(da_km);
        r.setA_km(a_km);
        r.setProcurato(procurato);
        r.setNote(note);

        SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");

        try {
            r.setData_inizio(ft.parse(data_inizio));
            r.setData_fine(ft.parse(data_fine));

            boolean areReservations = dbe.checkPre(fk_oggetto, r);

            if(areReservations) {
                //no possible to add reservation, if already present.
                DataBaseException dbex = new DataBaseException("Inserimento dati non riuscito!");
                callManagerError(request, dbex, "Inserimento riservazione fallito. Esiste gia una prenotazione");
            }else {
                if(dbe.setRiservazione(r)) {

                    ArrayList<Riservazione> reservations = dbe.getRiservazioni(fk_oggetto);
                    Oggetto o = dbe.getOggetto("" + fk_oggetto);

                    request.setAttribute("Oggetto", o);
                    request.setAttribute("reservations", reservations);

                    userPath = "/reservations";
                }else {
                    DataBaseException dbex = new DataBaseException("Inserimento dati non riuscito!");
                    callManagerError(request, dbex, "Inserimento riservazione fallito. Chiamare un amministratore.");
                }
            }

        } catch (ParseException e) {
            callManagerError(request, e, "Inserimento riservazione fallito. Formato data non corretto");
        }

    }

    private void runQuery(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 4){

                String query = request.getParameter("query");

                String result = dbe.runQuery(query);

                request.setAttribute("result", result);

                userPath = "/viewQuery";
            } else {
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Lanciare query.");
            }
        }
    }

    private void viewQuery(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 4){

                String result = "Inserisci la query nel campo sotto";

                request.setAttribute("result", result);

                userPath = "/viewQuery";
            } else {
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Lanciare query.");
            }
        }

    }

    private void deleteUser(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 3){

                String email = request.getParameter("email");

                if(dbe.deleteUser(email)) {
                    userList(request);
                }else {
                    DataBaseException dbex = new DataBaseException("Problema ad eliminare l'utente");
                    callManagerError(request, dbex, "Problema ad eliminare l'utente.");
                }

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare oggetti.");
            }
        }
    }

    private void createUser(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){

                String nome = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String email = request.getParameter("email");
                String domicilio = request.getParameter("domicilio");
                String cap = request.getParameter("cap");
                String via = request.getParameter("via");
                String telefono = request.getParameter("telefono");

                //creare password per abilitare utente
                String password = Utility.createPassword(10);

                Utente utente = new Utente();

                utente.setNome(nome);
                utente.setCognome(cognome);
                utente.setEmail(email);
                utente.setDomicilio(domicilio);
                utente.setCap(cap);
                utente.setVia(via);
                utente.setPassword(password);
                utente.setTelefono(telefono);

                try {
                    dbe.setUser(utente);

                } catch (DataBaseException ex) {
                    log.error(ex.getMessage());
                }

                userList(request);
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire utenti.");
            }
        }

    }

    private void newUser(HttpServletRequest request) {
        userPath = "/newUser";

    }


    private void updateUser(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                String email = request.getParameter("email");

                Utente u = dbe.getUser(email);

                request.setAttribute("Utente", u);

                userPath = "/updateUser";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare oggetti.");
            }
        }
    }

    private void updateUserOk(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                String nome = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String email = request.getParameter("email");
                String domicilio = request.getParameter("domicilio");
                String cap = request.getParameter("cap");
                String via = request.getParameter("via");
                String telefono = request.getParameter("telefono");
                String password = request.getParameter("password");
                String enabled = request.getParameter("enabled");

                Utente utente = new Utente();

                utente.setNome(nome);
                utente.setCognome(cognome);
                utente.setEmail(email);
                utente.setDomicilio(domicilio);
                utente.setCap(cap);
                utente.setVia(via);
                utente.setTelefono(telefono);
                utente.setPassword(password);
                utente.setEnabled(new Boolean(enabled));

                dbe.updateUser(utente);

                if(new Boolean(enabled)) {
                    dbe.setEnabled(email);
                }else {
                    dbe.setDisabled(email);
                }


                userList(request);
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi aggiornare utenti.");
            }
        }

        //userPath = "/updateUser";
    }


    private void listDocs(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        }else {
            String key = request.getParameter("fk_tabella");
            String tabella = request.getParameter("tabella");

            List<Documento> documenti = null;
            documenti = dbe.getDocumenti(Integer.parseInt(key), tabella);

            request.setAttribute("Documenti", documenti);
            request.setAttribute("FK_Tabella", key);
            request.setAttribute("Tabella", tabella);

            userPath = "/listDocs";
        }

    }


    private void uploadPdf(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){

                //key di documento è una sequenza
                //String key = request.getParameter("key");
                String tabella = request.getParameter("tabella");

                Integer fkTab = Integer.parseInt(request.getParameter("fk_tabella"));
                Documento doc = new Documento();
                doc.setFk_tabella(fkTab);
                doc.setTabella(tabella);

                request.setAttribute("Documento", doc);

                request.setAttribute("Command", "newPdf");

                userPath = "/uploadPdf";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }

    }

    private void uploadPdfUpdate(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                String key = request.getParameter("key");

                Documento d = dbe.getDocumento(Integer.parseInt(key));

                request.setAttribute("Documento", d);
                request.setAttribute("Command", "updatePdf");

                userPath = "/uploadPdf";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }

    }

    private void updateReservation(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                int key = Integer.parseInt(request.getParameter("key").trim());
                Integer fk_oggetto = Integer.parseInt(request.getParameter("fk_oggetto").trim());
                String fk_utente = request.getParameter("fk_utente");
                Integer stato = Integer.parseInt(request.getParameter("stato").trim());
                String data_inizio = request.getParameter("data_inizio");
                String data_fine = request.getParameter("data_fine");
                double prezzo_finale = Double.parseDouble(request.getParameter("prezzo_finale"));

                String metodo_pagamento = request.getParameter("metodo_pagamento");
                String fattura_num = request.getParameter("fattura_num");

                Integer da_km = 0;
                Integer a_km = 0;
                try {
                    da_km = Integer.parseInt(request.getParameter("da_km"));
                    a_km = Integer.parseInt(request.getParameter("a_km"));
                }catch (Exception e) {
                    //do nothing
                }

                String procurato = request.getParameter("procurato");
                String note = request.getParameter("note");
                String data_pagamento = request.getParameter("data_pagamento");



                Riservazione r = new Riservazione();
                r.setKey(key);
                r.setFk_oggetto(fk_oggetto);
                r.setFk_utente(fk_utente);
                r.setStato(stato);
                r.setFinal_price(prezzo_finale);
                r.setMetodo_pagamento(metodo_pagamento);
                r.setFattura_num(fattura_num);
                r.setDa_km(da_km);
                r.setA_km(a_km);
                r.setProcurato(procurato);
                r.setNote(note);



                Date dateI = null;
                Date dateF= null;
                Date dateP= null;
                try {
                    dateI = new SimpleDateFormat("dd-MM-yyyy").parse(data_inizio);
                    dateF = new SimpleDateFormat("dd-MM-yyyy").parse(data_fine);
                    if(data_pagamento != "") {
                        dateP = new SimpleDateFormat("dd-MM-yyyy").parse(data_pagamento);
                    }
                } catch (ParseException e) {
                    callManagerError(request, e, "UpdateDBException");
                }
                r.setData_inizio(dateI);
                r.setData_fine(dateF);
                r.setData_pagamento(dateP);


                try {
                    dbe.updateReservation(r);

                    Riservazione riservazione = dbe.getRiservazione(key);
                    request.setAttribute("Riservazione", riservazione);


                    objectReservationsFK(request);
                } catch (UpdateDBException udbe) {
                    callManagerError(request, udbe, "UpdateDBException");
                }

                //request.setAttribute("result", result);
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare oggetti.");
            }
        }
    }


    private void viewReservation(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 0){

                int key = Integer.parseInt(request.getParameter("key"));
                Riservazione r = dbe.getRiservazione(key);
                Oggetto o = dbe.getOggetto("" + r.getFk_oggetto());
                List<Documento> documenti = dbe.getDocumenti(key, "riservazioni");

                request.setAttribute("Documenti", documenti);
                request.setAttribute("Riservazione", r);
                request.setAttribute("Oggetto", o);
                userPath = "/viewReservation";

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare oggetti.");
            }
        }

    }


    private void viewUpdateReservation(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                int key = Integer.parseInt(request.getParameter("key"));
                Riservazione r = dbe.getRiservazione(key);
                Oggetto o = dbe.getOggetto("" + r.getFk_oggetto());
                request.setAttribute("Riservazione", r);
                request.setAttribute("Oggetto", o);
                userPath = "/updateReservation";

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare oggetti.");
            }
        }

    }

    private void padreDocs(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 0){

                int key = Integer.parseInt(request.getParameter("fk_tabella"));
                String tabella = request.getParameter("tabella");

                if(tabella.equals("riservazioni")) {
                    Riservazione r = dbe.getRiservazione(key);
                    List<Documento> documenti = dbe.getDocumenti(key, "riservazioni");

                    request.setAttribute("Documenti", documenti);
                    request.setAttribute("Riservazione", r);
                    userPath = "/viewReservation";
                }else if(tabella.equals("oggetti")) {
                    ListaFoto foto = new ListaFoto();
                    foto.setListaFoto(dbe.getListaFoto(key));
                    Oggetto o = dbe.getOggetto(request.getParameter("fk_tabella"));
                    o.setEarning(dbe.earningsByScooter(key));

                    //se il campo è venduto devo inserire l'oggetto in oggetti_venduti con la stessa chiave dell'oggetto
                    if(o.isVenduto()) {
                        OggettoVenduto oggV = dbe.getOggettoVenduto(o.getKey());
                        request.setAttribute("OggettoVenduto", oggV);
                    }

                    List<Documento> documenti = null;
                    documenti = dbe.getDocumenti(key, "oggetti");

                    request.setAttribute("Documenti", documenti);
                    request.setAttribute("foto", foto);
                    request.setAttribute("Oggetto", o);

                    userPath = "/object";
                }else if(tabella.equals("oggetti_venduti")) {
                    //TODO
                }else {
                    TableNotFoundException tnfe = new TableNotFoundException("Tabella padre non trovata");
                    callManagerError(request, tnfe, "Tabella padre non trovata");
                }


            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare oggetti.");
            }
        }

    }


    private void updateStatusReservation(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            if(diritti >= 1){
                String key = request.getParameter("keyId");
                String stato = request.getParameter("Status");


                try {
                    dbe.updateStatusReservation(Integer.parseInt(stato), Integer.parseInt(key));

                    objectReservationsFK(request);

                } catch (NumberFormatException nfe) {
                    callManagerError(request, nfe, "NumberFormatException");
                } catch (UpdateDBException udbe) {
                    callManagerError(request, udbe, "UpdateDBException");
                }
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare le riservazioni.");
            }
        }

    }

    private void deleteReservation(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 3){
                String key = request.getParameter("key");

                try {
                    dbe.deleteRiservazione(Integer.parseInt(key));

                    reservations(request);

                } catch (DeleteReservationException ex) {
                    callManagerError(request, ex, "DeleteReservationException");
                }
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare manager.");
            }
        }

    }

    private void logout(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            userPath = "/login";
        } else {
            session.removeAttribute("manager");
            session.invalidate();

            userPath = "/login";
        }

    }

    private void insertPrice(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){

                String key = request.getParameter("key");

                String g1 = request.getParameter("g1");
                String g2 = request.getParameter("g2");
                String g3 = request.getParameter("g3");
                String g4 = request.getParameter("g4");
                String g5 = request.getParameter("g5");
                String g6 = request.getParameter("g6");
                String g7 = request.getParameter("g7");
                String more_g = request.getParameter("more_g");

                String m1 = request.getParameter("m1");
                String m2 = request.getParameter("m2");
                String m3 = request.getParameter("m3");
                String m4 = request.getParameter("m4");
                String m5 = request.getParameter("m5");
                String m6 = request.getParameter("m6");
                String m7 = request.getParameter("m7");
                String m8 = request.getParameter("m8");
                String m9 = request.getParameter("m9");
                String m10 = request.getParameter("m10");
                String m11 = request.getParameter("m11");
                String m12 = request.getParameter("m12");
                String more_m = request.getParameter("more_m");

                Prezzi prezzi = new Prezzi();

                try {
                    prezzi.setFk_oggetto(Integer.parseInt(key));
                    prezzi.setG1(Double.parseDouble(g1));
                    prezzi.setG2(Double.parseDouble(g2));
                    prezzi.setG3(Double.parseDouble(g3));
                    prezzi.setG4(Double.parseDouble(g4));
                    prezzi.setG5(Double.parseDouble(g5));
                    prezzi.setG6(Double.parseDouble(g6));
                    prezzi.setG7(Double.parseDouble(g7));
                    prezzi.setMore_g(Double.parseDouble(more_g));

                    prezzi.setM1(Double.parseDouble(m1));
                    prezzi.setM2(Double.parseDouble(m2));
                    prezzi.setM3(Double.parseDouble(m3));
                    prezzi.setM4(Double.parseDouble(m4));
                    prezzi.setM5(Double.parseDouble(m5));
                    prezzi.setM6(Double.parseDouble(m6));
                    prezzi.setM7(Double.parseDouble(m7));
                    prezzi.setM8(Double.parseDouble(m8));
                    prezzi.setM9(Double.parseDouble(m9));
                    prezzi.setM10(Double.parseDouble(m10));
                    prezzi.setM11(Double.parseDouble(m11));
                    prezzi.setM12(Double.parseDouble(m12));
                    prezzi.setMore_m(Double.parseDouble(more_m));

                    if(dbe.setPrice(prezzi)) {
                        Prezzi p = dbe.getPrezzi(Integer.parseInt(key));
                        Oggetto o = dbe.getOggetto(key);
                        String subCommand = "updatePrice";

                        request.setAttribute("oggetto", o);
                        request.setAttribute("command", subCommand);
                        request.setAttribute("prezzi", p);

                        userPath = "/priceManagement";
                    }else {
                        DataBaseException dbex = new DataBaseException("Inserimento Prezzi nel DB ha generato un eccezione.");
                        callManagerError(request, dbex, "Formato prezzi non valido. Deve essere numerico !");
                    }
                }catch (Exception e) {
                    callManagerError(request, e, "Formato prezzi non valido. Deve essere numerico !");
                }

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire prezzi.");
            }
        }


    }

    private void updatePrice(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                String key = request.getParameter("key");

                String g1 = request.getParameter("g1");
                String g2 = request.getParameter("g2");
                String g3 = request.getParameter("g3");
                String g4 = request.getParameter("g4");
                String g5 = request.getParameter("g5");
                String g6 = request.getParameter("g6");
                String g7 = request.getParameter("g7");
                String more_g = request.getParameter("more_g");

                String m1 = request.getParameter("m1");
                String m2 = request.getParameter("m2");
                String m3 = request.getParameter("m3");
                String m4 = request.getParameter("m4");
                String m5 = request.getParameter("m5");
                String m6 = request.getParameter("m6");
                String m7 = request.getParameter("m7");
                String m8 = request.getParameter("m8");
                String m9 = request.getParameter("m9");
                String m10 = request.getParameter("m10");
                String m11 = request.getParameter("m11");
                String m12 = request.getParameter("m12");
                String more_m = request.getParameter("more_m");

                Prezzi prezzi = new Prezzi();

                try {
                    prezzi.setFk_oggetto(Integer.parseInt(key));
                    prezzi.setG1(Double.parseDouble(g1));
                    prezzi.setG2(Double.parseDouble(g2));
                    prezzi.setG3(Double.parseDouble(g3));
                    prezzi.setG4(Double.parseDouble(g4));
                    prezzi.setG5(Double.parseDouble(g5));
                    prezzi.setG6(Double.parseDouble(g6));
                    prezzi.setG7(Double.parseDouble(g7));
                    prezzi.setMore_g(Double.parseDouble(more_g));

                    prezzi.setM1(Double.parseDouble(m1));
                    prezzi.setM2(Double.parseDouble(m2));
                    prezzi.setM3(Double.parseDouble(m3));
                    prezzi.setM4(Double.parseDouble(m4));
                    prezzi.setM5(Double.parseDouble(m5));
                    prezzi.setM6(Double.parseDouble(m6));
                    prezzi.setM7(Double.parseDouble(m7));
                    prezzi.setM8(Double.parseDouble(m8));
                    prezzi.setM9(Double.parseDouble(m9));
                    prezzi.setM10(Double.parseDouble(m10));
                    prezzi.setM11(Double.parseDouble(m11));
                    prezzi.setM12(Double.parseDouble(m12));
                    prezzi.setMore_m(Double.parseDouble(more_m));

                    if(dbe.updatePrice(prezzi)) {
                        Prezzi p = dbe.getPrezzi(Integer.parseInt(key));

                        request.setAttribute("prezzi", p);
                        Oggetto o = dbe.getOggetto(key);
                        request.setAttribute("oggetto", o);
                        request.setAttribute("command", "updatePrice");

                        userPath = "/priceManagement";
                    }else {
                        DataBaseException dbex = new DataBaseException("Inserimento Prezzi nel DB ha generato un eccezione.");
                        callManagerError(request, dbex, "Formato prezzi non valido. Deve essere numerico !");
                    }
                }catch (Exception e) {
                    callManagerError(request, e, "Formato prezzi non valido. Deve essere numerico !");
                }

            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire prezzi.");
            }
        }


    }


    private void priceManagement(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 0){

                String subCommand = "updatePrice";
                String key = request.getParameter("key");
                Prezzi p = dbe.getPrezzi(Integer.parseInt(key));

                if(p == null) {
                    p = new Prezzi();
                    subCommand = "insertPrice";
                }

                Oggetto o = dbe.getOggetto(key);

                request.setAttribute("prezzi", p);
                request.setAttribute("oggetto", o);
                request.setAttribute("command", subCommand);

                userPath = "/priceManagement";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire e aggiornare prezzi.");
            }
        }

    }

    private void listObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

                ArrayList<Oggetto> objects = dbe.listObject();
                boolean viewPicture = true;

                request.setAttribute("viewPicture", viewPicture);
                request.setAttribute("objects", objects);

                request.setAttribute("titolo", "Lista scooters");

                userPath = "/listObject";

        }

    }

    private void objectsFree(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            ArrayList<Oggetto> objectsFree = dbe.listObject(true);



            //dagli ogggetti free tolgo i non funzionanti.
            ArrayList<Oggetto> objectsNotWorking = new ArrayList<Oggetto>();
            for (Oggetto ogg : objectsFree) {
                if (!ogg.isFunzionante() ) {
                    objectsNotWorking.add(ogg);
                }
            }
            objectsFree.removeAll(objectsNotWorking);

            boolean viewPicture = true;
            request.setAttribute("viewPicture", viewPicture);
            request.setAttribute("objects", objectsFree);

            request.setAttribute("titolo", "Scooter disponibili");

            userPath = "/listObject";

        }

    }

    private void objectsNotWorking(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            ArrayList<Oggetto> objectsFree = dbe.listObject(true);



            //dagli ogggetti free tolgo i non funzionanti.
            ArrayList<Oggetto> objectsNotWorking = new ArrayList<Oggetto>();
            for (Oggetto ogg : objectsFree) {
                if (!ogg.isFunzionante() ) {
                    objectsNotWorking.add(ogg);
                }
            }


            boolean viewPicture = true;
            request.setAttribute("viewPicture", viewPicture);
            request.setAttribute("objects", objectsNotWorking);

            request.setAttribute("titolo", "Scooter fuori uso");

            userPath = "/listObject";

        }

    }



    private void objectsNotFree(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {


            ArrayList<Oggetto> objectsNotFree = dbe.listObject(false);


            boolean viewPicture = true;
            request.setAttribute("viewPicture", viewPicture);
            request.setAttribute("objects", objectsNotFree);

            request.setAttribute("titolo", "Scooter affittati");

            userPath = "/listObject";

        }

    }

    private void resPending(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            ArrayList<Riservazione> reservations = dbe.getRiservazioniAperte();
            ArrayList<Riservazione> resPending = new ArrayList<Riservazione>();

            for (Riservazione riservazione : reservations) {
                if (riservazione.getDaysleft() <= DAYS_LEFT ) {
                    resPending.add(riservazione);
                }
            }

            request.setAttribute("objects", null);
            request.setAttribute("reservations", resPending);

            request.setAttribute("titolo", "Lista delle riservazioni(Scooter) in scadenza");

            userPath = "/reservations";

        }

    }

    private void reservations(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

                ArrayList<Riservazione> reservations = dbe.getRiservazioni();
                ArrayList<Oggetto> objects = dbe.listObject();

                request.setAttribute("objects", objects);
                request.setAttribute("reservations", reservations);

                request.setAttribute("titolo", "Lista delle riservazioni");

                userPath = "/reservations";

        }

    }

    private void objectReservations(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

                String key = request.getParameter("key");

                ArrayList<Riservazione> reservations = dbe.getRiservazioni(Integer.parseInt(key));
                Oggetto o = dbe.getOggetto(key);
                ArrayList<Oggetto> objects = dbe.listObject();

                request.setAttribute("objects", objects);
                request.setAttribute("Oggetto", o);
                request.setAttribute("reservations", reservations);

                userPath = "/reservations";

        }

    }

    private void objectReservationsFK(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

                String key = request.getParameter("fk_oggetto");

                ArrayList<Riservazione> reservations = dbe.getRiservazioni(Integer.parseInt(key));
                Oggetto o = dbe.getOggetto(key);
                ArrayList<Oggetto> objects = dbe.listObject();

                request.setAttribute("objects", objects);
                request.setAttribute("Oggetto", o);
                request.setAttribute("reservations", reservations);

                userPath = "/reservations";

        }

    }

    private void userList(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            List<Utente> users = dbe.getListUser();

            request.setAttribute("users", users);

            userPath = "/userList";

        }

    }

    private void viewObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

                String key = request.getParameter("key");
                ListaFoto foto = new ListaFoto();
                foto.setListaFoto(dbe.getListaFoto(Integer.parseInt(key)));
                Oggetto o = dbe.getOggetto(key);
                o.setEarning(dbe.earningsByScooter(Integer.parseInt(key)));

              //se il campo è venduto devo inserire l'oggetto in oggetti_venduti con la stessa chiave dell'oggetto
                if(o.isVenduto()) {
                    OggettoVenduto oggV = dbe.getOggettoVenduto(o.getKey());
                    request.setAttribute("OggettoVenduto", oggV);
                }

                List<Documento> documenti = null;
                documenti = dbe.getDocumenti(Integer.parseInt(key), "oggetti");

                request.setAttribute("Documenti", documenti);

                request.setAttribute("foto", foto);
                request.setAttribute("Oggetto", o);

                userPath = "/object";

        }

    }

    private void viewInsertObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){
                userPath = "/newObject";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
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
        String newMsg1 = captions.getString("Manager.sessionExpired.msg1");
        String newMsg2 = captions.getString("Manager.sessionExpired.msg2");
        request.setAttribute("newMsg1", newMsg1);
        request.setAttribute("newMsg2", newMsg2);

        userPath = "/loginError";
    }

    private void managerNotFound (HttpServletRequest request){
        String newMsg1 = captions.getString("Manager.managerNotFound.msg1");
        String newMsg2 = captions.getString("Manager.managerNotFound.msg2");
        request.setAttribute("newMsg1", newMsg1);
        request.setAttribute("newMsg2", newMsg2);

        userPath = "/loginError";
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void viewLogin(HttpServletRequest request) {
        userPath = "/login";
    }

    private void login(HttpServletRequest request) {
        String managerName = request.getParameter("manager");
        String password = request.getParameter("password");

        ch.ecoRent.beans.Manager manager = dbe.loginManager(managerName, password);

        if(manager == null) {
            managerNotFound(request);
        }else {

            diritti = manager.getDiritti();

            if(diritti != -1){
                session = request.getSession(true);
                session.setAttribute("manager", manager);

                log.debug(manager + " diritti: " + diritti);

                List<ch.ecoRent.beans.Manager> managers = null;
                try {
                    managers = dbe.getListManager();
                } catch (DataBaseException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                //request.setAttribute("managers", managers);
                ArrayList<Riservazione> reservations = dbe.getRiservazioniAperte();
                ArrayList<Riservazione> resRequest = dbe.getRiservazioniRichiesteAperte();
                ArrayList<Riservazione> resPending = new ArrayList<Riservazione>();

                for (Riservazione riservazione : reservations) {
                    if (riservazione.getDaysleft() <= DAYS_LEFT ) {
                        resPending.add(riservazione);
                    }
                }

                ArrayList<Oggetto> objectsFree = dbe.listObject(true);
                ArrayList<Oggetto> objectsNotFree = dbe.listObject(false);

                int earning25 = dbe.earningsByCategory("25");
                int earning30 = dbe.earningsByCategory("30");
                int earning45 = dbe.earningsByCategory("45");

                //dagli ogggetti free tolgo i non funzionanti.
                ArrayList<Oggetto> objectsNotWorking = new ArrayList<Oggetto>();
                for (Oggetto ogg : objectsFree) {
                    if (!ogg.isFunzionante() ) {
                        objectsNotWorking.add(ogg);
                    }
                }
                objectsFree.removeAll(objectsNotWorking);

                request.setAttribute("objectsFree", objectsFree);
                request.setAttribute("objectsNotFree", objectsNotFree);
                request.setAttribute("objectsNotWorking", objectsNotWorking);
                request.setAttribute("resPending", resPending);
                request.setAttribute("resRequest", resRequest);

                request.setAttribute("earning25", earning25);
                request.setAttribute("earning30", earning30);
                request.setAttribute("earning45", earning45);

                request.setAttribute("viewPicture", true);

                userPath = "/main";


            }else{
                String newMsg1 = "Attenzione user o password sbagliate";
                String newMsg2 = "Login Fallito!";

                request.setAttribute("newMsg1", newMsg1);
                request.setAttribute("newMsg2", newMsg2);

                userPath = "/loginError";
            }
        }
    }


    private void listManager(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        }else {
            List<ch.ecoRent.beans.Manager> managers = null;
            try {
                managers = dbe.getListManager();
            } catch (DataBaseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            request.setAttribute("managers", managers);

            userPath = "/listManager";
        }

    }

    private void photoManagement(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){

                String key = request.getParameter("key");
                ListaFoto foto = new ListaFoto();
                foto.setListaFoto(dbe.getListaFoto(Integer.parseInt(key)));
                Oggetto o = dbe.getOggetto(key);


                request.setAttribute("foto", foto);
                request.setAttribute("Oggetto", o);

                userPath = "/photoManagement";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }
    }


    private void preparePhoto(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){

                String key = request.getParameter("key");
                Foto f = new Foto();
                f.setFk_oggetto(Integer.parseInt(key));
                int newKey = dbe.getNextFotoKey(key);

                f.setNumero(newKey);

                request.setAttribute("foto", f);
                request.setAttribute("Command", "newPhoto");

                userPath = "/uploadPhoto";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }
    }

    private void viewUpdatePhoto(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){

                String key = request.getParameter("key");
                String numFoto = request.getParameter("selezione");

                Foto f = dbe.getPhoto(Integer.parseInt(numFoto), Integer.parseInt(key));

                request.setAttribute("foto", f);
                request.setAttribute("Command", "updatePhoto");

                userPath = "/uploadPhoto";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare oggetti.");
            }
        }
    }

    private void deletePhoto(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 3){

                String key = request.getParameter("key");
                String numFoto = request.getParameter("selezione");

                dbe.deleteFoto(key, numFoto);

                ListaFoto foto = new ListaFoto();
                foto.setListaFoto(dbe.getListaFoto(Integer.parseInt(key)));
                Oggetto o = dbe.getOggetto(key);


                request.setAttribute("foto", foto);
                request.setAttribute("Oggetto", o);

                userPath = "/photoManagement";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare oggetti.");
            }
        }
    }


    private void viewInsertManager(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){
                userPath = "/insertManager";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }
    }

    private void main(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            ArrayList<Riservazione> reservations = dbe.getRiservazioniAperte();
            ArrayList<Riservazione> resRequest = dbe.getRiservazioniRichiesteAperte();
            ArrayList<Riservazione> resPending = new ArrayList<Riservazione>();

            for (Riservazione riservazione : reservations) {
                if (riservazione.getDaysleft() <= DAYS_LEFT ) {
                    resPending.add(riservazione);
                }
            }

            ArrayList<Oggetto> objectsFree = dbe.listObject(true);
            ArrayList<Oggetto> objectsNotFree = dbe.listObject(false);

            Integer earning25 = dbe.earningsByCategory("25");
            Integer earning30 = dbe.earningsByCategory("30");
            Integer earning45 = dbe.earningsByCategory("45");
            //ArrayList<Oggetto> scootersEarnings = dbe.listScooterWithEarnings();

            //dagli ogggetti free tolgo i non funzionanti.
            ArrayList<Oggetto> objectsNotWorking = new ArrayList<Oggetto>();
            for (Oggetto ogg : objectsFree) {
                if (!ogg.isFunzionante() ) {
                    objectsNotWorking.add(ogg);
                }
            }
            objectsFree.removeAll(objectsNotWorking);

            request.setAttribute("objectsFree", objectsFree);
            request.setAttribute("objectsNotFree", objectsNotFree);
            request.setAttribute("objectsNotWorking", objectsNotWorking);
            request.setAttribute("resPending", resPending);
            request.setAttribute("resRequest", resRequest);

            request.setAttribute("earning25", earning25);
            request.setAttribute("earning30", earning30);
            request.setAttribute("earning45", earning45);

            request.setAttribute("viewPicture", false);

            userPath = "/main";

        }
    }

    private void insertManager(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti == 4){
                String nome = request.getParameter("nome");
                String password = request.getParameter("password");
                String dirittiStr = request.getParameter("diritti");
                String email = request.getParameter("email");
                String infoPreStr = request.getParameter("infoPre");

                try {
                    ch.ecoRent.beans.Manager m = new ch.ecoRent.beans.Manager();

                    m.setNome(nome);
                    m.setPassword(password);
                    m.setDiritti(Integer.parseInt(dirittiStr));
                    m.setEmail(email);
                    m.setInfoPre(new Boolean(infoPreStr));

                    dbe.setManager(m);

                    List<ch.ecoRent.beans.Manager> managers = dbe.getListManager();
                    request.setAttribute("managers", managers);
                    userPath = "/listManager";
                } catch (NumberFormatException ex) {
                    callManagerError(request, ex, "NumberFormatException");
                } catch (DataBaseException ex) {
                    callManagerError(request, ex, "DataBaseException");
                }


            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }
    }

    private void viewUpdateManager(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){
                String nome = request.getParameter("Manager");

                ch.ecoRent.beans.Manager m = dbe.getManager(nome);

                request.setAttribute("manager", m);


                userPath = "/updateManager";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare manager.");
            }
        }
    }

    private void updateManager(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {

            if(diritti == 4){
                String nome = request.getParameter("nome");
                String password = request.getParameter("password");
                String dirittiStr = request.getParameter("diritti");
                String email = request.getParameter("email");
                String infoPreStr = request.getParameter("infoPre");

                try {
                    ch.ecoRent.beans.Manager m = new ch.ecoRent.beans.Manager();
                    m.setNome(nome);
                    m.setPassword(password);
                    m.setDiritti(Integer.parseInt(dirittiStr));
                    m.setEmail(email);
                    m.setInfoPre(new Boolean(infoPreStr));

                    dbe.updateManager(m);

                    List<ch.ecoRent.beans.Manager> managers = dbe.getListManager();
                    request.setAttribute("managers", managers);
                    userPath = "/listManager";

                } catch (NumberFormatException nfe) {
                    callManagerError(request, nfe, "NumberFormatException");
                } catch (DataBaseException dbex) {
                    callManagerError(request, dbex, "DataBaseException");
                } catch (UpdateDBException udbe) {
                    callManagerError(request, udbe, "UpdateDBException");
                }
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare manager.");
            }
        }
    }

    private void deleteManager(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti == 4){
                String nome = request.getParameter("Manager");

                try {
                    dbe.deleteManager(nome);

                    List<ch.ecoRent.beans.Manager> managers = dbe.getListManager();
                    request.setAttribute("managers", managers);
                    userPath = "/listManager";

                } catch (DeleteManagerException ex) {
                    callManagerError(request, ex, "DeleteManagerException");
                } catch (DataBaseException ex) {
                    callManagerError(request, ex, "DataBaseException");
                }
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare manager.");
            }
        }
    }

    private void deleteObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 3){
                String key = request.getParameter("key");

                try {
                    dbe.deleteObject(key);

                    listObject(request);//

                } catch (DeleteManagerException ex) {
                    callManagerError(request, ex, "DeleteManagerException");
                }
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare manager.");
            }
        }
    }

    private void deleteDoc(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 3){
                String key = request.getParameter("key");
                String fk_tabella= request.getParameter("fk_tabella");
                String tabella= request.getParameter("tabella");

                try {
                    dbe.deleteDoc(key);

                    List<Documento> documenti = dbe.getDocumenti(Integer.parseInt(fk_tabella), tabella);

                    request.setAttribute("Documenti", documenti);
                    request.setAttribute("FK_Tabella", fk_tabella);
                    request.setAttribute("Tabella", tabella);
                    userPath = "/listDocs";


                } catch (DeleteManagerException ex) {
                    callManagerError(request, ex, "DeleteManagerException");
                }
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Eliminare manager.");
            }
        }
    }

    private void insertObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 2){
                Oggetto obj = new Oggetto();
                String result = "Oggetto inserito correttamente!";

                obj.setNome(request.getParameter("nome"));
                obj.setMarca(request.getParameter("marca"));
                obj.setTipo(request.getParameter("tipo"));
                obj.setDescrizione(request.getParameter("descrizione"));
                obj.setSpecifiche(request.getParameter("specifiche"));
                obj.setVarie(request.getParameter("varie"));
                obj.setAnno(request.getParameter("anno"));


                int intKey = dbe.setOggetto(obj);

                if(intKey == 0) {
                    DataBaseException dbe = new DataBaseException("Oggetto non inserito correttamente.");
                    callManagerError(request, dbe, "Tabella Oggetti");
                }else {
                    Oggetto o = dbe.getOggetto("" + intKey);
                    ListaFoto foto = new ListaFoto();

                    foto.setListaFoto(dbe.getListaFoto(intKey));


                    request.setAttribute("Oggetto", o);
                    request.setAttribute("foto", foto);

                    userPath = "/object";
                }

                //request.setAttribute("result", result);
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Inserire oggetti.");
            }
        }
    }

    private void viewUpdateObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){
                String key = request.getParameter("key");

                Oggetto o = dbe.getOggetto(key);

              //se il campo è venduto devo inserire l'oggetto in oggetti_venduti con la stessa chiave dell'oggetto
                if(o.isVenduto()) {
                    OggettoVenduto oggV = dbe.getOggettoVenduto(o.getKey());
                    request.setAttribute("OggettoVenduto", oggV);
                }

                request.setAttribute("oggetto", o);


                userPath = "/updateObject";
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare manager.");
            }
        }
    }

    private void updateObject(HttpServletRequest request) {
        if (session == null || (ch.ecoRent.beans.Manager)session.getAttribute("manager") == null){
            sessionExpired(request);
        } else {
            if(diritti >= 1){
                Oggetto obj = new Oggetto();
                OggettoVenduto oggV = null;

                int key = Integer.parseInt(request.getParameter("key"));
                String venduto = request.getParameter("venduto");

                obj.setKey(key);

                obj.setNome(request.getParameter("nome"));
                obj.setMarca(request.getParameter("marca"));
                obj.setTipo(request.getParameter("tipo"));
                obj.setDescrizione(request.getParameter("descrizione"));
                obj.setSpecifiche(request.getParameter("specifiche"));
                obj.setVarie(request.getParameter("varie"));
                obj.setAnno(request.getParameter("anno"));
                obj.setFunzionante(new Boolean(request.getParameter("funzionante")));
                obj.setVenduto(new Boolean(venduto));

                //se il campo è venduto devo inserire l'oggetto in oggetti_venduti con la stessa chiave dell'oggetto
                if(venduto != null && venduto.equals("true")) {
                    oggV = new OggettoVenduto();

                    oggV.setKey(key);
                    oggV.setFk_utente(request.getParameter("fk_utente"));
                    oggV.setMetodo_pagamento(request.getParameter("metodo_pagamento"));
                    oggV.setFattura_num(request.getParameter("fattura_numero"));
                    oggV.setPrezzo(Integer.parseInt(request.getParameter("prezzo")));
                }

                try {
                    int oggV_key;
                    if(venduto != null && venduto.equals("true")) {

                        SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
                        String dv = request.getParameter("data_vendita");
                        oggV.setData_vendita(ft.parse(dv));

                        if (dbe.getOggettoVenduto(key) == null) {
                            oggV_key = dbe.insertOggettoVenduto(oggV);
                        }else {
                            oggV_key = dbe.updateOggettoVenduto(oggV);
                        }

                        oggV = dbe.getOggettoVenduto(key);
                        request.setAttribute("OggettoVenduto", oggV);
                    }

                    dbe.updateOggetto(obj);

                    Oggetto o = dbe.getOggetto("" + key);
                    ListaFoto foto = new ListaFoto();
                    o.setEarning(dbe.earningsByScooter(key));

                    foto.setListaFoto(dbe.getListaFoto(key));


                    request.setAttribute("Oggetto", o);
                    request.setAttribute("foto", foto);

                    userPath = "/object";
                } catch (UpdateDBException udbe) {
                    callManagerError(request, udbe, "UpdateDBException");
                } catch (ParseException e) {
                    callManagerError(request, e, "ParseDateException");
                } catch (SQLException e) {
                    callManagerError(request, e, "SQLException");
                }

                //request.setAttribute("result", result);
            }else{
                PrivilegesException pe = new PrivilegesException("Non hai sufficenti privilegi.");
                callManagerError(request, pe, "Non puoi Aggiornare oggetti.");
            }
        }



    }


    private void callManagerError(HttpServletRequest request, Exception ex, String nameEx) {
        log.error(ex.getMessage());
        String msg1 = nameEx;
        String msg2 = ex.getMessage();

        request.setAttribute("msg1", msg1);
        request.setAttribute("msg2", msg2);

        userPath = "/managerError";
    }

}

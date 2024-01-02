package ch.ecoRent.db;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.postgresql.util.PSQLException;

import ch.ecoRent.beans.Documento;
import ch.ecoRent.beans.Foto;
import ch.ecoRent.beans.Manager;
import ch.ecoRent.beans.Oggetto;
import ch.ecoRent.beans.OggettoVenduto;
import ch.ecoRent.beans.Prezzi;
import ch.ecoRent.beans.Riservazione;
import ch.ecoRent.beans.Utente;
import ch.ecoRent.exception.DataBaseException;
import ch.ecoRent.exception.DeleteManagerException;
import ch.ecoRent.exception.DeleteReservationException;
import ch.ecoRent.exception.UpdateDBException;
import ch.ecoRent.utility.Utility;


public class DBEngine {

    private Connection conn;
    private Logger log = Logger.getLogger(DBEngine.class.getName());
    DataSource ds;

    public DBEngine(){

        try {

            Context ctx = new InitialContext();
            if(ctx == null ) {
                log.error("Context null!!");
            }

            this.ds = (DataSource)ctx.lookup("java:comp/env/jdbc/ecorent");
            log.debug("DataSource lookup <- java:comp/env/jdbc/ecorent");

            this.conn = ds.getConnection();
            log.debug("get connection succesfull!");



        } catch (SQLException ex) {
                log.error("SQLException: " + ex.getMessage());
                log.error("SQLState: " + ex.getSQLState());
                log.error("VendorError: " + ex.getErrorCode());
        } catch (NamingException e) {
                log.error(e.getMessage());
        }
    }

    public void setUser(Utente u) throws DataBaseException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn.setAutoCommit(false);

            //inserisco l'utente nella tabella
            pstmt = conn.prepareStatement("INSERT INTO utenti (password, nome, cognome, email, domicilio, cap, via, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, u.getPassword());
            pstmt.setString(2, u.getNome());
            pstmt.setString(3, u.getCognome());
            pstmt.setString(4, u.getEmail().toLowerCase());//email sempre lower case
            pstmt.setString(5, u.getDomicilio());
            pstmt.setString(6, u.getCap());
            pstmt.setString(7, u.getVia());
            pstmt.setString(8, u.getTelefono());
            pstmt.execute();


            conn.commit();
            conn.setAutoCommit(true);


        } catch (PSQLException psqlE) {
            log.error("psqlException: " + psqlE.getMessage());
            try {
                conn.rollback();
                log.error("ROLLBACK!");
                conn.setAutoCommit(true);
                throw new DataBaseException(psqlE.getMessage());
            } catch (SQLException ex) {
                log.error("sqlException: " + ex.getMessage());
            }
        } catch (SQLException e) {
            log.error("psqlException: " + e.getMessage());
            try {
                conn.rollback();
                log.error("ROLLBACK!");
                conn.setAutoCommit(true);
                throw new DataBaseException(e.getMessage());
            } catch (SQLException ex) {
                log.error("sqlException: " + ex.getMessage());
            }
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
    }

    public boolean setPrice(Prezzi prezzi) throws DataBaseException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.setAutoCommit(false);

            pstmt = conn.prepareStatement("INSERT INTO prezzi (fk_oggetto, g1, g2, g3, g4, g5, g6, g7, more_g, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, more_m) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            pstmt.setInt(1, prezzi.getFk_oggetto());
            pstmt.setDouble(2, prezzi.getG1());
            pstmt.setDouble(3, prezzi.getG2());
            pstmt.setDouble(4, prezzi.getG3());
            pstmt.setDouble(5, prezzi.getG4());
            pstmt.setDouble(6, prezzi.getG5());
            pstmt.setDouble(7, prezzi.getG6());
            pstmt.setDouble(8, prezzi.getG7());
            pstmt.setDouble(9, prezzi.getMore_g());
            pstmt.setDouble(10, prezzi.getM1());
            pstmt.setDouble(11, prezzi.getM2());
            pstmt.setDouble(12, prezzi.getM3());
            pstmt.setDouble(13, prezzi.getM4());
            pstmt.setDouble(14, prezzi.getM5());
            pstmt.setDouble(15, prezzi.getM6());
            pstmt.setDouble(16, prezzi.getM7());
            pstmt.setDouble(17, prezzi.getM8());
            pstmt.setDouble(18, prezzi.getM9());
            pstmt.setDouble(19, prezzi.getM10());
            pstmt.setDouble(20, prezzi.getM11());
            pstmt.setDouble(21, prezzi.getM12());
            pstmt.setDouble(22, prezzi.getMore_m());

            pstmt.execute();

            result = true;

            //conn.commit();
            //conn.setAutoCommit(true);


        } catch (SQLException e) {

            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Oggetto> listObject(String cat){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        try {
            pstmt = conn.prepareStatement("SELECT * FROM OGGETTI WHERE tipo like ? and venduto = false");
            pstmt.setString(1, "%" + cat + "%");


            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Oggetto obj = new Oggetto();
                obj.setKey(rs.getInt("key"));
                obj.setNome(rs.getString("nome"));
                obj.setMarca(rs.getString("marca"));
                obj.setTipo(rs.getString("tipo"));
                obj.setDescrizione(rs.getString("descrizione"));
                obj.setSpecifiche(rs.getString("specifiche"));
                obj.setAnno(rs.getString("anno"));
                obj.setVarie(rs.getString("varie"));
                obj.setFunzionante(rs.getBoolean("funzionante"));
                obj.setVenduto(rs.getBoolean("venduto"));

                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Oggetto> listObject(String cat, boolean isFree){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        conn = checkConnection(conn);

        try {
            if(isFree) {
                pstmt = conn.prepareStatement("select * from oggetti where key not in(select fk_oggetto from riservazioni where current_date between data_inizio and data_fine) and tipo like ? and venduto = false");
            }else {
                pstmt = conn.prepareStatement("select * from oggetti where key in(select fk_oggetto from riservazioni where current_date between data_inizio and data_fine) and tipo like ? and venduto = false");

            }
            pstmt.setString(1, "%" + cat + "%");


            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Oggetto obj = new Oggetto();
                obj.setKey(rs.getInt("key"));
                obj.setNome(rs.getString("nome"));
                obj.setMarca(rs.getString("marca"));
                obj.setTipo(rs.getString("tipo"));
                obj.setDescrizione(rs.getString("descrizione"));
                obj.setSpecifiche(rs.getString("specifiche"));
                obj.setAnno(rs.getString("anno"));
                obj.setVarie(rs.getString("varie"));
                obj.setFunzionante(rs.getBoolean("funzionante"));
                obj.setVenduto(rs.getBoolean("venduto"));

                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Oggetto> listObject(boolean isFree){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        conn = checkConnection(conn);

        try {
            if(isFree) {
                pstmt = conn.prepareStatement("select * from oggetti where key not in(select fk_oggetto from riservazioni where current_date between data_inizio and data_fine and venduto = false)");
            }else {
                pstmt = conn.prepareStatement("select * from oggetti where key in(select fk_oggetto from riservazioni where current_date between data_inizio and data_fine and venduto = false)");

            }


            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Oggetto obj = new Oggetto();
                obj.setKey(rs.getInt("key"));
                obj.setNome(rs.getString("nome"));
                obj.setMarca(rs.getString("marca"));
                obj.setTipo(rs.getString("tipo"));
                obj.setDescrizione(rs.getString("descrizione"));
                obj.setSpecifiche(rs.getString("specifiche"));
                obj.setAnno(rs.getString("anno"));
                obj.setVarie(rs.getString("varie"));
                obj.setFunzionante(rs.getBoolean("funzionante"));
                obj.setVenduto(rs.getBoolean("venduto"));

                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }


    public ArrayList<Oggetto> listObject(Boolean isVenduto){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        try {
            pstmt = conn.prepareStatement("SELECT * FROM OGGETTI WHERE venduto = ?");
            pstmt.setBoolean(1, isVenduto);


            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Oggetto obj = new Oggetto();
                obj.setKey(rs.getInt("key"));
                obj.setNome(rs.getString("nome"));
                obj.setMarca(rs.getString("marca"));
                obj.setTipo(rs.getString("tipo"));
                obj.setDescrizione(rs.getString("descrizione"));
                obj.setSpecifiche(rs.getString("specifiche"));
                obj.setAnno(rs.getString("anno"));
                obj.setVarie(rs.getString("varie"));
                obj.setFunzionante(rs.getBoolean("funzionante"));
                obj.setVenduto(rs.getBoolean("venduto"));


                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }


    private Connection checkConnection(Connection conn) {
        try {
            if(conn != null && conn.isClosed()) {
                conn = this.ds.getConnection();
            }else if (conn == null) {
                conn = this.ds.getConnection();
            }
        } catch (SQLException e) {
            log.error(e.getMessage());
        }
        return conn;
    }

    public ArrayList<Oggetto> listObject(){
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        StringBuffer query = new StringBuffer("SELECT * FROM OGGETTI Order by nome");

        System.out.print(query.toString());
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query.toString());

            // Now do something with the ResultSet ....
            while(rs.next()){
                //inserisco i risultati nel beans
                Oggetto obj = new Oggetto();
                obj.setKey(rs.getInt("key"));
                obj.setNome(rs.getString("nome"));
                obj.setMarca(rs.getString("marca"));
                obj.setTipo(rs.getString("tipo"));
                obj.setDescrizione(rs.getString("descrizione"));
                obj.setSpecifiche(rs.getString("specifiche"));
                obj.setAnno(rs.getString("anno"));
                obj.setVarie(rs.getString("varie"));
                obj.setFunzionante(rs.getBoolean("funzionante"));
                obj.setVenduto(rs.getBoolean("venduto"));

                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {  }

                stmt = null;
            }
        }

        return result;
    }

    public int getNextFotoKey(String fk_obj) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 1;

        try {
            pstmt = conn.prepareStatement("SELECT NUMERO FROM FOTO WHERE FOTO.fk_ogg = ?", ResultSet.FETCH_FORWARD, ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, Integer.parseInt(fk_obj));

            rs = pstmt.executeQuery();

            if(rs.last()){
                result = rs.getInt("numero") + 1;
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    /**
     * Method setOggetto.
     * @param obj oggetto da inserire
     * @return int Ritorna la chiave dell'oggetto appena inserito
     */
    public int setOggetto(Oggetto obj){
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("INSERT INTO oggetti (nome, marca, tipo, descrizione, specifiche, varie, anno, funzionante) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, obj.getNome());
            pstmt.setString(2, obj.getMarca());
            pstmt.setString(3, obj.getTipo());
            pstmt.setString(4, obj.getDescrizione());
            pstmt.setString(5, obj.getSpecifiche());
            pstmt.setString(6, obj.getVarie());
            pstmt.setString(7, obj.getAnno());
            pstmt.setBoolean(8, obj.isFunzionante());


            pstmt.execute();

            String myQuery ="Select oggetti.key from oggetti order by oggetti.key desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(myQuery);

            if(rs.next()){
                result = rs.getInt("key");
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;

    }

    public Boolean setRiservazione(Riservazione r){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Boolean result = false;

        try {
            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("INSERT INTO riservazioni (fk_oggetto, fk_utente, stato, data_inizio, data_fine, metodo_pagamento, fattura_num, da_km, a_km, procurato, note, prezzo_finale) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, r.getFk_oggetto());
            pstmt.setString(2, r.getFk_utente());
            pstmt.setInt(3, r.getStato());
            java.sql.Date sqlDateS = new java.sql.Date(r.getData_inizio().getTime());
            pstmt.setDate(4, sqlDateS);
            java.sql.Date sqlDateE = new java.sql.Date(r.getData_fine().getTime());
            pstmt.setDate(5, sqlDateE);

            pstmt.setString(6, r.getMetodo_pagamento());
            pstmt.setString(7, r.getFattura_num());
            pstmt.setInt(8, r.getDa_km());
            pstmt.setInt(9, r.getA_km());
            pstmt.setString(10, r.getProcurato());
            pstmt.setString(11, r.getNote());
            pstmt.setDouble(12, r.getFinal_price());
            //data_pagamento non viene inserita alla creazione.

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;

    }

    public int updateOggetto(Oggetto obj) throws UpdateDBException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("UPDATE oggetti SET nome = ?, marca = ?, tipo = ?, descrizione = ?, specifiche = ?, varie = ?, anno = ?, funzionante = ?, venduto = ?  WHERE key=?");
            pstmt.setString(1, obj.getNome());
            pstmt.setString(2, obj.getMarca());
            pstmt.setString(3, obj.getTipo());
            pstmt.setString(4, obj.getDescrizione());
            pstmt.setString(5, obj.getSpecifiche());
            pstmt.setString(6, obj.getVarie());
            pstmt.setString(7, obj.getAnno());
            pstmt.setBoolean(8, obj.isFunzionante());
            pstmt.setBoolean(9, obj.isVenduto());

            pstmt.setInt(10, obj.getKey());


            int rowUpdated = pstmt.executeUpdate();
            log.debug(rowUpdated);

            if(rowUpdated == 0){
                throw new UpdateDBException("Aggiornamento Banca Dati tabella oggetti fallito!");
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;

    }

    public Oggetto getOggetto(String key){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Oggetto result = new Oggetto();

        try {

            pstmt = conn.prepareStatement("Select * from oggetti where oggetti.key = ?");
            pstmt.setInt(1, Integer.parseInt(key));

            rs = pstmt.executeQuery();

            if(rs.next()){
                result.setKey(rs.getInt("key"));
                result.setNome(rs.getString("nome"));
                result.setMarca(rs.getString("marca"));
                result.setTipo(rs.getString("tipo"));
                result.setDescrizione(rs.getString("descrizione"));
                result.setSpecifiche(rs.getString("specifiche"));
                result.setVarie(rs.getString("varie"));
                result.setAnno(rs.getString("anno"));
                result.setFunzionante(rs.getBoolean("funzionante"));
                result.setVenduto(rs.getBoolean("venduto"));

            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;

    }


    public Utente login(Utente u) {
        //Utente utente = u;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Utente result = null;

        try {
            conn = checkConnection(conn);

            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from utenti where email = ? and password = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, u.getEmail());
            pstmt.setString(2, u.getPassword());

            rs = pstmt.executeQuery();

            if(rs.next()){
                u.setNome(rs.getString("nome"));
                u.setCognome(rs.getString("cognome"));
                u.setEnabled(rs.getBoolean("enabled"));
                u.setIsTxPending(rs.getBoolean("txIsPending"));
                u.setDomicilio(rs.getString("domicilio"));
                u.setCap(rs.getString("cap"));
                u.setVia(rs.getString("via"));

                result = u;
            }
        } catch (PSQLException psqlE) {
                log.error("psqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public ch.ecoRent.beans.Manager loginManager(String nome, String password) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ch.ecoRent.beans.Manager result = null;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from manager where nome = ? and password = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, nome);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = new ch.ecoRent.beans.Manager();
                result.setDiritti(rs.getInt("diritti"));
                result.setNome(rs.getString("nome"));
                result.setPassword(rs.getString("password"));
                result.setEmail(rs.getString("email"));
                result.setInfoPre(rs.getBoolean("info_pre"));
            }
        } catch (PSQLException psqlE) {
                log.error("psqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public Utente getUser(String email) {
        //Utente utente = u;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Utente result = null;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from utenti where email = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = new Utente();
                result.setPassword(rs.getString("password"));
                result.setNome(rs.getString("nome"));
                result.setCognome(rs.getString("cognome"));
                result.setEmail(rs.getString("email"));
                result.setDomicilio(rs.getString("domicilio"));
                result.setCap(rs.getString("cap"));
                result.setVia(rs.getString("via"));
                result.setIsTxPending(rs.getBoolean("txIsPending"));
                result.setTelefono(rs.getString("telefono"));

            }
        } catch (PSQLException psqlE) {
                log.error("psqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    //if true exist reservation -> no possible to add reservation.
    public boolean checkPre(int fk_oggetto, Riservazione r) {
        //Utente utente = u;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = true;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("select checkpre(?, ?, ?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, fk_oggetto);
            java.sql.Date sqlDateS = new java.sql.Date(r.getData_inizio().getTime());
            pstmt.setDate(2, sqlDateS);
            java.sql.Date sqlDateE = new java.sql.Date(r.getData_fine().getTime());
            pstmt.setDate(3, sqlDateE);

            rs = pstmt.executeQuery();

            if(rs.next()){

                result = rs.getBoolean("checkpre");

            }
        } catch (PSQLException psqlE) {
                log.error("psqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

  //if true exist reservation -> no possible to add reservation.
    public int daysLeft(Date end_date) {
        //Utente utente = u;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("select daysleft(?)", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);


            java.sql.Date sqlDateE = new java.sql.Date(end_date.getTime());
            pstmt.setDate(1, sqlDateE);

            rs = pstmt.executeQuery();

            if(rs.next()){

                result = rs.getInt("daysleft");

            }
        } catch (PSQLException psqlE) {
                log.error("psqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }


    public boolean updateUser(Utente utente) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE utenti SET password=?, nome=?, cognome=?, domicilio=?, cap=?, via=?, telefono=?, enabled=? where email = ?");
            pstmt.setString(1, utente.getPassword());
            pstmt.setString(2, utente.getNome());
            pstmt.setString(3, utente.getCognome());
            pstmt.setString(4, utente.getDomicilio());
            pstmt.setString(5, utente.getCap());
            pstmt.setString(6, utente.getVia());
            pstmt.setString(7, utente.getTelefono());
            pstmt.setBoolean(8, utente.getEnabled());

            pstmt.setString(9, utente.getEmail());

            pstmt.execute();

            result = true;

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }






    public boolean isTxPresent(String payPal_tx) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            pstmt = conn.prepareStatement("Select paypal_tx from transazioni where paypal_tx = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, payPal_tx);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = true;
            }

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }

    public boolean setEnabled(String email, String password) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE utenti SET enabled=true WHERE email=? and password=?");

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            int rowUpdated = pstmt.executeUpdate();
            if(rowUpdated == 0){
                result = false;
            }else{
                result = true;
            }


        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }

    public boolean setEnabled(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE utenti SET enabled=true WHERE email=?");

            pstmt.setString(1, email);


            int rowUpdated = pstmt.executeUpdate();
            if(rowUpdated == 0){
                result = false;
            }else{
                result = true;
            }


        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }

    public boolean setDisabled(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE utenti SET enabled=false WHERE email=?");

            pstmt.setString(1, email);

            int rowUpdated = pstmt.executeUpdate();
            if(rowUpdated == 0){
                result = false;
            }else{
                result = true;
            }


        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }


    public String getPassword(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = null;

        try {
            pstmt = conn.prepareStatement("Select password from utenti where email = ?");
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if(rs.next()){
                result = rs.getString("password");
            }
        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public boolean deleteConto(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("delete from conto where email=?");

            pstmt.setString(1, email);

            pstmt.execute();

            result = true;

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }


    public List<Utente> getListUser() {
        return getListUser(null, null);
    }

    public List<Utente> getListUser(String iniziale, String filtroLike) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Utente> result = new ArrayList<Utente>();

        try {

            StringBuilder query = new StringBuilder("Select * from utenti order by cognome");
            if (iniziale != null){
                query.append(" where ").append(filtroLike).append(" ilike '").append(iniziale).append("%'");
            }
            pstmt = conn.prepareStatement(query.toString(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Utente u = new Utente();

                u.setNome(rs.getString("nome"));
                u.setCognome(rs.getString("cognome"));
                u.setPassword(rs.getString("password"));
                u.setEmail(rs.getString("email"));
                u.setDomicilio(rs.getString("domicilio"));
                u.setCap(rs.getString("cap"));
                u.setVia(rs.getString("via"));
                u.setEnabled(rs.getBoolean("enabled"));
                u.setTelefono(rs.getString("telefono"));

                result.add(u);
            }
        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public String runQuery(String query) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = "query run successfully";

        try {

            pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.execute();


        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
                result = psqlE.getMessage();
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
                result = e.getMessage();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }



    public boolean deleteUser(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("delete from utenti where email=?");

            pstmt.setString(1, email);

            pstmt.execute();

            result = true;

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }

    public boolean enableUser(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE utenti SET enabled=true WHERE email=?");

            pstmt.setString(1, email);

            int rowUpdated = pstmt.executeUpdate();
            if(rowUpdated == 0){
                result = false;
            }else{
                result = true;
            }


        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }

    public boolean disableUser(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE utenti SET enabled=false WHERE email=?");

            pstmt.setString(1, email);

            int rowUpdated = pstmt.executeUpdate();
            if(rowUpdated == 0){
                result = false;
            }else{
                result = true;
            }


        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }





    public double getSum(String query){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        double result = 0;

        try {
            pstmt = conn.prepareStatement(query);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = rs.getDouble(1);
            }
        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public boolean setTxPending(String email, boolean value) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            pstmt = conn.prepareStatement("UPDATE utenti SET " + '"' + "txIsPending" + '"' + "=? WHERE email=?");

            pstmt.setBoolean(1, value);
            pstmt.setString(2, email);

            int rowUpdated = pstmt.executeUpdate();
            if(rowUpdated == 0){
                result = false;
            }else{
                result = true;
            }

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }


    public boolean setImage(int num, String album, String anno, File foto, String nome, String ruolo, String squadra){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            FileInputStream fis = new FileInputStream(foto);
            String query = "insert into figurine (num, album, anno, foto, nome, ruolo, squadra) values( ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setInt(1, num);
            pstmt.setString(2, album);
            pstmt.setString(3, anno);
            pstmt.setBinaryStream(4, fis, (int)foto.length());
            pstmt.setString(5, nome);
            pstmt.setString(6, ruolo);
            pstmt.setString(7, squadra);

            pstmt.execute();

            result = true;

        } catch (IOException io) {
            log.error("ioException: " + io.getMessage());
        } catch (PSQLException psqlE) {
            log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }


    public List<Manager> getListManager() throws DataBaseException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Manager> result = new ArrayList<Manager>();

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from manager", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            rs = pstmt.executeQuery();

            while(rs.next()){
                Manager m = new Manager();

                m.setNome(rs.getString("nome"));
                m.setPassword(rs.getString("password"));
                m.setDiritti(rs.getInt("diritti"));
                m.setEmail(rs.getString("email"));
                m.setInfoPre(rs.getBoolean("info_pre"));

                result.add(m);
            }
        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    //lista per inviare email dopo che l'utente ha fatto una prenotazione.
    public List<Manager> listManagerInfoPre() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Manager> result = new ArrayList<Manager>();

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from manager where info_pre = true", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            rs = pstmt.executeQuery();

            while(rs.next()){
                Manager m = new Manager();

                m.setNome(rs.getString("nome"));
                m.setPassword(rs.getString("password"));
                m.setDiritti(rs.getInt("diritti"));
                m.setEmail(rs.getString("email"));
                m.setInfoPre(rs.getBoolean("info_pre"));

                result.add(m);
            }
        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public Manager getManager(String nome) {
        //Utente utente = u;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Manager result = null;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from manager where nome = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setString(1, nome);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = new Manager();
                result.setNome(rs.getString("nome"));
                result.setPassword(rs.getString("password"));
                result.setDiritti(rs.getInt("diritti"));
                result.setEmail(rs.getString("email"));
                result.setInfoPre(rs.getBoolean("info_pre"));
            }
        } catch (PSQLException psqlE) {
                log.error("psqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public void updateManager(Manager m) throws UpdateDBException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            pstmt = conn.prepareStatement("UPDATE manager SET password=?, diritti=?, email=?, info_pre=? WHERE nome=?");

            log.debug("nome: " + m.getNome());
            log.debug("password: " + m.getPassword());
            log.debug("diritti: " + m.getDiritti());
            log.debug("email: " + m.getEmail());
            log.debug("infoPrenotazioni: " + m.isInfoPre());

            pstmt.setString(1, m.getPassword());
            pstmt.setInt(2, m.getDiritti());
            pstmt.setString(3, m.getEmail());
            pstmt.setBoolean(4, m.isInfoPre());
            pstmt.setString(5, m.getNome().trim());

            int rowUpdated = pstmt.executeUpdate();
            log.debug(rowUpdated);

            if(rowUpdated == 0){
                throw new UpdateDBException("Aggiornamento Banca Dati tabella manager fallito!");
            }

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
                throw new UpdateDBException(psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
                throw new UpdateDBException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
    }

    public void setManager(Manager m) throws DataBaseException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            StringBuilder query = new StringBuilder("insert into manager (nome, password, diritti, email, info_pre) values (?, ?, ?, ?, ?)");

            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, m.getNome());
            pstmt.setString(2, m.getPassword());
            pstmt.setInt(3, m.getDiritti());
            pstmt.setString(4, m.getEmail());
            pstmt.setBoolean(5, m.isInfoPre());

            pstmt.execute();

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
                throw new DataBaseException(psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
                throw new DataBaseException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
    }

    public void deleteManager(String nome) throws DeleteManagerException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("delete from manager where nome=?");

            pstmt.setString(1, nome);

            pstmt.execute();

        } catch (PSQLException psqlE) {
            log.error("sqlException: " + psqlE.getMessage());
            throw new DeleteManagerException(psqlE.getMessage());
        } catch (SQLException e) {
            log.error("sqlException: " + e.getMessage());
            throw new DeleteManagerException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
    }

    public boolean checkPostOrderId(int orderId, String payerEmail) throws DataBaseException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            pstmt = conn.prepareStatement("Select * from transazioni where id = ? and email = ? and causale ilike '%pendente%'", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt.setInt(1, orderId);
            pstmt.setString(2, payerEmail);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = true;
            }

        } catch (SQLException e) {
            log.error("sqlException: " + e.getMessage());
            throw new DataBaseException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public Foto getPhotoFromV(int numero, int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Foto f = null;


        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select foto from foto where fk_ogg = ? and numero = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pstmt.setInt(1, key);
            pstmt.setInt(2, numero);


            rs = pstmt.executeQuery();
            if(rs.next()){
                f = new Foto();

                f.setFoto(rs.getBinaryStream(1));


            }
        } catch (PSQLException psqlE) {
            System.out.println("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            System.out.println("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return f;
    }

    public Foto getPhoto(int numero, int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Foto f = null;


        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from foto where fk_ogg = ? and numero = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pstmt.setInt(1, key);
            pstmt.setInt(2, numero);


            rs = pstmt.executeQuery();
            if(rs.next()){
                f = new Foto();
                f.setNumero(rs.getInt("numero"));
                f.setDescrizione(rs.getString("descf"));
                f.setFk_oggetto(rs.getInt("fk_ogg"));
                f.setFoto(rs.getBinaryStream("foto"));


            }
        } catch (PSQLException psqlE) {
            System.out.println("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            System.out.println("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return f;
    }

    public Documento getDocumento(int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Documento c = null;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from documenti where key = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pstmt.setInt(1, key);

            rs = pstmt.executeQuery();
            if(rs.next()){
                c = new Documento();
                c.setKey(rs.getInt("key"));
                c.setFk_tabella(rs.getInt("fk_tabella"));
                c.setDataDocumento(rs.getDate("data_doc")); //data_firma
                c.setDocumento(rs.getBinaryStream("documento"));//contratto
                c.setTabella(rs.getString("tabella"));
                c.setTipo(rs.getString("tipo"));
            }
        } catch (PSQLException psqlE) {
            System.out.println("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            System.out.println("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return c;
    }

    public List<Integer> getListFoto(int fk_ogg) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Integer> result = new ArrayList<Integer>();


        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select numero from foto where fk_ogg = ? order by numero asc", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pstmt.setInt(1, fk_ogg);


            rs = pstmt.executeQuery();
            if(rs.next()){
                Integer i = new Integer(rs.getInt("numero"));
                result.add(i);

            }
        } catch (PSQLException psqlE) {
            System.out.println("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            System.out.println("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public List<Documento> getDocumenti(int fk_tabella, String tabella) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Documento> result = new ArrayList<Documento>();


        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from documenti where fk_tabella = ? and tabella = ? order by data_doc asc", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pstmt.setInt(1, fk_tabella);
            pstmt.setString(2, tabella);

            rs = pstmt.executeQuery();
            while(rs.next()){
                Documento c = new Documento();
                c.setKey(rs.getInt("key"));
                c.setFk_tabella(rs.getInt("fk_tabella"));
                c.setDataDocumento(rs.getDate("data_doc")); //data_firma
                c.setDocumento(rs.getBinaryStream("documento"));//contratto
                c.setTabella(rs.getString("tabella"));
                c.setTipo(rs.getString("tipo"));

                result.add(c);

            }
        } catch (PSQLException psqlE) {
            System.out.println("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            System.out.println("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public ArrayList<Foto> getListaFoto(int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Foto> result = new ArrayList<Foto>();

        try {
            pstmt = conn.prepareStatement("SELECT * FROM FOTO WHERE FOTO.fk_ogg = ?");
            pstmt.setInt(1, key);

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Foto f = new Foto();

                f.setFk_oggetto(rs.getInt("fk_ogg"));
                f.setNumero(rs.getInt("numero"));
                f.setDescrizione(rs.getString("descf"));

                result.add(f);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Riservazione> getRiservazioni(int fk_oggetto) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Riservazione> result = new ArrayList<Riservazione>();

        try {
            //pstmt = conn.prepareStatement("SELECT * FROM riservazioni WHERE riservazioni.fk_oggetto = ?");
            pstmt = conn.prepareStatement("select *, daysleft(r.data_fine) from riservazioni as r WHERE r.fk_oggetto = ? order by daysleft desc");

            pstmt.setInt(1, fk_oggetto);

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Riservazione r = new Riservazione();

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                //add daysleft
                r.setDaysleft(rs.getInt("daysleft"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                result.add(r);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Riservazione> getRiservazioni() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Riservazione> result = new ArrayList<Riservazione>();

        try {
            //pstmt = conn.prepareStatement("SELECT * FROM riservazioni");
            pstmt = conn.prepareStatement("select *, daysleft(r.data_fine) from riservazioni as r order by daysleft desc");

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Riservazione r = new Riservazione();

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                //add daysleft
                r.setDaysleft(rs.getInt("daysleft"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                result.add(r);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Riservazione> getRiservazioniRichiesteAperte() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Riservazione> result = new ArrayList<Riservazione>();

        try {
            //pstmt = conn.prepareStatement("SELECT * FROM riservazioni");
            pstmt = conn.prepareStatement("select *, daysleft(r.data_fine) as daysleft from riservazioni as r where daysleft(r.data_fine) >= 0 and stato = 1 order by daysleft desc");

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Riservazione r = new Riservazione();

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                //add daysleft
                r.setDaysleft(rs.getInt("daysleft"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                result.add(r);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Riservazione> getRiservazioniAperte() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Riservazione> result = new ArrayList<Riservazione>();

        try {
            pstmt = conn.prepareStatement("select *, daysleft(r.data_fine) as daysleft from riservazioni as r where daysLeft(r.data_fine) >= 0");

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Riservazione r = new Riservazione();

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                r.setDaysleft(rs.getInt("daysleft"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                result.add(r);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Riservazione> getRiservazioniChiuse() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Riservazione> result = new ArrayList<Riservazione>();

        try {
            pstmt = conn.prepareStatement("select * from riservazioni as r where daysLeft(r.data_fine) < 0");

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Riservazione r = new Riservazione();

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                r.setFinal_price(rs.getDouble("prezzo_finale"));

                result.add(r);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public ArrayList<Riservazione> getRiservazioni(String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Riservazione> result = new ArrayList<Riservazione>();

        try {
            pstmt = conn.prepareStatement("SELECT *, daysleft(r.data_fine) as daysleft FROM riservazioni as r WHERE r.fk_utente = ?");
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                Riservazione r = new Riservazione();

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                r.setDaysleft(rs.getInt("daysleft"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));


                result.add(r);
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }


    public ArrayList<Oggetto> listScooterWithEarnings(){
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        StringBuffer query = new StringBuffer("SELECT fk_oggetto, SUM (prezzo_finale) as prezzo_finale FROM riservazioni GROUP BY fk_oggetto order by fk_oggetto");

        System.out.print(query.toString());
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query.toString());

            while(rs.next()){
                //inserisco i risultati nel beans
                int key = rs.getInt("fk_oggetto");
                double guadagno = rs.getDouble("prezzo_finale");
                Oggetto obj = this.getOggetto("" + key);
                obj.setEarning(guadagno);

                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException sqlEx) {  }

                stmt = null;
            }
        }

        return result;
    }

    public ArrayList<Oggetto> listScooterWithEarnings(String cat){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Oggetto> result = new ArrayList<Oggetto>();

        try {
            pstmt = conn.prepareStatement("SELECT fk_oggetto, SUM (prezzo_finale) as prezzo_finale FROM riservazioni where fk_oggetto in (SELECT key FROM OGGETTI WHERE tipo like ?) GROUP BY fk_oggetto order by fk_oggetto");
            pstmt.setString(1, "%" + cat + "%");

            rs = pstmt.executeQuery();

            while(rs.next()){
                //inserisco i risultati nel beans
                int key = rs.getInt("fk_oggetto");
                double guadagno = rs.getDouble("prezzo_finale");
                Oggetto obj = this.getOggetto("" + key);
                obj.setEarning(guadagno);

                result.add(obj);
            }


        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public int earningsByCategory(String category){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        double result = 0;

        try {
            pstmt = conn.prepareStatement("Select SUM (prezzo_finale) as somma from riservazioni where fk_oggetto in (SELECT key FROM oggetti where tipo like ?)");
            pstmt.setString(1, "%" + category + "%");

            rs = pstmt.executeQuery();

            if(rs.next()){
                //inserisco i risultati nel beans

                result = rs.getDouble("somma");

            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return (int)result;
    }

    public double earningsByScooter(int fk_obj){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        double result = 0;

        try {
            pstmt = conn.prepareStatement("Select SUM (prezzo_finale) as somma from riservazioni where fk_oggetto = ?");
            pstmt.setInt(1, fk_obj);

            rs = pstmt.executeQuery();

            if(rs.next()){
                //inserisco i risultati nel beans

                result = rs.getDouble("somma");

            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }


    /**
     *
     */
    public boolean setFoto(Foto f, File foto) {
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            FileInputStream fis = new FileInputStream(foto);

            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("INSERT INTO foto (fk_ogg, numero, descf, foto) VALUES (?, ?, ?, ?)");
            pstmt.setInt(1, f.getFk_oggetto());
            pstmt.setInt(2, f.getNumero());
            pstmt.setString(3, f.getDescrizione());
            pstmt.setBinaryStream(4, fis, (int)foto.length());

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
                e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public boolean setDocumento(Documento c, File contratto) {
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            FileInputStream fis = new FileInputStream(contratto);

            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("INSERT INTO documenti (fk_tabella, data_doc, documento, tipo, tabella) VALUES (?, ?, ?, ?, ?)");
            pstmt.setInt(1, c.getFk_tabella());

            java.sql.Date sqlDateF = new java.sql.Date(c.getDataDocumento().getTime());
            pstmt.setDate(2, sqlDateF);

            pstmt.setBinaryStream(3, fis, (int)contratto.length());

            pstmt.setString(4, c.getTipo());
            pstmt.setString(5, c.getTabella());

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
                e.printStackTrace();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public boolean updateFoto(Foto f, File foto){
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            FileInputStream fis = new FileInputStream(foto);

            pstmt = conn.prepareStatement("UPDATE foto SET fk_ogg = ?, numero = ?, descf = ?, foto = ? where foto.fk_ogg = ? and foto.numero = ?");
            pstmt.setInt(1, f.getFk_oggetto());
            pstmt.setInt(2, f.getNumero());
            pstmt.setString(3, f.getDescrizione());
            pstmt.setBinaryStream(4, fis, (int)foto.length());

            pstmt.setInt(5, f.getFk_oggetto());
            pstmt.setInt(6, f.getNumero());


            pstmt.execute();

            result = true;


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public boolean updateDocumento(Documento d, File doc){
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            FileInputStream fis = new FileInputStream(doc);

            pstmt = conn.prepareStatement("UPDATE documenti SET fk_tabella = ?, data_doc = ?, documento = ?, tipo = ?, tabella = ? where documenti.key = ?");
            pstmt.setInt(1, d.getFk_tabella());
            java.sql.Date sqlDateF = new java.sql.Date(d.getDataDocumento().getTime());
            pstmt.setDate(2, sqlDateF);
            pstmt.setBinaryStream(3, fis, (int)doc.length());
            pstmt.setString(4, d.getTipo());
            pstmt.setString(5, d.getTabella());

            pstmt.setInt(6, d.getKey());

            pstmt.execute();

            result = true;


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }

    public boolean deleteFoto(String fk_Obj, String key){
        PreparedStatement pstmt = null;
        boolean result = false;

        try {

            pstmt = conn.prepareStatement("Delete from foto where foto.fk_ogg = ? and foto.numero = ?");
            pstmt.setInt(1, Integer.parseInt(fk_Obj));
            pstmt.setInt(2, Integer.parseInt(key));

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public boolean deleteRiservazione(int key) throws DeleteReservationException{
        PreparedStatement pstmt = null;
        boolean result = false;

        try {

            pstmt = conn.prepareStatement("Delete from riservazioni where riservazioni.key = ?");
            pstmt.setInt(1, key);

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
            throw new DeleteReservationException(e.getMessage());
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public boolean deleteObject(String key) throws DeleteManagerException{
        PreparedStatement pstmt = null;
        boolean result = false;

        try {

            pstmt = conn.prepareStatement("Delete from oggetti where oggetti.key = ?");
            pstmt.setInt(1, Integer.parseInt(key));

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DeleteManagerException(e.getMessage());
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public boolean deleteDoc(String key) throws DeleteManagerException{
        PreparedStatement pstmt = null;
        boolean result = false;

        try {

            pstmt = conn.prepareStatement("Delete from documenti where documenti.key = ?");
            pstmt.setInt(1, Integer.parseInt(key));

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DeleteManagerException(e.getMessage());
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public boolean deleteObjFoto(String fk_Obj){
        PreparedStatement pstmt = null;
        boolean result = false;

        try {

            pstmt = conn.prepareStatement("Delete from foto where foto.fk_ogg = ?");
            pstmt.setString(1, fk_Obj);

            pstmt.execute();

            result = true;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }
        return result;
    }

    public Prezzi getPrezzi(int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Prezzi result = null;


        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("Select * from prezzi where fk_oggetto = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pstmt.setInt(1, key);


            rs = pstmt.executeQuery();
            if(rs.next()){
                result = new Prezzi();
                result.setFk_oggetto(key);
                result.setG1(rs.getDouble("g1"));
                result.setG2(rs.getDouble("g2"));
                result.setG3(rs.getDouble("g3"));
                result.setG4(rs.getDouble("g4"));
                result.setG5(rs.getDouble("g5"));
                result.setG6(rs.getDouble("g6"));
                result.setG7(rs.getDouble("g7"));
                result.setMore_g(rs.getDouble("more_g"));
                result.setM1(rs.getDouble("m1"));
                result.setM2(rs.getDouble("m2"));
                result.setM3(rs.getDouble("m3"));
                result.setM4(rs.getDouble("m4"));
                result.setM5(rs.getDouble("m5"));
                result.setM6(rs.getDouble("m6"));
                result.setM7(rs.getDouble("m7"));
                result.setM8(rs.getDouble("m8"));
                result.setM9(rs.getDouble("m9"));
                result.setM10(rs.getDouble("m10"));
                result.setM11(rs.getDouble("m11"));
                result.setM12(rs.getDouble("m12"));
                result.setMore_m(rs.getDouble("more_m"));


            }
        } catch (PSQLException psqlE) {
            System.out.println("sqlException: " + psqlE.getMessage());
        } catch (SQLException e) {
            System.out.println("sqlException: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { System.out.println("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }
        return result;
    }

    public boolean updatePrice(Prezzi p) throws UpdateDBException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pstmt = conn.prepareStatement("UPDATE prezzi SET g1 = ?, g2 = ?, g3 = ?, g4 = ?, g5 = ?, g6 = ?, g7 = ?, more_g = ?, m1 = ?, m2 = ?, m3 = ?, m4 = ?, m5 = ?, m6 = ?, m7 = ?, m8 = ?, m9 = ?, m10 = ?, m11 = ?, m12 = ?, more_m = ? where prezzi.fk_oggetto = ?");


            pstmt.setDouble(1, p.getG1());
            pstmt.setDouble(2, p.getG2());
            pstmt.setDouble(3, p.getG3());
            pstmt.setDouble(4, p.getG4());
            pstmt.setDouble(5, p.getG5());
            pstmt.setDouble(6, p.getG6());
            pstmt.setDouble(7, p.getG7());
            pstmt.setDouble(8, p.getMore_g());

            pstmt.setDouble(9, p.getM1());
            pstmt.setDouble(10, p.getM2());
            pstmt.setDouble(11, p.getM3());
            pstmt.setDouble(12, p.getM4());
            pstmt.setDouble(13, p.getM5());
            pstmt.setDouble(14, p.getM6());
            pstmt.setDouble(15, p.getM7());
            pstmt.setDouble(16, p.getM8());
            pstmt.setDouble(17, p.getM9());
            pstmt.setDouble(18, p.getM10());
            pstmt.setDouble(19, p.getM11());
            pstmt.setDouble(20, p.getM12());
            pstmt.setDouble(21, p.getMore_m());

            pstmt.setInt(22, p.getFk_oggetto());

            int rowUpdated = pstmt.executeUpdate();

            log.debug(rowUpdated);

            if(rowUpdated == 0){
                throw new UpdateDBException("Aggiornamento Banca Dati tabella manager fallito!");
            }

            result = true;

        } catch (PSQLException psqlE) {
            log.error("sqlException: " + psqlE.getMessage());
            throw new UpdateDBException(psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
                throw new UpdateDBException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

        return result;
    }

    public void updateStatusReservation(int stato, int key) throws UpdateDBException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            pstmt = conn.prepareStatement("UPDATE riservazioni SET stato=? WHERE key=?");

            log.debug("stato: " + stato);
            log.debug("key: " +key);

            pstmt.setInt(1, stato);
            pstmt.setInt(2, key);

            int rowUpdated = pstmt.executeUpdate();
            log.debug(rowUpdated);

            if(rowUpdated == 0){
                throw new UpdateDBException("Aggiornamento Banca Dati tabella riservazioni fallito!");
            }

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
                throw new UpdateDBException(psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
                throw new UpdateDBException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

    }

    public Riservazione getRiservazione(int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Riservazione r = new Riservazione();

        try {

            //pstmt = conn.prepareStatement("SELECT * FROM riservazioni where key = ?");
            pstmt = conn.prepareStatement("select *, daysleft(r.data_fine) from riservazioni as r WHERE r.key = ?");

            pstmt.setInt(1, key);

            rs = pstmt.executeQuery();

            if(rs.next()){

                r.setKey(rs.getInt("key"));
                r.setFk_oggetto(rs.getInt("fk_oggetto"));
                r.setFk_utente(rs.getString("fk_utente"));
                r.setStato(rs.getInt("stato"));
                r.setData_inizio(rs.getDate("data_inizio"));
                r.setData_fine(rs.getDate("data_fine"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));

                r.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                r.setFattura_num(rs.getString("fattura_num"));
                r.setDa_km(rs.getInt("da_km"));
                r.setA_km(rs.getInt("a_km"));
                r.setProcurato(rs.getString("procurato"));
                r.setNote(rs.getString("note"));
                r.setData_pagamento(rs.getDate("data_pagamento"));

                r.setDays(Utility.countDays(r.getData_inizio(), r.getData_fine()));
                r.setMonths(Utility.getMonths(r.getData_inizio(), r.getData_fine()));

                Prezzi prezzi = getPrezzi(r.getFk_oggetto());
                if(prezzi != null) {
                    r.setPrice(Utility.getPrice(r.getMonths(), r.getDays(), prezzi));
                }

                //add daysleft
                r.setDaysleft(rs.getInt("daysleft"));
                r.setFinal_price(rs.getDouble("prezzo_finale"));


            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return r;
    }

    public void updateReservation(Riservazione r) throws UpdateDBException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            pstmt = conn.prepareStatement("UPDATE riservazioni SET fk_oggetto=?, fk_utente=?, stato=?, data_inizio=?, data_fine=?, prezzo_finale=?, metodo_pagamento=?, fattura_num=?, da_km=?, a_km=?, procurato=?, note=?, data_pagamento=? WHERE key=?");

            log.debug("fk_oggetto: " + r.getFk_oggetto());
            log.debug("fk_utente: " + r.getFk_utente());
            log.debug("stato: " + r.getStato());
            log.debug("data_inizio: " + r.getData_inizio());
            log.debug("data_fine: " + r.getData_fine());
            log.debug("key: " + r.getKey());
            log.debug("prezzo_finale: " + r.getFinal_price());

            pstmt.setInt(1, r.getFk_oggetto());
            pstmt.setString(2, r.getFk_utente());
            pstmt.setInt(3, r.getStato());
            java.sql.Date sqlDateS = new java.sql.Date(r.getData_inizio().getTime());
            pstmt.setDate(4, sqlDateS);
            java.sql.Date sqlDateE = new java.sql.Date(r.getData_fine().getTime());
            pstmt.setDate(5, sqlDateE);
            pstmt.setDouble(6, r.getFinal_price());

            pstmt.setString(7, r.getMetodo_pagamento());
            pstmt.setString(8, r.getFattura_num());
            pstmt.setInt(9, r.getDa_km());
            pstmt.setInt(10, r.getA_km());
            pstmt.setString(11, r.getProcurato());
            pstmt.setString(12, r.getNote());

            Date dateP = r.getData_pagamento();
            if(dateP != null) {
                java.sql.Date sqlDateP = new java.sql.Date(r.getData_pagamento().getTime());
                pstmt.setDate(13, sqlDateP);
            }else {
                pstmt.setDate(13, null);
            }


            pstmt.setInt(14, r.getKey());

            int rowUpdated = pstmt.executeUpdate();
            log.debug(rowUpdated);

            if(rowUpdated == 0){
                throw new UpdateDBException("Aggiornamento Banca Dati tabella Riservazioni fallito!");
            }

        } catch (PSQLException psqlE) {
                log.error("sqlException: " + psqlE.getMessage());
                throw new UpdateDBException(psqlE.getMessage());
        } catch (SQLException e) {
                log.error("sqlException: " + e.getMessage());
                throw new UpdateDBException(e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                rs = null;
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) { log.error("sqlException: " + sqlEx.getMessage()); }
                pstmt = null;
            }
        }

    }

    /**
     * Method insertOggettoVenduto.
     * @param objV oggetto da inserire
     * @return int Ritorna la chiave dell'oggetto appena inserito
     * @throws SQLException
     */
    public int insertOggettoVenduto(OggettoVenduto oggV) throws SQLException {
        Statement stmt = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("INSERT INTO oggetti_venduti (key, data_vendita, prezzo, metodo_pagamento, fattura_num, fk_utente) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, oggV.getKey());
            java.sql.Date sqlDateDV = new java.sql.Date(oggV.getData_vendita().getTime());
            pstmt.setDate(2, sqlDateDV);
            pstmt.setInt(3, oggV.getPrezzo());
            pstmt.setString(4, oggV.getMetodo_pagamento());
            pstmt.setString(5, oggV.getFattura_num());
            pstmt.setString(6, oggV.getFk_utente());


            pstmt.execute();

            String myQuery ="Select oggetti_venduti.key from oggetti_venduti order by oggetti_venduti.key desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(myQuery);

            if(rs.next()){
                result = rs.getInt("key");
            }

        } catch (SQLException e) {
            throw e;

        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;

    }

    public int updateOggettoVenduto(OggettoVenduto obj) throws UpdateDBException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;

        try {
            //stmt = conn.createStatement();
            pstmt = conn.prepareStatement("UPDATE oggetti_venduti SET key = ?, data_vendita = ?, prezzo = ?, metodo_pagamento = ?, fattura_num = ?, fk_utente = ?  WHERE key=?");

            pstmt.setInt(1, obj.getKey());
            java.sql.Date sqlDateDV = new java.sql.Date(obj.getData_vendita().getTime());
            pstmt.setDate(2, sqlDateDV);
            pstmt.setInt(3, obj.getPrezzo());
            pstmt.setString(4, obj.getMetodo_pagamento());
            pstmt.setString(5, obj.getFattura_num());
            pstmt.setString(6, obj.getFk_utente());

            pstmt.setInt(7, obj.getKey());

            int rowUpdated = pstmt.executeUpdate();
            log.debug(rowUpdated);

            if(rowUpdated == 0){
                throw new UpdateDBException("Aggiornamento Banca Dati tabella oggetti_venduti fallito!");
            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;

    }

    public OggettoVenduto getOggettoVenduto(int key) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OggettoVenduto result = null;

        try {

            pstmt = conn.prepareStatement("Select * from oggetti_venduti where oggetti_venduti.key = ?");
            pstmt.setInt(1, key);

            rs = pstmt.executeQuery();

            if(rs.next()){
                result = new OggettoVenduto();

                result.setKey(rs.getInt("key"));
                result.setData_vendita(rs.getDate("data_vendita"));
                result.setPrezzo(rs.getInt("prezzo"));
                result.setMetodo_pagamento(rs.getString("metodo_pagamento"));
                result.setFattura_num(rs.getString("fattura_num"));
                result.setFk_utente(rs.getString("fk_utente"));

            }

        } catch (SQLException e) {
            // TODO Blocco catch generato automaticamente
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {  }

                rs = null;
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlEx) {  }

                pstmt = null;
            }
        }

        return result;
    }






}
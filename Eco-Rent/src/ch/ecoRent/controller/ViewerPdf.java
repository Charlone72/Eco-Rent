/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ch.ecoRent.controller;

import ch.ecoRent.beans.Documento;
import ch.ecoRent.beans.Foto;
import ch.ecoRent.db.DBEngine;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import org.apache.log4j.Logger;

/**
 *
 * @author Carlo Martinenghi
 */
@WebServlet("/viewPdf")
public class ViewerPdf extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private DBEngine dbe;
    private ServletContext sc;


    private Logger log = Logger.getLogger(ViewerPdf.class.getName());


    @Override
    public void init() {
        dbe = new DBEngine();
        sc = getServletConfig().getServletContext();
        log.debug("init Controller!");
    }

     @Override
     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {

         response.setContentType("application/pdf");
         int key = Integer.parseInt(request.getParameter("key"));

         log.debug("key:" + key);
         try {
             log.debug("recupero doc da DB");

             Documento d = dbe.getDocumento(key);

             if(d == null ){
                 log.debug("doc = null, documento non trovato");
             }else {

                 byte [] rb = null;
                 InputStream readImg = null;
                 int index = 0;

                 rb = new byte[d.getDocumento().available()];
                 readImg = d.getDocumento();
                 index = readImg.read(rb, 0, d.getDocumento().available());
                 log.debug("indexRead =" + index);

                 response.reset();
                 response.setContentType("application/pdf");
                 response.getOutputStream().write(rb,0,index);
                 response.getOutputStream().flush();
                 log.debug("endFlush");
              }
         } catch (Exception e) {
             log.error("file non presente nel DB");
             log.error("eccezione: " + e.getMessage());
             log.error("eccezione: " + e.toString());

         }
     }

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException {
        doGet(request, response);
    }
 }

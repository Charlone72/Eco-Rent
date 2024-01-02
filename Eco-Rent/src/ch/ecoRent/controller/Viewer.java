/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ch.ecoRent.controller;

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
@WebServlet("/view")
public class Viewer extends HttpServlet {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private DBEngine dbe;
    private ServletContext sc;


    private Logger log = Logger.getLogger(Viewer.class.getName());


    @Override
    public void init() {
        dbe = new DBEngine();
        sc = getServletConfig().getServletContext();
        log.debug("init Controller!");
    }

     @Override
     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {

         response.setContentType("image/jpg");
         int key = Integer.parseInt(request.getParameter("fk_ogg"));
         int num = Integer.parseInt(request.getParameter("num"));

         log.debug("fk_oggetto:" + key);
         log.debug("num:" + num);
         try {
             log.debug("recupero foto da DB");

             Foto f = dbe.getPhotoFromV(num, key);
             log.debug("foto num: " + num + ", fk_ogg: " + key);
             if(f == null ){
                 f = dbe.getPhotoFromV(0, 0);
             }

             byte [] rb = null;
             InputStream readImg = null;
             int index = 0;

             rb = new byte[f.getFoto().available()];
             readImg = f.getFoto();
             index = readImg.read(rb, 0, f.getFoto().available());

             response.reset();
             response.setContentType("image/jpg");
             response.getOutputStream().write(rb,0,index);
             response.getOutputStream().flush();

         } catch (Exception e) {
             log.error("file non presente nel DB");
             log.error("eccezione: " + e.getMessage());
             log.error("eccezione: " + e.toString());
             log.error("foto num: " + num + "-fk_ogg: " + key);
         }
     }

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException {
        doGet(request, response);
    }
 }

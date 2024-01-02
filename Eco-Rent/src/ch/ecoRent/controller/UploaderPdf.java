package ch.ecoRent.controller;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ch.ecoRent.beans.Documento;
import ch.ecoRent.beans.Riservazione;
import ch.ecoRent.db.DBEngine;
import ch.ecoRent.utility.WriterPDF;

//import org.apache.log4j.Logger;

/**
 * @version     1.0
 * @author Carlo Martinenghi
 */
@WebServlet("/UploaderPdf")
public class UploaderPdf extends javax.servlet.http.HttpServlet
{
    /**
     *
     */
    private static final long serialVersionUID = 5456237382635788835L;
    public HttpSession session;
    private DBEngine dbe = new DBEngine();
    private WriterPDF writerPdf = new WriterPDF();
    private String path;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        performTask(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        performTask(request, response);
    }

    public void init() {
        String os = null;
        os = getServletContext().getInitParameter("ecoRentOS");

        //in base al sistema operativo prendo il path di dove è installato ImmoWeb
        if(os != null && os.equalsIgnoreCase("windows")){
            path = getServletContext().getInitParameter("ecoRentPath_Win");
        }else if(os != null && os.equalsIgnoreCase("linux")){
            path = getServletContext().getInitParameter("ecoRentPath_Linux");
        }else{
            System.out.println("lettura parametri web.xml errata!");
        }

        dbe = new DBEngine();

    }


    public void performTask(HttpServletRequest request, HttpServletResponse response)
    {


        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        session = request.getSession();

        if (isMultipart){

            //Scrivo doc sul file system e sul DB
            Documento c = null;
            try {
                c = writerPdf.writeFile(request, path);
                if(c != null){
                    System.out.println("Contratto inserito o modificato");
                    /*Documento d = null;
                    if(c.getKey() != null) {
                        d = dbe.getDocumento(c.getKey());
                    }*/

                    List<Documento> documenti = null;
                    documenti = dbe.getDocumenti(c.getFk_tabella(), c.getTabella());//potrebbe avere una lista di documenti tipo riservazione (contratto, fattura ecc...)


                    request.setAttribute("Tabella", c.getTabella());
                    request.setAttribute("FK_Tabella", c.getFk_tabella());
                    request.setAttribute("Documenti", documenti);

                    try {
                        //request.getRequestDispatcher(response.encodeURL("manager/uploadPdf.jsp")).forward(request, response);
                        request.getRequestDispatcher(response.encodeURL("manager/listDocs.jsp")).forward(request, response);

                        return;
                    } catch (Throwable e) {
                        String msg1 = "Il doc non è stato inserito!!";
                        request.setAttribute("msg1", msg1);

                        String msg2 = "vedi logs";
                        request.setAttribute("msg1", msg2);
                        try {
                            request.getRequestDispatcher(response.encodeURL("manager/managerError.jsp")).forward(request, response);
                            return;
                        } catch (Throwable e1) {
                            e1.printStackTrace();
                        }
                    }
                }else{

                    String msg1 = "Il doc non è stato inserito!!";
                    request.setAttribute("msg1", msg1);

                    String msg2 = "vedi logs!!";
                    request.setAttribute("msg1", msg2);

                    try {
                        request.getRequestDispatcher(response.encodeURL("manager/managerError.jsp")).forward(request, response);
                        return;
                    } catch (Throwable e) {
                        e.printStackTrace();
                    }
                }
            } catch (ParseException e1) {
                String msg1 = "Il doc non è stato inserito!!";
                request.setAttribute("msg1", msg1);

                String msg2 = "problemi con la data";
                request.setAttribute("msg1", msg2);
                try {
                    request.getRequestDispatcher(response.encodeURL("manager/managerError.jsp")).forward(request, response);
                    return;
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }

        }else{
            System.out.println("non è un fileUpload!");
        }
    }
}



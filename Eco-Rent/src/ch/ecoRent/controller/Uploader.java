package ch.ecoRent.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ch.ecoRent.beans.Foto;
import ch.ecoRent.beans.ListaFoto;
import ch.ecoRent.db.DBEngine;
import ch.ecoRent.utility.WriterFile;
import ch.ecoRent.beans.Oggetto;

//import org.apache.log4j.Logger;

/**
 * @version     1.0
 * @author Carlo Martinenghi
 */
@WebServlet("/Uploader")
public class Uploader extends javax.servlet.http.HttpServlet
{
    /**
     *
     */
    private static final long serialVersionUID = 5456237382631788835L;
    public HttpSession session;
    private DBEngine dbe = new DBEngine();
    //private Boolean isAdmin = new Boolean(false);
    private WriterFile writerFile = new WriterFile();
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

            //Scrivo foto sul file system e sul DB
            Foto f = writerFile.writeFile(request, path);
            if(f != null){
                System.out.println("foto inserita o modificata");
                Oggetto o = dbe.getOggetto("" + f.getFk_oggetto());

                ArrayList<Foto> list = dbe.getListaFoto(f.getFk_oggetto());
                ListaFoto listaF = new ListaFoto();
                listaF.setListaFoto(list);

                request.setAttribute("foto", listaF);
                request.setAttribute("Oggetto", o);

                try {

                    if (f.getNumero() == 0){
                        request.getRequestDispatcher(response.encodeURL("manager/main.jsp")).forward(request, response);
                    }else{
                        request.getRequestDispatcher(response.encodeURL("manager/photoManagement.jsp")).forward(request, response);
                    }

                    return;
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }else{

                String msg1 = "Le foto non sono state inserite!!";
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
        }else{
            System.out.println("non è un fileUpload!");
        }
    }
}



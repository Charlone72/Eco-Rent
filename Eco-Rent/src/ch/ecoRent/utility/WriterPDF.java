/*
 * Created on 21-dic-2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package ch.ecoRent.utility;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ch.ecoRent.beans.Documento;
import ch.ecoRent.beans.Foto;
import ch.ecoRent.db.DBEngine;

//http://jakarta.apache.org/commons/fileupload/using.html

/**
 * @author MartinC
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class WriterPDF {
    private DBEngine dbe = new DBEngine();

    private FileItemFactory factory = new DiskFileItemFactory();
    private ServletFileUpload uploader = new ServletFileUpload(factory);

    //if return null is an error!!!
    //inserisce i files nel FS e nel DB
    public Documento writeFile(HttpServletRequest request, String path) throws ParseException{
        String command = null;

        Documento c = new Documento();
        String myPath = null;
        String key=null;

        List<FileItem> fileItemsList = null;
        try {
            fileItemsList = uploader.parseRequest(request);

        } catch (FileUploadException e) {
            e.printStackTrace();
        } /* FileItem */

        Iterator<FileItem> iter = fileItemsList.iterator();
        while (iter.hasNext()) {
            FileItem item = iter.next();

            if (item.isFormField()) {
                if(item.getFieldName().equals("fk_tabella")){
                    c.setFk_tabella(Integer.parseInt(item.getString()));
                }else if(item.getFieldName().equals("dataDocumento")){
                    String d = item.getString();
                    Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(d);
                    c.setDataDocumento(date1);
                }else if(item.getFieldName().equals("tipo")){
                    String tipo = item.getString();
                    c.setTipo(tipo);
                }else if(item.getFieldName().equals("tabella")){
                    String tabella = item.getString();
                    c.setTabella(tabella);
                }else if(item.getFieldName().equals("Command")){
                    command = item.getString();
                }else if(item.getFieldName().equals("key")){
                    key = item.getString();
                }
            }else if(item.getFieldName().equals("document")){
                myPath = path + "\\\\"+ "PDF_" + c.getTabella() + "_" + c.getFk_tabella() + ".pdf";

                //inserisco i files nel FS
                if(processUploadedFile(item, myPath)){
                    //do nothing
                    /*Resize resizer = new Resize();
                    resizer.doResize(myPath, myPathNormal, 400, -1);
                    resizer.doResize(myPath, myPathPreview, 112, -1);
                    resizer = null;*/
                }else{
                    c = null;
                }
            }
        }

        //inserisco i dati delle foto nel DB
        if(command != null && command.equals("updatePdf")){
            File documento = new File(myPath);
            c.setKey(Integer.parseInt(key));
            dbe.updateDocumento(c, documento);
            documento.delete();
            deleteFile(c, path);
        }else if(command != null && command.equals("newPdf")){
            //carico le foto con i file
            File documento = new File(myPath);
            dbe.setDocumento(c, documento);
            //cancello le foto dal fileSystem
            documento.delete();
            deleteFile(c, path);

        }else if(command != null && command.equals("newPdfNotFound")){
            //carico le foto con i file
            File documento = new File(myPath);

            dbe.setDocumento(c, documento);

            //cancello le foto dal fileSystem
            documento.delete();

            deleteFile(c, path);

        }else{
            deleteFile(c, path);
            c = null;
        }

        return c;
    }

    public boolean processUploadedFile(FileItem item, String path){
        boolean result = false;
           File uploadedFile = new File(path);

           if(item.getName() == null || item.getName().equals("")){
               result = false;
           }else{
               try {
                //salvo il file nel fileSystem
                item.write(uploadedFile);
                result = true;
            } catch (Exception e) {
                // TODO Blocco catch generato automaticamente
                e.printStackTrace();
                result = false;
            }
           }


        return result;
    }

    public void deleteFile(Documento c, String path){
        //String pathN = path + c.getKey() + "_" + c.getFk_riservazione() + ".pdf";
        String pathN = path + c.getKey() + "_" + c.getTabella() + "_" + c.getFk_tabella() + ".pdf";
        File fileN = new File(pathN);
        fileN.delete();

    }


    public static void main(String[] args) {
        WriterPDF me = new WriterPDF();
        //me.deleteFile("");
    }


}



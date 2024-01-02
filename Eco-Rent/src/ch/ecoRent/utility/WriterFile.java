/*
 * Created on 21-dic-2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package ch.ecoRent.utility;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ch.ecoRent.beans.Foto;
import ch.ecoRent.db.DBEngine;

//http://jakarta.apache.org/commons/fileupload/using.html

/**
 * @author MartinC
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class WriterFile {
    private DBEngine dbe = new DBEngine();

    private FileItemFactory factory = new DiskFileItemFactory();
    private ServletFileUpload uploader = new ServletFileUpload(factory);

    //if return null is an error!!!
    //inserisce i files nel FS e nel DB
    public Foto writeFile(HttpServletRequest request, String path){
        String Command = null;

        Foto f = new Foto();
        String myPath = null;


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
                if(item.getFieldName().equals("fk_obj")){
                    f.setFk_oggetto(Integer.parseInt(item.getString()));
                }else if(item.getFieldName().equals("numero")){
                    f.setNumero(Integer.parseInt(item.getString()));
                }else if(item.getFieldName().equals("descrizione")){
                    f.setDescrizione(item.getString());
                }else if(item.getFieldName().equals("Command")){
                    Command = item.getString();
                }
            }else if(item.getFieldName().equals("image")){
                myPath = path + f.getFk_oggetto() + "_" + f.getNumero() + ".jpg";

                //inserisco i files nel FS
                if(processUploadedFile(item, myPath)){
                    //do nothing
                    /*Resize resizer = new Resize();
                    resizer.doResize(myPath, myPathNormal, 400, -1);
                    resizer.doResize(myPath, myPathPreview, 112, -1);
                    resizer = null;*/
                }else{
                    f = null;
                }
            }
        }

        //inserisco i dati delle foto nel DB
        if(Command != null && Command.equals("updatePhoto")){
            File foto = new File(myPath);
            dbe.updateFoto(f, foto);
            foto.delete();
            deleteFile(f, path);
        }else if(Command != null && Command.equals("newPhoto")){
            //carico le foto con i file
            File foto = new File(myPath);
            dbe.setFoto(f, foto);
            //cancello le foto dal fileSystem
            foto.delete();
            deleteFile(f, path);

        }else if(Command != null && Command.equals("newFotoNotFound")){
            //carico le foto con i file
            File foto = new File(myPath);

            dbe.setFoto(f, foto);

            //cancello le foto dal fileSystem
            foto.delete();

            deleteFile(f, path);

        }else{
            deleteFile(f, path);
            f = null;
        }

        return f;
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

    public void deleteFile(Foto f, String path){
        String pathN = path + f.getFk_oggetto() + "_" + f.getNumero() + ".jpg";
        File fileN = new File(pathN);
        fileN.delete();

    }


    public static void main(String[] args) {
        WriterFile me = new WriterFile();
        //me.deleteFile("");
    }


}



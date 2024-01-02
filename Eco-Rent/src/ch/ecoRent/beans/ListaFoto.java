package ch.ecoRent.beans;

import java.util.ArrayList;

/**
 * @author Carlo
 *
 * Per modificare il modello associato al commento di questo tipo generato, aprire
 * Finestra&gt;Preferenze&gt;Java&gt;Generazione codice&gt;Codice e commenti
 */
public class ListaFoto {

    private ArrayList<Foto> listaFoto = null;

    public void setFoto(Foto obj){
        listaFoto.add(obj);
    }

    public void setListaFoto(ArrayList<Foto> listaFoto){
        this.listaFoto = listaFoto;
    }

    public ArrayList<Foto> getListaFoto(){

        return this.listaFoto;
    }
}

package ch.ecoRent.beans;

import java.io.InputStream;

/**
 * @author Carlo
 *
 * Per modificare il modello associato al commento di questo tipo generato, aprire
 * Finestra&gt;Preferenze&gt;Java&gt;Generazione codice&gt;Codice e commenti
 */
public class Foto {

    private int fk_oggetto;
    private int numero;
    private String descrizione;
    private InputStream foto;


    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }



    /**
     * @return
     */
    public String getDescrizione() {
        return descrizione;
    }


    /**
     * @return
     */
    public int getFk_oggetto() {
        return fk_oggetto;
    }

    /**
     * @return
     */
    public int getNumero() {
        return numero;
    }

    /**
     * @param string
     */
    public void setDescrizione(String string) {
        descrizione = string;
    }



    /**
     * @param i
     */
    public void setFk_oggetto(int i) {
        fk_oggetto = i;
    }

    /**
     * @param i
     */
    public void setNumero(int i) {
        numero = i;
    }

}


package ch.ecoRent.beans;

/**
 * @author Carlo
 *
 * Per modificare il modello associato al commento di questo tipo generato, aprire
 * Finestra&gt;Preferenze&gt;Java&gt;Generazione codice&gt;Codice e commenti
 */
public class Oggetto {





    private int key;
    private String nome;
    private String marca;
    private String tipo;
    private String descrizione;
    private String specifiche;
    private String anno;
    private String varie;
    private double earning;
    private boolean funzionante;
    private boolean venduto;


    public boolean isVenduto() {
        return venduto;
    }


    public void setVenduto(boolean venduto) {
        this.venduto = venduto;
    }


    public double getEarning() {
        return earning;
    }


    public void setEarning(double earning) {
        this.earning = earning;
    }


    public static void main(String[] args) {
    }


    public int getKey() {
        return key;
    }



    public void setKey(int key) {
        this.key = key;
    }



    public String getNome() {
        return nome;
    }



    public void setNome(String nome) {
        this.nome = nome;
    }



    public String getMarca() {
        return marca;
    }



    public void setMarca(String marca) {
        this.marca = marca;
    }



    public String getTipo() {
        return tipo;
    }



    public void setTipo(String tipo) {
        this.tipo = tipo;
    }



    public String getDescrizione() {
        return descrizione;
    }



    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }



    public String getSpecifiche() {
        return specifiche;
    }



    public void setSpecifiche(String specifiche) {
        this.specifiche = specifiche;
    }



    public String getAnno() {
        return anno;
    }



    public void setAnno(String anno) {
        this.anno = anno;
    }



    public String getVarie() {
        return varie;
    }



    public void setVarie(String varie) {
        this.varie = varie;
    }


    public boolean isFunzionante() {
        return funzionante;
    }


    public void setFunzionante(boolean funzionante) {
        this.funzionante = funzionante;
    }
}

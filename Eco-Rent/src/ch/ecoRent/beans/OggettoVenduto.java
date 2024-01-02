
package ch.ecoRent.beans;

import java.util.Date;

/**
 * @author Carlo
 *
 * Per modificare il modello associato al commento di questo tipo generato, aprire
 * Finestra&gt;Preferenze&gt;Java&gt;Generazione codice&gt;Codice e commenti
 */
public class OggettoVenduto {

    private int key;
    private Date data_vendita;
    private Integer prezzo;
    private String metodo_pagamento;
    private String fattura_num;
    private String fk_utente;

    public int getKey() {
        return key;
    }
    public void setKey(int key) {
        this.key = key;
    }

    public Date getData_vendita() {
        return data_vendita;
    }
    public void setData_vendita(Date data_vendita) {
        this.data_vendita = data_vendita;
    }
    public Integer getPrezzo() {
        return prezzo;
    }
    public void setPrezzo(Integer prezzo) {
        this.prezzo = prezzo;
    }
    public String getMetodo_pagamento() {
        return metodo_pagamento;
    }
    public void setMetodo_pagamento(String metodo_pagamento) {
        this.metodo_pagamento = metodo_pagamento;
    }
    public String getFattura_num() {
        return fattura_num;
    }
    public void setFattura_num(String fattura_num) {
        this.fattura_num = fattura_num;
    }
    public String getFk_utente() {
        return fk_utente;
    }
    public void setFk_utente(String fk_utente) {
        this.fk_utente = fk_utente;
    }



}

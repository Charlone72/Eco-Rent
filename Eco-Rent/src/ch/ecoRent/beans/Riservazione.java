/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ch.ecoRent.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Charly
 */
public class Riservazione {
    private Integer key;
    private Integer fk_oggetto;
    private String fk_utente;
    private Integer stato;
    private Date data_inizio;
    private Date data_fine;
    private String metodo_pagamento;
    private String fattura_num;
    private int da_km;
    private int a_km;
    private String procurato;
    private String note;
    private Date data_pagamento;

    private long days;
    private double months;
    private double final_price;//present in table, is price present in contract!
    private double price;//price calculated from Prezzi, possible not final price!
    private String mese_inizio;//warning calendar start month with 0 and not 1
    private String mese_fine;//warning calendar start month with 0 and not 1
    private Integer daysleft;



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
    public Integer getDa_km() {
        return da_km;
    }
    public void setDa_km(Integer da_km) {
        this.da_km = da_km;
    }
    public Integer getA_km() {
        return a_km;
    }
    public void setA_km(Integer a_km) {
        this.a_km = a_km;
    }
    public String getProcurato() {
        return procurato;
    }
    public void setProcurato(String procurato) {
        this.procurato = procurato;
    }
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    public void setMese_inizio(String mese_inizio) {
        this.mese_inizio = mese_inizio;
    }
    public void setMese_fine(String mese_fine) {
        this.mese_fine = mese_fine;
    }
    public Integer getDaysleft() {
        return daysleft;
    }
    public void setDaysleft(Integer daysleft) {
        this.daysleft = daysleft;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public Integer getKey() {
        return key;
    }
    public void setKey(Integer key) {
        this.key = key;
    }
    public Integer getFk_oggetto() {
        return fk_oggetto;
    }
    public void setFk_oggetto(Integer fk_oggetto) {
        this.fk_oggetto = fk_oggetto;
    }
    public String getFk_utente() {
        return fk_utente;
    }
    public void setFk_utente(String fk_utente) {
        this.fk_utente = fk_utente;
    }
    public Integer getStato() {
        return stato;
    }
    public void setStato(Integer stato) {
        this.stato = stato;
    }
    public Date getData_inizio() {
        return data_inizio;
    }
    public void setData_inizio(Date data_inizio) {
        this.data_inizio = data_inizio;
        String pattern = "MM";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String dateI = simpleDateFormat.format(data_inizio);
        this.mese_inizio = fixMonthForCalendar(dateI);
    }
    public Date getData_fine() {
        return data_fine;
    }
    public void setData_fine(Date data_fine) {
        this.data_fine = data_fine;
        String pattern = "MM";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String dateF = simpleDateFormat.format(data_fine);
        this.mese_fine = fixMonthForCalendar(dateF);
    }
    public long getDays() {
        return days;
    }
    public void setDays(long days) {
        this.days = days;
    }


    public String getMese_inizio() {
        return mese_inizio;
    }

    public String getMese_fine() {
        return mese_fine;
    }

    public double getMonths() {
        return months;
    }

    public void setMonths(double months) {
        this.months = months;
    }

    private String fixMonthForCalendar(String month) {
        int monthInt = Integer.parseInt(month);
        int fixedMonth = monthInt - 1;
        String value = Integer.toString(fixedMonth);
        String padded="00".substring(value.length()) + value;
        return padded;
    }

    public double getFinal_price() {
        return final_price;
    }

    public void setFinal_price(double final_price) {
        this.final_price = final_price;
    }
    public Date getData_pagamento() {
        return data_pagamento;
    }
    public void setData_pagamento(Date data_pagamento) {
        this.data_pagamento = data_pagamento;
    }

}

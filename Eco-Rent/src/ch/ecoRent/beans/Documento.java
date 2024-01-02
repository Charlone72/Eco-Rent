package ch.ecoRent.beans;



import java.io.InputStream;
import java.util.Date;

/**
 *
 * @author Charly
 */
public class Documento {
    private Integer key;
    private Integer fk_tabella;
    private Date dataDocumento;
    private InputStream documento;
    private String tipo;
    private String tabella;
    public Integer getKey() {
        return key;
    }
    public void setKey(Integer key) {
        this.key = key;
    }
    public Integer getFk_tabella() {
        return fk_tabella;
    }
    public void setFk_tabella(Integer fk_tabella) {
        this.fk_tabella = fk_tabella;
    }
    public Date getDataDocumento() {
        return dataDocumento;
    }
    public void setDataDocumento(Date dataDocumento) {
        this.dataDocumento = dataDocumento;
    }
    public InputStream getDocumento() {
        return documento;
    }
    public void setDocumento(InputStream documento) {
        this.documento = documento;
    }
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public String getTabella() {
        return tabella;
    }
    public void setTabella(String tabella) {
        this.tabella = tabella;
    }





}

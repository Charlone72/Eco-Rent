/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ch.ecoRent.beans;

/**
 *
 * @author ex93115
 */
public class Manager {
    private String nome;
    private String password;
    private int diritti = 0;
    private String email;
    private boolean infoPre;


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isInfoPre() {
        return infoPre;
    }

    public void setInfoPre(boolean infoPre) {
        this.infoPre = infoPre;
    }

    public int getDiritti() {
        return diritti;
    }

    public void setDiritti(int diritti) {
        this.diritti = diritti;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}

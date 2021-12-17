/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanPack;

import java.io.Serializable;

/**
 *
 * @author lenova
 */
public class User implements Serializable {

    private String email;
    private String password;
    private String userType;
    private String nameSurname;
    private String ehliyet;
    private String dogumTarih;

    public User() {

    }

    public User(String email, String password, String userType) {
        this.email = email;
        this.password = password;
        this.userType = userType;
    }

    public User(String email, String password, String userType, String nameSurname, String ehliyet, String dogumTarih) {
        this.email = email;
        this.password = password;
        this.userType = userType;
        this.nameSurname = nameSurname;
        this.ehliyet = ehliyet;
        this.dogumTarih = dogumTarih;
    }

    public String getNameSurname() {
        return nameSurname;
    }

    public void setNameSurname(String nameSurname) {
        this.nameSurname = nameSurname;
    }

    public String getEhliyet() {
        return ehliyet;
    }

    public void setEhliyet(String ehliyet) {
        this.ehliyet = ehliyet;
    }

    public String getDogumTarih() {
        return dogumTarih;
    }

    public void setDogumTarih(String dogumTarih) {
        this.dogumTarih = dogumTarih;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

}

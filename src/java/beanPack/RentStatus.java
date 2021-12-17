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
public class RentStatus implements Serializable {

    private String startDate1;
    private String endDate1;
    private String rentPrice;
    private String rentContent;
    private int day;
    private String model1;
    private String price;
    private String email1;
    private String rentStatus;
    private String plata;
    private int idrentList;

    public RentStatus() {

    }

    public RentStatus(String startDate1, String endDate1, String rentPrice, String rentContent, int day, String model1, String price, String email1, String rentStatus, String plata, int idrentList) {
        this.startDate1 = startDate1;
        this.endDate1 = endDate1;
        this.rentPrice = rentPrice;
        this.rentContent = rentContent;
        this.day = day;
        this.model1 = model1;
        this.price = price;
        this.email1 = email1;
        this.rentStatus = rentStatus;
        this.plata = plata;
        this.idrentList = idrentList;
    }

    public int getIdrentList() {
        return idrentList;
    }

    public void setIdrentList(int idrentList) {
        this.idrentList = idrentList;
    }

    public String getPlata() {
        return plata;
    }

    public void setPlata(String plata) {
        this.plata = plata;
    }

    public String getStartDate1() {
        return startDate1;
    }

    public void setStartDate1(String startDate1) {
        this.startDate1 = startDate1;
    }

    public String getEndDate1() {
        return endDate1;
    }

    public void setEndDate1(String endDate1) {
        this.endDate1 = endDate1;
    }

    public String getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(String rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getRentContent() {
        return rentContent;
    }

    public void setRentContent(String rentContent) {
        this.rentContent = rentContent;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getModel1() {
        return model1;
    }

    public void setModel1(String model1) {
        this.model1 = model1;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getRentStatus() {
        return rentStatus;
    }

    public void setRentStatus(String rentStatus) {
        this.rentStatus = rentStatus;
    }

}

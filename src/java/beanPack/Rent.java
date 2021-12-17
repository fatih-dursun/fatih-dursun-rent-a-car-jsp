/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanPack;

/**
 *
 * @author lenova
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.Serializable;

/**
 *
 * @author lenova
 */
public class Rent implements Serializable {

    private String uid;
    private String cid;
    private String startDate;
    private String endDate;
    private String rentPrice;
    private String rentContent;
    private String carName;
    private String rentStatus;
    private int day;

    public Rent() {

    }

    public Rent(String cid, String startDate, String endDate, String rentPrice, int day, String carName) {
        this.cid = cid;
        this.startDate = startDate;
        this.endDate = endDate;
        this.rentPrice = rentPrice;
        this.day = day;
        this.carName = carName;
    }

    public String getRentStatus() {
        return rentStatus;
    }

    public void setRentStatus(String rentStatus) {
        this.rentStatus = rentStatus;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
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

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

}

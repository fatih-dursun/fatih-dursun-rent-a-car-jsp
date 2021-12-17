/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beanPack;

import java.io.InputStream;
import java.io.Serializable;

/**
 *
 * @author lenova
 */
public class Car implements Serializable {

    private String model;
    private String years;
    private String gear;
    private String price;
    private String fuel;
    private String plata;
    private InputStream inputStream;
    private String encode;
    private byte[] inputStreams;

    public Car() {

    }

    public Car(String model, String years, String gear, String fuel, String price, String plata, InputStream inputStream) {
        this.model = model;
        this.years = years;
        this.gear = gear;
        this.price = price;
        this.fuel = fuel;
        this.plata = plata;
        this.inputStream = inputStream;
    }

    public Car(String model, String years, String gear, String fuel, String price, String plata) {
        this.model = model;
        this.years = years;
        this.gear = gear;
        this.price = price;
        this.fuel = fuel;
        this.plata = plata;
    }

    public byte[] getInputStreams() {
        return inputStreams;
    }

    public void setInputStreams(byte[] inputStreams) {
        this.inputStreams = inputStreams;
    }

    public Car(String model, String years, String gear, String fuel, String price, String plata, byte[] inputStreams) {
        this.model = model;
        this.years = years;
        this.gear = gear;
        this.price = price;
        this.fuel = fuel;
        this.plata = plata;
        this.inputStreams = inputStreams;

    }

    public String getEncode() {
        return encode;
    }

    public void setEncode(String encode) {
        this.encode = encode;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years;
    }

    public String getGear() {
        return gear;
    }

    public void setGear(String gear) {
        this.gear = gear;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public String getPlata() {
        return plata;
    }

    public void setPlata(String plata) {
        this.plata = plata;
    }

}

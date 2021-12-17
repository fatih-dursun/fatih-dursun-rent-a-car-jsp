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
public class Feature implements Serializable {

    private String property;
    private String information;
    private InputStream inputStream;
    private String encode;

    public Feature() {
    }

    public Feature(String property, String information) {
        this.property = property;
        this.information = information;
    }

    public String getEncode() {
        return encode;
    }

    public void setEncode(String encode) {
        this.encode = encode;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

}

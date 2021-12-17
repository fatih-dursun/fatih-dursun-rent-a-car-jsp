package beanPack;

import java.io.Serializable;
import java.text.NumberFormat;

public class Product implements Serializable {

    private String plata;
    private String model;
    private String price;

    public Product() {
        plata = "";
        model = "";
        price = "";
    }

    public String getPlata() {
        return plata;
    }

    public void setPlata(String plata) {
        this.plata = plata;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPriceCurrencyFormat() {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(price);
    }
}

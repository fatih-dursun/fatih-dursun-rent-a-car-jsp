/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beanPack.Car;
import db.CarDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenova
 */
@MultipartConfig(maxFileSize = 16177215)
public class Cars extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String carPlata = request.getParameter("carPlata");
        Car car = new Car();
        car = CarDB.createCare(carPlata);
        String model = car.getModel();
        String years = car.getYears();
        String gear = car.getGear();
        String fuel = car.getFuel();
        String price = car.getPrice();
        String photo = car.getEncode();
        String startDate = request.getParameter("startDate ");
        String endDate = request.getParameter("endDate ");

        request.setAttribute("model", model);
        request.setAttribute("years", years);
        request.setAttribute("gear", gear);
        request.setAttribute("fuel", fuel);
        request.setAttribute("price", price);
        request.setAttribute("photo", photo);
        request.setAttribute("plata", carPlata);

        Cookie cModel = new Cookie("cModel", model);
        cModel.setMaxAge(60 * 60 * 24);
        response.addCookie(cModel);

        Cookie cPrice = new Cookie("cPrice", price);
        cPrice.setMaxAge(60 * 60 * 24);
        response.addCookie(cPrice);

        Cookie cPlata = new Cookie("cPlata", carPlata);
        cPlata.setMaxAge(60 * 60 * 24);
        response.addCookie(cPlata);

        getServletContext()
                .getRequestDispatcher("/car.jsp")
                .forward(request, response);
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}

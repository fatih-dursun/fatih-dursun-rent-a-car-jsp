/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beanPack.Car;
import beanPack.Rent;
import db.CarDB;
import db.UserDB;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CarRent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String plata = request.getParameter("plata");
        String price = request.getParameter("price");
        String startRent = request.getParameter("startRent");
        String endRent = request.getParameter("endRent");
        String message = "";
        String url = "";
        int d = 0;
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
        String inputString1 = startRent;
        String inputString2 = endRent;
        HttpSession session = request.getSession();
        ArrayList<Rent> carRentList = (ArrayList<Rent>) session.getAttribute("carRentList");

        if (action.equals("statusRentCar")) {
            if (startRent.isEmpty() || startRent == null || endRent.isEmpty() || endRent == null) {
                message = "Kiralama başlangıç ve bitiş tarihini seçin.";
                url = "/Car?carPlata=" + plata;
            } else {

                try {
                    java.util.Date date1 = myFormat.parse(inputString1);
                    java.util.Date date2 = myFormat.parse(inputString2);
                    long diff = date2.getTime() - date1.getTime();
                    d = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                int cd = CarDB.cidRentCar(plata);
                String cid = Integer.toString(cd);
                int statusRentCar = CarDB.statusRentCar(startRent, endRent, cid);
                if (statusRentCar < 1) {
                    int day = d;
                    int subPrice = Integer.parseInt(price) * day;
                    String strSubPrice = String.valueOf((subPrice));
                    Car car = new Car();
                    car = CarDB.createCare(plata);
                    String carName = car.getModel();
                    Rent rent = new Rent(cid, startRent, endRent, strSubPrice, day, carName);
                    if (carRentList == null) {
                        carRentList = new ArrayList<Rent>();
                        carRentList.add(rent);
                        session.setAttribute("carRentList", carRentList);
                    } else {
                        carRentList.add(rent);

                    }

                    url = "/cart.jsp";
                } else {
                    message = "Araç seçilen tarihlerde müsait değil.";
                    url = "/Car?carPlata=" + plata;
                }
            }
        } else if (action.equals("carDeleteList")) {
            int indis = Integer.parseInt(request.getParameter("indisCarList"));
            carRentList.remove(indis);
            session.setAttribute("carRentList", carRentList);
            url = "/cart.jsp";
        } else if (action.equals("rentFinish")) {
            Cookie cookie = null;
            Cookie[] cookies = null;

            String cdurum = "";

            // Get an array of Cookies associated with the this domain
            cookies = request.getCookies();

            if (cookies != null) {

                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if (cookie.getName().equals("durum")) {
                        cdurum = cookie.getValue().toString();
                    }
                }
            }

            if (cdurum.equals("logged-in")) {
                url = "/cartRentDetails.jsp";
            } else {
                message = "Devam Edebilmek İçin Lütfen Giriş Yapın Üye Değilseniz Kayıt Olun.<a href=\"/login-register.jsp\">Giriş Yap / Kayıt Ol</a>";
                url = "/cart.jsp";
            }

            session.setAttribute("carRentList", carRentList);

        } 
        else if (action.equals("rentInsert")) {
            int rentCount = carRentList.size();
            Cookie cookie = null;
            Cookie[] cookies = null;

            String cdurum = "";
            String cUserEmail = "";

            cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if (cookie.getName().equals("durum")) {
                        cdurum = cookie.getValue().toString();
                    } else if (cookie.getName().equals("cookiesUserEmail")) {
                        cUserEmail = cookie.getValue().toString();
                    }
                }
            }
            int uid = UserDB.uidRentCar(cUserEmail);
            int succesCount = 0;
            String rentContent = request.getParameter("carRentContent");
            if (rentContent == null) {
                rentContent = "Ofis Alis birakis Saat 10:00";
            } else {

            }
            if (cdurum.equals("logged-in")) {
                for (int i = 0; i < rentCount; i++) {
                    Rent rent = carRentList.get(i);
                    int rentStatus = 0;
                    succesCount = succesCount + CarDB.insertRentaCar(rent, uid, rentContent, rentStatus);
                }
                if (succesCount == rentCount) {
                    carRentList.clear();
                    message = "Araçlar Başarıyla Kiralandi. İsteginiz onaylandiktan sonra telefonla iletisime gecilecek."
                            + "Kiraladiginiz arabalarin durumunu profilinizden gorebilirsiniz.";
                    session.setAttribute("carRentList", carRentList);
                    url = "/successRent.jsp";
                } else {
                    message = "Araçlar Kiralanamadi Lütfen Telefon İle İletişime Geçin.";
                    url = "/successRent.jsp";
                }

            } else {
                message = "Devam Edebilmek İçin Lütfen Giriş Yapın Üye Değilseniz Kayıt Olun.<a href=\"/login-register.jsp\">Giriş Yap / Kayıt Ol</a>";
                url = "/cart.jsp";
            }

            session.setAttribute("carRentList", carRentList);

        } else if (action.equals("searchRent")) {
            ArrayList<Integer> cidAllList = new ArrayList<Integer>();
            ArrayList<Integer> musaitCidAll = new ArrayList<Integer>();
            ArrayList<Integer> kiralanmisAraclarCid = new ArrayList<Integer>();
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            kiralanmisAraclarCid = CarDB.searchRentCar(startDate, endDate);
            cidAllList = CarDB.searchAllCid();
            musaitCidAll = cidAllList;
            for (int i = 0; i < kiralanmisAraclarCid.size(); i++) {
                for (int j = 0; j < cidAllList.size(); j++) {
                    if (kiralanmisAraclarCid.get(i) == cidAllList.get(j)) {
                        musaitCidAll.remove(j);
                    }
                }

            }
            ArrayList<Car> carList = new ArrayList<Car>();
            carList = CarDB.searchListCar(musaitCidAll);
            request.setAttribute("carList", carList);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            url = "/searchCar.jsp";
        } else {

        }

        request.setAttribute("message", message);

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

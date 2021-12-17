/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beanPack.Car;
import beanPack.Feature;
import beanPack.Page;
import beanPack.RentStatus;
import beanPack.User;
import db.CarDB;
import db.FeatureDB;
import db.PageDB;
import db.UserDB;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
public class AdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/admin/index.jsp";
        String message = "";
        String view = "";
        // get current action
        String action = request.getParameter("action");

        Cookie cookie = null;
        Cookie[] cookies = null;

        String cUserEmail = "";
        String cUserPass = "";
        String cUserType = "";
        String cdurum = "";

        // Get an array of Cookies associated with the this domain
        cookies = request.getCookies();

        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equals("cookiesUserEmail")) {
                    cUserEmail = cookie.getValue().toString();
                } else if (cookie.getName().equals("cookiesUserPass")) {
                    cUserPass = cookie.getValue().toString();
                } else if (cookie.getName().equals("cookiesUserType")) {
                    cUserType = cookie.getValue().toString();
                } else if (cookie.getName().equals("durum")) {
                    cdurum = cookie.getValue().toString();
                }
            }
        }
        if (cdurum.equals("logged-in") && cUserType.equals("0")) {

            if (action == null) {
                action = "join";  // default action
            } else if (action.equals("page-add")) {
                view = "page-add";
            } else if (action.equals("add")) {

                String pTitle = request.getParameter("ptitle");
                String pContent = request.getParameter("pcontent");
                String pUrl = request.getParameter("purl");
                // store data in User object
                Page page = new Page(pTitle, pContent, pUrl);
                int a = PageDB.titleUnique(page);
                int b = PageDB.urlUnique(page);
                if (a > 0 && b > 0) {
                    message = "Aynı Başlık ve Aynı Url'de Bir Sayfa Mevcut";
                    request.setAttribute("page", page);
                } else if (a > 0) {
                    message = "Aynı Başlıkta Bir Sayfa Mevcut";
                    request.setAttribute("page", page);
                } else if (b > 0) {
                    message = "Aynı Url'de Bir Sayfa Mevcut";
                    request.setAttribute("page", page);
                } else if (pTitle == null || pUrl == null
                        || pTitle.isEmpty() || pUrl.isEmpty()) {
                    message = "Url ve Başlık Alanı Boş Olamaz";
                    request.setAttribute("page", page);
                } else {
                    message = "Sayfa Başarıyla Eklendi";
                    PageDB.insert(page);
                    request.setAttribute("linkurl", pUrl);
                }

                url = "/admin/index.jsp";
                view = "page-add";
            } else if (action.equals("page-edit-open")) {
                String pageListUrl = request.getParameter("pageListUrl");
                if (pageListUrl == null) {
                    pageListUrl = "";
                } else {
                    Page page = new Page();
                    page = PageDB.createPage(pageListUrl);
                    request.setAttribute("page", page);
                }
                url = "/admin/index.jsp";
                view = "page-edit";
            } else if (action.equals("update")) {

                String pTitle = request.getParameter("ptitle");
                String pContent = request.getParameter("pcontent");
                String pUrl = request.getParameter("purl");
                // store data in User object
                Page page = new Page(pTitle, pContent, pUrl);

                int a = PageDB.update(page);
                if (a > 0) {
                    message = "Sayfa Başarıyla Güncellendi";
                } else {
                    message = "Sayfa Güncellenemedi";
                }

                request.setAttribute("page", page);
                url = "/admin/index.jsp";
                view = "page-edit";
            } else if (action.equals("page-list")) {
                ArrayList<Page> pageList = new ArrayList<Page>();
                String actionPage = request.getParameter("actionPage");
                if (actionPage == null) {
                    actionPage = "";  // default action
                } else if (actionPage.equals("page-delete")) {
                    String pageListUrl = "";
                    pageListUrl = request.getParameter("pageListUrl");
                    if (pageListUrl != null) {
                        int a = PageDB.deletePage(pageListUrl);
                        if (a > 0) {
                            message = "Sayfa Başarıyla Silindi.";
                        } else {
                            message = "Sayfa Silme Başarısız.";
                        }
                    } else {
                        pageListUrl = "";
                    }
                } else {

                }
                pageList = PageDB.listPage();
                request.setAttribute("pageList", pageList);

                view = "page-list";
                url = "/admin/index.jsp";
            } //araba işlemleri
            else if (action.equals("car-add")) {
                view = "car-add";
                url = "/admin/index.jsp";

            } 
              else if (action.equals("car-add-ok")) {
                    String model= request.getParameter("model");
                    String years= request.getParameter("years");
                    String gear= request.getParameter("gear");
                    String fuel= request.getParameter("fuel");
                    String price= request.getParameter("price");
                    String plata = request.getParameter("plata");
                    InputStream inputStream= request.getPart("photo").getInputStream();
                    message="";
                    Car car = new Car (model, years, gear, fuel, price, plata, inputStream);
                    int c=CarDB.plataUnique(car);
                    if(model.isEmpty() || years.isEmpty() || gear.isEmpty() || fuel.isEmpty() || 
                            price.isEmpty() || plata.isEmpty() || inputStream==null){
                        message="Tüm alanları doldurun!";
                        request.setAttribute("car",car);
                    }
                    else if(c>0){
                        message="Aynı Plakaya Ait Başka Bir Araç Var!";
                        request.setAttribute("car",car);
                    }
                    else{
                        message=CarDB.insert(car);
                        request.setAttribute("carPlata",plata);
                    } 
                    
                    url="/admin/index.jsp";
                    view="car-add";
                    
            }
            else if (action.equals("car-list")) {

                String actionCar = request.getParameter("actionCar");
                if (actionCar == null) {
                    actionCar = "";
                } else if (actionCar.equals("car-delete")) {
                    String carPlata = "";
                    carPlata = request.getParameter("carPlata");
                    if (carPlata != null) {
                        int a = CarDB.deleteCar(carPlata);
                        if (a > 0) {
                            message = "Araç Başarıyla Silindi.";
                        } else {
                            message = "Araç Silme Başarısız.";
                        }
                    }
                }
                ArrayList<Car> carList = new ArrayList<Car>();
                carList = CarDB.listCar();
                request.setAttribute("carList", carList);
                view = "car-list";
                url = "/admin/index.jsp";
            } 
            
            else if (action.equals("car-image-update")) {
                String platax = request.getParameter("plata");
                InputStream inputSr = request.getPart("photo").getInputStream();

                int a = CarDB.updateInImage(platax, inputSr);
                if (a > 0) {
                    message = "Araç Görseli Güncelleme Başarılı";
                } else {
                    message = "Araç Görseli Güncelleme Başarısız";
                }
                Car car = new Car();
                car = CarDB.createCare(platax);
                request.setAttribute("car", car);
                view = "car-list";
                url = "/AdminServlet?action=car-edit-open&message="+message+"&carListPlata="+platax;
            } 
            
            else if (action.equals("car-edit-open")) {
                String carListPlata = request.getParameter("carListPlata");
                if (carListPlata == null) {
                    carListPlata = "";
                } else {
                    Car car = new Car();
                    car = CarDB.createCare(carListPlata);
                    request.setAttribute("car", car);
                }
                url = "/admin/index.jsp";
                view = "car-edit";
            } else if (action.equals("car-update")) {
                String model = request.getParameter("model");
                String years = request.getParameter("years");
                String gear = request.getParameter("gear");
                String fuel = request.getParameter("fuel");
                String price = request.getParameter("price");
                String plata = request.getParameter("plata");
                Car car = new Car();
                car = new Car(model, years, gear, fuel, price, plata);
                int a = CarDB.updateNoImage(car);
                if (a > 0) {
                    message = "İçerik Güncelleme Başarılı";
                } else {
                    message = "İçerik Güncelleme Başarısız";
                }

                car = CarDB.createCare(plata);
                request.setAttribute("car", car);
                url = "/admin/index.jsp";
                view = "car-edit";

            } 
            
            
            else if (action.equals("car-image-update")) {
                String plata = request.getParameter("plata");
                InputStream inputStream= request.getPart("photo").getInputStream();
                 int a=CarDB.updateInImage(plata, inputStream);
                if(a>0){
                    message="Araç Görseli Başarıyla Değiştirildi";
                }
                else{
                    message="Görsel Değiştirilemedi!";
                }
                Car car=new Car();
                car=CarDB.createCare(plata);
                request.setAttribute("car", car);
                view="car-edit";
                url = "/admin/index.jsp";
                
                 }
            
            else if (action.equals("user-add-page")) {
                url = "/admin/index.jsp";
                view = "user-add";
            } //kullanıcı işlemleri
            else if (action.equals("register")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");
                String userType = request.getParameter("userRole");
                String nameSurname = request.getParameter("nameSurname");
                String dTarih = request.getParameter("dTarih");
                String ehliyet = request.getParameter("ehliyet");

                if (userType.equals("administrator")) {
                    userType = "0";
                } else if (userType.equals("normal")) {
                    userType = "1";
                }

                User user = new User(email, password, userType, nameSurname, ehliyet, dTarih);
                int countEmail = UserDB.uniqeEmail(user);

                if (countEmail > 0) {
                    message = "Aynı email mevcut.";
                    request.setAttribute("user", user);
                } else if (email.isEmpty() || password.isEmpty() || dTarih.isEmpty() || confirmPassword.isEmpty()) {
                    message = "Lütfen tüm alanları doldurun.";
                    request.setAttribute("user", user);

                } else if (!password.equals(confirmPassword)) {
                    message = "Şifreler birbiriyle uyuşmuyor lütfen tekrar deneyin";
                    request.setAttribute("user", user);

                } else {
                    int a = UserDB.insert(user);
                    if (a > 0) {
                        message = "Kullanıcı kaydı başarılı giriş yapabilir.";

                    } else {
                        message = "Kullanıcı eklenemedi. Yönetici ile iletişime geçin.";

                    }
                }
                request.setAttribute("ms", countEmail);
                url = "/admin/index.jsp";
                view = "user-add";

            } else if (action.equals("user-list")) {
                String actionUser = request.getParameter("actionUser");
                if (actionUser == null) {
                    actionUser = "";
                } else if (actionUser.equals("user-delete")) {
                    String userEmail = "";
                    userEmail = request.getParameter("userEmail");
                    if (userEmail != null) {
                        int a = UserDB.deleteUser(userEmail);
                        if (a > 0) {
                            message = "Kullanıcı Başarıyla Silindi.";
                        } else {
                            message = "Kullanıcı Silme Başarısız.";
                        }
                    }
                }

                ArrayList<User> userList = new ArrayList<User>();
                userList = UserDB.listUser();
                request.setAttribute("userList", userList);
                view = "user-list";
                url = "/admin/index.jsp";
            } else if (action.equals("user-edit")) {
                String userEmail = request.getParameter("userEmail");
                if (userEmail == null) {
                    userEmail = "";
                } else {
                    User user = new User();
                    user = UserDB.createUser(userEmail);
                    request.setAttribute("user", user);
                    request.setAttribute("dTarih", user.getDogumTarih());
                }
                url = "/admin/index.jsp";
                view = "user-edit";
            } else if (action.equals("user-update")) {

                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");
                String userRole = request.getParameter("userRole");
                String nameSurname = request.getParameter("nameSurname");
                String ehliyet = request.getParameter("ehliyet");
                String dTarih = request.getParameter("dTarih");
                // store data in User object
                User user = new User(email, password, userRole, nameSurname, ehliyet, dTarih);
                if (password.isEmpty() || email.isEmpty() || confirmPassword.isEmpty() || userRole.isEmpty()) {
                    message = "Tüm alanları doldurun.";
                } else if (!password.equals(confirmPassword)) {
                    message = "Şifreler birbiriyle uyuşmuyor";
                } else {
                    int a = UserDB.updateUser(user);
                    request.setAttribute("dTarih", dTarih);
                    if (a > 0) {
                        message = "Kullanıcı Başarıyla Güncellendi";
                    } else {
                        message = "Kullanıcı Güncellenemedi";
                    }
                }

                request.setAttribute("user", user);

                url = "/admin/index.jsp";
                view = "user-edit";
            } //menü ayarlama
            else if (action.equals("menu-settings")) {
                view = "menu-add";
                url = "/admin/index.jsp";
            } else if (action.equals("menuSave")) {
                String menuOutput = "";
                menuOutput = request.getParameter("menuOutput");
                if (menuOutput != null) {

                    int a = FeatureDB.updateFields("menu", menuOutput);
                    if (a == 1) {
                        message = "Menü başarıyla güncellendi!";
                    } else {
                        message = "Menü güncelleme başarsız tekrar deneyin!";
                    }
                }
                view = "menu-add";
                url = "/admin/index.jsp";
            } //genel ayarlar
            else if (action.equals("general-settings")) {
                String facebook = request.getParameter("facebook");
                String twitter = request.getParameter("twitter");
                String youtube = request.getParameter("youtube");
                String instagram = request.getParameter("instagram");
                String telephone = request.getParameter("telephone");
                String email = request.getParameter("email");
                String encode = "";
                String slider1 = "";
                String slider2 = "";
                String slider3 = "";
                if (facebook == "" || facebook == null) {
                    facebook = "#";
                }
                if (twitter == "" || twitter == null) {
                    twitter = "#";
                }
                if (youtube == "" || youtube == null) {
                    youtube = "#";
                }
                if (instagram == "" || instagram == null) {
                    instagram = "#";
                }
                if (telephone == "" || telephone == null) {
                    telephone = "#";
                }
                if (email == "" || email == null) {
                    email = "#";
                } else {

                }
                ArrayList<Feature> featureList = new ArrayList<Feature>();
                String actionFeature = request.getParameter("actionFeature");
                if (actionFeature == null) {
                    actionFeature = "";
                } else if (actionFeature.equals("general-update-save")) {
                    int a = FeatureDB.updateFields("facebook", facebook);
                    int b = FeatureDB.updateFields("twitter", twitter);
                    int c = FeatureDB.updateFields("instagram", instagram);
                    int d = FeatureDB.updateFields("youtube", youtube);
                    int f = FeatureDB.updateFields("telephone", telephone);
                    int e = FeatureDB.updateFields("e-mail", email);
                    if (a > 0) {
                        message = "Güncellemeler başarılı";
                    } else {
                        message = "Güncelleme başarısız.";
                    }
                } else if (actionFeature.equals("general-logo-update")) {
                    InputStream inputSr = request.getPart("logo-photo").getInputStream();

                    if (inputSr != null) {
                        int a = FeatureDB.updateInImage("image-logo", inputSr);
                        if (a > 0) {

                            message = "Logo Güncelleme Başarılı";
                        } else {
                        }
                    }
                } else if (actionFeature.equals("general-slider1-update")) {
                    InputStream inputSr = request.getPart("slider1-photo").getInputStream();

                    if (inputSr != null) {
                        int a = FeatureDB.updateInImage("image-slider1", inputSr);
                        if (a > 0) {
                            message = "Slider 1 Güncelleme Başarılı";
                        } else {
                        }
                    }
                } else if (actionFeature.equals("general-slider2-update")) {
                    InputStream inputSr = request.getPart("slider2-photo").getInputStream();

                    if (inputSr != null) {
                        int a = FeatureDB.updateInImage("image-slider2", inputSr);
                        if (a > 0) {
                            message = "Slider 2 Güncelleme Başarılı";
                        } else {
                        }
                    }
                } else if (actionFeature.equals("general-slider3-update")) {
                    InputStream inputSr = request.getPart("slider3-photo").getInputStream();

                    if (inputSr != null) {
                        int a = FeatureDB.updateInImage("image-slider3", inputSr);
                        if (a > 0) {
                            message = "Slider 3 Güncelleme Başarılı";
                        } else {
                        }
                    }
                } else {

                }
                facebook = FeatureDB.selectInformation("facebook");
                twitter = FeatureDB.selectInformation("twitter");
                youtube = FeatureDB.selectInformation("youtube");
                instagram = FeatureDB.selectInformation("instagram");
                telephone = FeatureDB.selectInformation("telephone");
                email = FeatureDB.selectInformation("e-mail");
                encode = FeatureDB.selectFeature("image-logo").getEncode();
                slider1 = FeatureDB.selectFeature("image-slider1").getEncode();
                slider2 = FeatureDB.selectFeature("image-slider2").getEncode();
                slider3 = FeatureDB.selectFeature("image-slider3").getEncode();

                request.setAttribute("slider1", slider1);
                request.setAttribute("slider2", slider2);
                request.setAttribute("slider3", slider3);
                request.setAttribute("encode", encode);
                request.setAttribute("facebook", facebook);
                request.setAttribute("twitter", twitter);
                request.setAttribute("youtube", youtube);
                request.setAttribute("instagram", instagram);
                request.setAttribute("telephone", telephone);
                request.setAttribute("email", email);
                request.setAttribute("featureList", featureList);

                view = "general-settings";
                url = "/admin/index.jsp";
            } //footer ayarla
            else if (action.equals("footer-edit")) {
                view = "footer-edit";
                url = "/admin/index.jsp";
            } else if (action.equals("footerMenuSave")) {
                String menuOutput = "";
                menuOutput = request.getParameter("menuOutput");
                if (menuOutput != null) {

                    int a = FeatureDB.updateFields("menu-footer", menuOutput);
                    if (a == 1) {
                        message = "Alt Menü başarıyla güncellendi!";
                    } else {
                        message = "Alt Menü güncelleme başarsız tekrar deneyin!";
                    }
                }
                String address = FeatureDB.selectFeature("address").getInformation();
                String mapCode = FeatureDB.selectFeature("mapCode").getInformation();
                request.setAttribute("address", address);
                request.setAttribute("mapCode", mapCode);
                view = "footer-edit";
                url = "/admin/index.jsp";

            } else if (action.equals("footer-map-address")) {
                String address;
                String mapCode;

                address = request.getParameter("address");
                mapCode = request.getParameter("mapCode");

                if (address == null && mapCode == null) {
                    address = "";
                    mapCode = "";
                } else if (address == null) {
                    address = "";
                } else if (mapCode == null) {
                    mapCode = "";
                } else {
                    int a = FeatureDB.updateFields("address", address);
                    int b = FeatureDB.updateFields("mapCode", mapCode);
                    if (a + b == 2) {
                        message = "Bilgiler başarıyla güncellendi!";
                    } else {
                        message = "Bilgi güncelleme başarsız tekrar deneyin!";
                    }
                }
                request.setAttribute("address", address);
                request.setAttribute("mapCode", mapCode);
                view = "footer-edit";
                url = "/admin/index.jsp";

            } else if (action.equals("wait-rent")) {
                String actionUpdate = request.getParameter("action-update");
                if (actionUpdate == null) {
                    actionUpdate = "";
                } else if (actionUpdate.equals("update-ok-rent")) {
                    String carrentId = request.getParameter("carrentId");
                    int a = CarDB.rentUpdateStatus(carrentId, "1");
                    if (a > 0) {
                        message = "Kiralama isteği onaylandı";
                    } else {
                        message = "Kiralama isteği onaylanmadı";
                    }
                } else if (actionUpdate.equals("not-ok-rent")) {
                    String carrentId = request.getParameter("carrentId");
                    int a = CarDB.rentDeleteStatus(carrentId);
                    if (a > 0) {
                        message = "Kiralama isteği iptal edildi";
                    } else {
                        message = "Kiralama isteği iptal edilemedi";
                    }
                }
                ArrayList<RentStatus> waitCarList = new ArrayList<RentStatus>();
                waitCarList = CarDB.searchRentStatus("0");
                request.setAttribute("waitCarList", waitCarList);
                view = "wait-rent";
                url = "/admin/index.jsp";
            } 
            else if (action.equals("ok-rent")) {

                String actionUpdate = request.getParameter("action-update");
                if (actionUpdate == null) {
                    actionUpdate = "";
                } else if (actionUpdate.equals("not-ok-rent")) {
                    String carrentId = request.getParameter("carrentId");
                    int a = CarDB.rentDeleteStatus(carrentId);
                    if (a > 0) {
                        message = "Kiralama isteği iptal edildi";
                    } else {
                        message = "Kiralama isteği iptal edilemedi";
                    }
                }
                ArrayList<RentStatus> okCarList = new ArrayList<RentStatus>();
                okCarList = CarDB.searchRentStatus("1");
                request.setAttribute("okCarList", okCarList);
                view = "ok-rent";
                url = "/admin/index.jsp";
            } else {

            }
            request.setCharacterEncoding("UTF-8");

            response.setContentType("text/html; charset=utf-8");

            request.setAttribute("message", message);
            request.setAttribute("view", view);
            getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);
        } else {
            getServletContext()
                    .getRequestDispatcher("/index.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

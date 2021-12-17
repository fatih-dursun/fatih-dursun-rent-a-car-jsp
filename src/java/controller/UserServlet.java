/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beanPack.User;
import db.UserDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenova
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/login-register.jsp";
        String messageRegister = "";
        String messageLogin = "";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String userType = request.getParameter("userRole");
        String action = request.getParameter("action");
        String active = "";
        String deactive = "";

        if (action == null) {
            action = "login";
        } /* kullanıcı giriş yapıyor kullanıcı tipine göre sayfa yönlendir
        Kullanıcı nesnesi oluştur requestten gelen bilgilerle. daha sonra nesneyi
        giriş bilgileri doğrulumuk için veri tabanına yolla sonucua göre işlem yap
        doğruysa giriş gerçekleşir yanlışsa giriş sayfasına tekrar dönülür
        active deactive bilgileri div kısımlarına eklenir kullanıcı kayıttan geldiyse
        kayıta girişten geldiyse girişe gider.*/ 
        
        else if (action.equals("login")) {

            if (userType.equals("administrator")) {
                userType = "0";
                url = "/admin/index.jsp";
            } else if (userType.equals("normal")) {
                userType = "1";
                url = "/User?userEmail="+email;
            } else {
            }

            User user = new User(email, password, userType);
            int stateLogin = UserDB.succesfulLogin(user);

            //giriş başarılıysa bu bilgileri cookiye at.
            if (stateLogin > 0) {
                Cookie userEmail = new Cookie("cookiesUserEmail", email);
                userEmail.setMaxAge(60 * 60 * 24);

                Cookie userPass = new Cookie("cookiesUserPass", password);
                userPass.setMaxAge(60 * 60 * 24);

                Cookie uTypeCook = new Cookie("cookiesUserType", userType);
                uTypeCook.setMaxAge(60 * 60 * 24);

                Cookie durum = new Cookie("durum", "logged-in");
                durum.setMaxAge(60 * 60 * 24);

                response.addCookie(durum);
                response.addCookie(userEmail);
                response.addCookie(userPass);
                response.addCookie(uTypeCook);

                active = "";
                deactive = "";

                response.sendRedirect(url);
            } /*giriş başarısızsa tekrar giriş sayfasına dön.Yazılan  emaili de kullanıcı görmesi için
            request ile yolla. */ 
            else {
                url = "/login-register.jsp";
                messageLogin = "Tekrar Giriş Yapın";
                request.setAttribute("email", email);

                request.setAttribute("messageLogin", messageLogin);
                request.setAttribute("active", active);
                request.setAttribute("deactive", deactive);

                getServletContext()
                        .getRequestDispatcher(url)
                        .forward(request, response);
            }

        } //kullanıcı çıkış yapmak istiyor.
        else if (action.equals("logout")) {
            //cookie de sadece kullanıcı durumunun bilgisi 0 yapılır diğer bilgiler cookide
            //belirlenen süre kadar tutulmaya devam edilir. Kullanıcı ana sayfaya yönlendirilir.
            Cookie cookie = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    cookie = cookies[i];
                    if ((cookie.getName()).compareTo("durum") == 0) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }

            url = "/index.jsp";
            response.sendRedirect(url);
        } //kullanıcı kayıt mı oluyor. email daha önce var mı sorgulaması yapılır
        //alanlar boş mu dolu mu sorgulaması yapılır.
        //paralor eşleşiyor mu sorgulaması yapılır.
        //tüm adımlar başarılıysa kullanıcı eklenir.
        else if (action.equals("register")) {

            if (userType.equals("administrator")) {
                userType = "0";
            } else if (userType.equals("normal")) {
                userType = "1";
            }

            User user = new User(email, password, userType);
            int countEmail = UserDB.uniqeEmail(user);

            if (countEmail > 0) {
                messageRegister = "Aynı email mevcut.";
                url = "/login-register.jsp";
                active = "is-active";
                deactive = "deactive";
            } else if (email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
                messageRegister = "Lütfen tüm alanları doldurun.";
                url = "/login-register.jsp";
                active = "is-active";
                deactive = "deactive";
            } else if (!password.equals(confirmPassword)) {
                messageRegister = "Şifreler birbiriyle uyuşmuyor lütfen tekrar deneyin";
                url = "/login-register.jsp";
                active = "is-active";
                deactive = "deactive";
            } else {
                int a = UserDB.insertForm(user);
                if (a > 0) {
                    messageLogin = "Kullanıcı kaydı başarılı giriş yapabilirsiniz.";
                    url = "/login-register.jsp";
                    active = "";
                    deactive = "";
                } else {
                    messageRegister = "Kullanıcı eklenemedi. Yönetici ile iletişime geçin.";
                    url = "/login-register.jsp";
                    active = "is-active";
                    deactive = "deactive";
                }
            }
            request.setAttribute("messageRegister", messageRegister);
            request.setAttribute("messageLogin", messageLogin);
            request.setAttribute("active", active);
            request.setAttribute("deactive", deactive);
            getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}

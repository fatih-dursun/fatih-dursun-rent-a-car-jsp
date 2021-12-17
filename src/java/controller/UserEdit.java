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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenova
 */
@MultipartConfig(maxFileSize = 16177215)
public class UserEdit extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";

        String email = request.getParameter("email");
        String url = "/User?userEmail="+email;
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String userRole = request.getParameter("userRole");
        String dTarih = request.getParameter("dTarih");
        String nameSurname = request.getParameter("nameSurname");
        String ehliyet = request.getParameter("ehliyet");
        // store data in User object

        if (password.isEmpty() || email.isEmpty() || confirmPassword.isEmpty() || userRole.isEmpty()) {
            message = "Tüm alanları doldurun.";
        } else if (!password.equals(confirmPassword)) {
            message = "Şifreler birbiriyle uyuşmuyor";
        } else {
            User user = new User(email, password, userRole, nameSurname, ehliyet, dTarih);
            int a = UserDB.updateUser(user);
            if (a > 0) {
                message = "Kullanıcı Başarıyla Güncellendi";

                request.setAttribute("user", user);
                request.setAttribute("email", user.getEmail());
                request.setAttribute("userRole", user.getUserType());
                request.setAttribute("ehliyetSinifi", user.getEhliyet());
                request.setAttribute("nameSurname", user.getNameSurname());
                request.setAttribute("dTarih", user.getDogumTarih());
            } else {
                message = "Kullanıcı Güncellenemedi";
            }
        }

        request.setAttribute("message", message);
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}

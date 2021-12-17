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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenova
 */
public class Users extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String userEmail = request.getParameter("userEmail");
        User user = new User();
        user = UserDB.createUser(userEmail);
        int stateLogin = UserDB.succesfulLogin(user);
        if (stateLogin > 0) {
            request.setAttribute("email", user.getEmail());
            request.setAttribute("nameSurname", user.getNameSurname());
            request.setAttribute("userRole", user.getUserType());
            request.setAttribute("dTarih", user.getDogumTarih());
            request.setAttribute("password", user.getPassword());
            request.setAttribute("ehliyetSinifi", user.getEhliyet());
            getServletContext()
                    .getRequestDispatcher("/user-profil.jsp")
                    .forward(request, response);
        } else {
            getServletContext()
                    .getRequestDispatcher("/index.jsp")
                    .forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beanPack.Page;
import db.PageDB;
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
public class Pages extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String pageUrl = request.getParameter("url");
        String url = "";
        if (pageUrl.equals("ana-sayfa")) {
            url = "/index.jsp";
        } else if (pageUrl.equals("arabalarim")) {
            url = "/allCarList.jsp";
        } else {
            Page page = new Page();
            page = PageDB.createPage(pageUrl);
            String pageContent = page.getContent();
            String pageTitle = page.getTitle();
            request.setAttribute("pageContent", pageContent);
            request.setAttribute("pageTitle", pageTitle);
            url = "/page.jsp";
        }

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

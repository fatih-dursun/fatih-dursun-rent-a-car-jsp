<%-- 
    Document   : header
    Created on : 08.Ara.2021, 12:37:17
    Author     : lenova
--%>

<%@page import="db.FeatureDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <% String email = FeatureDB.selectInformation("e-mail");
        String address = FeatureDB.selectInformation("address");
        String telephone = FeatureDB.selectInformation("telephone");
        String logo = FeatureDB.selectFeature("image-logo").getEncode();
        String menu = FeatureDB.selectInformation("menu");
        String facebook = FeatureDB.selectInformation("facebook");
        String twitter = FeatureDB.selectInformation("twitter");
        String instagram = FeatureDB.selectInformation("instagram");
        String youtube = FeatureDB.selectInformation("youtube");
    %>
    <%
        Cookie cookie = null;
        Cookie[] cookies = null;
        String cUserEmail = "";
        String cUserPass = "";
        String cUserType = "";
        String cdurum = "";

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
        } else {
        }


    %>
<title>Rent Car</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="Araba Kiralama">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<script src="/cdn-cgi/apps/head/3ts2ksMwXvKRuG480KNifJ2_JNM.js"></script>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <!-- Stylesheets-->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CTeko:300,400,500%7CMaven+Pro:500">
        <link rel="stylesheet" href="css/bootstrap.css">
            <link rel="stylesheet" href="css/fonts.css">
                <link rel="stylesheet" href="css/style.css">
                    </head>
                    <body>
                    <div class="ust"><div class="container"><div class="ic"><div class="col-6">
                                    <% if (cdurum.equals("logged-in")) {%>
                                    <a href="/User?userEmail=<%=cUserEmail%>">Hoş Geldin <%=cUserEmail%></a>
                                    <%} else {%><a href="./login-register.jsp">Giriş Yap / Kayıt Ol</a><%}%>


                                </div>
                                <div class="col-6">
                                    <% if (cdurum.equals("logged-in")) {%>
                                    <form class="logout-link" action="/UserServlet">
                                        <input type="hidden" name="action" value="logout">
                                            <button type="submit">Çıkış Yap?</button>
                                    </form>

                                    <a class="right profil-page" href="/User?userEmail=<%=cUserEmail%>">Profil</a>
                                    <%} else {%><p class="adres-top"><span class="icon fas fa-map-marker"></span> Adresimiz: <%=address%></p><%}%>

                                </div>
                            </div>
                        </div></div>
                    <div class="content-page">
                        <header class="section page-header">
                            <div class="rd-navbar-wrap">
                                <nav class="rd-navbar rd-navbar-corporate" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-xxl-layout="rd-navbar-static" data-xxl-device-layout="rd-navbar-static" data-lg-stick-up-offset="46px" data-xl-stick-up-offset="46px" data-xxl-stick-up-offset="106px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
                                    <div class="rd-navbar-collapse-toggle rd-navbar-fixed-element-1" data-rd-navbar-toggle=".rd-navbar-collapse"><span></span></div><div class="rd-navbar-aside-outer"><div class="rd-navbar-aside"> <div class="rd-navbar-panel">
                                                <!-- RD Navbar Toggle-->
                                                <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                                                <div class="rd-navbar-brand">
                                                    <a class="brand" href="./">
                                                        <img class="admin-image uploadd" src="data:image/jpeg;base64,<%=logo%>" /></a></div>
                                            </div>
                                            <div class="rd-navbar-aside-right rd-navbar-collapse">
                                                <ul class="rd-navbar-corporate-contacts"><li>
                                                        <div class="unit unit-spacing-xs"><div class="unit-left"><span class="icon fa fa-envelope"></span></div> <div class="unit-body">
                                                                <a href="mailto:<%=email%>"><%=email%></a>
                                                            </div></div></li>
                                                    <li><div class="unit unit-spacing-xs"><div class="unit-left"><span class="icon fa fa-phone"></span></div><div class="unit-body">
                                                                <a class="link-phone" href="tel:<%=telephone%>"><%=telephone%></a></div>
                                                        </div> </li>
                                                </ul><a class="button button-md button-ujarak button-default-outline" href="/cart.jsp"><i class="fas fa-shopping-cart"></i>Sepet</a>
                                            </div></div></div>
                                    <div class="rd-navbar-main-outer"><div class="rd-navbar-main"><div class="rd-navbar-nav-wrap">
                                                <ul class="list-inline list-inline-md rd-navbar-corporate-list-social">
                                                    <li><a class="icon fa fa-facebook" target="_blank" href="<%=facebook%>"></a></li>
                                                    <li><a class="icon fa fa-twitter" target="_blank" href="<%=twitter%>"></a></li>                    
                                                    <li><a class="icon fa fa-instagram" target="_blank" href="<%=instagram%>"></a></li>
                                                    <li><a class="icon fas fa-youtube" target="_blank" href="<%=youtube%>"></a></li>
                                                </ul>
                                                <!-- RD Navbar Nav-->
                                                <ul class="rd-navbar-nav">
                                                    <%=menu%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                        </header>
<script src="js/core.min.js"></script>
<script src="js/script.js"></script>
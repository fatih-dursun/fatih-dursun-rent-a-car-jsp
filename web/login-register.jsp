<%-- 
    Document   : register
    Created on : 22.Kas.2021, 10:15:37
    Author     : lenova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="styles/register.css" type="text/css"/>
    <link rel="stylesheet" href="js/register.js" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    </head>

    <%
        Cookie cookie = null;
        Cookie[] cookies = null;
        String cUserEmail = "";
        String cUserPass = "";
        String cUserType = "";
        String cdurum = "";
        String emailBox = request.getParameter("email");
        String passBox = "";

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
        
        else {
        }

        if (emailBox == null) {
            emailBox = cUserEmail;
            passBox = cUserPass;
        } 
        else {
            passBox = "";
        }
    %>

    <%if (cdurum.equals("logged-in")) { %>
    <% if (cUserType.equals("0")) {
            response.sendRedirect("/admin/index.jsp");
        } else {
            response.sendRedirect("/User?userEmail=" + cUserEmail);
        }
    %> 

    <%} else {%>

    <body translate="no" >
    <section class="forms-section">
        <h1 class="section-title">Kayıt ve Giriş Sayfası</h1>
        <div class="forms">
            <div class="form-wrapper is-active${deactive}">
                <button type="button" class="switcher switcher-login">
                    Giriş Yap
                    <span class="underline"></span>
                </button>
                <form class="form form-login" action="UserServlet">
                    <p class="alert-form">${messageLogin}</p>
                    <input type="hidden" name="action" value="login"> 
                        <div class="input-block">
                            <label for="login-email">E-mail</label>
                            <input id="login-email" name="email" type="email" required value="<%=emailBox%>">
                        </div>
                        <div class="input-block">
                            <label for="login-password">Şifre</label>
                            <input id="login-password" name="password" type="password" required value="<%=passBox%>">
                        </div>
                        <label for="txt">Kullanıcı Türü</label>
                        <select id="userRole" name="userRole">
                            <option value="normal">Kullanıcı</option>
                            <option value="administrator">Admin</option>
                        </select>
                        <button type="submit" class="btn-login">Giriş Yap</button>
                </form>
            </div>
            <div class="form-wrapper ${active}">
                <button type="button" class="switcher switcher-signup">
                    Kayıt Ol
                    <span class="underline"></span>
                </button>
                <form class="form form-signup" action="UserServlet">
                    <p class="alert-form">${messageRegister}</p>
                    <div class="input-block">
                        <label for="signup-email">E-mail</label>
                        <input type="hidden" name="action" value="register"> 
                            <input type="hidden" name="userRole" value="normal"> 
                                <input id="signup-email" type="email" name="email" value="">
                                    </div>
                                    <div class="input-block">
                                        <label for="signup-password">Şifre</label>
                                        <input id="signup-password" type="password" name="password" value="">
                                    </div>
                                    <div class="input-block">
                                        <label for="signup-password-confirm">Tekrar Şifre</label>
                                        <input id="signup-password-confirm" type="password" name="confirmPassword" value="">
                                    </div>
                                    <button type="submit" class="btn-signup">Kayıt Ol</button>
                                    </form>
                                    </div>
                                    </div>
                                    </section>
                                    <% }%> 
                                    <script id="rendered-js" >
          const switchers = [...document.querySelectorAll('.switcher')];

          switchers.forEach(item => {
              item.addEventListener('click', function () {
                  switchers.forEach(item => item.parentElement.classList.remove('is-active'));
                  this.parentElement.classList.add('is-active');
              });
          });
//# sourceURL=pen.js
                                    </script>

                                    </html>

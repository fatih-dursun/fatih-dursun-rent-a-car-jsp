<%-- 
    Document   : car-add
    Created on : 19.Kas.2021, 12:36:19
    Author     : lenova
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid px-4 page-add">
    <h1 class="mt-4">Kullanıcı Ekle</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>
    </div>
    <form method="post" action="/AdminServlet" enctype="multipart/form-data">


        <input type="hidden" name="action" value="register"> 
            <label for="signup-email">Adi Soyadi:</label></br>
            <input id="name-surname" type="text" name="nameSurname" value="${user.nameSurname}"></br>
                <label for="signup-email">E-mail:</label></br>
                <input id="signup-email" type="email" name="email" value="${user.email}">
                    </br>
                    <label for="signup-password">Doğum Tarihi:</label><br>
                    <input id="signup-date" type="date" name="dTarih" value="00-00-0000">
                        </br>
                        <label for="signup-password">Şifre:</label>
                        </br>
                        <input id="signup-password" type="password" name="password" value="">
                            </br>
                            <label for="signup-password-confirm">Tekrar Şifre:</label>
                            </br>
                            <input id="signup-password-confirm" type="password" name="confirmPassword" value="">
                                <br>
                                <label for="signup-password-confirm">Kullanıcı Türü:</label></br>
                                <select name="userRole" id="userRole">
                                    <option value="normal">Kullanıcı</option>
                                    <option value="administrator">Admin</option>
                                </select></br>
                                <label for="signup-password-confirm">Ehliyet Türü:</label><br>
                                <select name="ehliyet" id="ehliyetRole">
                                    <option value="b">B</option>
                                    <option value="e">E</option>
                                </select>
                                <br>
                                <input class="car-add" type="reset">
                                    <input class="car-add" type="submit" value="Kaydet">
                                        </form>
                                        </div>

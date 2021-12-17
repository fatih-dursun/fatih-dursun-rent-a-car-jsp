
<%@page import="beanPack.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>

    section.section.user-profil input {
        width: 60%;
        margin: 10px 0px;
        background: #e5e5e5;
        border: 1px solid #727171;
        padding: 8px;
    }
</style>
<% User user = (User) request.getAttribute("user");%>

<script>
    window.onload = function () {

        var x = '<%=request.getAttribute("dTarih")%>';

        document.getElementById("dTarihim").value = x;

    };
</script>
<div class="container-fluid px-4 page-add" >
    <h1 class="mt-4">Kullanıcı Düzenle</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>

    </div>

    <form method="post" action="/AdminServlet" enctype="multipart/form-data">


        <input type="hidden" name="action" value="user-update"> 
            <label for="signup-email">Adi Soyadi:</label></br>
            <input id="name-surname" type="text" name="nameSurname" value="${user.nameSurname}"></br>
                <label for="signup-email">E-mail:</label></br>
                <input id="signup-email" type="email" name="email" value="${user.email}">
                    </br>
                    <label for="signup-password">Doğum Tarihi:</label>
                    </br>
                    <input type="Date"  name="dTarih" id="dTarihim" value=""></br>
                        <%--
                        <label for="signup-date">Doğum Tarihi:</label></br>
                    <input id="signup-date" type="date" name="dTarih" value="">
                        </br>
                        --%>
                        <label for="signup-password">Şifre:</label>
                        </br>
                        <input id="signup-password" type="password" name="password" value="">
                            </br>
                            <label for="signup-password-confirm">Tekrar Şifre:</label>
                            </br>
                            <input id="signup-password-confirm" type="password" name="confirmPassword" value="">
                                <br>
                                <label for="signup-password-confirm">Kullanıcı Türü:</label><br>
                                <% if (user.getUserType().equals("0") || user.getUserType().isEmpty()) { %>
                                <select name="userRole" id="user-id">
                                    <option id="1" value="1" >Kullanıcı</option>
                                    <option id="2" value="0" selected>Admin</option>
                                </select>
                                <%
               } else { %>
                                <select name="userRole" id="user-id">
                                    <option id="1" value="1" selected>Kullanıcı</option>
                                    <option id="2" value="0">Admin</option>
                                </select>
                                <% }%>         <br>
                                <label for="signup-password-confirm">Ehliyet Türü:</label><br>
                                <% if (user.getEhliyet().equals("E") || user.getEhliyet().isEmpty()) { %>
                                <select name="ehliyet" id="user-id">
                                    <option id="1" value="B" >B</option>
                                    <option id="2" value="E" selected>E</option>
                                </select>

                                <%
               } else { %>
                                <select name="ehliyet" id="user-id">
                                    <option id="1" value="B" selected>B</option>
                                    <option id="2" value="E">E</option>
                                </select>
                                <% }%>         <br>

                                <input class="car-add" type="reset">
                                    <input class="car-add" type="submit" value="Kaydet">
                                        </form>

                                        </div>

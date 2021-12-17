<%-- 
    Document   : car-add
    Created on : 05.Ara.2021, 19:22:23
    Author     : lenova
--%>
<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid px-4 page-add">
    <h1 class="mt-4">Araç Ekle</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>
            <%String cPlata = (String) request.getAttribute("carPlata");
    if (cPlata != null) { %>
    <a class="page-view-url" href="Car?carPlata=${carPlata}" target="_blank">Arabayı Görüntüle</a>
    
                        <% }%>
                        </div>
                        <form method="post" action="AdminServlet" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="car-add-ok">
                                <label for="model">Araba Modeli:</label><br>
                                <input type="text" id="model" name="model" value="${car.model}"><br>
                                    <label for="years">Araba Yılı:</label><br>
                                    <input type="text" id="years" name="years" value="${car.years}"><br>

                                        <label for="gear">Vites Türü:</label><br>
                                        <select name="gear" id="gear">
                                            <option id="1" value="Otomatik">Otomatik</option>
                                            <option id="2" value="Manuel">Manuel</option>
                                            <option id="3" value="Yarı Otomatik">Yarı Otomatik</option>
                                        </select><br>

                                        <label for="fuel">Yakıt Türü:</label><br>
                                        <select name="fuel" id="fuel">
                                            <option id="4" value="LPG">LPG</option>
                                            <option id="5" value="Benzin">Benzin</option>
                                            <option id="6" value="Motorin">Motorin</option>
                                        </select><br>

                                        <label for="price">Kira Fiyatı:</label><br>
                                        <input type="number" id="price" name="price"><br> 

                                            <label for="plata">Araç Plakası:</label><br>
                                            <input type="text" id="plata" name="plata" value="${car.plata}"><br> 

                                                <label for="photo">Araç Görseli:</label>
                                                <input type="file" name="photo" ><br> 


                                                    <input class="car-add" type="reset">
                                                        <input class="car-add" type="submit" value="Kaydet">
                                                            </form>
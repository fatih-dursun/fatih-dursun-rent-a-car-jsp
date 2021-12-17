<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    window.onload = function () {
    <% Car car = (Car) request.getAttribute("car");
    %>

        var x = '<%=car.getGear()%>';
        var y = '<%=car.getFuel()%>';
        var z = '<%=car.getPrice()%>';
        document.getElementById("price").value = z;
        switch (x) {
            case 'Manuel':
                document.getElementById("gear-id").value = "Manuel";
                break;

            case 'Otomatik':
                document.getElementById("gear-id").value = "Otomatik";
                break;
            case 'Yarı Otomatik':
                document.getElementById("gear-id").value = "Yarı Otomatik";
                break;
            default:
                break;
        }

        switch (y) {
            case 'LPG':
                document.getElementById("fuel-id").value = "LPG";
                break;

            case 'Benzin':
                document.getElementById("fuel-id").value = "Benzin";
                break;
            case 'Motorin':
                document.getElementById("fuel-id").value = "Motorin";
                break;
            default:
                break;
        }

    };
</script>

<div class="container-fluid px-4 page-add" >
    <h1 class="mt-4">Araba Düzenle</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>
<a class="page-view-url" href="Car?carPlata=${car.plata}" target="_blank">Arabayı Görüntüle</a>
 

                        </div>
                        <form class="sola" method="get" action="AdminServlet" enctype="multipart/form-data" >
                            <input type="hidden" name="action" value="car-update">
                                <label for="model">Araba Modeli:</label><br>
                                <input type="text" id="model" name="model" value="${car.model}"><br>
                                    <label for="years">Araba Yılı:</label><br>
                                    <input type="text" id="years" name="years" value="${car.years}"><br>

                                        <label for="gear">Vites Türü:</label><br>
                                        <select name="gear" id="gear-id">
                                            <option id="1" value="Otomatik">Otomatik</option>
                                            <option id="2" value="Manuel">Manuel</option>
                                            <option id="3" value="Yarı Otomatik">Yarı Otomatik</option>
                                        </select><br>

                                        <label for="fuel">Yakıt Türü:</label><br>
                                        <select name="fuel" id="fuel-id">
                                            <option id="4" value="LPG">LPG</option>
                                            <option id="5" value="Benzin">Benzin</option>
                                            <option id="6" value="Motorin">Motorin</option>
                                        </select><br>

                                        <label for="price">Kira Fiyatı:</label><br>
                                        <input type="number" id="price" name="price"><br> 

                                            <label for="plata">Araç Plakası:</label><br>
                                            <input class="lock" type="text" id="plata" name="plata" value="${car.plata}" readonly="readonly"><br> 
                                                <br>

                                                <input class="car-add" type="reset">
                                                    <input class="car-add right" type="submit" value="Kaydet">
                                                        </form>

                                            <i><%=request.getParameter("message")%></i>
                                                        <form class="saga" method="post" action="AdminServlet" enctype="multipart/form-data" >
                                                            <label for="photo">Araç Görseli Güncelle:</label><br>
                                                            <input class="edit-page" type="file" name="photo">
                                                                <input type="hidden" name="action" value="car-image-update">
                                                                    <input type="hidden" name="plata" value="${car.plata}">
                                                                        <input class="car-add r right" type="submit" value="Görseli Güncelle">
                                                                            <img src="data:image/jpeg;base64,<%=car.getEncode()%>" />
                                                                            </form>

                                                                            </div>

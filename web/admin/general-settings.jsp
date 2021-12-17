<%@page import="java.util.Base64"%>
<%@page import="beanPack.Feature"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid px-4 page-add">
    <h1 class="mt-4">Genel Ayarlar</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>

    </div>
    <form class="general-form" action="AdminServlet" method="post">
        <input type="hidden" name="action" value="general-settings"></input>
        <input type="hidden" name="actionFeature" value="general-update-save"></input>
        <label class="bold-label">Telefon:</label>
        <input type="tel" name="telephone" placeholder="Telefon" value="${telephone}">
            <label class="bold-label">E-mail Adresi:</label>
            <input type="email" name="email" placeholder="Email" value="${email}">
                <label class="bold-label">Facebook Url:</label>
                <input type="text" name="facebook" placeholder="Facebook Adresi" value="${facebook}">
                    <label class="bold-label">Twitter Url:</label>
                    <input type="text" name="twitter" placeholder="Twitter Adresi" value="${twitter}">
                        <label class="bold-label"> Instagram Url:</label>
                        <input type="text" name="instagram" placeholder="Instagram Adresi" value="${instagram}">
                            <label class="bold-label">Youtube Url:</label>
                            <input type="text" name="youtube" placeholder="Youtube Adresi" value="${youtube}">
                                <input class="general-input"type="submit" value="Bilgileri Güncelle" class="margin_left">
                                    </form>

                                    <form class="general-form sol-gn" method="post" action="AdminServlet" enctype="multipart/form-data" >
                                        <label for="photo" class="updata-pt">Logo Güncelle:</label>
                                        <i class="boyut-bilgi">Uygun Boyut >> 171px Genişlik 46px Yükseklik </i>
                                        <br>
                                        <input class="edit-page upload-image" type="file" name="logo-photo">
                                            <input type="hidden" name="actionFeature" value="general-logo-update"></input>
                                            <input type="hidden" name="action" value="general-settings">
                                                <input class="car-add r right iupload" type="submit" value="Görseli Güncelle">
                                                    <img class="admin-image uploadd" src="data:image/jpeg;base64,${encode}" />
                                                    </form>
                                                    <div class="hr-half"><hr></div>


                                                    <form class="general-form sol-gn" method="post" action="AdminServlet" enctype="multipart/form-data" >
                                                        <label for="photo" class="updata-pt">Slider 1 Güncelle:</label>
                                                        <i class="boyut-bilgi">Uygun Boyut >> 1140px Genişlik 400px Yükseklik </i>
                                                        <br>
                                                        <input class="edit-page upload-image" type="file" name="slider1-photo">
                                                            <input type="hidden" name="actionFeature" value="general-slider1-update"></input>
                                                            <input type="hidden" name="action" value="general-settings">
                                                                <input class="car-add r right iupload" type="submit" value="Görseli Güncelle">
                                                                    <img class="admin-image uploadd" src="data:image/jpeg;base64,${slider1}" />
                                                                    </form>
                                                                    <div class="hr-half"><hr></div>

                                                                    <form class="general-form sol-gn rht" method="post" action="AdminServlet" enctype="multipart/form-data" >
                                                                        <label for="photo" class="updata-pt">Slider 2 Güncelle:</label>
                                                                        <i class="boyut-bilgi">Uygun Boyut >> 1140px Genişlik 400px Yükseklik </i>
                                                                        <br>
                                                                        <input class="edit-page upload-image" type="file" name="slider2-photo">
                                                                            <input type="hidden" name="actionFeature" value="general-slider2-update"></input>
                                                                            <input type="hidden" name="action" value="general-settings">
                                                                                <input class="car-add r right iupload" type="submit" value="Görseli Güncelle">
                                                                                    <img class="admin-image uploadd" src="data:image/jpeg;base64,${slider2}" />
                                                                                    </form>
                                                                                    <div class="hr-half rht"><hr></div>

                                                                                    <form class="general-form sol-gn rht" method="post" action="AdminServlet" enctype="multipart/form-data" >
                                                                                        <label for="photo" class="updata-pt">Slider 3 Güncelle:</label>
                                                                                        <i class="boyut-bilgi">Uygun Boyut >> 1140 Genişlik 400 Yükseklik </i>
                                                                                        <br>
                                                                                        <input class="edit-page upload-image" type="file" name="slider3-photo">
                                                                                            <input type="hidden" name="actionFeature" value="general-slider3-update"></input>
                                                                                            <input type="hidden" name="action" value="general-settings">
                                                                                                <input class="car-add r right iupload" type="submit" value="Görseli Güncelle">
                                                                                                    <img class="admin-image uploadd" src="data:image/jpeg;base64,${slider3}" />
                                                                                                    </form>
                                                                                                    <div class="hr-half rht"><hr></div>
                                                                                                    </div>                                                                                                    </div>
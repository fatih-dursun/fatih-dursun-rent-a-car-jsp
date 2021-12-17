<%-- 
    Document   : slider
    Created on : 08.Ara.2021, 13:57:46
    Author     : lenova
--%>

<%@page import="db.FeatureDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String slider1 = FeatureDB.selectFeature("image-slider1").getEncode();
    String slider2 = FeatureDB.selectFeature("image-slider2").getEncode();
    String slider3 = FeatureDB.selectFeature("image-slider3").getEncode();
%>

<script>
    $('.carousel').carousel()
</script>

<section class="banner">
    <div class="container">
        <div class="row">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="data:image/jpeg;base64,<%=slider1%>" />
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="data:image/jpeg;base64,<%=slider2%>" />
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="data:image/jpeg;base64,<%=slider3%>" />
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Sonraki</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Önceki</span>
                </a>
            </div>

        </div>
    </div>
</section>
<div class="parallax-container section section-lg bg-default" data-parallax-img=""><div class="material-parallax parallax"><img src="images/bg-forms-1.jpg" alt="" style="transform: translate3d(-50%, 2px, 0px); display: block;"></div>
    <div class="parallax-content section-fd context-dark text-center">
        <div class="container container-custom">
            <h2 class="present-title">En Uygun Aracı Bul</h2>
            <p class="index-title-text">Günlük 150 TL'den başlayan fiyatlar aracınızı bulun</p>
            <div class="row row-10 justify-content-center">


                <div class="col-sm-7 col-xl">
                    <div class="form-wrap">
                        <form class="araba-bul" action="CarRent" method="get">   

                            <input type="hidden" name="action" value="searchRent">
                                <label class="search-sag">Kira Başlangıç Tarihi</label> <label class="search-sol">Kira Bitiş Tarihi</label><br>
                                <input type="date" id="start" class="search-car" name="startDate" value="">
                                    <input type="date" id="finish" class="search-car" name="endDate" value="">

                                        <input type="submit" id="araci-incele" formtarget="_blank" value="Araç Bul">
                                            </form>


                                            </div>
                                            </div>

                                            </div>
                                            </div>
                                            </div>
                                            </div>
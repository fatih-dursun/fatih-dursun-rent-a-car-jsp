<%-- 
    Document   : home-car-list
    Created on : 09.Ara.2021, 14:39:35
    Author     : lenova
--%>
<%@page import="java.util.Random"%>
<%@page import="db.CarDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Car> carList = new ArrayList<Car>();
    carList = CarDB.listCar();
    int carCount = carList.size();
    Random random = new Random();
%>
<section class="section-lg bg-default">
    <div class="container">
        <h4 class="title-block home">Sizin İçin Seçtiklerimiz</h4>
        <div class="row row-sm row-30">
            <%
                ArrayList<Integer> indisler = new ArrayList<Integer>();
                int randomInt = random.nextInt(carCount);
                indisler.add(randomInt);
                for (int c = 0; c < 11; c++) {
                    randomInt = random.nextInt(carCount);
                    int i = 0;
                    while (i < indisler.size()) {
                        if (randomInt == indisler.get(i)) {
                            break;
                        } 
                        else {
                        }
                        i++;
                    }
                    if (indisler.size() == i) {
                        indisler.add(randomInt);
                        c++;
                    }
                    c--;
                }
            %>  <%  for (int i = 0; i < indisler.size(); i++) {
            %>
            <div class="col-sm-6 col-lg-3 text-left">
                <!-- Thumbnail Modern-->
                <figure class="thumbnail thumbnail-simple wow slideInUp" style="visibility: visible; animation-name: slideInUp;">
                    <a class="thumbnail-img" href="/Car?carPlata=<%=carList.get(indisler.get(i)).getPlata()%>">
                        <div class="flip-card">
                            <div class="flip-card-inner">
                                <div class="flip-card-front">
                                    <img src="data:image/jpeg;base64,<%=carList.get(indisler.get(i)).getEncode()%>"width="250" height="233" />
                                </div>

                                </a>


                                <div class="flip-card-back">
                                    <a class="thumbnail-img" href="/Car?carPlata=<%=carList.get(indisler.get(i)).getPlata()%>">

                                        <p>Aracın Detaylarını Gör ve Kirala</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <figcaption class="heading heading-5"><a href="/Car?carPlata=<%=carList.get(indisler.get(i)).getPlata()%>"> <%=carList.get(indisler.get(i)).getModel()%></a></figcaption>
                        <p class="description gray-500"><strong><%=carList.get(indisler.get(i)).getPrice()%>TL </strong> - <%=carList.get(indisler.get(i)).getGear()%> Vites - <%=carList.get(indisler.get(i)).getFuel()%></p>




                </figure>
            </div>
            <%}%>
        </div>
    </div>
</section>
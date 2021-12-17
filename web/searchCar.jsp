<%-- 
    Document   : searchCar
    Created on : 14.Ara.2021, 14:35:42
    Author     : lenova
--%>

<%@page import="db.CarDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%

    ArrayList<Car> carList = new ArrayList<Car>();
    carList = (ArrayList<Car>) request.getAttribute("carList");
    int carCount = carList.size();
%>
<script>
    window.onload = function () {
    <% String startDate = (String) request.getParameter("startDate");
       String endDate = (String) request.getParameter("endDate");
    %>

        var x = '<%=startDate%>';
        var y = '<%=endDate%>';

      
    
        switch (x) {
            case x:
                document.getElementById("start").value = x;
                break;
            default:
                break;
        }

        switch (y) {
            case y:
                document.getElementById("finish").value = y;
                break;
            default:
                break;
        }

    };
</script>
<section class="section-lg bg-default">
    <div class="container">
        <div class="arac-bul">
            <div class="arac-bul-ortala">
                <form class="araba-bul" action="CarRent" method="get">   

                    <input type="hidden" name="action" value="searchRent">
                        <label class="search-sag">Kira Başlangıç Tarihi</label> <label class="search-sol">Kira Bitiş Tarihi</label><br>
                        <input type="date" id="start" class="search-car" name="startDate" value="">
                            <input type="date" id="finish" class="search-car" name="endDate" value="">

                                <input type="submit" id="araci-incele" value="Araç Bul">
                                    </form></div></div>

                                    <h4 class="title-block home">Aradığınız Tarihte Uygun <%=carCount%> Aracımız Mevcut</h4>
                                    <h5 class="ortala">Başlangıç Tarihi: ${startDate} / Bitiş Tarihi: ${endDate}</h5>
                                    <div class="row row-sm row-30">
                                        <%  for (int i = 0; i < carCount; i++) {
                                        %>
                                        <div class="col-sm-6 col-lg-3 text-left">
                                            <!-- Thumbnail Modern-->
                                            <figure class="thumbnail thumbnail-simple wow slideInUp" style="visibility: visible; animation-name: slideInUp;">
                                                <a class="thumbnail-img" href="/Car?carPlata=<%=carList.get(i).getPlata()%>&startDate=${startDate}&endDate=${endDate}">
                                                    <div class="flip-card">
                                                        <div class="flip-card-inner">
                                                            <div class="flip-card-front">
                                                                <img src="data:image/jpeg;base64,<%=carList.get(i).getEncode()%>" width="250" height="233" />
                                                            </div>

                                                            </a>


                                                            <div class="flip-card-back">
                                                                <a class="thumbnail-img" href="/Car?carPlata=<%=carList.get(i).getPlata()%>&startDate=${startDate}&endDate=${endDate}">

                                                                    <p>Aracın Detaylarını Gör ve Kirala</p>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <figcaption class="heading heading-5"><a href="/Car?carPlata=<%=carList.get(i).getPlata()%>&startDate=${startDate}&endDate=${endDate}"> <%=carList.get(i).getModel()%></a></figcaption>
                                                    <p class="description gray-500"><strong><%=carList.get(i).getPrice()%>TL </strong> - <%=carList.get(i).getGear()%> Vites - <%=carList.get(i).getFuel()%></p>




                                            </figure>
                                        </div>
                                        <%}%>
                                    </div>
                                    </div>
                                    </section>
                                    <jsp:include page="footer.jsp"></jsp:include>
<%@page import="beanPack.Rent"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <section class="section section-sm bg-default text-md-left">
        <div class="container">
            <div class="row row-50 justify-content-start align-items-xl-center">
                <div class="col-md-12 col-lg-12 col-xl-12">
                    <div class="offset-right-xl-15">
                    <% ArrayList<Rent> carRentList = (ArrayList<Rent>) session.getAttribute("carRentList");
                        int i = 0;
                        int subDay = 0;
                        int subPrice = 0;
                        if (carRentList != null && carRentList.size() > 0) {
                            i = carRentList.size();
                    %>

                    <i>${message}</i>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Araba Adı</th>
                                <th scope="col">Kira Başlangıç</th>
                                <th scope="col">Kira Bitiş</th>
                                <th scope="col">Kira Gün Sayısı</th>
                                <th scope="col">Toplam Ücret</th>
                                <th scope="col">Çıkar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
    for (int j = 0; j < i; j++) {%>



                            <tr>
                                <td><%=j + 1%></td>

                                <td><%=carRentList.get(j).getCarName()%></td>
                                <td><%=carRentList.get(j).getStartDate()%></td>
                                <td><%=carRentList.get(j).getEndDate()%></td>
                                <td><%=carRentList.get(j).getDay()%><%subDay = subDay + carRentList.get(j).getDay();%></td>
                                <td><%=carRentList.get(j).getRentPrice()%><%subPrice = subPrice + Integer.parseInt(carRentList.get(j).getRentPrice());%></td>
                                <td><form action="/CarRent" method="get">
                                        <input type="hidden" name="indisCarList" value="<%=j%>">
                                            <input type="hidden" name="action" value="carDeleteList">   
                                                <input type="submit" value="Çıkar">
                                                    </form></td>
                                                    </tr>
                                                    <% }%>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td><b>Toplam Gün:</b> <%=subDay%></td>
                                                    <td><b>Toplam Ücret:</b> <%=subPrice%>TL</td>         

                                                    </tbody>
                                                    </table>
                                                    <div class="button-cart-new"><form action="/allCarList.jsp" method="get">
                                                            <input type="submit" value="Başka Bir Araç Daha Ekle">
                                                        </form></div>
                                                    <div class="button-cart-finish"><form action="/CarRent" method="get">
                                                            <input type="hidden" name="action" value="rentFinish">
                                                                <input type="submit" style="float:right;" value="Araçları Kirala">
                                                                    </form></div>
                                                                    </div>
                                                                    <%} else { %>
                                                                    <p>Sepetiniz Boş</p>
                                                                    <% }%>
                                                                    </div>
                                                                    </div>
                                                                    </div>
                                                                    </section>

                                                                    <jsp:include page="footer.jsp"></jsp:include>
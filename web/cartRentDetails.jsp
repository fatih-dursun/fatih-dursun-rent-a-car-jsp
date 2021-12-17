<%@page import="beanPack.Rent"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <section class="section section-sm bg-default text-md-left">
        <div class="container">
            <div class="row row-50 justify-content-start align-items-xl-center">
                <div class="col-md-12 col-lg-12 col-xl-12">
                    <div class="offset-right-xl-15">
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
                            </tr>
                        </thead>
                        <tbody>
                            <% ArrayList<Rent> carRentList = (ArrayList<Rent>) session.getAttribute("carRentList");
                                int i = carRentList.size();
                                int subDay = 0;
                      int subPrice = 0;
                      for (int j = 0; j < i; j++) {%>



                            <tr>
                                <td><%=j + 1%></td>

                                <td><%=carRentList.get(j).getCarName()%></td>
                                <td><%=carRentList.get(j).getStartDate()%></td>
                                <td><%=carRentList.get(j).getEndDate()%></td>
                                <td><%=carRentList.get(j).getDay()%><%subDay = subDay + carRentList.get(j).getDay();%></td>
                                <td><%=carRentList.get(j).getRentPrice()%><%subPrice = subPrice + Integer.parseInt(carRentList.get(j).getRentPrice());%></td>
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
                    <p class="adres-satir" style="font-weight: 600; margin-top:15px;">Araç teslim almak ve teslim etmek istediğiniz adres ve saatleri aşağıda 
                        belirtiniz. Ücret araç teslim edilirken alınacaktır.</p>
                  
                    <div class="button-cart-finish">
                        <form action="/CarRent" method="Post">
                            <textarea id="dd" name="carRentContent" rows="" cols="100%" placeholder="Eğer bu kısmı boş bırakırsanız alış ve bırakış adresi ofisimiz, alış ve bırakış saati 10:00 olarak belirlenecektir."></textarea>
                        
                            <input type="hidden" name="action" value="rentInsert">
                                <input type="submit" style="margin-top:15px;" value="Kiralama İşlemini Bitir">
                                    </form></div>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                    </section>

                                    <jsp:include page="footer.jsp"></jsp:include>
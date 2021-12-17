<%-- 
    Document   : page-edit
    Created on : 04.Ara.2021, 23:55:00
    Author     : lenova
--%>
<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<div class="container-fluid px-4">
    <h1 class="mt-4">Tüm Araçlar</h1>
    <h4>${message}</h4>
    <hr>
    <%
        ArrayList<Car> carList = new ArrayList<Car>();

        if (request.getAttribute("carList") != null) {
            carList = (ArrayList<Car>) request.getAttribute("carList");
        } else {
        }
    %>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Araçlar
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Araba Adı</th>
                        <th>Araba Plakası</th>
                        <th>Kira Fiyatı</th>
                        <th class="button">Görüntüle</th>
                        <th class="button">Düzenle</th>
                        <th class="button">Sil</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Araba Adı</th>
                        <th>Araba Plakası</th>
                        <th>Kira Fiyatı</th>
                        <th class="button">Görüntüle</th>
                        <th class="button">Düzenle</th>
                        <th class="button">Sil</th>
                    </tr>
                </tfoot>
                <tbody>
                    <% for (int i = 0; i < carList.size(); i++) {%>
                    <tr>
                        <td><%=carList.get(i).getModel()%></td>
                        <td><%=carList.get(i).getPlata()%></td>
                        <td><%=carList.get(i).getPrice()%></td>
                        <td class="button-table button-list-ust">
                            <a class="button-list" href="Car?carPlata=<%=carList.get(i).getPlata()%>" target="_blank">Görüntüle</a>

                                            </td>
                                            <td class="button-table">
                                                <form class="in-button" action="AdminServlet" method="get"> 
                                                    <input type="hidden" name="action" value="car-edit-open">
                                                        <input type="hidden" name="carListPlata" value="<%=carList.get(i).getPlata()%>">
                                                            <input type="submit" class="fonksiyonel" value="Araba Düzenle" >                
                                                                </form>
                                                                </td>
                                                                <td class="button-table">
                                                                    <form class="in-button" action="AdminServlet" method="post">
                                                                        <input type="hidden" name="actionCar" value="car-delete">
                                                                            <input type="hidden" name="action" value="car-list">
                                                                                <input type="hidden" name="carPlata" value="<%=carList.get(i).getPlata()%>">
                                                                                    <input type="submit" class="fonksiyonel" value="Araba Sil">                
                                                                                        </form>
                                                                                        </td>

                                                                                        </tr>
                                                                                        <%
                                                                                            }
                                                                                        %>    
                                                                                        </tbody>
                                                                                        </table>
                                                                                        </div>
                                                                                        </div>
                                                                                        </div>

<%-- 
    Document   : page-edit
    Created on : 04.Ara.2021, 23:55:00
    Author     : lenova
--%>
<%@page import="beanPack.RentStatus"%>
<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<div class="container-fluid px-4">
    <h1 class="mt-4">Onaylanan Kiralama İstekleri</h1>
    <h4>${message}</h4>
    <hr>
    <%
        ArrayList<RentStatus> okCarList = new ArrayList<RentStatus>();

        if (request.getAttribute("okCarList") != null) {
            okCarList = (ArrayList<RentStatus>) request.getAttribute("okCarList");
        } else {
        }
        int waitCount = okCarList.size();
    %>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Araçlar
        </div>
        <div class="card-body buton-kisa">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Araba Adı</th>
                        <th>Plaka</th>
                        <th>Fiyat</th>
                        <th>Gün</th>
                        <th>Toplam</th>
                        <th>Kira Detay Açıklaması</th>
                        <th>Kira Başlangıç</th>
                        <th>Kira Bit.Tarihi</th>
                        <th>Email</th>
                        <th class="button">Reddet</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Araba Adı</th>
                        <th>Plaka</th>
                        <th>Kira Fiyatı</th>
                        <th>Gün</th>
                        <th>Fiyat</th>
                        <th>Kira Detay Açıklaması</th>
                        <th>Kira Başlangıç</th>
                        <th>Kira Bitiş</th>
                        <th>Email</th>
                        <th class="button formlar">Reddet</th>
                    </tr>
                </tfoot>
                <tbody>
                    <% for (int i = 0; i < okCarList.size(); i++) {%>
                    <tr>

                        <td><%=okCarList.get(i).getModel1()%></td>
                        <td><%=okCarList.get(i).getPlata()%></td>
                        <td><%=okCarList.get(i).getPrice()%></td>
                        <td><%=okCarList.get(i).getDay()%></td>
                        <td><%=okCarList.get(i).getRentPrice()%></td>
                        <td><%=okCarList.get(i).getRentContent()%></td>
                        <td><%=okCarList.get(i).getStartDate1()%></td>
                        <td><%=okCarList.get(i).getEndDate1()%></td>
                        <td><%=okCarList.get(i).getEmail1()%></td>

                        <td class="button-table formlar">
                            <form action="AdminServlet" method="get">
                                <input type="hidden" name="action-update" value="not-ok-rent">
                                    <input type="hidden" name="action" value="ok-rent">
                                        <input type="hidden" name="carrentId" value="<%=okCarList.get(i).getIdrentList()%>">
                                            <input type="submit" value="İptal">
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

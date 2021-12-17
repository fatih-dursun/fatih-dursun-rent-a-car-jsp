<%-- 
    Document   : page-edit
    Created on : 04.Ara.2021, 23:55:00
    Author     : lenova
--%>
<%@page import="beanPack.User"%>
<%@page import="beanPack.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<div class="container-fluid px-4">
    <h1 class="mt-4">Tüm Kullanıcılar</h1>
    <h4>${message}</h4>
    <hr>
    <%
        ArrayList<User> userList = new ArrayList<User>();

        if (request.getAttribute("userList") != null) {
            userList = (ArrayList<User>) request.getAttribute("userList");
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
                        <th>Kullanıcı Adı</th>
                        <th>Kullanıcı Türü</th>
                        <th class="button">Düzenle</th>
                        <th class="button">Sil</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Kullanıcı Adı</th>
                        <th>Kullanıcı Türü</th>
                        <th class="button">Düzenle</th>
                        <th class="button">Sil</th>
                    </tr>
                </tfoot>
                <tbody>
                    <% for (int i = 0; i < userList.size(); i++) {%>
                    <tr>
                        <td><%=userList.get(i).getEmail()%></td>
                        <td><%
                            String s = "";
                            if (userList.get(i).getUserType().equals("0")) {
                                s = "Administrator";
                            } else {
                                s = "Kullanıcı";
                            }
                            %>
                            <%=s%></td>
                        
                                            <td class="button-table">
                                                <form class="in-button" action="AdminServlet" method="post">
                                                    <input type="hidden" name="action" value="user-edit">
                                                        <input type="hidden" name="userEmail" value="<%=userList.get(i).getEmail()%>">
                                                            <input type="submit" class="fonksiyonel" value="Kullanıcı Düzenle">                
                                                                </form>
                                                                </td>
                                                                <td class="button-table">
                                                                    <form class="in-button" action="AdminServlet" method="post">
                                                                        <input type="hidden" name="actionUser" value="user-delete">
                                                                            <input type="hidden" name="action" value="user-list">
                                                                                <input type="hidden" name="userEmail" value="<%=userList.get(i).getEmail()%>">
                                                                                    <input type="submit" class="fonksiyonel" value="Kullanıcı Sil">                  
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

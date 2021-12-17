<%-- 
    Document   : page-edit
    Created on : 04.Ara.2021, 23:55:00
    Author     : lenova
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beanPack.Page"%>
<div class="container-fluid px-4">
    <h1 class="mt-4">Tüm Sayfalar</h1>
    <h4>${message}</h4>
    <hr>
    <%
        ArrayList<Page> pageList = new ArrayList<Page>();

        if (request.getAttribute("pageList") != null) {
            pageList = (ArrayList<Page>) request.getAttribute("pageList");
        } else {
        }
    %>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Sayfalar
        </div>
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Sayfa Adı</th>
                        <th>Sayfa Url</th>
                        <th class="button">Görüntüle</th>
                        <th class="button">Düzenle</th>
                        <th class="button">Sil</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Sayfa Adı</th>
                        <th>Sayfa Url</th>
                        <th class="button">Görüntüle</th>
                        <th class="button">Düzenle</th>
                        <th class="button">Sil</th>
                    </tr>
                </tfoot>
                <tbody>
                    <% for (int i = 0; i < pageList.size(); i++) {%>
                    <tr>
                        <td><%=pageList.get(i).getTitle()%></td>
                        <td><%=pageList.get(i).getUrl()%></td>

                        <td class="button-table button-list-ust">
                            <a class="button-list" href="Page?url=<%=pageList.get(i).getUrl()%>" target="_blank">Görüntüle</a>

                                            </td>
                                            <td class="button-table">
                                                <form class="in-button" action="AdminServlet" method="get"> 
                                                    <input type="hidden" name="action" value="page-edit-open">
                                                        <input type="hidden" name="pageListUrl" value="<%=pageList.get(i).getUrl()%>">
                                                            <input type="submit" class="fonksiyonel" value="Sayfa Düzenle" >                
                                                                </form>
                                                                </td>
                                                                <td class="button-table">
                                                                    <form class="in-button" action="AdminServlet" method="post">
                                                                        <input type="hidden" name="actionPage" value="page-delete">
                                                                            <input type="hidden" name="action" value="page-list">
                                                                                <input type="hidden" name="pageListUrl" value="<%=pageList.get(i).getUrl()%>">
                                                                                    <input type="submit" class="fonksiyonel" value="Sayfa Sil">                
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

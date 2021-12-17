<%@page import="db.FeatureDB"%>
<%@page import="db.PageDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<% String address = "";
    address = FeatureDB.selectInformation("address");

    String mapCode = "";
    mapCode = FeatureDB.selectInformation("mapCode");

    if (address == null) {
        address = "";
    }
    if (mapCode == null) {
        mapCode = "";
    }
%>

<div class="container-fluid px-4 page-add">
    <h1 class="mt-4">Footer Düzenle</h1>
    <hr>
    <div class="ust-uyari">
        <i>${message}</i>
    </div>

    <div class="draggable-main footer-form">
        <div class="box-drag footer">
            <ul class="connected-sortable draggable-left ui-sortable" >
                <% String a = "";
                    a = PageDB.menuPage();%>
                <%=a%></ul>
        </div>

        <div class="box-drag footer" >

            <% String b = "";
                b = FeatureDB.selectInformation("menu-footer");%>

            <ul class="connected-sortable draggable-right ui-sortable" id="page-menu"><%=b%></ul>
            <form id="menu-select" action="AdminServlet" method="Post">
                <input type="hidden" name="menuOutput" id="menuOutput"/>
                <input type="hidden" name="action" value="footerMenuSave"/>
                <input class="menu-save-footer" type="submit" value="Alt Menü Güncelle" onClick="menuGoServlet()">
            </form>
        </div>
    </div>
    <div class="footer-admin">
        <form class="general-form-footer" action="AdminServlet" method="post">
            <input type="hidden" name="action" value="footer-map-address"></input>
            <label class="bold-label">Adres:</label><br>
            <textarea name="address" rows="4" cols="auto"><%=address%></textarea><br>
            <label class="bold-label">Harita Kodu:</label><br>
            <textarea name="mapCode" rows="4" cols="50"><%=mapCode%></textarea>
            <input class="general-input" type="submit" value="Adres ve Harita Güncelle" class="margin_left">
        </form>
    </div>


    <script>
        function menuGoServlet()
        {
            var menuInner = document.getElementById("page-menu").innerHTML;
            document.getElementById("menuOutput").value = menuInner;

            var form = document.getElementById("menu-select");
            form.submit();

        }
    </script>
</div>
<style>
    input.menu-save {
        padding: 10px 60px;
    }
    .draggable-main{
        width: 75%;
    }
    .box-drag {
        float: left;
        width: 40%;
        margin-right: 5%;
        border: 2px #000;
        border-radius: 2px;
        border-style: dashed;
        background: #e9e9e1;
    }
    .box:last-child{
        margin: 0px;
    }
    .connected-sortable {
        list-style: none;
        padding: 20px;
        margin: 0px;
    }
    ul li.ui-sortable-handle{
        width: inherit;
        padding: 8px 15px;
        text-align: center;
        background-color: #3b4752;
        border-bottom: 1px solid #c1c1c1;
        color: #fff;
        font-weight: 600;
        font-size: 15px;
        margin-bottom: 4px;
        border-radius: 5px;
        -webkit-transition: transform 0.25s ease-in-out;
        -moz-transition: transform 0.25s ease-in-out;
        -o-transition: transform 0.25s ease-in-out;
        transition: transform 0.25s ease-in-out;
        -webkit-transition: box-shadow 0.25s ease-in-out;
        -moz-transition: box-shadow 0.25s ease-in-out;
        -o-transition: box-shadow 0.25s ease-in-out;
        transition: box-shadow 0.25s ease-in-out;
    }
    ul li.ui-sortable-handle:hover {
        cursor: move;
        background-color: #2147ff;
        color: #fff;
    }
    ul li.ui-sortable-helper {
        background-color: #e5e5e5;
        -webkit-box-shadow: 0 0 8px rgba(53, 41, 41, 0.8);
        -moz-box-shadow: 0 0 8px rgba(53, 41, 41, 0.8);
        box-shadow: 0 0 8px rgba(53, 41, 41, 0.8);
        transform: scale(1.015);
        z-index: 100;
    }
    ul li.ui-sortable-placeholder {
        background-color: #ddd;
        -moz-box-shadow: inset 0 0 10px #000000;
        -webkit-box-shadow: inset 0 0 10px #000000;
        box-shadow: inset 0 0 10px #000000;
    }
    li.rd-nav-item.ui-sortable-handle a {
        color: #fff !important;
        text-decoration: none;
    }
</style>

<script>
    $(".draggable-left, .draggable-right").sortable({
        connectWith: ".connected-sortable",
        stack: ".connected-sortable ul"
    }).disableSelection();</script>
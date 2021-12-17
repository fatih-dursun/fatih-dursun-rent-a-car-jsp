<%-- 
Document   : user-profil
Created on : 30.Kas.2021, 13:30:53
Author     : lenova
--%>
<%@page import="db.CarDB"%>
<%@page import="beanPack.RentStatus"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beanPack.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

<style>

/* Style the tab */
.tab {
float: left;
border: 1px solid #ccc;
background-color: #f1f1f1;
width: 23%;
}

/* Style the buttons inside the tab */
.tab button {
display: block;
background-color: inherit;
color: black;
padding: 22px 16px;
width: 100%;
border: none;
outline: none;
text-align: left;
cursor: pointer;
transition: 0.3s;
font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
float: left;
padding: 0px 40px;
width: 77%;
border-left: none;
}
section.section.user-profil .col-md-12.col-lg-12.col-xl-12 {
display: flex;
}
section.section.user-profil {
margin-top: 30px;
}
section.section.user-profil input, section.section.user-profil  select {
width: 60%;
margin: 10px 0px;
background: #e5e5e5;
border: 1px solid #727171;
padding: 8px;
}



</style>


<section class="section user-profil">
<div class="container">
<div class="col-md-12 col-lg-12 col-xl-12">
<div class="tab">
<button class="tablinks" onclick="openCity(event, 'profilview')" id="defaultOpen">Profili Gör</button>
<button class="tablinks" onclick="openCity(event, 'profiledit')">Profili Düzenle</button>
<button class="tablinks" onclick="openCity(event, 'okcar')">Onaylanan Araçlarım</button>
<button class="tablinks" onclick="openCity(event, 'waitcar')">Onay Bekleyen Araçlarım</button>
</div>

<div id="profilview" class="tabcontent">
<h5>Profil Bilgilerim</h5>

<hr style="margin-top:5px;">
<h5><i>${message}</i></h5>
<p>Adı Soyadı: ${nameSurname}</p>
<p>Email Adresi: ${email}</p>
<p>Doğum Tarihi: ${dTarih}</p>
<p>Ehliyet Sınıfı: ${ehliyetSinifi}</p>
</div>
<script>
window.onload = function () {

var x = '<%=request.getAttribute("dTarih")%>';

document.getElementById("dTarihim").value = x;

};
</script>
<div id="profiledit" class="tabcontent">
<h5>Profili Düzenle</h5>
<hr style="margin-top:5px;margin-bottom:15px;">
<form method="post" action="/UserEdit" enctype="multipart/form-data">
<input type="hidden" name="action" value="user-update"> 
<label for="signup-email">Adi Soyadi:</label></br>
<input id="name-surname" type="text" name="nameSurname" value="${nameSurname}"></br>
<label for="signup-email">E-mail:</label></br>
<input class="lock" id="signup-email" type="email" name="email" readonly="readonly" value="${email}">
</br>
<label for="signup-password">Doğum Tarihi:</label>
</br>
<input type="Date"  name="dTarih" id="dTarihim" value=""></br>

<label for="signup-password">Şifre:</label>
</br>
<input id="signup-password" type="password" name="password" value="">
<input id="signup-password" type="hidden" name="userRole" value="${userRole}">

</br>
<label for="signup-password-confirm">Tekrar Şifre:</label>
</br>
<input id="signup-password-confirm" type="password" name="confirmPassword" value="">

<br>

<label for="signup-password-confirm">Ehliyet Türü:</label><br>

<%  String str="";
    str=(String) request.getAttribute("ehliyetSinifi");
    if (str==null|| str.isEmpty() || str.equals("E")) { %>
<select name="ehliyet" id="user-id">
    <option id="1" value="B" >B</option>
    <option id="2" value="E" selected>E</option>
</select>
<%
} else { %>
<select name="ehliyet" id="user-id">
    <option id="1" value="B" selected>B</option>
    <option id="2" value="E">E</option>
</select>
<% }%>         <br>
<input class="car-add" type="submit" value="Kaydet">
    </form>
    </div>

    <div id="okcar" class="tabcontent">
        <h5>Onaylanan Araçlarım</h5>
        <hr style="margin-top:5px;margin-bottom:15px;">
        <%
            ArrayList<RentStatus> okCarList = new ArrayList<RentStatus>();
            String email = (String) request.getAttribute("email");
            okCarList = CarDB.searchRentStatusUser("1", email);
            int count = okCarList.size();

        %>


        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Araç</th>
                    <th scope="col">Plakası</th>
                    <th scope="col">Başlangıç</th>
                    <th scope="col">Bitiş</th>
                    <th scope="col">Detayları</th>
                    <th scope="col">Fiyatı</th>
                    <th scope="col">Gün</th>
                    <th scope="col">Toplam</th>
                </tr>
            </thead>
            <tbody>
                <% for (int j = 0; j < okCarList.size(); j++) {%>
                <tr>
                    <td><%=okCarList.get(j).getModel1()%></td>
                    <td><%=okCarList.get(j).getPlata()%></td>
                    <td><%=okCarList.get(j).getStartDate1()%></td>
                    <td><%=okCarList.get(j).getEndDate1()%></td>
                    <td><%=okCarList.get(j).getRentContent()%></td>
                    <td><%=okCarList.get(j).getPrice()%></td>
                    <td><%=okCarList.get(j).getDay()%></td>
                    <td><%=okCarList.get(j).getRentPrice()%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>


    <div id="waitcar" class="tabcontent">
        <h5>Onay Bekleyen Araçlarım</h5>
        <hr style="margin-top:5px;margin-bottom:15px;">
        <%
            ArrayList<RentStatus> waitCarList = new ArrayList<RentStatus>();
            okCarList = CarDB.searchRentStatusUser("0", email);

        %>


        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Araç</th>
                    <th scope="col">Plakası</th>
                    <th scope="col">Başlangıç</th>
                    <th scope="col">Bitiş</th>
                    <th scope="col">Detayları</th>
                    <th scope="col">Fiyatı</th>
                    <th scope="col">Gün</th>
                    <th scope="col">Toplam</th>
                </tr>
            </thead>
            <tbody>
                <% for (int j = 0; j < okCarList.size(); j++) {%>
                <tr>
                    <td><%=okCarList.get(j).getModel1()%></td>
                    <td><%=okCarList.get(j).getPlata()%></td>
                    <td><%=okCarList.get(j).getStartDate1()%></td>
                    <td><%=okCarList.get(j).getEndDate1()%></td>
                    <td><%=okCarList.get(j).getRentContent()%></td>
                    <td><%=okCarList.get(j).getPrice()%></td>
                    <td><%=okCarList.get(j).getDay()%></td>
                    <td><%=okCarList.get(j).getRentPrice()%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>


    </div>
    </div>
    </section>
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

    // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>

    <jsp:include page="footer.jsp"></jsp:include>

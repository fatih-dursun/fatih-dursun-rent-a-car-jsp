<%@page import="db.CarDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Cookie cookie = null;
    Cookie[] cookies = null;
    String cUserEmail = "";
    String cUserPass = "";
    String cUserType = "";
    String cdurum = "";

    // Get an array of Cookies associated with the this domain
    cookies = request.getCookies();

    if (cookies != null) {

        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if (cookie.getName().equals("cookiesUserEmail")) {
                cUserEmail = cookie.getValue().toString();
            } else if (cookie.getName().equals("cookiesUserPass")) {
                cUserPass = cookie.getValue().toString();
            } else if (cookie.getName().equals("cookiesUserType")) {
                cUserType = cookie.getValue().toString();
            } else if (cookie.getName().equals("durum")) {
                cdurum = cookie.getValue().toString();
            }
        }
    } else {
    }
    String view = "";
    if (request.getAttribute("view") != null) {
        view = request.getAttribute("view").toString();
    }
%>
<%    if (cUserType.equals("1") || cdurum.equals("")) {
        response.sendRedirect("/./login-register.jsp");
    } else {
    }
%>

<jsp:include page="admin-menu-and-top.jsp"></jsp:include>
    <div id="layoutSidenav_content">
        <main>

        <% if (view.equals("home")) { %><jsp:include page="home.jsp"></jsp:include>
        <% } else if (view.equals("ok-rent")) { %><jsp:include page="ok-rent.jsp"></jsp:include>
        <% } else if (view.equals("wait-rent")) { %><jsp:include page="wait-rent.jsp"></jsp:include>
        <% } else if (view.equals("page-add")) { %><jsp:include page="page-add.jsp"></jsp:include>
        <% } else if (view.equals("page-list")) { %><jsp:include page="page-list.jsp"></jsp:include>
        <% } else if (view.equals("page-edit")) { %><jsp:include page="page-edit.jsp"></jsp:include>
        <% } else if (view.equals("car-add")) { %><jsp:include page="car-add.jsp"></jsp:include>
        <% } else if (view.equals("car-list")) { %><jsp:include page="car-list.jsp"></jsp:include>
        <% } else if (view.equals("car-edit")) { %><jsp:include page="car-edit.jsp"></jsp:include>
        <% } else if (view.equals("user-add")) { %><jsp:include page="user-add.jsp"></jsp:include>
        <% } else if (view.equals("user-list")) { %><jsp:include page="user-list.jsp"></jsp:include>
        <% } else if (view.equals("user-edit")) { %><jsp:include page="user-edit.jsp"></jsp:include>
        <% } else if (view.equals("menu-add")) { %><jsp:include page="menu-add.jsp"></jsp:include>
        <% } else if (view.equals("general-settings")) { %><jsp:include page="general-settings.jsp"></jsp:include>
        <% } else if (view.equals("footer-edit")) { %><jsp:include page="footer-edit.jsp"></jsp:include>
        <% } else { %>

        <%
            int countCar = CarDB.countCar();
            int countUser = CarDB.countUser();
            int countWaitCar = CarDB.countRentStatic("0");
            int countOkCar = CarDB.countRentStatic("1");

        %>
        <div id="">

            <div class="container-fluid px-4">
                <h1 class="mt-4">Yönetim Paneli</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Web Site İstatistikleri</li>
                </ol>
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">Onaylanan Kiralama İstekleri</div>
                            <p style="margin-left:17px;"><%=countOkCar%> Adet</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/AdminServlet?action=ok-rent">Detay Gör</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">Bekleyen Kiralama İstekleri</div>
                            <p style="margin-left:17px;"><%=countWaitCar%> Adet</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/AdminServlet?action=wait-rent">Detay Gör</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">Araç Sayısı</div>
                            <p style="margin-left:17px;"><%=countCar%> Adet</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/AdminServlet?action=car-list">Detay Gör</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-secondary text-white mb-4">
                            <div class="card-body">Üye Sayısı</div>
                            <p style="margin-left:17px;"><%=countUser%> Adet</p>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="/AdminServlet?action=user-list">Detay Gör</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%}%>
    </main>
</div>
<%
    if (view == null) {
%>

<% }%>
</div>
<jsp:include page="admin-script.jsp"></jsp:include>
</body>
</html>
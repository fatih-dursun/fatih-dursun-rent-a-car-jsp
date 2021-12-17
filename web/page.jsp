<%-- 
    Document   : page
    Created on : 09.Ara.2021, 21:30:51
    Author     : lenova
--%>
<title>${pageTitle}</title>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

    <section class="section section-sm bg-default text-md-left">
        <div class="container">
            <div class="col-md-12 col-lg-12 col-xl-12">
                <h4 class="font-weight-medium title">${pageTitle}</h4>
            <hr style="margin-top:15px;">
            <!-- Bootstrap tabs-->
            <div class="tabs-custom tabs-horizontal tabs-line" id="tabs-4">
                <!-- Nav tabs-->
                <!-- Tab panes-->
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="tabs-4-3">
                        <p>${pageContent}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</html>

<%-- 
    Document   : footer
    Created on : 09.Ara.2021, 20:19:35
    Author     : lenova
--%>
<%@page import="java.util.Base64"%>
<%@page import="db.FeatureDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String email=FeatureDB.selectInformation("e-mail");
String address=FeatureDB.selectInformation("address");
String telephone=FeatureDB.selectInformation("telephone");
String menu=FeatureDB.selectInformation("menu");
    String facebook=FeatureDB.selectInformation("facebook");
    String twitter=FeatureDB.selectInformation("twitter");
    String instagram=FeatureDB.selectInformation("instagram");
    String youtube=FeatureDB.selectInformation("youtube");
    String mapCode=FeatureDB.selectInformation("mapCode");
     String menuFooter=FeatureDB.selectInformation("menu-footer");
%>
<footer class="section footer-corporate footer-corporate-2 bg-gray-800">
        <div class="footer-corporate-inset">
          <div class="container">
            <div class="row row-40 justify-content-lg-between">
                <div class="col-sm-6 col-md-12 col-lg-4 col-xl-4">
                <div class="oh-desktop">
                  <div class="wow slideInRight" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: slideInRight;">
                    <h6 class="text-spacing-100 rd-range-title">İletişim Bilgileri</h6>
                    <ul class="footer-contacts d-inline-block d-sm-block">
                      <li>
                        <div class="unit">
                          <div class="unit-left"><span class="icon fa fa-phone"></span></div>
                          <div class="unit-body">
                              <a class="link-phone" href="tel:<%=telephone%>"><%=telephone%></a></div>
                        </div>
                      </li>
                      <li>
                        <div class="unit">
                          <div class="unit-left"><span class="icon fa fa-envelope"></span></div>
                          <div class="unit-body">
                              <a class="link-aemail" href="mailto:<%=email%>"><%=email%></a></div>
                        </div>
                      </li>
                      <li>
                        <div class="unit">
                          <div class="unit-left"><span class="icon fa fa-location-arrow"></span></div>
                          <div class="unit-body"><a class="link-location" href="#"><%=address%></a></div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div> <div class="col-sm-12 col-md-7 col-lg-4 col-xl-4">
                <div class="oh-desktop">
                  <div class="wow slideInLeft" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: slideInLeft;">
                    <h6 class="text-spacing-100 rd-range-title">Hızlı Menü</h6>
                    <ul class="row-6 list-0 list-marked list-marked-md list-custom-2 list-marked-third">
                        <%=menuFooter%>
                    </ul>
                     </div>
                </div>
              </div>
                    
                    <div class="col-sm-6 col-md-5 col-lg-4 col-xl-4">
                <div class="oh-desktop">
                  <div class="wow slideInDown" data-wow-delay="0s" style="visibility: visible; animation-delay: 0s; animation-name: slideInDown;">
                    <%=mapCode%>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
        <div class="footer-corporate-bottom-panel">
          <div class="container">
            <div class="row row-10 align-items-md-center">
              <div class="col-sm-6 col-md-4 text-sm-right text-md-center">
                <div>
                  <ul class="list-inline list-inline-sm footer-social-list-2">
                    <li><a class="icon fa fa-facebook" target="_blank" href="<%=facebook%>"></a></li>
                    <li><a class="icon fa fa-twitter" target="_blank" href="<%=twitter%>"></a></li>
                    <li><a class="icon fa fa-youtube" target="_blank" href="<%=youtube%>"></a></li>
                    <li><a class="icon fa fa-instagram" target="_blank" href="<%=instagram%>"></a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-6 col-md-4 order-sm-first">
                <!-- Rights-->
                <p class="rights"><span>©&nbsp;</span><span class="copyright-year">2021</span> <span>Rent Car</span>. Fatih Dursun
                </p>
              </div>
              <div class="col-sm-6 col-md-4 text-md-right">
                <p class="rights"><a href="./login-register.jsp" target="_blank">Giriş - Kayıt Ol</a></p>
              </div>
            </div>
          </div>
        </div>
      </footer>
               <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<%
         Cookie cookiePop = null;
         Cookie[] cookiesPop = null;
         String cModel="";
         String cPrice="";
         String cPlata="";
         cookiesPop = request.getCookies();
         
         if( cookiesPop != null ) {
            
            for (int i = 0; i < cookiesPop.length; i++) {
               cookiePop = cookiesPop[i];
               if(cookiePop.getName( ).equals("cModel")){
                   cModel=cookiePop.getValue().toString();
               }
               else if(cookiePop.getName( ).equals("cPrice")){
                   cPrice=cookiePop.getValue().toString();
               }
               else if(cookiePop.getName( ).equals("cPlata")){
                   cPlata=cookiePop.getValue().toString();
               }
            }
         }
         
         
      %>
<% if(cModel!="") { %>
      <script>
$(document).ready(function(){
setTimeout(function(){
$("#myModal").modal('show');}, 40000);
 
});


</script>
      <% } %>
    <div id="myModal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Aradığın Aracı Bulamadın Mı?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <p>Sitemizde Daha Önce <b><%=cModel%></b> aracımızı incelediğinizi gördük. Bu araımızı şimdi günlük
                        <b><%=cPrice%>TL'den</b> kiralamak ister misiniz?
                    </p>
                  
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hayır, Düşünmüyorum</button>
                    <a href="/Car?carPlata=<%=cPlata%>"><button type="button" class="btn btn-primary">Evet İsterim! Araca Git</button></a>
                </div>
            </div>
        </div>
    </div>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

<script>
    window.onload = function () {
    <% String startDate = (String) request.getParameter("startDate");
       String endDate = (String) request.getParameter("endDate");
    %>

        var x = '<%=startDate%>';
        var y = '<%=endDate%>';

      
    
        switch (x) {
            case x:
                document.getElementById("sdate").value = x;
                break;
            default:
                break;
        }

        switch (y) {
            case y:
                document.getElementById("edate").value = y;
                break;
            default:
                break;
        }

    };
</script>

<section class="section section-sm bg-default text-md-left">
<div class="container">
<div class="row row-50 justify-content-start align-items-xl-center">
<div class="col-md-6 col-lg-6 col-xl-6">
<div class="offset-right-xl-15">
<img src="data:image/jpeg;base64,${photo}" width="480" height="446" />
</div>
</div>
<div class="col-md-6 col-lg-6 col-xl-6 text-left">
<h5 class="text-gray-1000">${model}</h5>

<p class="text-gray-500">Yanda fotografi gorulen ${model} isimli aracimiz ${years} yili uretimli bir aracdir. 
Aracimiz ${gear} vites ile kullanilmaktadir. 
Aracimizin yakiti ${fuel} olup tam depo olarak teslim edilip tam depo olarak teslim alinir.
Aracimizin gunluk kira ucreti ${price}TL olup assagida ki formdan arac alis tarihi ve birakis tarihinizi
secerek sorgulama yapabilirsiniz.
<p class="fiyat-alani">${price}TL /Gunluk</p>
<i>${message}</i>
<div class="aciklama">
<p class="form-desc-sol">Kira Başlangıç</p>
<p class="form-desc-sag">Kira Bitiş</p>
</div>
<form action="/CarRent" method="post">
<input type="hidden" name="action" value="statusRentCar">
<input type="hidden" name="plata" value="${plata}">
<input type="hidden" name="price" value="${price}">
<input type="date" class="dateSelect" id="sdate" name="startRent" value="">
<input type="date" class="dateSelect" id="edate" name="endRent" value="">
    <input class="button button-primary button-md not-top" type="submit" value="Aracı Kirala">
        </form>    
        <div class="divider divider-30 bosluk"></div>
        <div class="list list-description d-inline-block d-md-block">
            <div class="row">

                <div class="col-xs-12 col-md-5">
                    <ul>
                        <li><i class="far fa-check-square"></i>${model}</li>
                    </ul>
                    <ul>
                        <li><i class="far fa-check-square"></i>${years} Model</li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-5">
                    <ul>
                        <li><i class="far fa-check-square"></i>${gear} Vites</li>
                    </ul>
                    <ul>
                        <li><i class="far fa-check-square"></i>${fuel} Yakit</li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-12 col-lg-12 ">

                </div>

            </div>
        </div>
        <div class="divider divider-30"></div>

        </div>
        </div>
        </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>
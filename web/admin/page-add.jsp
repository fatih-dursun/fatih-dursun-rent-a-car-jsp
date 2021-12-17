<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<div class="container-fluid px-4 page-add">
    <h1 class="mt-4">Sayfa Ekle</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>
            <%String linkurl = (String) request.getAttribute("linkurl");
    if (linkurl != null) { %>
    <a class="page-view-url" href="Page?url=${linkurl}" target="_blank">Sayfayı Ziyaret Edin</a>
 

                        <% }%>
                        </div>
                        <form action="AdminServlet" method="post">
                            <input type="hidden" name="action" value="add">        
                                <label class="pad_top"></label>
                                <input type="text" name="ptitle" placeholder="Sayfa Başlığı" value="${page.title}"><br>
                                    <label class="pad_top"></label>
                                    <input type="text" name="purl" placeholder="Sayfa Url" value="${page.url}"><br>
                                        <label class="pad_top">Sayfa İçeriği</label>
                                        <textarea name="pcontent">${page.content}</textarea>
                                        <input type="submit" value="Kaydet" class="margin_left">
                                            </form>
                                            <script>
                                                CKEDITOR.replace('pcontent');
                                            </script>
                                            </div>
                                            </div>
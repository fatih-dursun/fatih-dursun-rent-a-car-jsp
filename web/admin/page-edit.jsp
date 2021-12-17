<%@page import="beanPack.Page"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
<div class="container-fluid px-4 page-add">
    <h1 class="mt-4">Sayfa Düzenle</h1>
    <hr>
    <div class="ust-uyari">
        <p class="left-content"><i>${message}</i></p>
        
    <a class="page-view-url" href="Page?url=${page.url}" target="_blank">Sayfayı Görüntüle</a>
    

                        </div>
                        <form action="AdminServlet" method="post">
                            <input type="hidden" name="action" value="update">        
                                <label class="pad_top"></label>
                                <input class="lock" type="text" name="ptitle" placeholder="Sayfa Başlığı" readonly="readonly" value="${page.title}"><br>
                                    <label class="pad_top"></label>
                                    <input class="lock" type="text" name="purl" placeholder="Sayfa Url"  readonly="readonly" value="${page.url}"><br>
                                        <label class="pad_top">Sayfa İçeriği</label>
                                        <textarea name="pcontent">${page.content}</textarea>
                                        <input type="submit" value="Güncelle" class="margin_left">
                                            </form>
                                            <script>
                                                CKEDITOR.replace('pcontent');
                                            </script>
                                            </div>
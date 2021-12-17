<!DOCTYPE html>
<html lang="tr">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
    <title>Araç Kiralama Yönetim Sayfası</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/admin/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand ps-3" href="./admin/index.jsp">Araba Kiralama Yönetim Paneli</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="/index.jsp" target="_blank">Siteyi Gör</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <li>
                        <form class="form" action="/UserServlet">
                            <input type="hidden" name="action" value="logout">
                                <button type="submit" class="dropdown-item">Çıkış Yap</button>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Kiralama İşlemleri</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseRent" aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-exchange-alt"></i></div>
                        Kiralamalar
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseRent" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="wait-rent">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-pause-circle"></i></div>
                                        Onay Bekleyenler
                                    </button>
                            </form>
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="ok-rent">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-check-circle"></i></div>
                                        Onaylananlar
                                    </button>
                            </form>
                        </nav>
                    </div>
                    <div class="sb-sidenav-menu-heading">Site Ayarları</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Sayfa
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="page-add">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-plus"></i></div>
                                        Sayfa Ekle
                                    </button>
                            </form>
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="page-list">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                        Sayfa Düzenle
                                    </button>
                            </form>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-car"></i></div>
                        Araçlar
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>

                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="car-add">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-plus"></i></div>
                                        Araç Ekle
                                    </button>
                            </form>
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="car-list">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                        Araç Düzenle
                                    </button>
                            </form>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Kullanıcılar
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseUser" aria-labelledby="headingTree" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="user-add-page">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-user-plus"></i></div>
                                        Kullanıcı Ekle
                                    </button>
                            </form>
                            <form action="/AdminServlet" method="post">
                                <input type="hidden" name="action" value="user-list">
                                    <button type="submit" class="nav-link">
                                        <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                                        Kullanıcı Düzenle
                                    </button>
                            </form>
                        </nav>
                    </div>

                    <div class="sb-sidenav-menu-heading">Site Genel Ayarları</div>
                    <form action="/AdminServlet">
                        <input type="hidden" name="action" value="menu-settings">
                            <button type="submit" class="nav-link">
                                <div class="sb-nav-link-icon"><i class="fas fa-bars"></i></div>
                                Menü Düzenle
                            </button>
                    </form>
                    <form action="/AdminServlet">
                        <input type="hidden" name="action" value="general-settings">
                            <button type="submit" class="nav-link">
                                <div class="sb-nav-link-icon"><i class="fas fa-cog"></i></div>
                                Genel Ayarlar
                            </button>
                    </form>
                    <form action="/AdminServlet">
                        <input type="hidden" name="action" value="footer-edit">
                            <button type="submit" class="nav-link">
                                <div class="sb-nav-link-icon"><i class="fas fa-sitemap"></i></div>
                                Footer Düzenle
                            </button>
                    </form>
                </div>
            </div>

        </nav>
    </div>
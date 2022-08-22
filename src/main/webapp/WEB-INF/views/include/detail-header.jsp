<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header_in clearfix">
    <div class="container">
        <div id="logo">
            <a href="/">
                <img src="img/foodie_logo.png" width="120" height="55" alt="">
            </a>
        </div>
        <ul id="top_menu">
            <li><a href="#sign-in-dialog" id="sign-in" class="login">Sign In</a></li>
            <li><a href="wishlist.html" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
        </ul>
        <!-- /top_menu -->
        <a href="#0" class="open_close">
            <i class="icon_menu"></i><span>Menu</span>
        </a>
        <nav class="main-menu">
            <div id="header_menu">
                <a href="#0" class="open_close">
                    <i class="icon_close"></i><span>Menu</span>
                </a>
                <a href="/"><img src="img/logo.svg" width="140" height="35" alt=""></a>
            </div>
            <ul>
                <li class="submenu">
                    <a href="/" class="show-submenu">메인페이지</a>
                </li>
                <li class="submenu">
                    <a href="/foodlist" class="show-submenu">맛집 리스트</a>
                </li>
                <li class="submenu">
                    <a href="/review" class="show-submenu">리뷰 리스트</a>
                </li>

            </ul>
        </nav>
    </div>
</header>
<!-- /header -->
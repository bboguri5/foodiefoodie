<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header_in clearfix">
    <div class="container">
        <div id="logo">
            <a href="/">
                <img src="/img/foodie_logo.png" width="120" height="55" alt="">
            </a>
        </div>
        <c:if test="${loginUser == null}">
            <ul id="top_menu">
                <li><a href="#sign-in-dialog" id="sign-in" class="login">Sign In</a></li>
            </ul>
        </c:if>

        <c:if test="${loginUser != null}">
            <c:if test="${loginUser.auth == 'ADMIN'}">
                <ul id="top_menu" class="drop_user">
                    <li>
                        <div class="dropdown user clearfix">
                            <a href="#" data-bs-toggle="dropdown">
                                <span>${loginUser.name}</span>
                            </a>
                            <div class="dropdown-menu">
                                <div class="dropdown-menu-content">
                                    <ul>
                                        <li><a href="/admin/member"><i class="icon_cog"></i>Admin Page</a></li>
                                        <li><a href="/sign-out"><i class="icon_key"></i>Log out</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /dropdown -->
                    </li>
                </ul>
            </c:if>
            <c:if test="${loginUser.auth != 'ADMIN'}">
                <ul id="top_menu" class="drop_user">
                    <li>
                        <div class="dropdown user clearfix">
                            <a href="#" data-bs-toggle="dropdown">
                                <span>${loginUser.name}</span>
                            </a>
                            <div class="dropdown-menu">
                                <div class="dropdown-menu-content">
                                    <ul>
                                        <li><a href="/myPage/profile"><i class="icon_cog"></i>MyPage</a></li>
                                        <li><a href="/myPage/myReview"><i class="icon_document"></i>MyReview</a></li>
                                        <li><a href="/myPage/favoriteList"><i class="icon_heart"></i>Favorite List</a></li>
                                        <li><a href="/sign-out"><i class="icon_key"></i>Log out</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /dropdown -->
                    </li>
                </ul>
            </c:if>
        </c:if>
        <!-- /top_menu -->
        <a href="#0" class="open_close">
            <i class="icon_menu"></i><span>Menu</span>
        </a>
        <nav class="main-menu">
            <div id="header_menu">
                <a href="#0" class="open_close">
                    <i class="icon_close"></i><span>Menu</span>
                </a>
                <a href="/"><img src="/img/foodie_logo.png"  width="150" height="100" alt=""></a>
            </div>
            <ul>
                <li class="submenu">
                    <a href="/" class="show-submenu">???????????????</a>
                </li>
                <li class="submenu">
                    <a href="/foodlist" class="show-submenu">?????? ?????????</a>
                </li>
                <li class="submenu">
                    <a href="/review?sort=latest" class="show-submenu">?????? ?????????</a>
                </li>

            </ul>
        </nav>
    </div>
</header>
<!-- /header -->
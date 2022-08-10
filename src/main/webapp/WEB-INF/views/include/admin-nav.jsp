<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html"><img src="img/logo.svg" alt="" width="142" height="36"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Member-management">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#member">
                    <i class="fa fa-fw fa-list"></i>
                    <span class="nav-link-text">회원 관리</span>
                </a>
                <ul class="sidenav-second-level collapse" id="member">
                    <li>
                        <a href="/admin/member-management">일반회원</a>
                    </li>
                    <li>
                        <a href="/admin/member-master">사업자</a>
                    </li>
                    <li>
                        <a href="/admin/member-reportmember">불량 이용자</a>
                    </li>
                    <li>
                        <a href="/admin/member-blacklist">블랙 리스트</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Report">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#report">
                    <i class="fa fa-fw fa-list"></i>
                    <span class="nav-link-text">신고 관리</span>
                </a>
                <ul class="sidenav-second-level collapse" id="report">
                    <li>
                        <a href="/admin/promotionFaq">홍보글</a>
                    </li>
                    <li>
                        <a href="/admin/reviewFaq">리뷰</a>
                    </li>
                    <li>
                        <a href="/admin/replyFaq">댓글</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Premiume"
                data-original-title="Bookings">
                <a class="nav-link" href="#">
                    <i class="fa fa-fw fa-calendar-check-o"></i>
                    <span class="nav-link-text">광고 관리</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Update-auth"
                data-original-title="Bookings">
                <a class="nav-link" href="#">
                    <i class="fa fa-fw fa-calendar-check-o"></i>
                    <span class="nav-link-text">권한 관리</span>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <form class="form-inline my-2 my-lg-0 mr-lg-2">
                    <div class="input-group">
                        <input class="form-control search-top" type="text" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </form>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal"><i
                        class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>
    </div>
</nav>
<!-- /Navigation-->
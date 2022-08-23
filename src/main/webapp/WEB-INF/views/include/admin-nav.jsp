<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="/"><img src="../img/foodie_logo.png" alt="" width="110" height="36"></a>
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
                        <a href="/admin/member">일반회원</a>
                    </li>
                    <li>
                        <a href="/admin/member-master">사업자</a>
                    </li>
                    <li>
                        <a href="/admin/member-reportmember">불량 이용자(일반)</a>
                    </li>
                    <li>
                        <a href="/admin/member-reportmaster">불량 이용자(사업자)</a>
                    </li>
                    <li>
                        <a href="/admin/member-blackList">블랙 리스트(일반)</a>
                    </li>
                    <li>
                        <a href="/admin/member-blackList-master">블랙 리스트(사업자)</a>
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
                    <li>
                        <a href="/admin/completeFaq">처리 완료</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Premiume">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#premiume">
                    <i class="fa fa-fw fa-list"></i>
                    <span class="nav-link-text">광고 관리</span>
                </a>
                <ul class="sidenav-second-level collapse" id="premiume">
                    <li>
                        <a href="/admin/premiume-F">신청중</a>
                    </li>
                    <li>
                        <a href="/admin/premiume-T">진행중</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Update-auth"
                data-original-title="Bookings">
                <a class="nav-link" href="/admin/approve-master">
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
               <a href="/sign-out"><i class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>
    </div>
</nav>
<!-- /Navigation-->


<script>
    (function() {
        
    }())
</script>
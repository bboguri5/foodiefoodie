<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="/"><img src="../img/foodie_logo.png" alt="" width="142" height="36"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">

        <!-- 옆라인 시작 ================================================================== -->

        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My profile">
                <a class="nav-link" href="/myPage/profile">
                    <i class="fa fa-fw fa-user"></i>
                    <span class="nav-link-text">내 정보 / 수정/ 탈퇴</span>
                </a>
            </li>
            <c:if test="${loginUser.auth == 'MASTER'}">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#storeInfo">
                        <i class="fa fa-fw fa-list"></i>
                        <span class="nav-link-text">가게 정보 현황 ${masterCount}개</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="storeInfo">
                            <c:forEach var="n" begin="0" end="${masterCount}" step="1">
                                <li>
                                    <a href="/masterInfo/${n}">${masterList[n].storeName}<span class="badge badge-pill badge-primary"></span></a>
                                </li>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${loginUser.auth == 'MASTER'}">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#f123123">
                        <i class="fa fa-fw fa-list"></i>
                        <span class="nav-link-text">가게 별 신고 내역</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="f123123">
                            <c:forEach var="n" begin="0" end="${masterCount}" step="1">
                                <li>
                                    <a href="/promotionReport/${n}&${masterList[n].businessNo}">${masterList[n].storeName}<span class="badge badge-pill badge-primary"></span></a>
                                </li>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>
            <c:if test="${loginUser.auth == 'MASTER'}">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
                    <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#masterOrderList">
                        <i class="fa fa-fw fa-list"></i>
                        <span class="nav-link-text">가게 별 주문 내역</span>
                    </a>
                    <ul class="sidenav-second-level collapse" id="masterOrderList">
                            <c:forEach var="n" begin="0" end="${masterCount}" step="1">
                                <li>
                                    <a href="/masterOrderList/${n}">${masterList[n].storeName}<span class="badge badge-pill badge-primary"></span></a>
                                </li>
                            </c:forEach>
                    </ul>
                </li>
            </c:if>



            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
                <a class="nav-link" href="/myReview">
                    <i class="fa fa-fw fa-star"></i>
                    <span class="nav-link-text">Reviews 내가쓴 리뷰 </span>
                </a>
            </li>

            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookmarks">
                <a class="nav-link" href="/favoriteList">
                    <i class="fa fa-fw fa-heart"></i>
                    <span class="nav-link-text">Bookmarks 즐겨찾기 리스트 </span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Messages">
                <a class="nav-link" href="/userOrderList">
                    <i class="fa fa-fw fa-envelope-open"></i>
                    <span class="nav-link-text"> 주문 내역 </span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#t123123">
                    <i class="fa fa-fw fa-list"></i>
                    <span class="nav-link-text">신고 내역</span>
                </a>
                <ul class="sidenav-second-level collapse" id="t123123">
                    <li>
                        <a href="/replyReport">댓글 신고내역<span class="badge badge-pill badge-primary"></span></a>
                    </li>
                    <li>
                        <a href="/reviewReport">리뷰글 신고내역<span class="badge badge-pill badge-success"></span></a>
                    </li>
                   
                </ul>
            </li>


        </ul>

        <!-- 옆라인 끝 ================================================================== -->

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
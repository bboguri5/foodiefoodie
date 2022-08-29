<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="../include/static-head.jsp" %>


    <style>
        .page_header .container .row form {
            width: 75%;

        }

        .page_header .container .row .col-xl-8 {
            width: 20%;
        }

        nav.main-menu {
            height: 100%;
            margin-right: 40px;
        }

        .submenu .show-submenu {
            color: #589442;
        }
    </style>

</head>

<body>

    <%@ include file="../include/detail-header.jsp" %>


    <main>
        <div class="page_header element_to_stick">
            <div class="container">
                <div class="row">
                    <form action="/review/search" method="get">
                        <div class="col-xl-4 col-lg-5 col-md-5">
                            <div class="search_bar_list">
                                <input required value="${search}" name="search" type="text" class="form-control"
                                    placeholder="Search in blog...">
                                <input type="submit" value="Search">
                            </div>
                        </div>
                    </form>
                    <div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
                        <nav class="main-menu">
                            <ul>
                                <li class="submenu">
                                    <a href="#0" class="show-submenu">SORT <i class="arrow_carrot-down"></i></a>
                                    <ul>
                                        <c:if test="${not empty search}">
                                            <li><a href="/review/search?search=${search}&sort=like">추천순</a></li>
                                            <li><a href="/review/search?search=${search}&sort=latest">최신순</a></li>
                                        </c:if>
                                        <c:if test="${empty search}">
                                            <li><a href="/review?sort=like">추천순</a></li>
                                            <li><a href="/review?sort=latest">최신순</a></li>
                                        </c:if>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /row -->
            </div>
        </div>
        <!-- /page_header -->

        <div class="container margin_30_40">
            <div class="row">
                <c:forEach var="sl" items="${searchList}" varStatus="status">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                        <div class="strip">
                            <figure>
                                <c:if test="${sl.hotDeal == 'Y'.charAt(0) && sl.endDate > todayDate}">
                                    <span class="ribbon off">${sl.discountPrice}</span>
                                </c:if>
                                <img src="${sl.filePath}" data-src="${sl.filePath}" class="img-fluid lazy" alt="">
                                <a href="detail-restaurant.html" class="strip_info">
                                    <c:if test="${sl.hotDeal == 'Y'.charAt(0) && sl.endDate > todayDate}">
                                        <small>기간: ${sl.endDate}</small>
                                    </c:if>
                                    <div class="item_title">
                                        <h3>${sl.storeName}</h3>
                                    </div>
                                </a>
                            </figure>
                            <ul>
                                <li><span>${sl.storeAddress}</span></li>
                                <li>
                                    <div class="score"><span>푸디푸디 추천 맛집<em>${sl.reviewCnt}개
                                                리뷰</em></span><strong>${sl.avgStarRate}</strong></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- /row -->

            <div class="list-bottom">
                <!-- 페이지 버튼 -->
                <div class="paging">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-lg pagination-custom">

                            <c:if test="${pm.prev}">
                                <li class="page-item"><a class="page-link"
                                        href="/list?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}&keyword=${s.keyword}">Prev</a>
                                </li>
                            </c:if>

                            <!-- step=1인 경우,, 생략 가능!! -->
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/list?pageNum=${n}&amount=${pm.page.amount}&keyword=${s.keyword}">${n}</a>
                                </li>
                            </c:forEach>


                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/list?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}&keyword=${s.keyword}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /container -->

    </main>
    <!-- /main -->

    <%@ include file="../include/footer.jsp" %>

</body>

</html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

	<%@ include file="../include/static-head.jsp" %>

</head>

<body>

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
                        <a href="#0" class="show-submenu">리뷰 리스트</a>
                    </li>
    
                </ul>
            </nav>
        </div>
    </header>
    <!-- /header -->

    <main>
        <div class="page_header element_to_stick">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
                        <div class="breadcrumbs">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Category</a></li>
                                <li>Page active</li>
                            </ul>
                        </div>
                        <h1>145 restaurants in Convent Street 2983</h1>
                    </div>
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="search_bar_list">
                            <input type="text" class="form-control" placeholder="Search again...">
                            <input type="submit" value="Search">
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
        </div>
        <!-- /page_header -->



        <div class="container margin_30_40">
            <div class="row">
                <c:forEach var="dbList" items="${dbList}" varStatus="status">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                        <div class="strip">
                            <figure>
                                <img src="${dbList.filePath}" data-src="${dbList.filePath}" class="img-fluid lazy"
                                    alt="">
                                <a href="detail-restaurant.html" class="strip_info">
                                    <div class="item_title">
                                        <h3>${dbList.storeName}</h3>
                                    </div>
                                </a>
                            </figure>
                            <ul>
                                <li><span>${dbList.storeAddress}</span></li>
                                <li>
                                    <div class="score"><span>맛집이에요~<em>${dbList.reviewCnt}개 리뷰</em></span><strong>${dbList.avgStarRate}</strong></div>
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
                                        href="/foodlist?pageNum=${pm.beginPage - 1}&amount=${pm.getPage().getAmount()}">Prev</a>
                                </li>
                            </c:if>

                            <!-- step=1인 경우,, 생략 가능!! -->
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/foodlist?pageNum=${n}&amount=${pm.getPage().getAmount()}">${n}</a>
                                </li>
                            </c:forEach>


                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/foodlist?pageNum=${pm.endPage + 1}&amount=${pm.getPage().getAmount()}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

	<%@ include file="../include/footer.jsp" %>

</body>

</html>
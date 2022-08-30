<%@ page contentType='text/html; charset=UTF-8' language='java' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Foogra - Discover & Book the best restaurants at the best price">
    <meta name="author" content="Ansonika">
    <title>Foogra - Discover & Book the best restaurants at the best price</title>

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="/css/detail-page.css" rel="stylesheet">

    <link href="/css/detail-page-delivery.css" rel="stylesheet">

    <!-- notice -->
    <link href="/vendor/magnific-popup.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>
    <!-- bootstrap css -->

    <style id="theia-sticky-sidebar-stylesheet-TSS">
        .theiaStickySidebar:after {
            content: "";
            display: table;
            clear: both;
        }
    </style>
    <!-- kakao map -->
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c52a004bc69d2f545cf74556fe651345&libraries=services,clusterer,drawing">
    </script>

    <!-- icon link -->
    <script src="https://kit.fontawesome.com/de04e07342.js" crossorigin="anonymous"></script>
</head>

<style>
    .container.margin_detail .col-lg-8 {
        width: 100%;
    }

    section.detail-section {
        width: 80%;
        margin: 0 auto;
    }

    .menu-gallery {
        width: 100%;
        padding-left: 25%;
        padding-right: 25%;
    }

    .menu_item.thumbs figure img.defaultImg {
        width: 50px;
    }

    .endLine {
        margin: 20px 0 20px 0;
        border-bottom: 1px solid rgb(204, 197, 197);
    }


    .update_date {
        display: flex;
        justify-content: end;
    }

    h2.detailInfoTitle {
        text-align: start;
    }

    .info-detail th {
        width: 110px;
        font-size: .9rem;
        color: rgba(79, 79, 79, 0.6);
        line-height: 1.7;
        text-align: left;
        vertical-align: top;
        padding-right: 10px;
        padding-bottom: 5px;
    }

    .menuInfo {
        display: flex;
        justify-content: space-between;
    }

    .menuAddBtn {
        background: rgb(255, 112, 112);
        width: 50px;
        height: 50px;
        border: 0;
    }

    .openKaKaoMap {
        margin-left: 10px;
    }

    h1 {
        color: #fff !important;
    }

    .openWriteBox {
        display: flex;
        justify-content: end;


    }

    .openWriteBtn {
        width: 50px;
        height: 50px;
    }

    .quantity {
        display: inline;
        margin-left: 470px;
    }

    .icon_minus_alt2:hover {
        cursor: pointer;
    }

    .icon_minus_alt2 {
        margin-right: 20px;
    }

    .icon_plus_alt2:hover {
        cursor: pointer;
    }

    .icon_plus_alt2 {
        margin-left: 20px;
    }


    /* review */
    #locationList {
        display: flex;
        justify-content: space-between;
    }

    #locationList .item {
        width: 16%;
    }

    .search form {
        display: flex;
    }

    .search .form-select {
        flex: 1;
        margin-top: 8px;
        border-radius: 10px;
    }

    .search .row {
        flex: 10;
    }

    .col-lg-9 {
        margin: auto;
        width: 60%;
    }

    article.blog .post_info {
        padding: 20px 17px 30px 17px;
    }

    .post_info h2 {
        margin: 20px 0;
    }

    .post_info li i {
        margin-left: 10px;
    }

    .heartIcon:hover {
        cursor: pointer;
    }

    .icon_comment_alt {
        cursor: pointer;
    }

    p {
        overflow-wrap: break-word;
    }

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

<body>

    <%@ include file="../include/header.jsp" %>


    <!-- main -->
    <main>

        <div class="hero_in detail_page title_img_add" style=" background-image: url(${proBoard.fileData});">
            <!-- <img src="data:image/jpg;base64,${titleImg}">  -->
            <div class="wrapper opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
                <div class="container">
                    <div class="main_info">
                        <div class="row">
                            <div class="col-xl-4 col-lg-5 col-md-6">
                                <div class="head">
                                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
                                </div>
                                <h1>${proBoard.title}</h1>
                                ${proBoard.storeAddress} ${proBoard.storeDetailAddress}
                                <a class="openKaKaoMap" target="_blank">카카오맵 연결</a>
                            </div>
                            <div class="col-xl-8 col-lg-7 col-md-6 position-relative">
                                <div class="buttons clearfix">
                                    <span class="magnific-gallery">
                                        <a href="/img/detail_1.jpg" class="btn_hero" title="Photo title"
                                            data-effect="mfp-zoom-in"><i class="icon_image"></i>View photos</a>
                                        <a href="/img/detail_2.jpg" title="Photo title" data-effect="mfp-zoom-in"></a>
                                        <a href="/img/detail_3.jpg" title="Photo title" data-effect="mfp-zoom-in"></a>
                                    </span>
                                    <a href="#0" class="btn_hero wishlist"><i class="icon_heart"></i>Wishlist</a>
                                </div>
                            </div>
                        </div>
                        <!-- /row -->
                    </div>
                    <!-- /main_info -->
                </div>
            </div>
        </div>
        <!--/hero_in-->

        <div class="container margin_detail">
            <div class="row">
                <div class="col-lg-8">
                    <div class="tabs_detail">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a id="tab-A" href="#pane-A" class="nav-link active" data-bs-toggle="tab"
                                    role="tab">Information</a>
                            </li>
                            <c:set var="menuList" value="${menuList}" />
                            <c:if test="${fn:length(menuList) > 0}">
                                <li class="nav-item">
                                    <a id="tab-B" href="#pane-B" class="nav-link" data-bs-toggle="tab"
                                        role="tab">menu</a>
                                </li>
                            </c:if>

                            <li class="nav-item">
                                <a id="tab-C" href="#pane-C" class="nav-link" data-bs-toggle="tab"
                                    role="tab">Reviews</a>
                            </li>
                            <li class="nav-item">
                                <a id="tab-D" href="#pane-D" class="nav-link  newNotice" data-bs-toggle="tab"
                                    role="tab">Notice

                                </a>
                            </li>
                        </ul>

                        <div class="tab-content" role="tablist">
                            <!-- A type -->
                            <div id="pane-A" class="card tab-pane fade show active" role="tabpanel"
                                aria-labelledby="tab-A">
                                <div class="card-header" role="tab" id="heading-A">
                                    <h5>
                                        <a class="collapsed" data-bs-toggle="collapse" href="#collapse-A"
                                            aria-expanded="true" aria-controls="collapse-A">
                                            Information
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapse-A" class="collapse" role="tabpanel" aria-labelledby="heading-A">
                                    <div class="card-body info_content">
                                        <div class="add_bottom_25"></div>
                                        <!-- detail photo -->
                                        <h2>Detail Photos</h2>
                                        <div class="pictures magnific-gallery clearfix">
                                            <c:forEach var="detailImg" items="${fileMap['detail']}" varStatus="status">
                                                <figure><a title="Photo title" data-effect="mfp-zoom-in"><img
                                                            src="${detailImg.fileData}" data-src="${detailImg.fileData}"
                                                            class="lazy" alt=""></a>
                                                </figure>
                                            </c:forEach>
                                        </div>
                                        <!-- /detail photo -->
                                        <!-- detail info -->
                                        <section class="detail-section">
                                            <div class="add_bottom_25"></div>
                                            <h2 class="detailInfoTitle"> 기본 정보</h2>
                                            <div class="info-detail">
                                                <table class="info-table">
                                                    <tbody>
                                                        <tr class="only-desktop">
                                                            <th>주소</th>
                                                            <td>${proBoard.storeAddress} ${proBoard.storeDetailAddress}<br>
                                                                <!-- ${address} -->
                                                            </td>
                                                        </tr>
                                                        <tr class="only-desktop">
                                                            <th>전화번호</th>
                                                            <td>${proBoard.storeCallNumber}</td>
                                                            <!-- ${storeCallNumber} -->
                                                        </tr>

                                                        <!-- 메뉴 입력시 평균 표시  -->
                                                        <!-- <tr>
                                                            <th>가격대</th>
                                                            <td>3만원-4만원</td> 
                                                        </tr> -->

                                                        <tr>
                                                            <th style="vertical-align:top;">영업시간</th>
                                                            <td>월-금: ${proBoard.weekdayOpenTime} -
                                                                ${proBoard.weekdayCloseTime}
                                                                <br> 토: ${proBoard.weekendOpenTime} -
                                                                ${proBoard.weekendCloseTime}
                                                                <br> 브레이크타임: ${proBoard.breakStartTime} -
                                                                ${proBoard.breakEndTime}</td>
                                                            <!-- ${StoreTime} -->
                                                        </tr>
                                                        <tr>
                                                            <th>휴일</th>
                                                            <td>${proBoard.closedDay}</td>
                                                        </tr><!-- ${StoreTime} -->
                                                    </tbody>
                                                </table>
                                                <p class="update_date">
                                                    업데이트
                                                    : ${proBoard.lastUpdated}
                                                </p>
                                            </div>
                                            <div class="endLine"></div>
                                            <!-- /detail info -->

                                            <div class="add_bottom_25"></div>
                                            <h2 class="detailInfoTitle"> 사장님이 작성한 글</h2>
                                            <div class="content">
                                                ${proBoard.content}
                                            </div>
                                            <div class="endLine"></div>

                                            <div class="add_bottom_25"></div>
                                            <h2 class="detailInfoTitle"> 장소</h2>
                                            <div id="map" class="kakaoMap" style="width:100%;height:600px;"></div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <!-- /A type -->






                            <!-- B type -->
                            <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
                                <div class="card-header" role="tab" id="heading-B">
                                    <div class="card-header" role="tab" id="heading-B">
                                        <h5>
                                            <a class="collapsed" data-bs-toggle="collapse" href="#collapse-B"
                                                aria-expanded="true" aria-controls="collapse-B">
                                                Information
                                            </a>
                                        </h5>
                                    </div>
                                </div>
                                <div id="collapse-B" class="collapse" role="tabpanel" aria-labelledby="heading-B">
                                    <div class="card-body info_content menu-body">
                                        <!-- /menu-gallery -->
                                        <div class="special_offers add_bottom_45">
                                            <h2>Menu</h2>
                                        </div>
                                        <div class="add_bottom_45"></div>
                                        <div class="menu-gallery">
                                            <!-- menu itmes -->
                                            <c:forEach var="menu" items="${menuList}">

                                            <div class="menu_item thumbs">
                                                    <figure>
                                                        <a title="Photo title" data-effect="mfp-zoom-in">
                                                            <c:set var="filePath" value="${menu.filePath}" />
                                                            <c:if test="${fn:contains(filePath,'foodie_default.PNG')}">
                                                                <img src="${menu.filePath}" data-src="${menu.filePath}"
                                                                    alt="${menu.fileName}" class="defaultImg">
                                                            </c:if>
                                                            <c:if
                                                                test="${not fn:contains(filePath,'foodie_default.PNG')}">
                                                                <img src="${menu.fileData}" data-src="${menu.fileData}"
                                                                    alt="${menu.fileName}" class="lazy">
                                                            </c:if>
                                                        </a>
                                                    </figure>
                                                <div id="menu${menu.menuNo}" class="menuInfo">
                                                    <h4 id="menu-name${menu.menuNo}">${menu.menuName}
                                                    </h4>
                                                    <em id="menu-price${menu.menuNo}">${menu.menuPrice}</em>
                                                    <button id="${menu.menuNo}" class="menuAddBtn"
                                                        type="button">방문포장</button>
                                                </div>
                                            </div>
                                        </c:forEach>

                                            <!-- menu itmes -->
                                        </div>
                                        <!-- /menu-gallery -->
                                        <div class="add_bottom_45"></div>
                                    </div>
                                    <div class="theiaStickySidebar">
                                        <div class="box_booking">
                                            <div class="head">
                                                <h3>Order Summary</h3>
                                                <div class="offer">Up to -40% off</div>
                                            </div>
                                            <!-- /head -->
                                            <div class="main">
                                                <ul id="async-order-list" class="clearfix click-target">

                                                </ul>

                                                <form action="#" method="get">
                                                    <input hidden value="" type="text">
                                                </form>

                                                <ul class="clearfix">
                                                    <li class="total">Total<span id="total">0</span></li>
                                                </ul>

                                                <a id="submit-order" href="#" class="btn_1 full-width mb_5">Order
                                                    Now</a>
                                                <div class="text-center"><small>No money charged on this
                                                        steps</small></div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                            <!-- /B type -->


                            <!-- C type -->
                            <div id="pane-C" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-C">
                                <div class="card-header" role="tab" id="heading-C">
                                    <h5>
                                        <a class="collapsed" data-bs-toggle="collapse" href="#collapse-C"
                                            aria-expanded="false" aria-controls="collapse-C">
                                            Reviews
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapse-C" class="collapse" role="tabpanel" aria-labelledby="heading-C">
                                    <div class="card-body reviews">
                                        <div class="row add_bottom_45 d-flex align-items-center">
                                            <div class="col-md-3">
                                                <div id="review_summary">
                                                    <strong>8.5</strong>
                                                    <em>Superb</em>
                                                    <small>Based on 4 reviews</small>
                                                </div>
                                            </div>
                                            <div class="col-md-9 reviews_sum_details">
                                                <c:forEach var="rl" items="${reviewList}" varStatus="status">
                                                    <!-- <div class="col-md-6"> -->
                                                    <article class="blog">
                                                        <figure>
                                                            <a
                                                                href="/review/detail?email=${loginUser.email}&reviewBno=${rl.reviewBno}"><img
                                                                    src="${uploads[status.index].filePath}" alt="">
                                                                <div class="preview"><span>Read more</span></div>
                                                            </a>
                                                        </figure>
                                                        <div class="post_info">
                                                            <small>Last Updated - ${rl.lastUpdated}
                                                                <fmt:formatDate type="both" value="${rl.lastUpdated}" />
                                                            </small>
                                                            <h2><a
                                                                    href="/review/detail?email=${loginUser.email}&reviewBno=${rl.reviewBno}">${rl.title}</a>
                                                            </h2>

                                                            <p>식당 이름: <a href="#">${rl.storeName}</a></p>
                                                            <p>식당 주소: ${rl.storeAddress}</p>
                                                            <p>${rl.content}
                                                                <ul>
                                                                    <li>
                                                                        <div class="thumb"><img src="/img/avatar.jpg"
                                                                                alt=""></div>
                                                                        ${rl.email}
                                                                    </li>
                                                                    <li>
                                                                        <i id="${rl.reviewBno}"
                                                                            class="heartIcon icon_heart_alt"></i><span
                                                                            id="heart${rl.reviewBno}">${rl.likeCnt}</span>
                                                                        <a
                                                                            href="/review/detail?email=${loginUser.email}&reviewBno=${rl.reviewBno}#section-comment"><i
                                                                                id="${rl.reviewBno}"
                                                                                class="icon_comment_alt"></i>${replyCount[status.index]}</a>
                                                                    </li>

                                                                </ul>
                                                        </div>
                                                    </article>
                                                    <!-- /article -->
                                                    <!-- </div> -->
                                                </c:forEach>
                                            </div>
                                            <!-- /review_card -->
                                        </div>
                                        <!-- /reviews -->
                                        <div class="text-end"><a href="leave-review.html" class="btn_1">Leave a
                                                review</a></div>
                                    </div>
                                </div>
                            </div>
                            <!-- /C type -->
                            <!-- D type -->

                            <div id="pane-D" class="card tab-pane fade show" role="tabpanel" aria-labelledby="tab-D">
                                <div class="card-header" role="tab" id="heading-D">
                                    <h5>
                                        <a class="collapsed" data-bs-toggle="collapse" href="#collapse-D"
                                            aria-expanded="true" aria-controls="collapse-D">
                                            Notice
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapse-D" class="collapse" role="tabpanel" aria-labelledby="heading-D">
                                    <div class="card-body info_content">
                                        <div class="add_bottom_25"></div>
                                        <!-- 공지사항  -->
                                        <h2>공지사항</h2>
                                        <div class="add_bottom_25 openWriteBox">
                                            <p class="inline-popups noticeWrite">
                                                <a href="#modal-reply" data-effect="mfp-zoom-in" class="btn_1">
                                                    <i class="fa fa-fw fa-reply"></i>글쓰기</a>
                                            </p>
                                        </div>
                                        <div class="list_general notices">
                                            <ul>
                                                <!-- makeNoticeDom method -->
                                            </ul>

                                        </div>
                                        <!-- /공지사항 -->
                                        <!-- detail info -->
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /tab-content -->
                    </div>
                    <!-- /tabs_detail -->

                </div>
                <!-- /col -->

                <!-- /row -->
            </div>

            <!-- /row -->

            <!-- /container -->
        </div>


    </main>
    <!-- /main -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_1">Quick Links</h3>
                    <div class="collapse dont-collapse-sm links" id="collapse_1">
                        <ul>
                            <li><a href="submit-rider.html">Become a Rider</a></li>
                            <li><a href="submit-restaurant.html">Add your restaurant</a></li>
                            <li><a href="help.html">Help</a></li>
                            <li><a href="account.html">My account</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_2">Categories</h3>
                    <div class="collapse dont-collapse-sm links" id="collapse_2">
                        <ul>
                            <li><a href="grid-listing-filterscol.html">Top Categories</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry.html">Best Rated</a></li>
                            <li><a href="grid-listing-filterscol-full-width.html">Best Price</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry.html">Latest Submissions</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_3">Contacts</h3>
                    <div class="collapse dont-collapse-sm contacts" id="collapse_3">
                        <ul>
                            <li><i class="icon_house_alt"></i>97845 Baker st. 567<br>Los Angeles - US</li>
                            <li><i class="icon_mobile"></i>+94 423-23-221</li>
                            <li><i class="icon_mail_alt"></i><a href="#0">info@domain.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_4">Keep in touch</h3>
                    <div class="collapse dont-collapse-sm" id="collapse_4">
                        <div id="newsletter">
                            <div id="message-newsletter"></div>
                            <form method="post" action="assets/newsletter.php" name="newsletter_form"
                                id="newsletter_form">
                                <div class="form-group">
                                    <input type="email" name="email_newsletter" id="email_newsletter"
                                        class="form-control" placeholder="Your email">
                                    <button type="submit" id="submit-newsletter"><i
                                            class="arrow_carrot-right"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="follow_us">
                            <h5>Follow Us</h5>
                            <ul>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="/img/twitter_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="/img/facebook_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="/img/instagram_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="/img/youtube_icon.svg" alt="" class="lazy"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- /row-->
            <hr>
            <div class="row add_bottom_25">
                <div class="col-lg-6">
                    <ul class="footer-selector clearfix">
                        <li>
                            <div class="styled-select lang-selector">
                                <select>
                                    <option value="English" selected>English</option>
                                    <option value="French">French</option>
                                    <option value="Spanish">Spanish</option>
                                    <option value="Russian">Russian</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <div class="styled-select currency-selector">
                                <select>
                                    <option value="US Dollars" selected>US Dollars</option>
                                    <option value="Euro">Euro</option>
                                </select>
                            </div>
                        </li>
                        <li><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                data-src="/img/cards_all.svg" alt="" width="198" height="30" class="lazy"></li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <ul class="additional_links">
                        <li><a href="#0">Terms and conditions</a></li>
                        <li><a href="#0">Privacy</a></li>
                        <li><span>© Foogra</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/footer-->

    <div id="toTop"></div><!-- Back to top button -->

    <div class="layer"></div><!-- Opacity Mask Menu Mobile -->

    <!-- Sign In Modal -->
    <div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
        <div class="modal_header">
            <h3>Sign In</h3>
        </div>
        <form>
            <div class="sign-in-wrapper">
                <a href="#0" class="social_bt facebook">Login with Facebook</a>
                <a href="#0" class="social_bt google">Login with Google</a>
                <div class="divider"><span>Or</span></div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" id="email">
                    <i class="icon_mail_alt"></i>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" id="password" value="">
                    <i class="icon_lock_alt"></i>
                </div>
                <div class="clearfix add_bottom_15">
                    <div class="checkboxes float-start">
                        <label class="container_check">Remember me
                            <input type="checkbox">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="float-end"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
                </div>
                <div class="text-center">
                    <input type="submit" value="Log In" class="btn_1 full-width mb_5">
                    Don’t have an account? <a href="account.html">Sign up</a>
                </div>
                <div id="forgot_pw">
                    <div class="form-group">
                        <label>Please confirm login email below</label>
                        <input type="email" class="form-control" name="email_forgot" id="email_forgot">
                        <i class="icon_mail_alt"></i>
                    </div>
                    <p>You will receive an email containing a link allowing you to reset your password to a new
                        preferred one.</p>
                    <div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
                </div>
            </div>
        </form>
        <!--form -->
    </div>
    <!-- /Sign In Modal -->

    <!-- notice modal to review popup -->
    <div id="modal-reply" class="white-popup mfp-with-anim mfp-hide">
        <div class="small-dialog-header">
            <h3>공지사항 내용</h3>
        </div>
        <div class="message-reply margin-top-0">
            <div class="form-group">
                <textarea cols="40" rows="3" class="form-control noticeContent" placeholder="300자 이내"></textarea>
            </div>
            <button class="btn_1 noticeSubmit">입력</button>
        </div>
    </div>


    <!-- COMMON SCRIPTS -->
    <script src="/js/common_scripts.min.js"></script>
    <script src="/js/common_func.js"></script>
    <script src="/js/validate.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="/js/sticky_sidebar.min.js"></script>
    <script src="/js/specific_detail.js"></script>

    <script src="/vendor/jquery.magnific-popup.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/js/admin.js"></script>

</body>

<script>
    showKaKao(); // information map  

    clickEventOpenKakao(); // open kakao map 

    showNotice(); // notice
    makeNoticeWriteStyle(); // notice popup style
    clickEventSaveNotice(); // notice save 

    function showKaKao() {
        let positionAddress = '';
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3, // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(`${proBoard.storeAddress}`, function (result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // console.log(coords);
                positionAddress = coords;
                // console.log(positionAddress);

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${proBoard.storeName}</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);

                // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                var zoomControl = new kakao.maps.ZoomControl();
                map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            }

            $("#tab-A").on('click', function () {
                console.log("map relayout");
                map.relayout();
            })

        });



    }

    function clickEventOpenKakao() {
        const $openKakaoMap = $(".openKaKaoMap");
        $openKakaoMap.on("click", function () {

            const serach = "https://map.kakao.com/link/search/" + `${proBoard.storeAddress}`;
            $openKakaoMap.attr("href", serach);
        });
    }

    function makeNoticeWriteStyle() {
        $('.noticeWrite').on('click', function () {
            console.log($('textarea.form-control'));
            $('textarea.form-control').width(430);
            $('textarea.form-control').height(200);
            $('.btn_1.noticeSubmit').css('margin-left', '180px');
            $('button.mfp-close').css('top', '5px');
            $('button.mfp-close').css('right', '10px');
        });

    }

    function clickEventSaveNotice() {
        const $noticeSubmit = $('.noticeSubmit');
        $noticeSubmit.on('click', function (e) {
            saveNoticeWriteText(e);
        });
    }

    function saveNoticeWriteText(e) {

        const $noticeContent = document.querySelector('.noticeContent');
        if ($noticeContent.value.length > 300) {
            alert(" 300자 이내 입력 부탁드립니다.");
            return;
        }

        const noticeContent = $noticeContent.value.replace(/\n/gi, "<br>");

        const noticeData = {
            promotionBno: `${promotionBno}`,
            content: noticeContent
        }

        const reqInfo = {
            method: 'POST',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify(noticeData)
        };


        fetch('/foodie/detail/notice/save', reqInfo)
            .then(res => res.text())
            .then(result => {
                console.log(result);
                if (result === 'insert-success') {
                    alert("공지사항 등록 성공");
                    $noticeContent.value = '';
                    $('.mfp-close').click();
                    showNotice();
                } else {
                    alert("공지사항 등록 실패");
                }
            });
    }

    function showNotice() {
        console.log("showNotice");
        fetch('/foodie/detail/notice/show/' + `${promotionBno}`)
            .then(res => res.json())
            .then(noticeDTOS => {
                console.log(noticeDTOS);
                makeNoticeDom(noticeDTOS);
            })
    }

    function makeNoticeDom(noticeDTOS) {

        let tag = '';
        let newUpdateArr = [];

        console.log("makeNoticeDom 진입");
        for (const notice of noticeDTOS) {

            tag += `<li>` +
                `<input type="hidden" class="noticeNo" value="` + notice.noticeNo + `">` +
                `<p>` + notice.content + `</p>` +
                `<ul class="buttons deleteNoticeWrite">` +
                `<li>` +
                `<a class="btn_1 gray delete">` +
                `<i class="fa fa-fw fa-times-circle-o"></i>` +
                `삭제 </a>` +
                `</li>` +
                `</ul>` +
                `<p class="update_date"> 업데이트 : ` + notice.updateAFewDaysAgo + `</p>` +
                `</li>`;

            newUpdateArr.push(notice.newUpdateFlag);
        }

        if (newUpdateArr.includes(true)) {
            document.querySelector('.newNotice').innerHTML = 'NOTICE    <span style="color : red "> [ new! ] </span>';
        }

        document.querySelector('.list_general.notices ul').innerHTML = tag;
        clickEventDeleteNotice();

    }

    function clickEventDeleteNotice() {
        const $deleteNotice = $('.deleteNoticeWrite');
        $deleteNotice.on('click', function () {
            const noticeNo = this.parentElement.firstElementChild.value;
            fetch('/foodie/detail/notice/delete/' + noticeNo, {
                    method: 'DELETE'
                })
                .then(res => res.text())
                .then(result => {
                    if (result === 'delete-success') {
                        alert("삭제 완료");
                        showNotice();

                    } else {
                        alert("삭제 실패");
                    }
                })
        })
    };
</script>


<!-- 메뉴 주문 자바 스크립트 -->
<script>
    // 즉시 실행
    (function () {

        // 메뉴 추가 버튼 클릭 이벤트
        menuAddClickEvent();

        // 주문 버튼 클릭 이벤트
        submitOrderClickEvent();

    })();

    // 메뉴 추가 버튼 클릭 이벤트
    function menuAddClickEvent() {
        const menuAddBtn = document.querySelector('.menu-gallery');
        menuAddBtn.addEventListener('click', e => {
            // console.log(e.target.classList);
            if (e.target.classList.contains('menuAddBtn')) {
                // console.log('menuAddBtn clicked');
                addToOrder(e.target);
            }
        });
    }

    // ADD TO ORDER SUMMARY LIST
    function addToOrder(target) {

        // get menu info
        const menuId = target.id;
        const menuInfo = document.getElementById('menu' + menuId);
        const menuName = document.getElementById('menu-name' + menuId).textContent;
        const menuPrice = document.getElementById('menu-price' + menuId).textContent;
        var totalPrice = document.getElementById('total').textContent;
        // console.log('totalPrice = ', totalPrice);
        // console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ", menuPrice);

        // 이미 메뉴가 리스트에 들어있으면 quantity & price 정보 수정
        if (document.getElementById('order-name' + menuId) !== null) {
            // increase current quantity
            const currQuantity = document.querySelector('.order-quantity' + menuId).textContent;
            // console.log('current quantity - ', currQuantity);
            document.querySelector('.order-quantity' + menuId).textContent = parseInt(currQuantity) + 1;

            // increase menu price and total price
            document.getElementById('total').textContent = parseInt(totalPrice) + parseInt(menuPrice);
            var currentPrice = document.getElementById('order-price' + menuId).textContent;
            document.getElementById('order-price' + menuId).textContent = parseInt(currentPrice) + parseInt(
                menuPrice);


            // add minus button if more than one
            const newQuantity = document.querySelector('.order-quantity' + menuId).textContent;
            if (newQuantity > 1) {
                const minusBtn = document.getElementById('minus' + menuId);
                minusBtn.classList.add('icon_minus_alt2');

            }
        } else { // 리스트에 비동기로 정보 추가

            let tag = '';
            tag +=
                `   <li id="order-name` + menuId + `">` +
                `       <a class="removeMenu" href="#0">` + menuName + `</a>` +
                `       <div id="order-quantity` + menuId + `" class="quantity ` + menuId + `">` +
                `           <i id="minus` + menuId + `" class=""></i><strong class="order-quantity` +
                menuId +
                `">1</strong><i id="plus` + menuId + `" class="icon_plus_alt2"></i>` + // maybe delete id
                `       </div>` +
                `       <span id="order-price` + menuId + `">` + menuPrice + `</span>` +
                `   </li>`;

            document.getElementById('async-order-list').innerHTML += tag;

            // 최종 가격 업데이트
            document.getElementById('total').textContent = parseInt(totalPrice) + parseInt(menuPrice);

        }

        // 주문 메뉴 개수 업다운 버튼 이벤트
        upDownQuantityClickEvent();

        // 주문 메뉴 삭제 이벤트
        deleteMenuFromOrderClickEvent();
    }

    // 주문 메뉴 개수 업다운 버튼 이벤트
    function upDownQuantityClickEvent() {
        const targetBtn = document.querySelector('.click-target');

        targetBtn.onclick = e => {
            const menuId = e.target.parentElement.classList[1];
            if (e.target.classList.contains('icon_plus_alt2')) {
                console.log('plus clicked ', menuId);

                // increase current quantity
                const currQuantity = document.querySelector('.order-quantity' + menuId).textContent;
                // console.log('current quantity - ', currQuantity);
                document.querySelector('.order-quantity' + menuId).textContent = parseInt(currQuantity) + 1;

                // add minus button if more than one
                const newQuantity = document.querySelector('.order-quantity' + menuId).textContent;
                if (newQuantity > 1) {
                    const minusBtn = document.getElementById('minus' + menuId);
                    minusBtn.classList.add('icon_minus_alt2');

                }

                // increase menu price and total price
                var totalPrice = document.getElementById('total').textContent;
                const menuPrice = document.getElementById('menu-price' + menuId).textContent;
                document.getElementById('total').textContent = parseInt(totalPrice) + parseInt(menuPrice);
                var currentPrice = document.getElementById('order-price' + menuId).textContent;
                document.getElementById('order-price' + menuId).textContent = parseInt(currentPrice) + parseInt(
                    menuPrice);

            } else if (e.target.classList.contains('icon_minus_alt2')) {
                console.log('minus clicked', menuId);

                // increase current quantity
                const currQuantity = document.querySelector('.order-quantity' + menuId).textContent;
                // console.log('current quantity - ', currQuantity);
                document.querySelector('.order-quantity' + menuId).textContent = parseInt(currQuantity) - 1;

                // add minus button if less than or equal to one
                const newQuantity = document.querySelector('.order-quantity' + menuId).textContent;
                if (newQuantity <= 1) {
                    const minusBtn = document.getElementById('minus' + menuId);
                    minusBtn.classList.remove('icon_minus_alt2');

                }

                // increase menu price and total price
                var totalPrice = document.getElementById('total').textContent;
                const menuPrice = document.getElementById('menu-price' + menuId).textContent;
                document.getElementById('total').textContent = parseInt(totalPrice) - parseInt(menuPrice);
                var currentPrice = document.getElementById('order-price' + menuId).textContent;
                document.getElementById('order-price' + menuId).textContent = parseInt(currentPrice) - parseInt(
                    menuPrice);
            }
        }
    }

    // 주문 메뉴 삭제 이벤트
    function deleteMenuFromOrderClickEvent() {
        const targetBtn = document.querySelector('.click-target');
        targetBtn.addEventListener('click', e => {
            if (e.target.classList.contains('removeMenu')) {
                e.preventDefault();
                // remove menu2
                // console.log('remove clicked - ', e.target.parentElement);
                e.target.parentElement.remove();
                document.getElementById('total').textContent = 0;
            }

        });
    }

    // 주문 버튼 클릭 이벤트
    function submitOrderClickEvent() {
        document.getElementById('submit-order').onclick = e => {
            e.preventDefault();
            makeOrderInfo();
        };
    }

    function makeOrderInfo() {
        // console.log('make order list clicked');

        // menu 정보를 담을 객체 리스트
        const menuList = [];
        const orderList = document.getElementById('async-order-list').children;

        // console.log(orderList);
        // console.log('business_no : ' + '${proBoard.businessNo}');

        for (let i = 0; i < orderList.length; i++) {
            // console.log(orderList[i].innerText);
            var orderArray = orderList[i].innerText.split(/\s+/);
            // console.log('orderArray - ', orderArray);

            var menuName = "";
            for (let j = 0; j < orderArray.length - 2; j++) {
                menuName += orderArray[j] + ' ';
            }

            const businessNo = '${proBoard.businessNo}';

            const menu = {
                menuName: menuName,
                menuPrice: orderArray[orderArray.length - 1],
                quantity: orderArray[orderArray.length - 2],
                businessNo: businessNo
            };

            menuList[menuList.length] = menu;

        }

        submitOrder(menuList);
    }



    // 주문 정보 전송 메서드
    function submitOrder(menuList) {

        // POST요청을 위한 요청 정보 객체
        const reqInfo = {
            method: 'POST',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify(menuList)
        };

        // console.log(data);


        fetch('/kakao/order/check', reqInfo)
            .then(res => res.text())
            .then(msg => {
                if (msg === 'order-success') {
                    location.href = '/kakao/order/check';
                }
            });
    }
</script>







</body>

</html>
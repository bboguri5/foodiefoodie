<%@ page contentType='text/html; charset=UTF-8' language='java' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>



    <%@ include file="../include/static-head.jsp" %>

      <!-- SPECIFIC CSS -->
      <link href="/css/detail-page.css" rel="stylesheet">
      <link href="/css/detail-page-delivery.css" rel="stylesheet">

      <!-- notice -->
      <link href="/css/admin.css" rel="stylesheet">

      <!-- bootstrap js -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

      </style>
      <!-- kakao map -->
      <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c52a004bc69d2f545cf74556fe651345&libraries=services,clusterer,drawing">
      </script>

</head>


<!-- //css -->
<style>
    .hero_in.detail_page .wrapper .buttons.writeBtn {
        position: absolute;
        bottom: 0;
        right: 150px;
    }

    .hero_in.detail_page .wrapper .buttons.wishBtn {
        position: absolute;
        bottom: 0;
        right: 20px;
    }

    .writeBtnHero {
        font-size: 14px;
    }

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
        cursor: pointer;
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

    a.btn_1.proBoardModifyBtn {
        margin-left: 80%;
    }


    /* review */
    .col-lg-9 {
        margin: auto;
        width: 100%;
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

    .not-open {

        text-align: center;
    }

    .row.upCount {
        width: 60%;
        margin: 0 auto;
    }

    .reviews #review_summary {
        margin: 0 auto;
        width: 60%;
    }

    div.text-end {
        text-align: center !important;
    }
</style>

<style>
    .card-body.reviews {
        word-wrap: normal;
    }

    .star.proBoardStar {
        position: relative;
        font-size: 2rem;
        color: #ddd;
    }

    .star.proBoardStar input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
    }

    .star.proBoardStar span {
        width: 0;
        position: absolute;
        left: 0px;
        color: yellow;
        overflow: hidden;
        pointer-events: none;
    }

    .star.reviewStar {
        position: relative;
        font-size: 2rem;
        color: #ddd;
    }

    .star.reviewStar input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
    }

    .star.reviewStar span {
        width: 0;
        position: absolute;
        left: 0px;
        color: yellow;
        overflow: hidden;
        pointer-events: none;
    }

    p.reviewP {
        overflow-wrap: normal;
    }

    strong.noneReview {
        text-align: center;
        display: block;
        font-size: 50px;
    }

    .proBoardModifyBtn {
        left: 0;
    }

    .promotion-modal-content {
        position: absolute;
        top: 100px;
    }

    .modal-promotion-faq-content {
        height: 200px;
    }
</style>

<%@ include file="../include/detail-header.jsp" %>



<body>

    <!-- main -->
    <main>
        <div class="hero_in detail_page title_img_add" style=" background-image: url(${titleFile.fileData});">
            <div class="wrapper opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
                <div class="container">
                    <div class="main_info">
                        <div class="row">
                            <div class="col-xl-4 col-lg-5 col-md-6">
                                <div class="head">
                                    <c:if test="${proBoard.avgStarRate != 0}">
                                        <div class="score">
                                            <span>review<em>${proBoard.review_cnt}</em></span>
                                            <strong> ${proBoard.avgStarRate}</strong>
                                        </div>
                                    </c:if>
                                </div>
                                <h1 style="display: inline;">${proBoard.title}</h1>

                                <c:if test="${flag}">
                                <a href="#" class="promotion-faq-btn nav-faq-btn"
                                style="margin-left: 10px;" data-bs-toggle='modal'
                                data-bs-target='.promotion-faq-modal'>신고</a></c:if>
                                <br>
                                ${proBoard.storeAddress} ${proBoard.storeDetailAddress}
                                <a class="openKaKaoMap" target="_blank">카카오맵 연결</a>
                            </div>

                            <c:if test="${flag && !(masterFlag)}">
                                <div class="col-xl-8 col-lg-7 col-md-6 position-relative">
                                    <div class="buttons clearfix wishBtn">
                                        <a href="#0" class="btn_hero wishlist"><i class="icon_heart"></i>favorite</a>
                                    </div>
                                    <div class="buttons clearfix writeBtn">
                                        <a href="/review/write/${proBoard.businessNo}" class="btn_hero"><strong
                                                class="writeBtnHero"><i class="icon_pencil"></i> write review</strong>
                                        </a>
                                    </div>
                                </div>
                            </c:if>
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
                                <a id="tab-D" href="#pane-D" class="nav-link newNotice" data-bs-toggle="tab"
                                    role="tab">Notice</a>
                            </li>
                        </ul>
                        <div class="add_bottom_25"></div>
                        <c:if test="${masterFlag}">
                            <a class="btn_1 proBoardModifyBtn" href="/proBoard/modify/${promotionBno}">홍보글 수정하기</a>
                        </c:if>
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
                                            <c:forEach var="detailImg" items="${detailFiles}" varStatus="status">
                                                <figure><a title="Photo title" href="${detailImg.fileData}"
                                                        data-effect="mfp-zoom-in"><img src="${detailImg.fileData}"
                                                            data-src="${detailImg.fileData}" class="lazy" alt=""></a>
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
                                                            <td>${proBoard.storeAddress}
                                                                ${proBoard.storeDetailAddress}<br>
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
                                                    : ${proBoard.formatDate}
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
                                            <div id="kakaoMap" class="kakaoMap" style="width:100%;height:600px;"></div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                            <!-- /A type -->






                            <!-- B type -->





                            <!-- B type -->
                            <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
                                <div class="card-header" role="tab" id="heading-B">
                                    <div class="card-header" role="tab" id="heading-B">
                                        <h5>
                                            <a class="collapsed" data-bs-toggle="collapse" href="#collapse-B"
                                                aria-expanded="true" aria-controls="collapse-B">
                                                menu
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
                                    <c:if
                                        test="${isOpen == '영업전' || isOpen == '브레이크 타임' || isOpen == '영업끝' || isOpen == '오늘 휴무'}">
                                        <h4 class="not-open">영업중에만 방문포장 주문을 할 수 있습니다.</h4>
                                    </c:if>
                                    <c:if test="${isOpen == '영업중'}">
                                        <div class="theiaStickySidebar">
                                            <div class="box_booking">
                                                <div class="head">
                                                    <h3>장바구니</h3>
                                                    <c:if test="${not empty isHotDeal}">
                                                        <div class="offer">전 메뉴 ${isHotDeal}% 할인 적용 중!!</div>
                                                    </c:if>
                                                </div>
                                                <!-- /head -->
                                                <div class="main">
                                                    <ul id="async-order-list" class="clearfix click-target">

                                                    </ul>

                                                    <form action="#" method="get">
                                                        <input hidden value="" type="text">
                                                    </form>

                                                    <ul class="clearfix after-discount">
                                                        <!-- 핫딜이면 -->
                                                        <li class="total">최종 결제 금액<span id="total"
                                                                class="line-through">0</span></li>
                                                    </ul>

                                                    <a id="submit-order" href="#" class="btn_1 full-width mb_5">주문하기</a>
                                                    <div class="text-center"><small>이 단계에서는 비용이 청구되지 않습니다</small></div>
                                                </div>
                                            </div>

                                        </div>
                                    </c:if>
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
                                        <c:if test="${proBoard.avgStarRate == 0}">
                                            <div class="add_bottom_45"></div>
                                            <strong class="noneReview">리뷰가 없습니다.</strong>
                                            <div class="add_bottom_45"></div>
                                        </c:if>
                                        <c:if test="${proBoard.avgStarRate != 0}">

                                            <div id="review_summary">
                                                <span class="star proBoardStar">
                                                    ★★★★★
                                                    <span>★★★★★</span>
                                                </span>
                                                <strong> ${proBoard.avgStarRate}</strong>
                                                <small> revivew view : ${proBoard.review_cnt}</small>
                                            </div>
                                            <div class="add_bottom_45"></div>

                                            <div class="row upCount">
                                                <c:forEach var="rl" items="${reviewList}" varStatus="status">
                                                    <!-- <div class="col-md-6"> -->
                                                    <article class="blog">
                                                        <div class="add_bottom_45"></div>

                                                        <figure>
                                                            <a href="/review/detail?reviewBno=${rl.reviewBno}"><img
                                                                    src="${uploads[status.index]}" alt="">
                                                                <div class="preview"><span>Read more</span></div>
                                                            </a>
                                                        </figure>

                                                        <div class="post_info">

                                                            <h2><a href="#">${rl.title}</a>
                                                            </h2>
                                                            <p class="reviewP">평점: <span class="star reviewStar">
                                                                    ★★★★★
                                                                    <c:set var="starRate" value="${rl.starRate*10}%" />
                                                                    <span style="width: ${starRate};">★★★★★</span>
                                                                </span>${rl.starRate}/10</p>
                                                            <p>${rl.content}
                                                                <ul>
                                                                    <li>
                                                                        <div class="thumb"><img src="/img/avatar.jpg"
                                                                                alt=""></div>
                                                                        ${rl.email}
                                                                    </li>
                                                                    <li>

                                                                        <c:set var="contains" value="false" />
                                                                        <c:forEach var="item" items="${isLikedList}">
                                                                            <c:if test="${item eq rl.reviewBno}">
                                                                                <c:set var="contains" value="true" />
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <c:choose>
                                                                            <c:when test="${contains}">
                                                                                <i id="${rl.reviewBno}"
                                                                                    class="heartIcon icon_heart"></i>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </li>

                                                                </ul>
                                                        </div>
                                                    </article>
                                                    <!-- /article -->
                                                    <!-- </div> -->
                                                </c:forEach>
                                                <!-- /review_card -->
                                            </div>
                                        </c:if>
                                        <!-- /reviews -->
                                        <c:if test="${proBoard.avgStarRate > 0}">
                                            <div class="text-end"><a
                                                    href="/review/search?search=${proBoard.businessNo}&sort=latest"
                                                    class="btn_1 viewMore"> View
                                                    More </a>
                                            </div>
                                        </c:if>
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
                                            <c:if test="${masterFlag}">
                                                <p class="inline-popups noticeWrite">
                                                    <a href="#modal-reply" data-effect="mfp-zoom-in" class="btn_1">
                                                        <i class="fa fa-fw fa-reply"></i>글쓰기</a>
                                                </p>
                                            </c:if>
                                        </div>
                                        <div class="list_general notices">
                                            <ul>
                                                <!-- makeNoticeDom method -->
                                            </ul>

                                        </div>
                                    </div>
                                </div>
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

        <!-- 홍보글 신고 모달 -->
        <form action="/proBoard/promotion-faq" method="POST" class="modal-form promotion-faq-form">
            <div class="modal fade promotion-faq-modal" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content promotion-modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="edit_bookingLabel">신고글 정보</h5>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>가게 이름</label>
                                <input type="text" class="form-control" value="${proBoard.storeName}" disabled>
                                <input type="hidden" class="modal-promotion-bno" name="promotionBno"
                                    value="${proBoard.promotionBno}" readonly>
                                <input type="hidden" value="${proBoard.businessNo}" name="businessNo" readonly>
                            </div>
                            <div class="form-group">
                                <label>사업자 계정</label>
                                <input type="text" class="form-control modal-promotion-writer-email"
                                    name="promotionWriterEmail" value="${proBoard.email}" readonly>
                            </div>
                            <div class="form-group">
                                <label>신고 작성자</label>
                                <input type="text" class="form-control modal-writer-email" name="writerEmail"
                                    value="${loginUser.email}" readonly>
                            </div>
                            <div class="form-group">
                                <label>신고 사유</label>
                                <textarea type="text" class="form-control modal-promotion-faq-content"
                                    name="content"></textarea>
                            </div>
                            <!-- /Row -->
                        </div>
                        <div class="modal-footer btn-wrap">
                            <button class="btn btn-primary del-btn modal-faq-btn" type="button">신고</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>


    </main>
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
    <!-- notice modal to review popup -->
    <!-- /main -->

    <%@ include file="../include/footer.jsp" %>

    <!-- COMMON SCRIPTS -->
    <script src="/js/common_scripts.min.js"></script>
    <!-- <script src="/js/common_func.js"></script> -->
    <script src="/js/validate.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="/js/sticky_sidebar.min.js"></script>
    <script src="/js/specific_detail.js"></script>

    <script src="/vendor/jquery.magnific-popup.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="/js/admin.js"></script>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

</body>


<!-- //script -->
<script>
    showKaKao(); // information map  

    clickEventOpenKakao(); // open kakao map 

    addFavoriteStore(); // add favorite
    showNotice(); // notice
    makeNoticeWriteStyle(); // notice popup style
    clickEventSaveNotice(); // notice save 

    function showKaKao() {
        let positionAddress = '';
        var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3, // 지도의 확대 레벨
            };

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        const masterAddress = '${proBoard.storeAddress}';
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(masterAddress, function (result, status) {

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


    function addFavoriteStore() {
        
        if ('${isFavorite}' === 'true') {
            $('.wishlist').addClass('liked');
        } 
        else{
            console.log("false");
        }

        $('.btn_hero.wishlist').on('click', function (e) {
            e.preventDefault();

            if (!$('.wishlist').hasClass('liked')) {
                fetch('/proBoard/detail/favorite/store/remove/' + `${promotionBno}`, {
                    method: 'DELETE'
                });
            } else {

                fetch('/proBoard/detail/favorite/store/add/' + `${promotionBno}`);
            }


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


        fetch('/proBoard/detail/notice/save', reqInfo)
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
        fetch('/proBoard/detail/notice/show/' + `${promotionBno}`)
            .then(res => res.json())
            .then(noticeDTOS => {
                console.log(noticeDTOS);
                makeNoticeDom(noticeDTOS);
            })
    }

    function makeNoticeDom(noticeDTOS) {

        let tag = '';
        let newUpdateArr = [];

        for (const notice of noticeDTOS) {

            tag += `<li>` +
                `<input type="hidden" class="noticeNo" value="` + notice.noticeNo + `">` +
                `<p>` + notice.content + `</p>` +
                `<ul class="buttons deleteNoticeWrite">` +
                `<li>` +
                `<c:if test="${masterFlag}">` +
                `<a class="btn_1 gray delete">` +
                `<i class="fa fa-fw fa-times-circle-o"></i>` +
                `삭제 </a>` +
                `</c:if>` +
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
            fetch('/proBoard/detail/notice/delete/' + noticeNo, {
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

<!-- javascript -->

<!-- 메뉴 주문 자바 스크립트 -->
<script>
    const isHotDeal = "${isHotDeal != null}";
    const deal = "${isHotDeal}";

    // 즉시 실행
    (function () {

        console.log("isHotDeal - ", typeof isHotDeal);

        // hot deal 이 true 일 경우
        if (isHotDeal === 'true') {
            document.querySelector('.after-discount').innerHTML = document.querySelector('.after-discount')
                .innerHTML += '<li class="total"><span id="discount">0</span></li>';
            document.querySelector('.line-through').style.textDecoration = 'line-through';
        }
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
            if (isHotDeal === 'true') {
                document.getElementById('discount').textContent = parseInt(document.getElementById('total')
                    .textContent) - parseInt(document.getElementById('total').textContent) * (
                    deal / 100);
            }
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
            if (isHotDeal === 'true') {
                document.getElementById('discount').textContent = parseInt(document.getElementById('total')
                    .textContent) - parseInt(document.getElementById('total').textContent) * (
                    deal / 100);
            }
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
                if (isHotDeal === 'true') {
                    document.getElementById('discount').textContent = parseInt(document.getElementById('total')
                        .textContent) - parseInt(document.getElementById('total').textContent) * (
                        deal / 100);
                }
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
                if (isHotDeal === 'true') {
                    document.getElementById('discount').textContent = parseInt(document.getElementById('total')
                        .textContent) - parseInt(document.getElementById('total').textContent) * (
                        deal / 100);
                }
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
        // console.log('business_no : ' + '${master.businessNo}');

        for (let i = 0; i < orderList.length; i++) {
            // console.log(orderList[i].innerText);
            var orderArray = orderList[i].innerText.split(/\s+/);
            // console.log('orderArray - ', orderArray);

            var menuName = "";
            for (let j = 0; j < orderArray.length - 2; j++) {
                menuName += orderArray[j] + ' ';
            }


            const menu = {
                menuName: menuName,
                menuPrice: orderArray[orderArray.length - 1],
                quantity: orderArray[orderArray.length - 2],
                // businessNo: businessNo,
                // discount: 10
            };

            menuList[menuList.length] = menu;

        }

        const businessNo = '${proBoard.businessNo}';

        const obj = {
            businessNo: businessNo,
            discount: deal,
            menuList: menuList
        }

        submitOrder(obj);
    }



    // 주문 정보 전송 메서드
    function submitOrder(obj) {

        // POST요청을 위한 요청 정보 객체
        const reqInfo = {
            method: 'POST',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify(obj)
        };

        // console.log(data);


        fetch('/kakao/order/check', reqInfo)
            .then(res => res.text())
            .then(msg => {
                if (msg === 'order-success') {
                    location.href = '/kakao/order/check/request';
                }
            });
    }
</script>

<script>
    // <!-- 별점 -->
    const proBoardStarRate = document.querySelector('.proBoardStar span');
    const proBoardStar = Math.ceil(`${proBoard.avgStarRate}`) * 10;
    proBoardStarRate.style.width = proBoardStar + '%';

    // const reviewStarRate = document.querySelector('.reviewStar span');
    // const reviewStar = `${review.starRate}` * 10;
    // console.log(reviewStar);
    // reviewStarRate.style.width = reviewStar + '%';
</script>
<!-- 신고 버튼 -->
<script>
    const promotionFaqBtn = document.querySelector('.modal-faq-btn');

    promotionFaqBtn.onclick = e => {
        const faqContent = document.querySelector('.modal-promotion-faq-content');
        const promotionFaqForm = document.querySelector('.promotion-faq-form');
        if (faqContent.value.trim() === '') {
            alert("사유는 필수값입니다.");
        } else {
            promotionFaqForm.submit();
        }
    }

</script>



</body>

</html>
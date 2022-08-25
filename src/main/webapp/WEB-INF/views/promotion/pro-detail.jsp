<%@ page contentType='text/html; charset=UTF-8' language='java' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Foogra - Discover & Book the best restaurants at the best price">
    <meta name="author" content="Ansonika">
    <title>Foogra - Discover & Book the best restaurants at the best price</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="/img/apple-touch-icon-144x144-precomposed.png">

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

    <!-- YOUR CUSTOM CSS -->
    <link href="/css/custom.css" rel="stylesheet">

    <link href="/css/detail-page-delivery.css" rel="stylesheet">

    <!-- menu -->
    <link rel="apple-touch-icon" type="image/x-icon" href="/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="/img/apple-touch-icon-144x144-precomposed.png">
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">

    <!-- notice -->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/css/admin.css" rel="stylesheet">

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

    h1{
        color: #fff !important ;
    }
</style>

<body>
    <!-- header -->
    <header class="header_in clearfix">
        <div class="container">
            <div id="logo">
                <a href="/">
                    <img src="/img/logo_sticky.svg" width="140" height="35" alt="">
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
                    <a href="index.html"><img src="/img/logo.svg" width="140" height="35" alt=""></a>
                </div>
                <ul>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Home</a>
                        <ul>
                            <li><a href="index.html">Default</a></li>
                            <li class="third-level"><a href="#0">Sliders - Parallax <strong>New!</strong></a>
                                <ul>
                                    <li><a href="index-8.html">Revolution Slider 1</a></li>
                                    <li><a href="index-9.html">Revolution Slider 2</a></li>
                                    <li><a href="index-3.html">Owl Carousel</a></li>
                                    <li><a href="index-10.html">Parallax Youtube</a></li>
                                    <li><a href="index-11.html">Parallax Vimeo</a></li>
                                    <li><a href="index-12.html">Parallax Mp4 Video</a></li>
                                    <li><a href="index-13.html">Parallax Video Fullscreen</a></li>
                                    <li><a href="index-14.html">Parallax Image</a></li>
                                </ul>
                            </li>
                            <li><a href="index-15.html">Text Rotator</a></li>
                            <li><a href="index-5.html">Address Autocomplete</a></li>
                            <li><a href="index-6.html">Search Version 2</a></li>
                            <li><a href="index-7.html">Delivery/Takeaway version</a></li>
                            <li><a href="modal-advertise.html">Modal Advertise</a></li>
                            <li><a href="modal-newsletter.html">Modal Newsletter</a></li>
                            <li><a href="index-2.html">Video Bg Fallback Mobile</a></li>
                            <li><a href="index-4.html">GDPR Cookie Bar EU Law</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Listing</a>
                        <ul>
                            <li class="third-level"><a href="#0">List pages</a>
                                <ul>
                                    <li><a href="grid-listing-filterscol.html">List default</a></li>
                                    <li><a href="grid-listing-filterscol-map.html">List with map</a></li>
                                    <li><a href="listing-map.html">List side map</a></li>
                                    <li><a href="grid-listing-filterscol-full-width.html">List full width</a></li>
                                    <li><a href="grid-listing-filterscol-full-masonry.html">List Masonry Filter</a></li>
                                    <li><a href="grid-listing-filterscol-delivery.html">List Delivery/Takeaway</a></li>
                                </ul>
                            </li>
                            <li class="third-level"><a href="#0">Detail pages</a>
                                <ul>
                                    <li><a href="detail-restaurant.html">Detail page 1</a></li>
                                    <li><a href="detail-restaurant-2.html">Detail page 2</a></li>
                                    <li><a href="detail-restaurant-3.html">Mobile Fixed Booking</a></li>
                                    <li><a href="detail-restaurant-delivery.html">Delivery/Takeaway</a></li>
                                    <li><a href="detail-restaurant-4.html">Detail Menu Thumbs</a></li>
                                    <li><a href="detail-restaurant-5.html">Detail Contact Form</a></li>
                                </ul>
                            </li>
                            <li class="third-level"><a href="#0">OpenStreetMap</a>
                                <ul>
                                    <li><a href="grid-listing-filterscol-map-openstreetmap.html">List with map</a></li>
                                    <li><a href="listing-map-openstreetmap.html">List side map</a></li>
                                    <li><a href="grid-listing-filterscol-full-width-openstreetmap.html">List full
                                            width</a></li>
                                    <li><a href="grid-listing-filterscol-full-masonry-openstreetmap.html">List Masonry
                                            Filter</a></li>
                                </ul>
                            </li>
                            <li><a href="submit-restaurant.html">Submit Restaurant</a></li>
                            <li><a href="submit-rider.html">Submit Rider</a></li>
                            <li><a href="wishlist.html">Wishlist</a></li>
                            <li><a href="booking.html">Booking</a></li>
                            <li><a href="confirm.html">Confirm Booking</a></li>
                            <li><a href="confirm-delivery.html">Confirm Order</a></li>
                            <li><a href="booking-delivery-2.html">Order Delivery/Takeaway</a></li>
                            <li><a href="booking-delivery.html">Order Delivery/Takeaway 2</a></li>
                            <li><a href="admin_section/index.html" target="_blank">Admin Section</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Other Pages</a>
                        <ul>
                            <li><a href="404.html">404 Error</a></li>
                            <li><a href="help.html">Help and Faq</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="leave-review.html">Leave a review</a></li>
                            <li><a href="user-logged-1.html">User Logged 1</a></li>
                            <li><a href="user-logged-2.html">User Logged 2</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                            <li><a href="coming_soon/index.html">Coming Soon</a></li>
                            <li><a href="account.html">Sign Up</a></li>
                            <li><a href="icon-pack-1.html">Icon Pack 1</a></li>
                            <li><a href="icon-pack-2.html">Icon Pack 2</a></li>
                        </ul>
                    </li>
                    <li><a href="submit-restaurant.html">Submit</a></li>
                    <li><a href="#0">Buy this template</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- /header -->

    <!-- main -->
    <main>
        <div class="hero_in detail_page title_img_add"
            style=" background-image: url('data:image/jpg;base64,${titleImg}');">
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
                                ${master.storeAddress} ${master.storeDetailAddress}
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
                            <li class="nav-item">
                                <a id="tab-B" href="#pane-B" class="nav-link" data-bs-toggle="tab" role="tab">menu</a>
                            </li>
                            <li class="nav-item">
                                <a id="tab-C" href="#pane-C" class="nav-link" data-bs-toggle="tab"
                                    role="tab">Reviews</a>
                            </li>
                            <li class="nav-item">
                                <a id="tab-D" href="#pane-D" class="nav-link" data-bs-toggle="tab" role="tab">Notice</a>
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
                                            <c:forEach var="detailImg" items="${detailImgList}" varStatus="status">
                                                <figure><a title="Photo title" data-effect="mfp-zoom-in"><img
                                                            src="data:image/jpg;base64,${detailImg}"
                                                            data-src="data:image/jpg;base64,${detailImg}" class="lazy"
                                                            alt=""></a>
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
                                                            <td>${master.storeAddress} ${master.storeDetailAddress}<br>
                                                                <!-- ${address} -->
                                                            </td>
                                                        </tr>
                                                        <tr class="only-desktop">
                                                            <th>전화번호</th>
                                                            <td>${master.storeCallNumber}</td>
                                                            <!-- ${storeCallNumber} -->
                                                        </tr>

                                                        <!-- 메뉴 입력시 평균 표시  -->
                                                        <!-- <tr>
                                                            <th>가격대</th>
                                                            <td>3만원-4만원</td> 
                                                        </tr> -->

                                                        <tr>
                                                            <th style="vertical-align:top;">영업시간</th>
                                                            <td>월-금: ${storeTime.weekdayOpenTime} -
                                                                ${storeTime.weekdayCloseTime}
                                                                <br> 토: ${storeTime.weekendOpenTime} -
                                                                ${storeTime.weekendCloseTime}
                                                                <br> 브레이크타임: ${storeTime.breakStartTime} -
                                                                ${storeTime.breakEndTime}</td>
                                                            <!-- ${StoreTime} -->
                                                        </tr>
                                                        <tr>
                                                            <th>휴일</th>
                                                            <td>${storeTime.closedDay}</td>
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
                                                            <img src="data:image/jpg;base64,${menu.filePath}"
                                                                data-src="data:image/jpg;base64,${menu.filePath}" alt=""
                                                                class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div class="menuInfo">
                                                        <h4>${menu.menuName}</h4>
                                                        <em>${menu.menuPrice}</em>
                                                        <button class="menuAddBtn" type="button">방문포장</button>
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
                                                <ul class="clearfix">
                                                    <li><a href="#0">1x Enchiladas</a><span>$11</span></li>
                                                    <li><a href="#0">2x Burrito</a><span>$14</span></li>
                                                    <li><a href="#0">1x Chicken</a><span>$18</span></li>
                                                    <li><a href="#0">2x Corona Beer</a><span>$9</span></li>
                                                    <li><a href="#0">2x Cheese Cake</a><span>$11</span></li>
                                                </ul>

                                                <ul class="clearfix">
                                                    <li>Subtotal<span>$56</span></li>
                                                    <li>Delivery fee<span>$10</span></li>
                                                    <li class="total">Total<span>$66</span></li>
                                                </ul>
                                                <div class="row opt_order">
                                                    <div class="col-6">
                                                        <label class="container_radio">Delivery
                                                            <input type="radio" value="option1" name="opt_order"
                                                                checked="">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                    <div class="col-6">
                                                        <label class="container_radio">Take away
                                                            <input type="radio" value="option1" name="opt_order">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="dropdown day">
                                                    <a href="#" data-bs-toggle="dropdown">Day <span
                                                            id="selected_day"></span></a>
                                                    <div class="dropdown-menu">
                                                        <div class="dropdown-menu-content">
                                                            <h4>Which day delivered?</h4>
                                                            <div class="radio_select chose_day">
                                                                <ul>
                                                                    <li>
                                                                        <input type="radio" id="day_1" name="day"
                                                                            value="Today">
                                                                        <label for="day_1">Today<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="day_2" name="day"
                                                                            value="Tomorrow">
                                                                        <label for="day_2">Tomorrow<em>-40%</em></label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <!-- /people_select -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /dropdown -->
                                                <div class="dropdown time">
                                                    <a href="#" data-bs-toggle="dropdown">Time <span
                                                            id="selected_time"></span></a>
                                                    <div class="dropdown-menu">
                                                        <div class="dropdown-menu-content">
                                                            <h4>Lunch</h4>
                                                            <div class="radio_select add_bottom_15">
                                                                <ul>
                                                                    <li>
                                                                        <input type="radio" id="time_1" name="time"
                                                                            value="12.00am">
                                                                        <label for="time_1">12.00<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="time_2" name="time"
                                                                            value="08.30pm">
                                                                        <label for="time_2">12.30<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="time_3" name="time"
                                                                            value="09.00pm">
                                                                        <label for="time_3">1.00<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="time_4" name="time"
                                                                            value="09.30pm">
                                                                        <label for="time_4">1.30<em>-40%</em></label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <!-- /time_select -->
                                                            <h4>Dinner</h4>
                                                            <div class="radio_select">
                                                                <ul>
                                                                    <li>
                                                                        <input type="radio" id="time_5" name="time"
                                                                            value="08.00pm">
                                                                        <label for="time_1">20.00<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="time_6" name="time"
                                                                            value="08.30pm">
                                                                        <label for="time_2">20.30<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="time_7" name="time"
                                                                            value="09.00pm">
                                                                        <label for="time_3">21.00<em>-40%</em></label>
                                                                    </li>
                                                                    <li>
                                                                        <input type="radio" id="time_8" name="time"
                                                                            value="09.30pm">
                                                                        <label for="time_4">21.30<em>-40%</em></label>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <!-- /time_select -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /dropdown -->
                                                <a href="booking-delivery-2.html" class="btn_1 full-width mb_5">Order
                                                    Now</a>
                                                <div class="text-center"><small>No money charged on this
                                                        steps</small></div>
                                            </div>
                                        </div>
                                        <ul class="share-buttons">
                                            <li><a class="fb-share" href="#0"><i class="social_facebook"></i>
                                                    Share</a></li>
                                            <li><a class="twitter-share" href="#0"><i class="social_twitter"></i>
                                                    Share</a></li>
                                            <li><a class="gplus-share" href="#0"><i class="social_googleplus"></i>
                                                    Share</a></li>
                                        </ul>
                                        <div class="resize-sensor"
                                            style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
                                            <div class="resize-sensor-expand"
                                                style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
                                                <div
                                                    style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 413px; height: 772px;">
                                                </div>
                                            </div>
                                            <div class="resize-sensor-shrink"
                                                style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
                                                <div
                                                    style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%">
                                                </div>
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
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h6>Food Quality</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 90%" aria-valuenow="90"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3">
                                                                <strong>9.0</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                        <h6>Service</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 95%" aria-valuenow="95"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3">
                                                                <strong>9.5</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                    </div>
                                                    <div class="col-md-6">
                                                        <h6>Location</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 60%" aria-valuenow="60"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3">
                                                                <strong>6.0</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                        <h6>Price</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 60%" aria-valuenow="60"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3">
                                                                <strong>6.0</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                            </div>
                                        </div>

                                        <div id="reviews">
                                            <div class="review_card">
                                                <div class="row">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="/img/avatar4.jpg" alt=""></figure>
                                                        <h5>Lukas</h5>
                                                    </div>
                                                    <div class="col-md-10 review_content">
                                                        <div class="clearfix add_bottom_15">
                                                            <span class="rating">8.5<small>/10</small>
                                                                <strong>Rating
                                                                    average</strong></span>
                                                            <em>Published 54 minutes ago</em>
                                                        </div>
                                                        <h4>"Great Location!!"</h4>
                                                        <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros
                                                            eirmod scaevola sea. Et nec tantas accusamus salutatus,
                                                            sit
                                                            commodo veritus te, erat legere fabulas has ut. Rebum
                                                            laudem
                                                            cum ea, ius essent fuisset ut. Viderer petentium cu his.
                                                            Tollit molestie suscipiantur his et.</p>
                                                        <ul>
                                                            <li><a href="#0"><i
                                                                        class="icon_like"></i><span>Useful</span></a>
                                                            </li>
                                                            <li><a href="#0"><i class="icon_dislike"></i><span>Not
                                                                        useful</span></a></li>
                                                            <li><a href="#0"><i class="arrow_back"></i>
                                                                    <span>Reply</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                            </div>
                                            <!-- /review_card -->
                                            <div class="review_card">
                                                <div class="row">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="/img/avatar6.jpg" alt=""></figure>
                                                        <h5>Lukas</h5>
                                                    </div>
                                                    <div class="col-md-10 review_content">
                                                        <div class="clearfix add_bottom_15">
                                                            <span class="rating">8.5<small>/10</small>
                                                                <strong>Rating
                                                                    average</strong></span>
                                                            <em>Published 10 Oct. 2019</em>
                                                        </div>
                                                        <h4>"Awesome Experience"</h4>
                                                        <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros
                                                            eirmod scaevola sea. Et nec tantas accusamus salutatus,
                                                            sit
                                                            commodo veritus te, erat legere fabulas has ut. Rebum
                                                            laudem
                                                            cum ea, ius essent fuisset ut. Viderer petentium cu his.
                                                            Tollit molestie suscipiantur his et.</p>
                                                        <ul>
                                                            <li><a href="#0"><i
                                                                        class="icon_like"></i><span>Useful</span></a>
                                                            </li>
                                                            <li><a href="#0"><i class="icon_dislike"></i><span>Not
                                                                        useful</span></a></li>
                                                            <li><a href="#0"><i class="arrow_back"></i>
                                                                    <span>Reply</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                            </div>
                                            <!-- /review_card -->
                                            <div class="review_card">
                                                <div class="row">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="/img/avatar1.jpg" alt=""></figure>
                                                        <h5>Marika</h5>
                                                    </div>
                                                    <div class="col-md-10 review_content">
                                                        <div class="clearfix add_bottom_15">
                                                            <span class="rating">9.0<small>/10</small>
                                                                <strong>Rating
                                                                    average</strong></span>
                                                            <em>Published 11 Oct. 2019</em>
                                                        </div>
                                                        <h4>"Really great dinner!!"</h4>
                                                        <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros
                                                            eirmod scaevola sea. Et nec tantas accusamus salutatus,
                                                            sit
                                                            commodo veritus te, erat legere fabulas has ut. Rebum
                                                            laudem
                                                            cum ea, ius essent fuisset ut. Viderer petentium cu his.
                                                            Tollit molestie suscipiantur his et.</p>
                                                        <ul>
                                                            <li><a href="#0"><i
                                                                        class="icon_like"></i><span>Useful</span></a>
                                                            </li>
                                                            <li><a href="#0"><i class="icon_dislike"></i><span>Not
                                                                        useful</span></a></li>
                                                            <li><a href="#0"><i class="arrow_back"></i>
                                                                    <span>Reply</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                                <div class="row reply">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="/img/avatar.jpg" alt=""></figure>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="review_content">
                                                            <strong>Reply from Foogra</strong>
                                                            <em>Published 3 minutes ago</em>
                                                            <p><br>Hi Monika,<br><br>Eos tollit ancillae ea, lorem
                                                                consulatu qui ne, eu eros eirmod scaevola sea. Et
                                                                nec
                                                                tantas accusamus salutatus, sit commodo veritus te,
                                                                erat
                                                                legere fabulas has ut. Rebum laudem cum ea, ius
                                                                essent
                                                                fuisset ut. Viderer petentium cu his. Tollit
                                                                molestie
                                                                suscipiantur his et.<br><br>Thanks</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /reply -->
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
                            <div id="pane-D" class="card tab-pane fade show" role="tabpanel"
                                aria-labelledby="tab-D">
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
                                        <div class="noticeBox">
                                            <!-- <div class="header_box">
                                                <div class="filter">
                                                    <div class="styled-select short">
                                                        <select name="orderby">
                                                            <option value="Any time">Any time</option>
                                                            <option value="Latest">Latest</option>
                                                            <option value="Oldest">Oldest</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <div class="list_general">
                                                <ul>
                                                    <li>
                                                        <figure><img src="img/item_1.jpg" alt=""></figure>
                                                        <small>Pizza - Italian</small>
                                                        <h4>La Monnalisa</h4>
                                                        <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae,
                                                            pro detracto disputando reformidans at, ex vel suas eripuit.
                                                            Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit
                                                            te possit senserit, eam alia veritus maluisset ei, id cibo
                                                            vocent ocurreret per....</p>
                                                        <p><a href="#0" class="btn_1 gray"><i
                                                                    class="fa fa-fw fa-eye"></i> View item</a></p>
                                                        <ul class="buttons">
                                                            <li><a href="#0" class="btn_1 gray delete wishlist_close"><i
                                                                        class="fa fa-fw fa-times-circle-o"></i>
                                                                    Cancel</a></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <figure><img src="img/item_2.jpg" alt=""></figure>
                                                        <small>Pizza - Italian</small>
                                                        <h4>Da Alfredo</h4>
                                                        <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae,
                                                            pro detracto disputando reformidans at, ex vel suas eripuit.
                                                            Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit
                                                            te possit senserit, eam alia veritus maluisset ei, id cibo
                                                            vocent ocurreret per....</p>
                                                        <p><a href="#0" class="btn_1 gray"><i
                                                                    class="fa fa-fw fa-eye"></i> View item</a></p>
                                                        <ul class="buttons">
                                                            <li><a href="#0" class="btn_1 gray delete wishlist_close"><i
                                                                        class="fa fa-fw fa-times-circle-o"></i>
                                                                    Cancel</a></li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <figure><img src="img/item_3.jpg" alt=""></figure>
                                                        <small>Japanese</small>
                                                        <h4>Sushi Gold</h4>
                                                        <p>Lorem ipsum dolor sit amet, est ei idque voluptua copiosae,
                                                            pro detracto disputando reformidans at, ex vel suas eripuit.
                                                            Vel alii zril maiorum ex, mea id sale eirmod epicurei. Sit
                                                            te possit senserit, eam alia veritus maluisset ei, id cibo
                                                            vocent ocurreret per....</p>
                                                        <p><a href="#0" class="btn_1 gray"><i
                                                                    class="fa fa-fw fa-eye"></i> View item</a></p>
                                                        <ul class="buttons">
                                                            <li><a href="#0" class="btn_1 gray delete wishlist_close"><i
                                                                        class="fa fa-fw fa-times-circle-o"></i>
                                                                    Cancel</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
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

    <!-- COMMON SCRIPTS -->
    <script src="/js/common_scripts.min.js"></script>
    <script src="/js/common_func.js"></script>
    <script src="/js/validate.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="/js/sticky_sidebar.min.js"></script>
    <script src="/js/specific_detail.js"></script>
</body>

<script>
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
    geocoder.addressSearch(`${master.storeAddress}`, function (result, status) {

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
                content: '<div style="width:150px;text-align:center;padding:6px 0;">${master.storeName}</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);

            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        }

    });

    const $openKakaoMap = $(".openKaKaoMap");
    $openKakaoMap.on("click", function () {

        const area = "https://map.kakao.com/link/search/" + `${master.storeAddress}`;
        $openKakaoMap.attr("href", area);
    });
</script>

</html>
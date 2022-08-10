<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="/css/booking-sign_up.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="/css/custom.css" rel="stylesheet">

    <!-- jquery -->
    <script src="/js/jquery-3.3.1.min.js"></script>


    <style>


    </style>

</head>

<body>

    <header class="header_in clearfix">
        <div class="container">
            <div id="logo">
                <a href="/">
                    <img src="/img/logo_sticky.svg" width="140" height="35" alt="">
                </a>
            </div>
            <ul id="top_menu">
                <li><a href="#sign-in-dialog" id="sign-in" class="login">Sign In</a></li>
                <li><a href="wishlist.text" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
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
                    <a href="/"><img src="/img/logo.svg" width="140" height="35" alt=""></a>
                </div>
                <ul>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Home</a>
                        <ul>
                            <li><a href="index.text">Default</a></li>
                            <li class="third-level"><a href="#0">Sliders - Parallax <strong>New!</strong></a>
                                <ul>
                                    <li><a href="index-8.text">Revolution Slider 1</a></li>
                                    <li><a href="index-9.text">Revolution Slider 2</a></li>
                                    <li><a href="index-3.text">Owl Carousel</a></li>
                                    <li><a href="index-10.text">Parallax Youtube</a></li>
                                    <li><a href="index-11.text">Parallax Vimeo</a></li>
                                    <li><a href="index-12.text">Parallax Mp4 Video</a></li>
                                    <li><a href="index-13.text">Parallax Video Fullscreen</a></li>
                                    <li><a href="index-14.text">Parallax Image</a></li>
                                </ul>
                            </li>
                            <li><a href="index-15.text">Text Rotator</a></li>
                            <li><a href="index-5.text">Address Autocomplete</a></li>
                            <li><a href="index-6.text">Search Version 2</a></li>
                            <li><a href="index-7.text">Delivery/Takeaway version</a></li>
                            <li><a href="modal-advertise.text">Modal Advertise</a></li>
                            <li><a href="modal-newsletter.text">Modal Newsletter</a></li>
                            <li><a href="index-2.text">Video Bg Fallback Mobile</a></li>
                            <li><a href="index-4.text">GDPR Cookie Bar EU Law</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Listing</a>
                        <ul>
                            <li class="third-level"><a href="#0">List pages</a>
                                <ul>
                                    <li><a href="grid-listing-filterscol.text">List default</a></li>
                                    <li><a href="grid-listing-filterscol-map.text">List with map</a></li>
                                    <li><a href="listing-map.text">List side map</a></li>
                                    <li><a href="grid-listing-filterscol-full-width.text">List full width</a></li>
                                    <li><a href="grid-listing-filterscol-full-masonry.text">List Masonry Filter</a></li>
                                    <li><a href="grid-listing-filterscol-delivery.text">List Delivery/Takeaway</a></li>
                                </ul>
                            </li>
                            <li class="third-level"><a href="#0">Detail pages</a>
                                <ul>
                                    <li><a href="detail-restaurant.text">Detail page 1</a></li>
                                    <li><a href="detail-restaurant-2.text">Detail page 2</a></li>
                                    <li><a href="detail-restaurant-3.text">Mobile Fixed Booking</a></li>
                                    <li><a href="detail-restaurant-delivery.text">Delivery/Takeaway</a></li>
                                    <li><a href="detail-restaurant-4.text">Detail Menu Thumbs</a></li>
                                    <li><a href="detail-restaurant-5.text">Detail Contact Form</a></li>
                                </ul>
                            </li>
                            <li class="third-level"><a href="#0">OpenStreetMap</a>
                                <ul>
                                    <li><a href="grid-listing-filterscol-map-openstreetmap.text">List with map</a></li>
                                    <li><a href="listing-map-openstreetmap.text">List side map</a></li>
                                    <li><a href="grid-listing-filterscol-full-width-openstreetmap.text">List full
                                            width</a></li>
                                    <li><a href="grid-listing-filterscol-full-masonry-openstreetmap.text">List Masonry
                                            Filter</a></li>
                                </ul>
                            </li>
                            <li><a href="submit-restaurant.text">Submit Restaurant</a></li>
                            <li><a href="submit-rider.text">Submit Rider</a></li>
                            <li><a href="wishlist.text">Wishlist</a></li>
                            <li><a href="booking.text">Booking</a></li>
                            <li><a href="confirm.text">Confirm Booking</a></li>
                            <li><a href="confirm-delivery.text">Confirm Order</a></li>
                            <li><a href="booking-delivery-2.text">Order Delivery/Takeaway</a></li>
                            <li><a href="booking-delivery.text">Order Delivery/Takeaway 2</a></li>
                            <li><a href="admin_section/index.text" target="_blank">Admin Section</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Other Pages</a>
                        <ul>
                            <li><a href="404.text">404 Error</a></li>
                            <li><a href="help.text">Help and Faq</a></li>
                            <li><a href="blog.text">Blog</a></li>
                            <li><a href="leave-review.text">Leave a review</a></li>
                            <li><a href="user-logged-1.text">User Logged 1</a></li>
                            <li><a href="user-logged-2.text">User Logged 2</a></li>
                            <li><a href="contacts.text">Contacts</a></li>
                            <li><a href="coming_soon/index.text">Coming Soon</a></li>
                            <li><a href="account.text">Sign Up</a></li>
                            <li><a href="icon-pack-1.text">Icon Pack 1</a></li>
                            <li><a href="icon-pack-2.text">Icon Pack 2</a></li>
                        </ul>
                    </li>
                    <li><a href="submit-restaurant.text">Submit</a></li>
                    <li><a href="#0">Buy this template</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- /header -->

    <main class="bg_gray pattern">

        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <div class="sign_up">
                        <div class="head">
                            <div class="title">
                                <h3>Sign Up</h3>
                            </div>
                        </div>
                        <!-- /head -->
                        <div class="main">
                            <!-- <a href="#0" class="social_bt facebook">Sign up with Facebook</a>
							<a href="#0" class="social_bt google">Sign up with Google</a>
							<div class="divider"><span>Or</span></div> -->
                            <h6>Personal details</h6>
                            <form id="reg-form" action="/register" method="post">
                                <div>
                                    <span id="emailChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="email" id="email-input" name="email"
                                        placeholder="Email [실제 존재하는 Email 계정명을 입력하세요 계정명, 비밀번호 찾기에 활용됩니다.]">
                                    <i class="icon_mail"></i>
                                </div>

                                <!-- 중복 확인 결과에 대해 알려줄 부분 삽입 -->

                                <div>
                                    <span id="pwChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="password_sign"
                                        placeholder="비밀번호 [8~10자리의 특수문자를 포함하여 입력하세요]" name="password">
                                    <i class="icon_lock"></i>
                                </div>
                                <div>
                                    <span id="nameChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="name" placeholder="이름" name="name">
                                    <i class="icon_pencil"></i>
                                </div>
                                <div>
                                    <span id="nickNameChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="nick-name"
                                        placeholder="닉네임 [사용하고자 하는 닉네임을 입력하세요.]" name="nickName">
                                    <i class="icon_pencil"></i>
                                </div>


                                <div>
                                    <span id="birthChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="birth" placeholder="생년월일 [예시: 19991231]"
                                        name="birth" minlength="8" maxlength="8">
                                    <i class="icon_pencil"></i>
                                </div>
                                <div>
                                    <span id="phoneChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="phone-num" maxlength="11"
                                        placeholder="연락처 [예시: 010-1234-5678 -> 01012345678]" name="phoneNumber">
                                    <i class="icon_pencil"></i>
                                </div>
                                <h6>Gender</h6>
                                <div class="form-group">
                                    <select name="gender" id="gender">
                                        <option value="M">남성</option>
                                        <option value="F">여성</option>
                                    </select>
                                </div>
                                <div>
                                    <span id="addrChk"></span>
                                </div>
                                <div class="form-group add_bottom_15">
                                    <input class="form-control" id="address" placeholder="주소 [예시: 서울특별시 금천구 한국로 130]"
                                        name="address" minlength="10">
                                    <i class="icon_pencil"></i>
                                </div>

                                <button type="button" id="reg-btn" class="btn_1 full-width mb_5">Sign Up Now</button>
                            </form>
                        </div>
                    </div>
                    <!-- /box_booking -->
                </div>
                <!-- /col -->

            </div>
            <!-- /row -->
        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_1">Quick Links</h3>
                    <div class="collapse dont-collapse-sm links" id="collapse_1">
                        <ul>
                            <li><a href="submit-rider.text">Become a Rider</a></li>
                            <li><a href="submit-restaurant.text">Add your restaurant</a></li>
                            <li><a href="help.text">Help</a></li>
                            <li><a href="account.text">My account</a></li>
                            <li><a href="blog.text">Blog</a></li>
                            <li><a href="contacts.text">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_2">Categories</h3>
                    <div class="collapse dont-collapse-sm links" id="collapse_2">
                        <ul>
                            <li><a href="grid-listing-filterscol.text">Top Categories</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry.text">Best Rated</a></li>
                            <li><a href="grid-listing-filterscol-full-width.text">Best Price</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry.text">Latest Submissions</a></li>
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
                                            data-src="img/twitter_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/facebook_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/instagram_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="img/youtube_icon.svg" alt="" class="lazy"></a></li>
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
                                data-src="img/cards_all.svg" alt="" width="198" height="30" class="lazy"></li>
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

    <!-- COMMON SCRIPTS -->
    <script src="/js/common_scripts.min.js"></script>
    <script src="/js/common_func.js"></script>
    <script src="assets/validate.js"></script>



    <!-- 회원가입 입력 항목별 검증 및 비동기 요청 중복 확인 -->
    <script>
        $(document).ready(function () {

            const getMailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            // 영어로 시작해야 하고 중간에 @가 들어가야 한다. 그 뒤에는 또 영어가 들어가야 하고 . 뒤에 다시 영어가 들어가야 한다.
            // end 정규표현식

            const getPwCheck = RegExp(
                /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
            // 영문, 숫자가 들어가야 하고 특수기호를 하나라도 포함해야한다 
            // 또는!! 시작을 특수문자로 해도 되고, 영문이나 숫자를 하나라도 포함해야 한다.

            const getName = RegExp(/^[가-힣]{2,4}/);
            // 한글로 써야 한다는 정규표현식. 유니코드상 한글의 시작이 '가', 끝이 '힣'이라서


            const getBitrth = RegExp(/^[0-9]+$/);
            // 생년월일은 숫자로만 입력해야 한다.


            const getPhoneNum = RegExp(/^010-?([0-9]{3,4})-?([0-9]{4})$/);
            // 전화번호는 010으로 시작하며 하이픈이 들어간 이후 3 또는 4자리, 그리고 다시 하이픈 후 4자리의 숫자가 들어가야 한다.



            // 입력값 검증 배열
            // 1: 이메일 / 2: 비번, 3: 이름, 4: 닉네임, 5: 생년월일, 6: 전화번호, 7: 주소
            const checkArr = [false, false, false, false, false, false, false];


            // 1. 이메일 검증
            const $emailInput = $('#email-input');
            const $emailChk = $('#emailChk');


            $emailInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($emailInput.val().trim() === '') {
                    $emailInput.css('border-color', 'red');
                    $emailChk.text('필수 입력사항입니다.');
                    $emailChk.css('color', 'red');
                    checkArr[0] = false;
                }

                // 이메일 표현식에 어긋나는 경우
                else if (!getMailCheck.test($emailInput.val())) {
                    $emailInput.css('border-color', 'red');
                    $emailChk.text('잘못된 이메일 형식입니다.');
                    $emailChk.css('color', 'red');
                    checkArr[0] = false;
                } else {

                    // 이메일 중복확인이 여기서 들어가야 한다. 비동기 요청!!
                    fetch('/member/check?type=email&value=' + $emailInput.val())
                        .then(res => res.text())
                        .then(flag => {

                            if (flag === 'true') {
                                // 중복 이메일인 경우
                                $emailInput.css('border-color', 'red');
                                $emailChk.text('중복된 아이디입니다.');
                                $emailChk.css('color', 'red');
                                checkArr[0] = false;

                            } else {
                                // 정상적으로 입력한 경우
                                $emailInput.css('border-color', 'greenyellow');
                                $emailChk.text('사용 가능한 이메일입니다');
                                $emailChk.css('color', 'green');
                                checkArr[0] = true;
                            }
                        });
                }
            }); // end 이메일 검증 로직


            // 2. 비밀번호 검증
            const $pwInput = $('#password_sign');
            const $pwChk = $('#pwChk');

            $pwInput.on('keyup', e => {

                // console.log('pw input:', $pwInput.val());

                // 아무 입력도 하지 않은 경우
                if ($pwInput.val().trim() === '') {
                    $pwInput.css('border-color', 'red');
                    $pwChk.text('필수입력 사항입니다.');
                    $pwChk.css('color', 'red');
                    checkArr[1] = false;
                }

                // 비밀번호 정규표현식 검증
                else if (!getPwCheck.test($pwInput.val()) || $pwInput.val().length < 8 || $pwInput.val()
                    .length > 10) {
                    $pwInput.css('border-color', 'red');
                    $pwChk.text('비밀번호는 특수문자 포함 8자 이상 10자 이하여야 합니다.');
                    $pwChk.css('color', 'red');
                    checkArr[1] = false;
                }

                // 정상적으로 입력한 경우
                else {
                    $pwInput.css('border-color', 'greenyellow');
                    $pwChk.text('사용 가능한 비밀번호입니다.');
                    $pwChk.css('color', 'green');
                    checkArr[1] = true;
                }
            }); // end 비밀번호 검증 로직


            // 3. 이름 검증
            const $nameInput = $('#name');
            const $nameChk = $('#nameChk');

            $nameInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($nameInput.val().trim() === '') {
                    $nameInput.css('border-color', 'red');
                    $nameChk.text('필수 입력사항입니다.');
                    $nameChk.css('color', 'red');
                    checkArr[2] = false;
                }

                // 입력값이 한글이 아니거나 2~4글자가 아닌 경우
                else if (!getName.test($nameInput.val())) {
                    $nameInput.css('border-color', 'red');
                    $nameChk.text('2~4글자 사이로 한글로만 입력하세요.');
                    $nameChk.css('color', 'red');
                    checkArr[2] = false;
                }

                // 정상 입력인 경우
                else {
                    $nameInput.css('border-color', 'greenyellow');
                    $nameChk.text('');
                    checkArr[2] = true;
                }
            }); // end 이름 검증 로직


            // 4. 닉네임 검증
            const $nickInput = $('#nick-name');
            const $nickChk = $('nickNameChk');

            $nickInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($nickInput.val().trim() === '') {
                    $nickInput.css('border-color', 'red');
                    $nickChk.text('필수 입력사항입니다.');
                    $nickChk.css('color', 'red');
                    checkArr[3] = false;
                }

                // 이메일 표현식에 어긋나는 경우
                else if ($nickInput.val().length < 2) {
                    $nickInput.css('border-color', 'red');
                    $nickChk.text('닉네임은 최소 2자 이상입니다.');
                    $nickChk.css('color', 'red');
                    checkArr[3] = false;
                } else {

                    // 이메일 중복확인이 여기서 들어가야 한다. 비동기 요청!!
                    fetch('/member/check?type=nickName&value=' + $nickInput.val())
                        .then(res => res.text())
                        .then(flag => {

                            if (flag === 'true') {
                                // 중복 이메일인 경우
                                $nickInput.css('border-color', 'red');
                                $nickChk.text('중복된 닉네임입니다.');
                                $nickChk.css('color', 'red');
                                checkArr[3] = false;

                            } else {
                                // 정상적으로 입력한 경우
                                $nickInput.css('border-color', 'greenyellow');
                                $nickChk.text('사용 가능한 닉네임입니다');
                                $nickChk.css('color', 'green');
                                checkArr[3] = true;
                            }
                        });
                }

            }); // end 닉네임 검증 로직


            // 5. 생년월일 검증
            const $birthInput = $('#birth');
            const $birthChk = $('#birthChk');

            $birthInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($birthInput.val().trim() === '') {
                    $birthInput.css('border-color', 'red');
                    $birthChk.text('필수 입력사항입니다.');
                    $birthChk.css('color', 'red');
                    checkArr[4] = false;
                }

                // 입력값이 
                else if (!getBitrth.test($birthInput.val()) || $birthInput.val().length < 8) {
                    $birthInput.css('border-color', 'red');
                    $birthChk.text('숫자로만 8자로 입력해주세요. 예시: 1999년 12월 31일 -> 19991231 ');
                    $birthChk.css('color', 'red');
                    checkArr[4] = false;
                }

                // 정상 입력인 경우
                else {
                    $birthInput.css('border-color', 'greenyellow');
                    $birthChk.text('');
                    checkArr[4] = true;
                }

            }); // end 생년월일 검증 로직


            // 6. 전화번호 검증
            const $phoneNumInput = $('#phone-num');
            const $phoneChk = $('#phoneChk');

            $phoneNumInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($phoneNumInput.val().trim() === '') {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('필수 입력사항입니다.');
                    $phoneChk.css('color', 'red');
                    checkArr[5] = false;
                }

                // 입력값이 전화번호 정규표현식에 위배될 경우
                else if (!getPhoneNum.test($phoneNumInput.val())) {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('올바른 전화번호 양식이 아닙니다. 입력을 확인해주세요. 예시: 010-1234-5678');
                    $phoneChk.css('color', 'red');
                    checkArr[5] = false;
                }

                // 정상 입력인 경우
                else {
                    $phoneNumInput.css('border-color', 'greenyellow');
                    $phoneChk.text('');
                    checkArr[5] = true;
                }

            }); // end 전화번호 검증 로직


            // 7. 주소 검증 이건 일단 임시로..
            const $addrInput = $('#address');
            const $addrChk = $('#addrChk');

            $addrInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($addrInput.val().trim() === '') {
                    $addrInput.css('border-color', 'red');
                    $addrChk.text('필수 입력사항입니다.');
                    $addrChk.css('color', 'red');
                    checkArr[6] = false;
                }

                // 입력값이 너무 작은 경우..
                else if ($addrInput.val().length < 14) {
                    $addrInput.css('border-color', 'red');
                    $addrChk.text('주소 길이가 너무 짧습니다. 입력을 확인해주세요. 실제 주소를 입력하셔야 온전한 서비스 이용이 가능합니다.');
                    $addrChk.css('color', 'red');
                    checkArr[6] = false;
                }

                // 정상 입력인 경우
                else {
                    $addrInput.css('border-color', 'greenyellow');
                    $addrChk.text('주소가 정확한지 다시 한번 확인하세요. 온전한 서비스 이용을 위해 정확한 주소가 필요합니다.');
                    $addrChk.css('color', 'green');
                    checkArr[6] = true;
                }
            }); // end 주소 검증 로직


            const $regForm = $('#reg-form');
            const $regBtn = $('#reg-btn');

            // sign-up 버튼 클릭 이벤트
            $regBtn.on('click', e => {
                e.preventDefault();

                for (let c of checkArr) {
                    if (c === false) {
                        return;
                    }
                }

                $regForm.submit();
            }); // end sign-up 클릭 이벤트




        });
    </script>

</body>

</html>
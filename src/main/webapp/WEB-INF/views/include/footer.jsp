<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <h3 data-bs-target="#collapse_1">Quick Links</h3>
                <div class="collapse dont-collapse-sm links" id="collapse_1">
                    <ul>
                        <li><a href="/master/register">Add your restaurant</a></li>
                        <li><a href="/myPage/profile">My Page</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h3 data-bs-target="#collapse_2">Categories</h3>
                <div class="collapse dont-collapse-sm links" id="collapse_2">
                    <ul>
                        <li><a href="/foodlist">Best Rated</a></li>
                        <li><a href="/hotdeals">Best Price</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h3 data-bs-target="#collapse_3">Contacts</h3>
                <div class="collapse dont-collapse-sm contacts" id="collapse_3">
                    <ul>
                        <li><i class="icon_house_alt"></i>서울특별시 금천구 디지털로 130 <br> 남성프라자 1007호<br>South Korea</li>
                        <li><i class="icon_mobile"></i>+82 010-1234-1234</li>
                        <li><i class="icon_mail_alt"></i><a href="#0">FoodieFoodie@naver.com</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h3 data-bs-target="#collapse_4">Keep in touch</h3>
                <div class="collapse dont-collapse-sm" id="collapse_4">
                    <div id="newsletter">
                        <div id="message-newsletter"></div>
                        <form method="post" action="assets/newsletter.php" name="newsletter_form" id="newsletter_form">
                            <div class="form-group">
                                <input type="email" name="email_newsletter" id="email_newsletter" class="form-control"
                                    placeholder="Your email">
                                <button type="submit" id="submit-newsletter"><i class="arrow_carrot-right"></i></button>
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
                    <li><span>© FoodieFoodie</span></li>
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
    <div class="sign-in-wrapper">
        <!-- <a href="#0" class="social_bt facebook">Login with Facebook</a>
            <a href="#0" class="social_bt google">Login with Google</a>
            <div class="divider"><span>Or</span></div> -->
        <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" name="email" id="login-email">
            <i class="icon_mail_alt"></i>
        </div>
        <div class="clearfix add_bottom_15">
            <div class="float-end"><a id="forgot-email" href="javascript:void(0);">Forgot Email?</a></div>
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" class="form-control" name="password" id="login-pw">
            <i class="icon_lock_alt"></i>
        </div>
        <div class="clearfix add_bottom_15">
            <div class="checkboxes float-start">
                <label class="container_check">Remember me
                    <input type="checkbox" name="autoLogin" id="auto-login">
                    <span class="checkmark"></span>
                </label>
            </div>
            <div class="float-end"><a id="forgot-pw" href="javascript:void(0);">Forgot Password?</a></div>
        </div>
        <div class="text-center">
            <input type="button" value="Log In" class="btn_1 full-width mb_5" id="login-btn">
            Don’t have an email? <a href="/register">Sign up</a>
        </div>
    </div>
    <!--form -->
</div>
<!-- /Sign In Modal -->

<!-- COMMON SCRIPTS -->
<script src="/js/common_scripts.min.js"></script>
<script src="/js/common_func.js"></script>
<script src="/assets/validate.js"></script>

<!-- SPECIFIC SCRIPTS -->
<script src="/js/sticky_sidebar.min.js"></script>
<script src="/js/specific_listing.js"></script>

<!-- Map -->
<script src="/js/main_map_scripts.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>


<!-- 로그인 요청 로직 처리 -->
<script>
    // 로그인시 로직 처리
    function login() {

        $('.sign-in-wrapper').keyup(e => {
            console.log(e.keyCode);
            if (e.keyCode === 13) {
                loginSubmit(e);
            }
        });


        const loginBtn = document.getElementById('login-btn');
        loginBtn.onclick = e => {
            loginSubmit(e);
        };
    }

    
    function loginSubmit(e) {
        e.preventDefault();

        const inputData = {
            email: document.getElementById('login-email').value,
            password: document.getElementById('login-pw').value,
            autoLogin: document.getElementById('auto-login').checked
        };

        console.log(inputData);

        const reqObj = {
            method: 'POST',
            headers: {
                'content-type': 'application/json'
            },
            body: JSON.stringify(inputData)
        };

        fetch('/login', reqObj)
            .then(res => res.text())
            .then(flag => {
                if (flag === 'SUCCESS') {

                    location.href = "/";

                } else if (flag === 'NO_PW') {
                    alert('일치하지 않는 비밀번호입니다.');
                } else {
                    alert('존재하지 않는 이메일입니다.');
                }
            });
    }


    // 메인 실행부
    (function () {

        login();

    })();
</script>


<!-- 이메일, 비번 찾기 로직 처리 -->
<script>

    // 이메일 찾기 로직
    function findEmail() {

        const $findEmailBtn = document.getElementById('forgot-email');

        $findEmailBtn.onclick = e => {
            location.href = '/find/email';
        }

    }


    // 비번 찾기 로직
    function findPW() {

        const $findPwBtn = document.getElementById('forgot-pw');


        $findPwBtn.onclick = e => {
            location.href = '/find/pw';
        }

    }



    // 실행부
    (function () {

        findEmail();
        findPW();

    }) ();

</script>
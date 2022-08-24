<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        main {
            height: 65vh;
        }

        .sign_up {
            margin-top: 50px;
        }
    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>


    <main class="bg_gray pattern">
        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="sign_up">
                        <div class="head">
                            <h3>Sign In</h3>
                        </div>
                        <div class="sign-in-wrapper2">
                            <div class="form-group">
                                <label>email</label>
                                <input type="email" class="form-control" name="email" id="login-email2">
                            </div>
                            <div class="clearfix add_bottom_15">
                                <div class="float-end"><a id="forgot-email2" href="javascript:void(0);">Forgot
                                        Email?</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>password</label>
                                <input type="password" class="form-control" name="password" id="login-pw2">
                            </div>
                            <div class="clearfix add_bottom_15">
                                <div class="checkboxes float-start">
                                    <label class="container_check">Remember me
                                        <input type="checkbox" name="autoLogin" id="auto-login2">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="float-end"><a id="forgot-pw2" href="javascript:void(0);">Forgot
                                        Password?</a>
                                </div>
                            </div>
                            <div class="text-center">
                                <input type="button" value="Log In" class="btn_1 full-width mb_5" id="login-btn2">
                                Don’t have an email? <a href="/register">Sign up</a>
                            </div>
                        </div>
                        <!--form -->
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


    <!-- 로그인 요청 로직 처리 -->
    <script>
        // 로그인시 로직 처리
        function login() {

            $('.sign-in-wrapper2').keyup(e => {
                console.log(e.keyCode);
                if (e.keyCode === 13) {
                    loginSubmit(e);
                }
            });


            const loginBtn = document.getElementById('login-btn2');
            loginBtn.onclick = e => {
                loginSubmit(e);
            };
        }


        function loginSubmit(e) {
            e.preventDefault();

            const inputData = {
                email: document.getElementById('login-email2').value,
                password: document.getElementById('login-pw2').value,
                autoLogin: document.getElementById('auto-login2').checked
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

            const $findEmailBtn = document.getElementById('forgot-email2');

            $findEmailBtn.onclick = e => {
                location.href = '/find/email';
            }

        }


        // 비번 찾기 로직
        function findPW() {

            const $findPwBtn = document.getElementById('forgot-pw2');


            $findPwBtn.onclick = e => {
                location.href = '/find/pw';
            }

        }



        // 실행부
        (function () {

            findEmail();
            findPW();

        })();
    </script>

</body>

</html>
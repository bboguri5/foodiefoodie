<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        main {
            height: 70vh;
        }

        .sign_up {
            margin-top: 50px;
        }
    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

    <main class="bg_gray pattern">

        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="sign_up">
                        <div class="head">
                            <div class="title">
                                <h3>비밀변호 변경하기</h3>
                            </div>
                        </div>
                        <!-- /head -->
                        <div class="main">
                            <h6>가입한 계정 이메일, 성함, 전화번호, 생년월일을 입력하세요.</h6>
                            <form id="find-pw-form" action="/find/pw" method="post">
                                <br>
                                <div>
                                    <span id="emailChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="email" id="email-input" name="email"
                                        placeholder="Email">
                                </div>

                                <div>
                                    <span id="nameChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="name" placeholder="이름" name="name">
                                </div>


                                <div>
                                    <span id="birthChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="birth" placeholder="생년월일 [예시: 19991231]"
                                        name="birth" minlength="8" maxlength="8">
                                </div>



                                <div>
                                    <span id="phoneChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control phoneNumber" type="text" id="phone-num" maxlength="13"
                                        placeholder="연락처 [예시: 010-1234-5678]" name="phoneNumber">
                                </div>


                                <button type="button" id="find-pw-btn" class="btn_1 full-width mb_5">비밀번호 변경하기</button>
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


    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

    <script>
        $(document).ready(function () {

            const getMailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            // 영어로 시작해야 하고 중간에 @가 들어가야 한다. 그 뒤에는 또 영어가 들어가야 하고 . 뒤에 다시 영어가 들어가야 한다.
            // end 정규표현식


            const getName = RegExp(/^[가-힣]{2,4}/);
            // 한글로 써야 한다는 정규표현식. 유니코드상 한글의 시작이 '가', 끝이 '힣'이라서


            const getBitrth = RegExp(/^[0-9]+$/);
            // 생년월일은 숫자로만 입력해야 한다.


            const getPhoneNum = RegExp(/^010-([0-9]{3,4})-([0-9]{4})$/);
            // 전화번호는 010으로 시작하며 하이픈이 들어간 이후 3 또는 4자리, 그리고 다시 하이픈 후 4자리의 숫자가 들어가야 한다.



            // 입력값 검증 배열
            // 1: 이메일 / 2: 이름 / 3: 생년월일, 4: 전화번호
            const checkArr = [false, false, false, false];


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
                    // 정상적으로 입력한 경우
                    $emailInput.css('border-color', 'greenyellow');
                    $emailChk.text('');
                    $emailChk.css('color', 'green');
                    checkArr[0] = true;
                }
            }); // end 이메일 검증 로직



            // 2. 이름 검증
            const $nameInput = $('#name');
            const $nameChk = $('#nameChk');

            $nameInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($nameInput.val().trim() === '') {
                    $nameInput.css('border-color', 'red');
                    $nameChk.text('필수 입력사항입니다.');
                    $nameChk.css('color', 'red');
                    checkArr[1] = false;
                }

                // 입력값이 한글이 아니거나 2~4글자가 아닌 경우
                else if (!getName.test($nameInput.val())) {
                    $nameInput.css('border-color', 'red');
                    $nameChk.text('2~4글자 사이로 한글로만 입력하세요.');
                    $nameChk.css('color', 'red');
                    checkArr[1] = false;
                }

                // 정상 입력인 경우
                else {
                    $nameInput.css('border-color', 'greenyellow');
                    $nameChk.text('');
                    checkArr[1] = true;
                }
            }); // end 이름 검증 로직



            // 3. 생년월일 검증
            const $birthInput = $('#birth');
            const $birthChk = $('#birthChk');

            $birthInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($birthInput.val().trim() === '') {
                    $birthInput.css('border-color', 'red');
                    $birthChk.text('필수 입력사항입니다.');
                    $birthChk.css('color', 'red');
                    checkArr[2] = false;
                }

                // 입력값이 
                else if (!getBitrth.test($birthInput.val()) || $birthInput.val().length < 8) {
                    $birthInput.css('border-color', 'red');
                    $birthChk.text('숫자로만 8자로 입력해주세요. 예시: 1999년 12월 31일 -> 19991231 ');
                    $birthChk.css('color', 'red');
                    checkArr[2] = false;
                }

                // 정상 입력인 경우
                else {
                    $birthInput.css('border-color', 'greenyellow');
                    $birthChk.text('');
                    checkArr[2] = true;
                }

            }); // end 생년월일 검증 로직


            // 4. 전화번호 검증
            const $phoneNumInput = $('#phone-num');
            const $phoneChk = $('#phoneChk');

            $phoneNumInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($phoneNumInput.val().trim() === '') {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('필수 입력사항입니다.');
                    $phoneChk.css('color', 'red');
                    checkArr[3] = false;
                }

                // 입력값이 전화번호 정규표현식에 위배될 경우
                else if (!getPhoneNum.test($phoneNumInput.val())) {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('올바른 전화번호 양식이 아닙니다. 입력을 확인해주세요. 예시: 010-1234-5678');
                    $phoneChk.css('color', 'red');
                    checkArr[3] = false;
                }

                // 정상 입력인 경우
                else {
                    $phoneNumInput.css('border-color', 'greenyellow');
                    $phoneChk.text('');
                    checkArr[3] = true;
                }

            });

            $phoneNumInput.on('change', e => {

                // 아무 입력도 하지 않은 경우
                if ($phoneNumInput.val().trim() === '') {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('필수 입력사항입니다.');
                    $phoneChk.css('color', 'red');
                    checkArr[3] = false;
                }

                // 입력값이 전화번호 정규표현식에 위배될 경우
                else if (!getPhoneNum.test($phoneNumInput.val())) {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('올바른 전화번호 양식이 아닙니다. 입력을 확인해주세요. 예시: 010-1234-5678');
                    $phoneChk.css('color', 'red');
                    checkArr[3] = false;
                }

                // 정상 입력인 경우
                else {
                    $phoneNumInput.css('border-color', 'greenyellow');
                    $phoneChk.text('');
                    checkArr[3] = true;
                }

            }); // end 전화번호 검증 로직



            const $findPwBtn = $('#find-pw-btn');
            const $form = $('#find-pw-form');

            $findPwBtn.on('click', e => {

                for (let check of checkArr) {
                    if (check === false) {
                        return;
                    }
                }

                $form.submit();

            });




        });
    </script>


    <!-- 연락처 입력시 자동으로 하이픈 작성을 해주는 스크립트 영역 -->
    <script>
        $(document).on("keyup", ".phoneNumber", function () {

            $(this).val($(this).val().replace(/[^0-9]/g, "").replace(
                /(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));

        });
    </script>

</body>

</html>
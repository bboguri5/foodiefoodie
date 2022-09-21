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

        .box_booking_2 {
            margin-top: 70px;
        }

        .left {
            float: left;
        }

    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <main class="bg_gray pattern">

        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>비밀번호 변경하기</h3>
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <form action="/check/oldPw" method="post" id="check-oldPw-form">
                                        <div class="form-group">
                                            <label class="left">현재 비밀번호를 입력하세요.</label>
                                            <span id="pwChk"></span>
                                            <input class="form-control" id="password_sign" type="password" name="oldPw">
                                        </div>
                                        <div class="form-group">
                                            <label class="left">현재 비밀번호를 다시 한번 입력하세요.</label>
                                            <span id="rePwChk"></span>
                                            <input class="form-control" id="recheck-pw" type="password">
                                        </div>
                                        <button type="button" id="check-oldPw-btn">전송</button>
                                    </form>
                                </div>
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


    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {

            const getPwCheck = RegExp(
                /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
            // 영문, 숫자가 들어가야 하고 특수기호를 하나라도 포함해야한다 
            // 또는!! 시작을 특수문자로 해도 되고, 영문이나 숫자를 하나라도 포함해야 한다.


        
            // 1. 현재 비밀번호  2. 확인용 재입력 비밀번호
            const checkArr = [false, false]; 


            // 1. 처음 input 창 현재 비밀번호 검증 처리
            const $pwInput = $('#password_sign');
            const $pwChk = $('#pwChk');

            $pwInput.on('keyup', e => {

                // console.log('pw input:', $pwInput.val());

                // 아무 입력도 하지 않은 경우
                if ($pwInput.val().trim() === '') {
                    $pwInput.css('border-color', 'red');
                    $pwChk.text('필수입력 사항입니다.');
                    $pwChk.css('color', 'red');
                    checkArr[0] = false;
                }

                // 비밀번호 정규표현식 검증
                else if (!getPwCheck.test($pwInput.val()) || $pwInput.val().length < 8 || $pwInput.val()
                    .length > 10) {
                    $pwInput.css('border-color', 'red');
                    $pwChk.text('비밀번호는 특수문자 포함 8자 이상 10자 이하여야 합니다.');
                    $pwChk.css('color', 'red');
                    checkArr[0] = false;
                }

                // 정상적으로 입력한 경우
                else {
                    $pwInput.css('border-color', 'greenyellow');
                    $pwChk.text('');
                    $pwChk.css('color', 'green');
                    checkArr[0] = true;
                }
            }); // end 현재 비밀번호 검증 로직



            // 2. 두 번째 현재 비밀번호 확인용 input 창 검증 처리
            const $reCheckInput = $('#recheck-pw');
            const $rePwChk = $('#rePwChk');


            $reCheckInput.on('keyup', e => {
                // 처음 입력한 현재 비밀번호와 일치하는 경우
                if ($reCheckInput.val() == $pwInput.val()) {
                    $reCheckInput.css('border-color', 'greenyellow');
                    $rePwChk.text('');
                    $rePwChk.css('color', 'green');
                    checkArr[1] = true;
                } 
                
                // 처음 입력한 현재 비밀번호와 일치하지 않는 경우
                else {
                    $reCheckInput.css('border-color', 'red');
                    $rePwChk.text('먼저 입력된 현재 비밀번호와 일치하지 않습니다.');
                    $rePwChk.css('color', 'red');
                    checkArr[1] = false;
                }
            }); // end 현재 비밀번호 재확인용 검증 로직


            const $changePwBtn = $('#check-oldPw-btn');
            const $changePwForm = $('#check-oldPw-form');

            $changePwBtn.on('click', e => {

                for (let check of checkArr) {
                    if (check === false) {
                        return;
                    }
                }

                $changePwForm.submit();
            });

        });
    </script>

</body>

</html>
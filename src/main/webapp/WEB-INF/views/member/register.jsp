<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <main class="bg_gray pattern">

        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <div class="sign_up">
                        <div class="head">
                            <div class="title">
                                <h3>회원가입</h3>
                            </div>
                        </div>
                        <!-- /head -->
                        <div class="main">
                            <!-- <a href="#0" class="social_bt facebook">Sign up with Facebook</a>
							<a href="#0" class="social_bt google">Sign up with Google</a>
							<div class="divider"><span>Or</span></div> -->
                            <h6>아래 항목들을 빠짐없이 입력하세요.</h6>
                            <form id="reg-form" action="/register" method="post">
                                <div>
                                    <span id="emailChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="email" id="email-input" name="email" autocomplete="off"
                                        placeholder="Email [실제 존재하는 Email 계정명을 입력하세요 계정명, 비밀번호 찾기에 활용됩니다.]">
                                    <!-- <i class="icon_mail"></i> -->
                                </div>

                                <!-- 중복 확인 결과에 대해 알려줄 부분 삽입 -->

                                <div>
                                    <span id="pwChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="password_sign"
                                        placeholder="비밀번호 [8~10자리의 특수문자를 포함하여 입력하세요]" name="password">
                                    <!-- <i class="icon_lock"></i> -->
                                </div>
                                <div>
                                    <span id="nameChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="name" placeholder="이름" name="name" maxlength="4">
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>
                                <div>
                                    <span id="nickNameChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="nick-name"
                                        placeholder="닉네임 [사용하고자 하는 닉네임을 입력하세요.]" name="nickName">
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>


                                <div>
                                    <span id="birthChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="birth" placeholder="생년월일 [예시: 19991231]"
                                        name="birth" minlength="8" maxlength="8">
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>
                                <div>
                                    <span id="phoneChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control phoneNumber" type="text" id="phone-num" maxlength="13"
                                        placeholder="연락처 [예시: 010-1234-5678]" name="phoneNumber">
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>
                                <h6>성별</h6>
                                <div class="form-group">
                                    <select name="gender" id="gender">
                                        <option value="M">남성</option>
                                        <option value="F">여성</option>
                                    </select>
                                </div>


                                <h6>주소</h6>
                                <div>
                                    <span id="addrChk"></span>
                                </div>
                                <input class="form-group" type="text" id="sample4_postcode" placeholder="우편번호">
                                <input class="form-group" type="button" onclick="sample4_execDaumPostcode()"
                                    value="우편번호 찾기"><br>
                                <input class="form-group addr-api" type="text" id="sample4_roadAddress"
                                    placeholder="도로명주소" name="address">
                                <input class="form-group" type="text" id="sample4_jibunAddress" placeholder="지번주소">
                                <span id="guide" style="color:#999;display:none"></span>
                                <input class="form-group addr-api" type="text" id="sample4_detailAddress"
                                    placeholder="상세주소" name="detailAddress">
                                <input class="form-group" type="text" id="sample4_extraAddress" placeholder="참고항목"
                                    name="extraAddress">

                                <button type="button" id="reg-btn" class="btn_1 full-width mb_5">가입하기</button>
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


    <!-- 연락처 입력시 자동으로 하이픈 작성을 해주는 스크립트 영역 -->
    <script>
        $(document).on("keyup", ".phoneNumber", function () {

            $(this).val($(this).val().replace(/[^0-9]/g, "").replace(
                /(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3").replace("--", "-"));

        });
    </script>


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


            const getNickName = RegExp(/^[a-zA-Zㄱ-힣0-9]{2,12}$/);

            const getBitrth = RegExp(/^[0-9]+$/);
            // 생년월일은 숫자로만 입력해야 한다.


            const getPhoneNum = RegExp(/^010-([0-9]{3,4})-([0-9]{4})$/);
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
                        .then(msg => {

                            if (msg === 'duplicate') {
                                // 중복 이메일인 경우
                                $emailInput.css('border-color', 'red');
                                $emailChk.text('중복된 계정명입니다.');
                                $emailChk.css('color', 'red');
                                checkArr[0] = false;
                            } 
                            else if (msg === 'blackList') {
                                $emailInput.css('border-color', 'red');
                                $emailChk.text('블랙리스트로 등록된 계정명입니다.');
                                $emailChk.css('color', 'red');
                                checkArr[0] = false;
                            }
                            else {
                                // 정상적으로 입력한 경우
                                $emailInput.css('border-color', 'greenyellow');
                                $emailChk.text('사용 가능한 계정명입니다');
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
            const $nickChk = $('#nickNameChk');

            $nickInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($nickInput.val().trim() === '') {
                    $nickInput.css('border-color', 'red');
                    $nickChk.text('필수 입력사항입니다.');
                    $nickChk.css('color', 'red');
                    checkArr[3] = false;
                }

                // 닉네임 정규표현식 검증 및 길이 검증
                else if (!getNickName.test($nickInput.val()) || $nickInput.val().length < 2 ||
                    $nickInput.val().length > 12) {
                    $nickInput.css('border-color', 'red');
                    $nickChk.text('닉네임은 최소 2자 이상 12자 이하로 영문, 한글, 숫자만 가능합니다.');
                    $nickChk.css('color', 'red');
                    checkArr[3] = false;
                } else {

                    // 닉네임 중복확인. 비동기 요청!!
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

            $phoneNumInput.on('keydown', e => {

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

            }); 

            $phoneNumInput.on('change', e => {
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



            const $regForm = $('#reg-form');
            const $regBtn = $('#reg-btn');

            const $addrApiInputList = $('.addr-api');
            const $addrChk = $('#addrChk');

            // sign-up 버튼 클릭 이벤트
            $regBtn.on('click', e => {
                e.preventDefault();

                for (let addrInput of $addrApiInputList) {
                    if (addrInput.value.trim() === '') {
                        addrInput.style.borderColor = 'red';
                        $addrChk.text('필수 입력사항입니다. 원활한 서비스 이용을 위해 정확한 주소를 입력하세요.');
                        $addrChk.css('color', 'red');
                        return;
                    } else {
                        addrInput.style.borderColor = 'yellowgreen';
                    }
                }


                $addrChk.text('');
                checkArr[6] = true;

                for (let c of checkArr) {
                    if (c === false) {
                        return;
                    }
                }

                $regForm.submit();
            }); // end sign-up 클릭 이벤트




        });
    </script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data
                            .buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data
                        .zonecode;
                    document.getElementById("sample4_roadAddress").value =
                        roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data
                        .jibunAddress;

                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if (roadAddr !== '') {
                        document.getElementById("sample4_extraAddress").value =
                            extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value =
                            '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr +
                            ')';
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr +
                            ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>


    

</body>

</html>
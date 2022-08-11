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
                                <h3>사업자 권한 요청하기</h3>
                            </div>
                        </div>
                        <!-- /head -->
                        <div class="main">
                            <!-- <a href="#0" class="social_bt facebook">Sign up with Facebook</a>
							<a href="#0" class="social_bt google">Sign up with Google</a>
							<div class="divider"><span>Or</span></div> -->
                            <h6>아래 항목들을 빠짐없이 입력하세요.</h6>
                            <br>
                            <form id="req-auth-form" action="/request-auth" method="post">
                                <div>
                                    <span class="vaildate-check">사업자 번호</span>
                                </div>
                                <div>
                                    <span id="businessNoChk"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="businessNo-input"
                                        name="businessNo" placeholder="정확한 사업자 번호를 입력하세요.">
                                    <!-- <i class="icon_mail"></i> -->
                                </div>
                                <div>
                                    <span class="vaildate-check">계정명</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" id="master-email" name="email"
                                        value="${loginUser.email}" readonly>
                                    <!-- <i class="icon_lock"></i> -->
                                </div>
                                <div>
                                    <span class="vaildate-check">사업주명</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="master-name" name="masterName"
                                        value="${loginUser.name}" readonly>
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>

                                <!--  -->
                                <div>
                                    <span class="vaildate-check">상호명</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="store-name"
                                        placeholder="등록하시려는 가게의 상호명을 입력하세요." name="storeName">
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>


                                <div>
                                    <span class="vaildate-check">주소: <br>
                                        자택 주변 가게 추천을 위해 정확한 주소를 입력하세요.</span>
                                </div>
                                <!-- <div class="form-group">
                                    <input class="form-control master" type="text" id="store-address"
                                        placeholder="예시: 서울특별시 금천구 한국로 130" name="storeAddress" minlength="10">
                                    <i class="icon_pencil"></i>
                                </div> -->
                                <input class="form-group" type="text" id="sample4_postcode" placeholder="우편번호">
                                <input class="form-group" type="button" onclick="sample4_execDaumPostcode()"
                                    value="우편번호 찾기"><br>
                                <input class="form-group addr-api master" type="text" id="sample4_roadAddress"
                                    placeholder="도로명주소" name="storeAddress">
                                <input class="form-group" type="text" id="sample4_jibunAddress" placeholder="지번주소">
                                <span id="guide" style="color:#999;display:none"></span>
                                <input class="form-group addr-api master" type="text" id="sample4_detailAddress"
                                    placeholder="상세주소" name="storeDetailAddress">
                                <input class="form-group" type="text" id="sample4_extraAddress" placeholder="참고항목"
                                    name="storeExtraAddress">

                                <div>
                                    <span class="vaildate-check">가게 전화번호: <br>
                                        고객과 원활한 소통을 위해 정확한 전화번호를 입력하세요.</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="store-call-num" maxlength="13"
                                        placeholder="하이픈(-)까지 정확히 입력하세요." name="storeCallNumber">
                                    <!-- <i class="icon_pencil"></i> -->
                                </div>
                                <div>
                                    <span class="vaildate-check"></span>
                                </div>

                                <button type="button" id="req-auth-btn" class="btn_1 full-width mb_5">권한 요청하기</button>
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

            if ('${resultMsg}' === 'fail') {
                alert('권한 요청에 실패하였습니다.');
            }


            // 사업자 번호 정규표현식
            const getBusiNo = RegExp(/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/);

            const getStoreCallNum = RegExp(/^(0[2-8][0-5]?|01[01346-9])-([1-9]{1}[0-9]{2,3})-([0-9]{4})$/);
            // 전화번호는 2,3글자의 지역번호 또는 01?로 시작하며 하이픈이 들어간 이후 3 또는 4자리, 그리고 다시 하이픈 후 4자리의 숫자가 들어가야 한다.


            const $reqMasterInputList = document.querySelectorAll('.master');
            const $reqAuthBtn = document.getElementById('req-auth-btn');
            const $reqAuthForm = document.getElementById('req-auth-form');


            const $businessNoInput = $('#businessNo-input');
            $businessNoInput.on('keyup', e => {

                const $businessNoChk = $('#businessNoChk');

                // 사업자번호 정규표현식 검증
                if (!getBusiNo.test($('#businessNo-input').val())) {

                    $('#businessNo-input').css('border-color', 'red');

                    $businessNoChk.css('color', 'red');

                    $businessNoChk.text('올바르지 않은 형식입니다. 하이픈(-)을 포함하여 정확한 사업자번호를 입력하세요.');

                    return;
                }

                fetch('/master/check?businessNo=' + $businessNoInput.val())
                    .then(res => res.text())
                    .then(flag => {
                        if (flag === 'false') {
                            $businessNoInput.css('border-color', 'yellowgreen');
                            $businessNoChk.css('color', 'green');
                            $businessNoChk.text('등록 가능한 사업자 번호입니다.');
                        } else {
                            $businessNoChk.css('color', 'red');
                            $businessNoChk.text('중복된 사업자 번호입니다.');
                        }
                    })

            });


            $reqAuthBtn.onclick = e => {
                // 필수입력사항 누락 여부 체크
                for (let input of $reqMasterInputList) {

                    if (input.value.trim() === '') {

                        input.style.borderColor = 'red';

                        alert('권한 요청에 실패하였습니다. 모든 항목을 빠짐없이 입력했는지 확인하세요.');

                        return;
                    }
                }


                // 전화번호 정규표현식 검증
                if (!getStoreCallNum.test($('#store-call-num').val())) {

                    $('#store-call-num').css('border-color', 'red');

                    alert('형식에 맞지 않는 가게 전화번호입니다. 입력을 확인해주세요. ');
                    return;
                }


                // 정상적으로 입력을 완료한 경우
                $reqAuthForm.submit();
            };
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
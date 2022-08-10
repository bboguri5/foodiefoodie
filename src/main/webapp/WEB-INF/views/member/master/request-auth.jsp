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
                                    <i class="icon_lock"></i>
                                </div>
                                <div>
                                    <span class="vaildate-check">사업주명</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="master-name" name="masterName"
                                        value="${loginUser.name}" readonly>
                                    <i class="icon_pencil"></i>
                                </div>

                                <!--  -->
                                <div>
                                    <span class="vaildate-check">상호명</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="store-name"
                                        placeholder="등록하시려는 가게의 상호명을 입력하세요." name="storeName">
                                    <i class="icon_pencil"></i>
                                </div>


                                <div>
                                    <span class="vaildate-check">주소: <br>
                                        자택 주변 가게 추천을 위해 정확한 주소를 입력하세요.</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="store-address"
                                        placeholder="예시: 서울특별시 금천구 한국로 130" name="storeAddress" minlength="10">
                                    <i class="icon_pencil"></i>
                                </div>
                                <div>
                                    <span class="vaildate-check">가게 전화번호: <br>
                                        고객과 원활한 소통을 위해 정확한 전화번호를 입력하세요.</span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control master" type="text" id="store-call-num" maxlength="11"
                                        placeholder="하이픈(-)까지 정확히 입력하세요." name="storeCallNumber">
                                    <i class="icon_pencil"></i>
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


            $reqAuthBtn.onclick = e => {
                // 필수입력사항 누락 여부 체크
                for (let input of $reqMasterInputList) {

                    if (input.value.trim() === '') {

                        input.style.borderColor = 'red';

                        alert('권한 요청에 실패하였습니다. 모든 항목을 빠짐없이 입력했는지 확인하세요.');

                        return;
                    }
                }


                // 사업자번호 정규표현식 검증
                if (!getBusiNo.test($('#businessNo-input').val())) {

                    $('#businessNo-input').css('border-color', 'red');

                    alert('올바르지 않은 사업자 번호 형식입니다. 입력을 확인하세요.');

                    return;
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

</body>

</html>
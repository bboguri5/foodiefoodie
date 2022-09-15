<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../include/admin-static-head.jsp" %>

    <style>
        .btnbox .btn {
            float: left;
            margin-left: 20px;
        }

        #changePassword {
            width: 150px;
            height: 50px;
            margin-left: 30px;
            margin-top: 20px;
            /* 색깔을 좀 바꿔주길 바람  */
        }

        .addressSum {
            margin-left: 30px;
            margin-top: 10px;
            /* border: 1px solid #000; */
            margin-bottom: 10px;
        }

        .addressSum input {
            margin-top: 10px;
            margin-right: 5px;
            margin-left: 7px;
            width: 200px;
            height: 30px;

        }

        .addressBox {
            /* background: blue; */
            width: 100%;
            height: 20px;
        }

        .addressBox .addressDiv {
            text-align: center;
            line-height: 20px;
        }
    </style>

</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>

    <!-- /Navigation-->
    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="container-fluid">
         
            <form action="/modifyMember" method="post" class="modiForm">
                <div class="box_general padding_bottom">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-user"></i>프로필 수정하는곳</h2>
                    </div>
                    <div class="row">
                        <!-- <div class="col-md-4">
					<div class="form-group">
					<label>Your photo</label>
						<form action="/file-upload" class="dropzone"></form>
				    </div>
				</div> -->
                        <!-- 프로필 쓰는 공간 !!  -->
                        <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
                        <div class="col-md-8 add_top_30">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>email 아이디 </label>
                                        <input type="text" class="form-control" name="email" value="${loginUser.email}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="nickLabel">nick Name </label><span class="nickSpan"></span>
                                        <input type="text" class="form-control nickInput" name="nickName"
                                            value="${loginUser.nickName}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="phonLabel">phoneNumber 핸드폰번호 </label> <span
                                            class="phoneSpan"></span>
                                        <input type="text" class="form-control phoneNumInput" name="phoneNumber"
                                            value="${loginUser.phoneNumber}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>birth 생년월일 8자 </label>
                                        <input type="email" class="form-control" name="birth" value="${loginUser.birth}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <label>address 주소</label>
                                        <input type="text" class="form-control" name="address" value="${loginUser.address}">
                                    </div>
                                </div> -->
                                <div class="addressBox">
                                    <div class="addressDiv"></div>
                                </div>
                                <div class="addressSum">
                                    <input class="form-group" type="text" id="sample4_postcode" placeholder="우편번호">
                                    <input class="form-group" type="button" onclick="sample4_execDaumPostcode()"
                                        value="우편번호 찾기"><br>
                                    <input class="form-group addr-api" type="text" id="sample4_roadAddress"
                                        placeholder="도로명주소" name="address" required>

                                    <input class="form-group" type="text" id="sample4_jibunAddress" placeholder="지번주소">

                                    <!-- <span id="guide" style="color:#999;display:none"></span> -->

                                    <input class="form-group addr-api" type="text" id="sample4_detailAddress"
                                        placeholder="상세주소" name="detailAddress" required>

                                    <input class="form-group" type="text" id="sample4_extraAddress" placeholder="참고항목"
                                        name="extraAddress" required>
                                </div>


                                <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <label>realName 진짜 이름 </label>
                                        <input type="email" class="form-control" name="name" value="${loginUser.name}"
                                            readonly>
                                    </div>
                                </div> -->
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Gender /성별/(M/F)</label>
                                        <input type="text" class="form-control" name="gender"
                                            value="${loginUser.gender}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>your Auth 권한</label>
                                        <input type="email" class="form-control" name="auth" value="${loginUser.auth}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>가입일자</label>
                                        <input type="text" class="form-control" name="regDate"
                                            value="${loginUser.regDate}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>realName 진짜 이름 </label>
                                        <input type="email" class="form-control" name="name" value="${loginUser.name}"
                                            readonly>
                                    </div>
                                </div>
                                <!-- <button id="changePassword">비밀번호 바꾸기</button> -->
                            </div>
                        </div>
                    </div>
            </form>

        </div>
        <!-- /box_general-->
        <!-- <div class="row">
			<div class="col-md-6">
				<div class="box_general padding_bottom">
					<div class="header_box version_2">
						<h2><i class="fa fa-lock"></i>Change password</h2>
					</div>
					<div class="form-group">
						<label>Old password</label>
						<input class="form-control" type="password">
					</div>
					<div class="form-group">
						<label>New password</label>
						<input class="form-control" type="password">
					</div>
					<div class="form-group">
						<label>Confirm new password</label>
						<input class="form-control" type="password">
					</div>
				</div>
			</div> -->
        <!-- <div class="col-md-6">
				<div class="box_general padding_bottom">
					<div class="header_box version_2">
						<h2><i class="fa fa-envelope"></i>Change email</h2>
					</div>
					<div class="form-group">
						<label>Old email</label>
						<input class="form-control" name="old_email" id="old_email" type="email">
					</div>
					<div class="form-group">
						<label>New email</label>
						<input class="form-control" name="new_email" id="new_email" type="email">
					</div>
					<div class="form-group">
						<label>Confirm new email</label>
						<input class="form-control" name="confirm_new_email" id="confirm_new_email" type="email">
					</div>
				</div>
			</div>
		</div> -->
        <!-- /row-->

        <div class="btnbox">
            <button type="button" class="btn successModify btn-success">수정 완료 </button>
            <button type="button" class="btn return btn-primary">되돌아 가기</button>
            <!-- <button id="changePassword">비밀번호 바꾸기</button> -->
        </div>
    </div>
    <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->


    <%@ include file="/WEB-INF/views/myPage/include/mypage-footer.jsp" %>


    <!-- 게시글 상세보기 관련 script -->
    <!-- <script>
        const $successModiBtn = document.querySelector('.successModify');
        const $returnBtn = document.querySelector('.return');
        const $modiForm = document.querySelector('.modiForm');

        if ($successModiBtn !== null) {
            //수정버튼
            $successModiBtn.onclick = e => {
                e.preventDefault();
                console.log("수정완료버튼 눌렀다 ! / 수정되서 다시 내 프로필로 돌아가는거임 ");
                // 클릭까지는 됨 서브밋이 안됨

                // 주소 검증
                const $addrApiInputList = $('.addr-api');
                const $addressDiv = $('.addressDiv');


                for (let addrInput of $addrApiInputList) {
                    // 인풋창이 비어있는지 확인
                    if (addrInput.value.trim() === '') {
                        addrInput.style.borderColor = 'red';
                        $addressDiv.text('필수 입력사항입니다. 원활한 서비스 이용을 위해 정확한 주소를 입력하세요.');
                        $addressDiv.css('color', 'red');
                        return;
                    } else {
                        addrInput.style.borderColor = 'yellowgreen';
                    }

                }
                // 위에 과정을 거친거면
                $addressDiv.text('');
                checkArr[2] = true;
                for (let i of checkArr) {
                    if (i === false) {
                        return;
                    }
                }
                console.log(checkArr[0], checkArr[1].checkArr[2]);

                $modiForm.submit();


            };
        }

        if ($returnBtn !== null) {
            // 되돌아가기!!

            $returnBtn.onclick = e => {
                console.log("되돌이가기 , 수정안하고 그냥 뒤로가는기능 ");

                location.href = '/myPage-profile';
            };
        }
    </script> -->

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

                    // var guideTextBox = document.getElementById("guide");
                    // // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    // if (data.autoRoadAddress) {
                    //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr +
                    //         ')';
                    //     guideTextBox.style.display = 'block';

                    // } else if (data.autoJibunAddress) {
                    //     var expJibunAddr = data.autoJibunAddress;
                    //     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr +
                    //         ')';
                    //     guideTextBox.style.display = 'block';
                    // } else {
                    //     // guideTextBox.innerHTML = '';
                    //     // guideTextBox.style.display = 'none';
                    // }
                }
            }).open();
        }
    </script>

    <script>
        $(document).ready(function () {

            const getNickName = RegExp(/^[a-zA-Zㄱ-힣0-9]{2,12}$/);
            const getPhoneNum = RegExp(/^010-([0-9]{3,4})-([0-9]{4})$/);

            // 닉네임 검증 //
            const $nickInput = $('.nickInput');
            const $nickLabel = $('.nickLabel');

            const $nickChk = $('.nickSpan');

            // 핸드폰 번호 검증
            const $phoneNumInput = $('.phoneNumInput');
            const $phonLabel = $('.phonLabel');
            const $phoneChk = $('.phoneSpan');

            // 주소 검증
            const $addrApiInputList = $('.addr-api');
            const $addressDiv = document.querySelector('.addressDiv')


            const checkArr = [false, false, false];


            $nickInput.on('keyup', e => {
                console.log('nick input keyup');


                // 아무 입력도 하지 않은 경우
                if ($nickInput.val().trim() === '') {
                    $nickInput.css('border-color', 'red');
                    $nickChk.text('닉네임은 필수 입력사항입니다.');
                    $nickChk.css('color', 'red');
                    $nickLabel.css('display', 'none');
                    checkArr[0] = false;
                }

                // 닉네임 정규표현식 검증 및 길이 검증
                else if (!getNickName.test($nickInput.val()) || $nickInput.val().length < 2 ||
                    $nickInput.val().length > 12) {
                    $nickInput.css('border-color', 'red');
                    $nickChk.text('닉네임은 최소 2자 이상 12자 이하로 영문, 한글, 숫자만 가능합니다.');
                    $nickChk.css('color', 'red');
                    $nickLabel.css('display', 'none');
                    checkArr[0] = false;
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
                                $nickLabel.css('display', 'none');
                                checkArr[0] = false;

                            } else {
                                // 정상적으로 입력한 경우
                                $nickInput.css('border-color', 'greenyellow');
                                $nickChk.text('사용 가능한 닉네임입니다');
                                $nickChk.css('color', 'green');
                                $nickLabel.css('display', 'block');
                                checkArr[0] = true;
                            }
                        });
                }

            }); // end 닉네임 검증 로직


            $phoneNumInput.on('keyup', e => {

                // 아무 입력도 하지 않은 경우
                if ($phoneNumInput.val().trim() === '') {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('핸드폰 번호는 필수 입력사항입니다.');
                    $phoneChk.css('color', 'red');
                    $phonLabel.css('display', 'none');
                    checkArr[1] = false;
                }

                // 입력값이 전화번호 정규표현식에 위배될 경우
                else if (!getPhoneNum.test($phoneNumInput.val())) {
                    $phoneNumInput.css('border-color', 'red');
                    $phoneChk.text('올바른 전화번호 양식이 아닙니다. 입력을 확인해주세요. 예시: 010-1234-5678');
                    $phoneChk.css('color', 'red');
                    $phonLabel.css('display', 'none');
                    checkArr[1] = false;
                }

                // 정상 입력인 경우
                else {
                    $phonLabel.css('display', 'block');
                    $phoneNumInput.css('border-color', 'greenyellow');
                    $phoneChk.text('');
                    checkArr[1] = true;
                }

            }); // end 전화번호 검증 로직


            const $successModiBtn = document.querySelector('.successModify');
            const $returnBtn = document.querySelector('.return'); // 되돌아가기 버튼
            const $modiForm = document.querySelector('.modiForm');

            if ($successModiBtn !== null) {
                //수정버튼
                $successModiBtn.onclick = e => {
                    e.preventDefault();
                    console.log("수정완료버튼 눌렀다 ! / 수정되서 다시 내 프로필로 돌아가는거임 ");
                    // 클릭까지는 됨 서브밋이 안됨

                    // 주소 검증
                    const $addrApiInputList = $('.addr-api');
                    const $addressDiv = $('.addressDiv');

                    for (let addrInput of $addrApiInputList) {
                        // 인풋창이 비어있는지 확인
                        if (addrInput.value.trim() === '') {
                            addrInput.style.borderColor = 'red';
                            $addressDiv.text('필수 입력사항입니다. 원활한 서비스 이용을 위해 정확한 주소를 입력하세요.');
                            $addressDiv.css('color', 'red');
                            return;
                        } else {
                            addrInput.style.borderColor = 'yellowgreen';
                        }

                    }
                    // 위에 과정을 거친거면
                    $addressDiv.text('');
                    checkArr[2] = true;
                    for (let i of checkArr) {
                        if (i === false) {
                            return;
                        }
                    }
                    console.log(checkArr[0], checkArr[1], checkArr[2]);

                    $modiForm.submit();


                };
            }

            if ($returnBtn !== null) {
                // 되돌아가기!!

                $returnBtn.onclick = e => {
                    console.log("되돌이가기 , 수정안하고 그냥 뒤로가는기능 ");

                    location.href = '/myPage/profile';
                };
            }


        });
    </script>

</body>

</html>
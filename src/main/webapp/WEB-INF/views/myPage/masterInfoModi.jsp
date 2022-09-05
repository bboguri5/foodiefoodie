<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Ansonika">
    <title>FOOGRA - Admin dashboard</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/mypage/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
        href="/mypage/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="/mypage/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="/mypage/img/apple-touch-icon-144x144-precomposed.png">

    <!-- Bootstrap core CSS-->
    <link href="/mypage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Main styles -->
    <link href="/mypage/css/admin.css" rel="stylesheet">
    <!-- Icon fonts-->
    <link href="/mypage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Plugin styles -->
    <link href="/mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/mypage/vendor/dropzone.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link href="/mypage/css/custom.css" rel="stylesheet">

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

        
    </style>

</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>

    <!-- <form action="" method="post"><button type="submit"></button></form> -->
    <!-- /Navigation-->
    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">여긴 마스터 정보~ </a>
                </li>
                <li class="breadcrumb-item active">${loginUser.nickName}님의 프로필 </li>
            </ol>
            <form action="/masterModiPost/${masterNum}" method="post" class="modiForm">
                <div class="box_general padding_bottom">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-user"></i>마스터 정보 ~~ </h2>
                    </div>
                    <div class="row">
                        <!-- 프로필 쓰는 공간 !!  -->
                        
                        <div class="col-md-8 add_top_30">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>사업자 번호 </label>
                                        <input type="text" class="form-control" name="businessNo"
                                            value="${master.businessNo}" placeholder="${master.businessNo}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>email</label>
                                        <input type="text" class="form-control" placeholder="${master.email}" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>master_name 사업자 이름 </label>
                                        <input type="text" class="form-control" placeholder="${master.masterName}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>store_name 가게이름  
                                        <input type="text" class="form-control master" name="storeName"
                                            value="${master.storeName}" placeholder="${master.storeName}" required
                                            maxlength="25">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>hot_deal 사용 여부</label>
                                        <input type="text" class="form-control" placeholder="${master.hotDeal}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <label>STORE_REG_DATE 가게 시작날짜 </label>
                                        <input type="email" class="form-control" placeholder="${master.storeRegDate}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group"> 
                                        <label>store_call_number 가게 전화번호</label> 
                                        <input type="text" class="form-control master" id="store-call-num"
                                            name="storeCallNumber" value="${master.storeCallNumber}"
                                            placeholder="${master.storeCallNumber}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="addressSum">
                                    <input class="form-group" type="text" id="sample4_postcode" placeholder="우편번호">
                                    <input class="form-group" type="button" onclick="sample4_execDaumPostcode()"
                                        value="우편번호 찾기"><br>

                                    <!-- storeAddress -->
                                    <input class="form-group addr-api master" type="text" id="sample4_roadAddress"
                                        placeholder="도로명주소" name="storeAddress" value="${master.storeAddress}" required>

                                    <input class="form-group " type="text" id="sample4_jibunAddress" placeholder="지번주소">
                                    <!-- <span id="guide" style="color:#999;display:none"></span> -->

                                    <!-- storeDetailAddress -->
                                    <input class="form-group addr-api master" type="text" id="sample4_detailAddress"
                                        placeholder="상세주소" name="storeDetailAddress" value="${master.storeDetailAddress}" required>

                                    <!-- storeExtraAddress -->
                                    <input class="form-group" type="text" id="sample4_extraAddress" placeholder="참고항목" 
                                        value="${master.storeExtraAddress}" name="storeExtraAddress">
                                </div>
                            </div>
                            <!-- /row-->
                            <!-- <div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Personal info</label>
								<textarea style="height:100px;" class="form-control" placeholder="Personal info"></textarea>
							</div>
						</div>
					</div> -->
                            <!-- /row-->
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
        <!-- <p><a href="#0" class="btn_1 medium">수정하기</a></p>
        <p><a href="#0" class="btn_1 medium">탈퇴하기</a></p>
        <p><a href="#0" class="btn_1 medium">사장으로 등록하기</a></p> -->
        <div class="btnbox">
            <button type="button" class="btn successModify btn-success">수정 완료 </button>
            <button type="button" class="btn return btn-primary">되돌아 가기</button>
            <!-- <button id="changePassword">비밀번호 바꾸기</button> -->
        </div>
    </div>
    <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Copyright © FOOGRA 2021</small>
            </div>
        </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="#0">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="/mypage/vendor/jquery/jquery.min.js"></script>
    <script src="/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/mypage/vendor/chart.js/Chart.min.js"></script>
    <script src="/mypage/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/mypage/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="/mypage/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/mypage/js/admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="/mypage/vendor/dropzone.min.js"></script>


    <!-- 게시글 상세보기 관련 script -->
    <script>
        const $returnBtn = document.querySelector('.return');

        if ($returnBtn !== null) {
            // 되돌아가기!! 

            $returnBtn.onclick = e => {
                console.log("되돌이가기 , 수정안하고 그냥 뒤로가는기능 ");

                location.href = '/masterInfo/${masterNum}';
            };
        }
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
                    //     guideTextBox.innerHTML = '';
                    //     guideTextBox.style.display = 'none';
                    // }
                }
            }).open();
        }
    </script>

    <script>
        $(document).ready(function () {


            const getStoreCallNum = RegExp(/^(0[2-8][0-5]?|01[01346-9])-([1-9]{1}[0-9]{2,3})-([0-9]{4})$/);
            // 전화번호는 2,3글자의 지역번호 또는 01?로 시작하며 하이픈이 들어간 이후 3 또는 4자리, 그리고 다시 하이픈 후 4자리의 숫자가 들어가야 한다.

            const $reqMasterInputList = document.querySelectorAll('.master');

            const $successModiBtn = document.querySelector('.successModify'); // 수정 완료 버튼 
            const $modiForm = document.querySelector('.modiForm'); // 넘기는 것 
            console.log($modiForm);
            if ($successModiBtn !== null) {
                //수정버튼
                $successModiBtn.onclick = e => {

                    e.preventDefault();

                    console.log("수정완료버튼 눌렀다 ! / 수정되서 다시 내 프로필로 돌아가는거임 ");

                    for (let input of $reqMasterInputList) {

                        if (input.value.trim() === '') {

                            input.style.borderColor = 'red';

                            alert('수정 요청에 실패하였습니다. 모든 항목을 빠짐없이 입력했는지 확인하세요.');

                            return;
                        }



                    }
                    // 전화번호 정규표현식 검증
                    if (!getStoreCallNum.test($('#store-call-num').val())) {

                        $('#store-call-num').css('border-color', 'red');

                        alert('형식에 맞지 않는 가게 전화번호입니다. 입력을 확인해주세요. ');
                        return;
                    }


                    $modiForm.submit();
                }



            }

        });
    </script>


</body>

</html>
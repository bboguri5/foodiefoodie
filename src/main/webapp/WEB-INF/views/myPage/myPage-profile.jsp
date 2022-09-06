<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/myPage/include/mypage-static-head.jsp" %>

    <style>
        .btnbox .btn {
            float: left;
            margin-left: 20px;
        }

        .modalBox1 {
            position: absolute;
            display: none;
            width: 25%;
            height: 20%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: white;
            border-radius: 5%;
            border: 2px solid green;
        }

        .modalBox1 .passwordModal {
            width: 80%;
            height: 60%;
            position: absolute;
            margin: 0 auto;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* background: blue; */
        }

        .modalBox1 .passwordModal .passwordModal-title {
            text-align: center;
            margin-bottom: 15px;
        }

        .modalBox1 .passwordModal .falseh5 {
            display: none;
            /* 이건 먹는데  */
            color: red;
            /* 왜 색깔은 안변하냐 ;; */
            text-align: center;
        }

        .modalBox1 .passwordModal .passwordform {
            text-align: center;
        }

        .modalBox1 .passwordModal .passwordBtn {
            margin-left: 20px;
        }

        .modalBox1 .returnBtn {
            /* 종료버튼  */
            position: absolute;
            width: 20px;
            height: 20px;
            left: 85%;
            top: 10%;
            border-radius: 50%;
            background: green;
            text-align: center;
            color: #000;
        }

        /* ====================================================== */

        .modalBox2 {
            position: absolute;
            display: none;
            width: 25%;
            height: 20%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: white;
            border-radius: 5%;
            border: 2px solid green;
        }

        .modalBox2 .passwordModal {
            width: 80%;
            height: 60%;
            position: absolute;
            margin: 0 auto;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* background: blue; */
        }

        .modalBox2 .passwordModal .passwordModal-title {
            text-align: center;
            margin-bottom: 15px;
        }

        .modalBox2 .passwordModal .falseh5 {
            display: none;
            /* 이건 먹는데  */
            color: red;
            /* 왜 색깔은 안변하냐 ;; */
            text-align: center;
        }

        .modalBox2 .passwordModal .passwordform {
            text-align: center;
        }

        .modalBox2 .passwordModal .passwordBtn2 {
            margin-left: 20px;
        }

        .modalBox2 .returnBtn {
            /* 종료버튼  */
            position: absolute;
            width: 20px;
            height: 20px;
            left: 85%;
            top: 10%;
            border-radius: 50%;
            background: green;
            text-align: center;
            color: #000;
        }
    </style>


</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>

    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <!-- <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">여기에 뭘 적을까 </a>
                </li>
                <li class="breadcrumb-item active">${loginUser.nickName}님의 프로필 </li>
            </ol> -->
            <div class="box_general padding_bottom">
                <div class="header_box version_2">
                    <h2><i class="fa fa-user"></i>${loginUser.nickName}님의 프로필 상세정보</h2>
                </div>
                <div class="row">
                    <!-- <div class="col-md-4">
					<div class="form-group">
					<label>Your photo</label>
						<form action="/file-upload" class="dropzone"></form>
				    </div>
				</div> -->
                    <!-- 프로필 쓰는 공간 !!  -->
                    <div class="col-md-8 add_top_30">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>email 아이디 </label>
                                    <input type="text" class="form-control" placeholder="${member.email}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>nickName 닉네임</label>
                                    <input type="text" class="form-control" placeholder="${member.nickName}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>phoneNumber 핸드폰번호 </label>
                                    <input type="text" class="form-control" placeholder="${member.phoneNumber}"
                                        readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>birth 생년월일 8자 </label>
                                    <input type="email" class="form-control" placeholder="${member.birth}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>address 주소</label>
                                    <input type="text" class="form-control"
                                        placeholder="${member.address} ${member.extraAddress} ${member.detailAddress} "
                                        readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>realName 진짜 이름 </label>
                                    <input type="email" class="form-control" placeholder="${member.name}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Gender /성별/(M/F)</label>
                                    <input type="text" class="form-control" placeholder="${member.gender}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>your Auth</label>
                                    <input type="email" class="form-control" placeholder="${member.auth}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>가입일자</label>
                                    <input type="text" class="form-control" placeholder="${member.regDate}" readonly>
                                </div>
                            </div>
                            <!-- <div class="col-md-6">
							<div class="form-group">
								<label>최근 로그인 한 시간 (있어도 되고 없어도되고 )</label>
								<input type="email" class="form-control" placeholder="Your last time " readonly>
							</div>
						</div> -->
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

            <!-- ----------------------------------------------------------------------------------------------------------------- -->

            <div class="modalBox1">
                <div class="passwordModal">

                    <h6 class="passwordModal-title">수정하기 위한 비밀번호를 입력하세요</h6>
                    <h5 class="falseh5">[비밀번호가 틀렸습니다.]</h5>

                    <input type="password" name="password" class="passwordInput"> <button type="button"
                        class="passwordBtn">누르세요</button>
                </div>
                <div class="returnBtn">X</div>

            </div>

            <div class="modalBox2">
                <div class="passwordModal">
                    <h5></h5>
                    <h5 class="passwordModal-title">탈퇴하기 위한 비밀번호를 입력하세요</h5>
                    <h5 class="falseh5">[비밀번호가 틀렸습니다.]</h5>

                    <input type="password" name="password" class="passwordInput2"> <button type="button"
                        class="passwordBtn2">누르세요</button>
                </div>
                <div class="returnBtn">X</div>

            </div>

            <!-- ----------------------------------------------------------------------------------------------------------------- -->
            <div class="btnbox">
                <button type="button" class="btn modiBtn btn-success">수정하기</button>
                <button type="button" class="btn masterRegistBtn btn-primary">사업자 권한 요청</button>
                <button type="button" class="btn btn-info changePW">비밀번호 바꾸기</button>
                <button type="button" class="btn deleteBtn btn-danger">탈퇴하기</button>
            </div>
        </div>
        <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->

    <%@ include file="/WEB-INF/views/myPage/include/mypage-footer.jsp" %>

    <!-- 가게 등록 버튼 클릭 이벤트 -->
    <script>
        const $masterRegistBtn = $('.masterRegistBtn');

        $masterRegistBtn.on('click', e => {
            location.href = '/master/register';
        });
    </script>



    <!-- 게시글 상세보기 관련 script -->
    <script>
        const $modBtn = document.querySelector('.modiBtn');
        // const $delBtn = document.querySelector('.del-btn');
        const $masterBtn = document.querySelector('.masterRegistBtn');
        const $modalBox1 = document.querySelector('.modalBox1'); // 수정하는 모달 창 

        const $modalBox2 = document.querySelector('.modalBox2'); // 탈퇴하는 모달 창  
        const $returnBtn = document.querySelector('.returnBtn');
        const $passwordModal = document.querySelector('.passwordModal');
        const $passwordInput = document.querySelector('.passwordInput');

        const $passwordInput2 = document.querySelector('.passwordInput2'); // 탈퇴 인풋 

        const $body = document.body;

        const $changePW = document.querySelector('.changePW');


        // 회원탈퇴 
        const $deleteBtn = document.querySelector('.deleteBtn');




        // 비동기
        const $falseh5 = document.querySelector('.falseh5');
        const $brLabel = document.querySelector('.brLabel');
        const $passwordBtn = document.querySelector('.passwordBtn');

        const $passwordBtn2 = document.querySelector('.passwordBtn2');



        // $body.onclick = e => {

        //     if (e.target.matches('.modiBtn')) return;
        //     // if (e.target.matches('.modalBox')) return;
        //     // if (e.target.matches('.passwordModal')) return;

        //     if ($modalBox.style.display === 'block') {
        //         console.log('바디 :', $modalBox.style.display);
        //         console.log("아아아아ㅏ");
        //         console.log("클릭----");
        //         console.log(e.target);
        //         $body.style.opacity = 1;
        //         $modalBox.style.display = "none";
        //     }

        // }



        if ($modBtn !== null) {
            //수정버튼
            $modBtn.addEventListener('click', e => {
                // console.log("수정버튼 눌렀다");

                // $body.style.opacity = 0.5;

                $modalBox1.style.display = "block";
                // location.href = '/myPage-modify';
            });

        }



        if ($deleteBtn !== null) {

            // 회원탈퇴 
            $deleteBtn.addEventListener('click', e => {
                console.log("회원탈퇴 눌러버려따 ! ");

                $modalBox2.style.display = "block";
                // location.href = '/myPage-modify';
            });

        }



        if ($returnBtn !== null) {
            // 모달창 빨간색 x 버튼 
            const $passwordInput = document.querySelector('.passwordInput')
            $returnBtn.onclick = e => {
                console.log("빨간색 x 버튼 눌렀다");
                $falseh5.style.display = "none";

                $modalBox1.style.display = "none";
                // location.href = '/myPage/modify';
            };
        }


        // if ($delBtn !== null) {

        //     //삭제버튼
        //     $delBtn.onclick = e => {
        //         if (!confirm('정말 삭제하시겠습니까?')) {
        //             return;
        //         }
        //         location.href = '/board/delete?boardNo=${b.boardNo}';
        //     };
        // }



        if ($changePW !== null) {

            // 비밀번호 바꾸는 경로
            $changePW.onclick = e => {
                if (!confirm('비밀번호 바꾸러 갑니다')) {
                    return;
                }
                location.href = '/change/pw';
            };
        }

        if ($masterBtn !== null) {

            // 사업자 권한 등록 요청
            $masterBtn.onclick = e => {
                if (!confirm('사업자 권한 등록 요청')) {
                    return;
                }
                location.href = '/master/register';
            };
        }





        // if ($deleteBtn !== null) {
        //     // 회원탈퇴!! 
        //     $deleteBtn.onclick = e => {

        //         location.href = '/';
        //     };
        // }


        if ($passwordBtn !== null) {
            // 수정하기 누르고 나서 발동하는 메서드 
            $passwordBtn.onclick = e => {
                console.log('click password');
                trueAndFalsePassword();
            }
        }

        if ($passwordBtn2 !== null) {
            // 탈퇴하기 누르고 나서 발동하는 메서드 
            $passwordBtn2.onclick = e => {
                console.log('click seccion');
                trueAndFalsePassword2();
            }
        }



        // 비밀번호 맞는지 아닌지 확인하고 넘기는 메서드 
        function trueAndFalsePassword(e) {

            const $passwordInput = document.querySelector('.passwordInput')

            // 서버로 전송할 데이터들
            const password = {
                password: $passwordInput.value
            };

            // POST요청을 위한 요청 정보 객체
            const reqInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(password)
            };

            fetch('/trueAndFalsePassword', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    console.log('aanjseqpw oqwf[ojqwo[fn [qownf'); // 여기까지온다 
                    if (msg === 'password-success') {
                        alert("비밀번호 인증에 성공했습니다. 수정화면으로 이동합니다.");
                        location.href = '/myPage/modify';
                    } else if (msg === 'password-false') {
                        console.log(123123123123123123);
                        $falseh5.style.display = "block";
                        $falseh5.style.color = 'red';
                        $brLabel.style.display = "none";
                    }
                });
        }

        function trueAndFalsePassword2(e) {

            console.log('탈퇴하려고 비밀번호 검증 '); // 나옴 

            const $passwordInput2 = document.querySelector('.passwordInput2')

            console.log($passwordInput2.value);
            
            // 서버로 전송할 데이터들
            const password = {
                password: $passwordInput2.value
            };

            // POST요청을 위한 요청 정보 객체
            const reqInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(password)
            };

            fetch('/trueAndFalsePassword', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    console.log('aanjseqpw oqwf[ojqwo[fn [qownf'); // 여기까지온다 
                    if (msg === 'password-success') {
                        alert("비밀번호 인증에 성공했습니다. 탈퇴하셨으므로 메인화면으로 이동합니다.");
                        location.href = '/secession';
                    } else if (msg === 'password-false') {
                        console.log(123123123123123123);
                        $falseh5.style.display = "block";
                        $falseh5.style.color = 'red';
                        $brLabel.style.display = "none";
                    }
                });
        }

        // 메인 실행부
        (function () {

            // // 비밀번호 맞는지 아닌지 확인하고 넘기는 메서드 
            // trueAndFalsePassword();



        })();
    </script>

</body>

</html>
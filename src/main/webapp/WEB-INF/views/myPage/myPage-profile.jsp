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
    <link rel="shortcut icon" href="/mypage/img/favicon.ico" type="image/x-icon">
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

        .modalBox {
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

        .modalBox .passwordModal {
            width: 80%;
            height: 60%;
            position: absolute;
            margin: 0 auto;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* background: blue; */
        }

        .modalBox .passwordModal .passwordModal-title {
            text-align: center;
            margin-bottom: 15px;
        }

        .modalBox .passwordModal .falseh5 {
            display: none;
            /* 이건 먹는데  */
            color: red;
            /* 왜 색깔은 안변하냐 ;; */
            text-align: center;
        }

        .modalBox .passwordModal .passwordform {
            text-align: center;
        }

        .modalBox .passwordModal .passwordBtn {
            margin-left: 20px;
        }

        .modalBox .returnBtn {
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
        <a class="navbar-brand" href="/"><img src="/mypage/img/logo.svg" alt="" width="142" height="36"></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">

            <!-- 옆라인 시작 ================================================================== -->

            <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="My profile">
                    <a class="nav-link" href="/myPage-profile">
                        <i class="fa fa-fw fa-user"></i>
                        <span class="nav-link-text">내 정보 / 수정/ 탈퇴</span>
                    </a>
                </li>

                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Reviews">
                    <a class="nav-link" href="/myReview">
                        <i class="fa fa-fw fa-star"></i>
                        <span class="nav-link-text">Reviews 내가쓴 리뷰 </span>
                    </a>
                </li>

                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Bookmarks">
                    <a class="nav-link" href="/favoriteList">
                        <i class="fa fa-fw fa-heart"></i>
                        <span class="nav-link-text">Bookmarks 즐겨찾기 리스트 </span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Messages">
                    <a class="nav-link" href="messages.html">
                        <i class="fa fa-fw fa-envelope-open"></i>
                        <span class="nav-link-text"> 결제 내역 </span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Messages">
                    <a class="nav-link" href="/reviewReport">
                        <i class="fa fa-fw fa-envelope-open"></i>
                        <span class="nav-link-text"> 게시글 신고 내역 </span>
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Messages">
                    <a class="nav-link" href="/replyReport">
                        <i class="fa fa-fw fa-envelope-open"></i>
                        <span class="nav-link-text">댓글 신고 내역 </span>
                    </a>
                </li>
            </ul>

            <!-- 옆라인 끝 ================================================================== -->

            <!--  옆에 메뉴 끝 라인   -->
            <ul class="navbar-nav sidenav-toggler">
                <li class="nav-item">
                    <a class="nav-link text-center" id="sidenavToggler">
                        <i class="fa fa-fw fa-angle-left"></i>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-fw fa-envelope"></i>
                        <span class="d-lg-none">Messages
                            <span class="badge badge-pill badge-primary">12 New</span>
                        </span>
                        <span class="indicator text-primary d-none d-lg-block">
                            <i class="fa fa-fw fa-circle"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="messagesDropdown">
                        <h6 class="dropdown-header">New Messages:</h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <strong>David Miller</strong>
                            <span class="small float-right text-muted">11:21 AM</span>
                            <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty
                                awesome! These messages clip off when they reach the end of the box so they don't
                                overflow over to the sides!</div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <strong>Jane Smith</strong>
                            <span class="small float-right text-muted">11:21 AM</span>
                            <div class="dropdown-message small">I was wondering if you could meet for an appointment at
                                3:00 instead of 4:00. Thanks!</div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <strong>John Doe</strong>
                            <span class="small float-right text-muted">11:21 AM</span>
                            <div class="dropdown-message small">I've sent the final files over to you for review. When
                                you're able to sign off of them let me know and we can discuss distribution.</div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item small" href="#">View all messages</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-fw fa-bell"></i>
                        <span class="d-lg-none">Alerts
                            <span class="badge badge-pill badge-warning">6 New</span>
                        </span>
                        <span class="indicator text-warning d-none d-lg-block">
                            <i class="fa fa-fw fa-circle"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="alertsDropdown">
                        <h6 class="dropdown-header">New Alerts:</h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <span class="text-success">
                                <strong>
                                    <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
                            </span>
                            <span class="small float-right text-muted">11:21 AM</span>
                            <div class="dropdown-message small">This is an automated server response message. All
                                systems are online.</div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <span class="text-danger">
                                <strong>
                                    <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
                            </span>
                            <span class="small float-right text-muted">11:21 AM</span>
                            <div class="dropdown-message small">This is an automated server response message. All
                                systems are online.</div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <span class="text-success">
                                <strong>
                                    <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
                            </span>
                            <span class="small float-right text-muted">11:21 AM</span>
                            <div class="dropdown-message small">This is an automated server response message. All
                                systems are online.</div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item small" href="#">View all alerts</a>
                    </div>
                </li>
                <li class="nav-item">
                    <form class="form-inline my-2 my-lg-0 mr-lg-2">
                        <div class="input-group">
                            <input class="form-control search-top" type="text" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal"><i
                            class="fa fa-fw fa-sign-out"></i>Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /Navigation-->
    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">여기에 뭘 적을까 </a>
                </li>
                <li class="breadcrumb-item active">${loginUser.nickName}님의 프로필 </li>
            </ol>
            <div class="box_general padding_bottom">
                <div class="header_box version_2">
                    <h2><i class="fa fa-user"></i>프로필 상세정보</h2>
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
                                    <label>nick Name 닉네임</label>
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
                                    <input type="text" class="form-control" placeholder="${member.address} ${member.extraAddress} ${member.detailAddress} " readonly>
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

            <div class="modalBox">
                <div class="passwordModal">
                    <h5 class="passwordModal-title">비밀번호를 입력하세요</h5>
                    <h5 class="falseh5">[비밀번호가 틀렸습니다.]</h5>
            
                    <input type="password" name="password" class="passwordInput"> <button type="button" class="passwordBtn">누르세요</button>
                </div>
                <div class="returnBtn">X</div>

            </div>

            <!-- ----------------------------------------------------------------------------------------------------------------- -->
            <div class="btnbox">
                <button type="button" class="btn modiBtn btn-success">수정하기</button>
                <button type="button" class="btn masterRegistBtn btn-primary">가게 등록 하기</button>
                <button type="button" class="btn deleteBtn btn-danger">탈퇴하기</button>
            </div>
        </div>
        <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Copyright © FoodieFoodie 2022</small>
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
        const $modBtn = document.querySelector('.modiBtn');
        const $delBtn = document.querySelector('.del-btn');
        const $masterBtn = document.querySelector('.masterRegistBtn');
        const $modalBox = document.querySelector('.modalBox');
        const $returnBtn = document.querySelector('.returnBtn');
        const $passwordModal = document.querySelector('.passwordModal');
        const $passwordInput = document.querySelector('.passwordInput');

        const $body = document.body;

        // 비동기 
        const $falseh5 = document.querySelector('.falseh5');
        const $brLabel = document.querySelector('.brLabel');
        const $passwordBtn = document.querySelector('.passwordBtn');
    


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
                console.log("수정버튼 눌렀다");

                // $body.style.opacity = 0.5;

                $modalBox.style.display = "block";
                // location.href = '/myPage-modify';
            });

        }



        if ($returnBtn !== null) {
            // 모달창 빨간색 x 버튼 
            const $passwordInput = document.querySelector('.passwordInput')
            $returnBtn.onclick = e => {
                console.log("빨간색 x 버튼 눌렀다");
                $falseh5.style.display = "none";   
               
                $modalBox.style.display = "none";
                // location.href = '/myPage-modify';
            };
        }

        if ($delBtn !== null) {

            //삭제버튼
            $delBtn.onclick = e => {
                if (!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }
                location.href = '/board/delete?boardNo=${b.boardNo}';
            };
        }

        if($passwordBtn !== null){
            $passwordBtn.onclick = e =>{
                console.log('click password');
                trueAndFalsePassword();
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
                        alert("비밀번호가 맞았습니다. 수정화면으로 이동합니다.");
                        location.href = '/myPage-modify';
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
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="/WEB-INF/views/myPage/include/mypage-static-head.jsp" %>

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
    </style>

</head>

<body class="fixed-nav sticky-footer" id="page-top">
    
    <%@ include file="/WEB-INF/views/myPage/include/mypage-nav.jsp" %>

    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">여기에 뭘 적을까 </a>
                </li>
                <li class="breadcrumb-item active">너의 프로필 </li>
            </ol>
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
                                        <input type="text" class="form-control" name="email"  value="${loginUser.email}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>nick Name 닉네임</label>
                                        <input type="text" class="form-control" name="nickName" value="${loginUser.nickName}">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>phoneNumber 핸드폰번호 </label>
                                        <input type="text" class="form-control" name="phoneNumber" value="${loginUser.phoneNumber}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>birth 생년월일 8자 </label>
                                        <input type="email" class="form-control" name= "birth" value="${loginUser.birth}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>address 주소</label>
                                        <input type="text" class="form-control" name="address" value="${loginUser.address}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>realName 진짜 이름 </label>
                                        <input type="email" class="form-control" name="name" value="${loginUser.name}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Gender /성별/(M/F)</label>
                                        <input type="text" class="form-control" name="gender" value="${loginUser.gender}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>your Auth 권한</label>
                                        <input type="email" class="form-control" name="auth"  value="${loginUser.auth}"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>가입일자</label>
                                        <input type="text" class="form-control" name="regDate" value="${loginUser.regDate}"
                                            readonly>
                                    </div>
                                </div>
                                <button id="changePassword">비밀번호 바꾸기</button>
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
        <!-- <p><a href="#0" class="btn_1 medium">수정하기</a></p>
        <p><a href="#0" class="btn_1 medium">탈퇴하기</a></p>
        <p><a href="#0" class="btn_1 medium">사장으로 등록하기</a></p> -->
        <div class="btnbox">
            <button type="button" class="btn successModify btn-success">수정 완료 </button>
            <button type="button" class="btn return btn-primary">되돌아 가기</button>
        </div>
    </div>
    <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->


    <%@ include file="/WEB-INF/views/myPage/include/mypage-footer.jsp" %>


    <!-- 게시글 상세보기 관련 script -->
    <script>
        // <div class="btnbox">
        //     <button type="button" class="btn successModify btn-success">수정 완료 </button>
        //     <button type="button" class="btn return btn-primary">되돌아 가기</button>
        // </div>

        const $successModiBtn = document.querySelector('.successModify');
        const $returnBtn = document.querySelector('.return');
        const $modiForm = document.querySelector('.modiForm');

        if ($successModiBtn !== null) {
            //수정버튼
            $successModiBtn.onclick = e => {
                console.log("수정완료버튼 눌렀다 ! / 수정되서 다시 내 프로필로 돌아가는거임 ");
                // 클릭까지는 됨 서브밋이 안됨 
                $modiForm.submit();

                // location.href = '/modifyMember';
            };
        }

        if ($returnBtn !== null) {
            // 되돌아가기!! 

            $returnBtn.onclick = e => {
                console.log("되돌이가기 , 수정안하고 그냥 뒤로가는기능 ");

                location.href = '/myPage-profile';
            };
        }
    </script>
</body>

</html>
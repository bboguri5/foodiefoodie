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


        .instaHeader {
            display: flex;
            background: skyblue;
            width: 100%;
            height: 200px;
        }

        .instaHeader .picture {
            flex: 2;
            background: blue;
            position: relative;

        }

        .instaHeader .picture .profilePicture {
            border-radius: 50%;
            height: 50%;
            width: 50%;
            background: pink;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        .instaHeader .profileContent {
            flex: 5;
            background: green;

        }

        .instaHeader .profileContent .userId {
            text-align: center;
        }

        .instaHeader .profileContent .myInfo {
            margin-top: 50px;
            height: 30px;
            display: flex;
        }

        .instaHeader .profileContent .myInfo .boardCnt {
            color: black;
            margin-left: 50px;
            flex: 1;
        }

        .instaHeader .profileContent .myInfo .followYou {
            color: black;
            flex: 1;
        }

        .instaHeader .profileContent .myInfo .followMe {
            color: black;
            flex: 1;
        }

        .myReview-allWrap #hoverWrapper {
            width: 100%;
            height: 100px;
            background: yellow;
            position: relative;
        }

        .myReview-allWrap .hoverMenu {
            position: absolute;
            display: flex;
            height: 100%;
            width: 50%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: yellowgreen;
        }

        .myReview-allWrap .hoverMenu .myReview {
            text-align: center;
            line-height: 100px;
            flex: 1;
            border: 1px solid #000;
        }

        .myReview-allWrap .hoverMenu .favoriteList {
            text-align: center;
            line-height: 100px;
            flex: 1;
            border: 1px solid #000;
        }

        .myReview-allWrap .reviewPictureWrapper {
            width: 100%;
            /* background: purple; */
            height: 100vh;
            position: relative;
            
        }

        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox {
            /* background: gray; */
            width: 95%;
            height: 100%;
            margin-top: 30px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            align-content: flex-start;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox{
            width: 33%;
            height: 200px;
            background: pink;
            
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
            margin-left: 3px;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .reviewPicture{
            flex: 7;
            border: 1px solid #000;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .title{
            flex: 1;
            border: 1px solid #000;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .content{
            flex: 2;
            border: 1px solid #000;
        }

        
    </style>

</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>
    
    <!-- /Navigation-->
    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="myReview-allWrap">
            <div class="instaHeader">
                <div class="picture">
                    <div class="profilePicture">
                        ${profile.filePath} , ${profile.fileName}
                        <img src="" alt="">
                        <form action="" method="post">
                            <!-- 히든으로 감춰서 보낼수있다 -->
                            <input type="hidden" name="qwe" value="123">
                        </form>
                    </div>
                </div>
                <div class="profileContent">
                    <h2 class="userId">${loginUser.email} 계정 이메일</h2>
                    <div class="myInfo">
                        <div class="boardCnt">게시물수 ? </div>
                        <div class="followYou">내가 한거</div>
                        <div class="followMe">나한테 팔로우 건사람 </div>
                    </div>
                </div>
            </div>
            <div id="hoverWrapper">
                <div class="hoverMenu">
                    <div class="myReview">내 리뷰 보기 </div>
                    <div class="favoriteList">즐겨찾기 사진 모음집</div>
                </div>
            </div>

            <div class="reviewPictureWrapper">
                <div class="reviewPictureBox">
                    <c:forEach var="reviewInfo" items="${reviewInfo}">
                        <div class="reviewBox item1">
                            <div class="reviewPicture picBox">
                               파일경로 : ${reviewInfo.filePath}
                                파일이름 : ${reviewInfo.fileName}
                                <img src="" alt="">
                            </div>
                            <div class="title">${reviewInfo.title}</div>
                            <div class="content">${reviewInfo.content}</div>
                        </div>
                    </c:forEach>
                    <!-- <div class="reviewBox item2">
                        <div class="reviewPicture picBox">
                            여기에 사진을 올릴거야
                        </div>
                        <div class="title">+ 타이틀 </div>
                        <div class="content">+콘텐트 </div>
                    </div>
                    <div class="reviewBox item3">
                        <div class="reviewPicture picBox">
                            여기에 사진을 올릴거야
                        </div>
                        <div class="title">+ 타이틀 </div>
                        <div class="content">+콘텐트 </div>
                    </div>
                    <div class="reviewBox item4">
                        <div class="reviewPicture picBox">
                            여기에 사진을 올릴거야
                        </div>
                        <div class="title">+ 타이틀 </div>
                        <div class="content">+콘텐트 </div>
                    </div>
                     -->
                    
                </div>
            </div>


        </div>




    </div>
    <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fa fa-angle-up"></i>
    </a>

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



</body>

</html>
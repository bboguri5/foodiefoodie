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


        .instaHeader {
            display: flex;
            /* background: skyblue; */
            width: 100%;
            /* height: 200px; */
            height: 150px;
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
            /* background: green; */

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
            text-align : center;
            line-height: 30px;
            font-size: x-large;
            flex: 1;
        }

        .instaHeader .profileContent .myInfo .followYou {
            color: black;
            text-align : center;
            line-height: 30px;
            font-size: x-large;
            flex: 1;
        }

        .instaHeader .profileContent .myInfo .followMe {
            color: black;
            text-align : center;
            line-height: 30px;
            font-size: x-large;
            flex: 1;
        }

        .myReview-allWrap #hoverWrapper {
            width: 100%;
            height: 100px;
            /* background: yellow; */
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
            /* background: yellowgreen; */
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
            background: purple;
            height: 100vh;
            position: relative;
            
        }

        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox {
            background: gray;
            width: 97%;
            height: 100%;
            margin-top: 30px;
            position: absolute;
            left: 50%;
            top: 47%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            align-content: flex-start;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox{
            width: 32%;
            height: 270px;
            background: pink;
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
            margin-left: 10px;
            overflow: hidden;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .reviewPicture{
            background: blue;
            border: 1px solid #000;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .likeAndReplyBox{
            background: green;
            width: 100%;
            height: 100%;
        }

        /* .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .title{
            
            border: 1px solid #000;
        }
        .myReview-allWrap .reviewPictureWrapper .reviewPictureBox .reviewBox .content{
           
            border: 1px solid #000;
        } */

        
    </style>

</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>
    
    <!-- /Navigation-->
    <!-- 프로필 쓰는 공간 !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="myReview-allWrap">
            <div class="instaHeader">
                <!-- <div class="picture">
                    <div class="profilePicture">
                        ${profile.filePath} , ${profile.fileName}
                        <img src="" alt="">
                        <form action="" method="post">
                            
                            <input type="hidden" name="qwe" value="123">
                        </form>
                    </div>
                </div> -->
                <div class="profileContent">
                    <h2 class="userId">${loginUser.email} </h2>
                    <div class="myInfo">
                        <div class="boardCnt">게시물수 ${totalMyReviewCount} </div>
                        <div class="followYou">좋아요 갯수 ${totalLikeCount}</div>
                        <div class="followMe">총 댓글 갯수 ${totalReplyCount} </div>
                    </div>
                </div>
            </div>
            <!-- <div id="hoverWrapper">
                <div class="hoverMenu">
                    <div class="myReview">리뷰 쓰기 </div>
                    <div class="favoriteList">즐겨찾기 사진 모음집</div>
                </div>
            </div> -->

            <div class="reviewPictureWrapper">
                <div class="reviewPictureBox">
                    <c:forEach var="review" items="${myReviewList}">
                        <div class="reviewBox item1">
                            <a href="/review/detail?reviewBno=${review.reviewBno}">
                                <div class="reviewPicture picBox">
                                    <!-- <div class="likeAndReplyBox"></div> -->
                                    <img src="${review.fileData}" alt="#">
                                </div> 
                                <!-- <div class="title">${reviewInfo.title}</div>
                                    <div class="content">${reviewInfo.content}</div> -->
                                </div>
                            </a>
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
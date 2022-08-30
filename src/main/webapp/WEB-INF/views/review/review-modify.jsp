<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Ansonika">
    <title>foodie - review write</title>
    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="/image/x-icon" href="/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="/image/x-icon" sizes="72x72" href="/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="/image/x-icon" sizes="114x114"
        href="/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="/image/x-icon" sizes="144x144"
        href="/img/apple-touch-icon-144x144-precomposed.png">
    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Main styles -->
    <link href="/css/admin.css" rel="stylesheet">
    <!-- Icon fonts-->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Plugin styles -->
    <link href="/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/vendor/dropzone.css" rel="stylesheet">
    <link href="/css/date_picker.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link href="/css/custom.css" rel="stylesheet">
    <!-- WYSIWYG Editor -->
    <link rel="stylesheet" href="/js/editor/summernote-bs4.css">

    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="/css/listing.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">


    <!-- YOUR CUSTOM CSS -->
    <link href="/css/custom.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">

    <!-- jquery -->
    <!-- <script src="/js/jquery-3.3.1.min.js"></script> -->
    <link href="/css/home.css" rel="stylesheet">

    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


    <!-- dropzone -->
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />



    <style>
        .content-wrapper {
            margin-left: 0%;
        }

        .content-wrapper label {
            font-weight: 700;
        }

        .mg-wrap {
            margin-left: 2%;
            margin-right: 2%;
        }

        body.fixed-nav {
            padding-top: 0;
        }

        .container-fluid {
            margin-bottom: 100px;
        }

        .save-buttons {
            padding-left: 40%;
        }

        .star {
            position: relative;
            font-size: 2rem;
            color: #ddd;
        }

        .star input {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            opacity: 0;
            cursor: pointer;
        }

        .star span {
            width: 0;
            position: absolute;
            left: 0;
            color: red;
            overflow: hidden;
            pointer-events: none;
        }

        /* dropzone */

        .dropzone {
            border: 2px dotted gray;
            min-height: 190px;
        }

        .add-Img-row .row {
            justify-content: space-between;
        }

        .add-Img-row .form-group:nth-child(1) {
            width: 45%;
            margin-left: 20px;
        }

        .add-Img-row .form-group:nth-child(2) {
            width: 45%;
            margin-right: 20px;
        }

        #title-dropzone.dropzone .dz-preview .dz-image {
            position: relative;
            width: 100%;
        }

        .dropzone .dz-remove {
            position: absolute;
            z-index: 100;
            right: 10px;
            top: 10px;
            color: red;
            font-weight: 700;
        }

        #title-dropzone.dropzone {
            resize: both;
            overflow: auto;
        }

        #detail-dropzone.dropzone {
            display: flex;
            justify-content: space-evenly;
            resize: both;
            overflow: auto;
            position: relative;
        }

        #detail-dropzone .dz-default.dz-message {
            position: absolute;
            top: 50px;
        }

        #detail-dropzone.dropzone .dz-preview .dz-image {
            width: 100px;
            height: 100px;
            position: relative;
        }

        #detail-dropzone.dropzone .dz-remove {
            position: absolute;
            z-index: 100;
            right: 10px;
            top: 10px;
            color: red;
        }

        .dropzone .dz-preview .dz-details .dz-size {
            font-size: 10px;
        }

        .dropzone .dz-preview .dz-details .dz-filename {
            font-size: 10px;
        }

        .dropzone .dz-preview .dz-progress {
            z-index: 0;
        }

        .dropzone .dz-message .dz-button {
            margin-top: 50px;
        }
        .dz-image img {
            width: 150px;
            height: 150px;
        }
    </style>




</head>

<body class="fixed-nav" id="page-top">
    <%@ include file="../include/detail-header.jsp" %>

    <div class="content-wrapper">
        <form id="review-modify-form" action="/review/modify" class="review-form" method="post"
            enctype="multipart/form-data">
            <div class="container-fluid">
                <div class="box_general padding_bottom mg-wrap">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-file"></i>리뷰 수정</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="title-label">리뷰 제목</label>
                                <input type="text" class="form-control title" placeholder="가산 고기 맛집!" maxlength="40"
                                    name="title" value="${review.title}">
                                <input type="hidden" name="reviewBno" value="${review.reviewBno}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>작성자</label>
                                <input type="text" class="form-control" placeholder="abc1234@naver.com"
                                    value="${loginUser.name}" disabled>
                                <input type="hidden" name="email" value="${loginUser.email}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="store-name-label">가게이름</label>
                                <input type="text" class="form-control store-name" placeholder="파리바게뜨"
                                    value="${review.storeName}" name="storeName">
                                <input type="hidden" name="businessNo" value="${review.businessNo}">
                            </div>
                        </div>
                    </div>
                    <!-- /row-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>주소</label>
                                <div>
                                    <span id="addrChk"></span>
                                </div>
                                <input class="form-group" type="text" id="sample4_postcode" placeholder="우편번호">
                                <input class="form-group" type="button" onclick="sample4_execDaumPostcode()"
                                    value="우편번호 찾기"><br>
                                <input class="form-group addr-api store-address" type="text" id="sample4_roadAddress"
                                    placeholder="도로명주소" name="storeAddress" value="${review.storeAddress}">
                                <input class="form-group" type="text" id="sample4_jibunAddress" placeholder="지번주소">
                                <span id=" guide" style="color:#999;display:none"></span>
                                <input class="form-group addr-api store-detail-address" type="text"
                                    id="sample4_detailAddress" placeholder="상세주소" name="storeDetailAddress"
                                    value="${review.storeDetailAddress}">
                                <input class="form-group store-extra-address" type="text" id="sample4_extraAddress"
                                    placeholder="참고항목" name="storeExtraAddress" value="${review.storeExtraAddress}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" style="margin-top: 30px;">
                                <label>평점</label>
                                <div></div>
                                <span class="star">
                                    ★★★★★
                                    <span>★★★★★</span>
                                    <input type="range" oninput="drawStar(this)" value="" step="1" min="0" max="10"
                                        name="starRate">
                                </span>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="form-group" style="margin-top: 30px;">
                                <label style="margin-bottom: 10px;">공개 여부</label>
                                <div>
                                    <input type="radio" id="huey" name="isPrivate" value="F" checked>
                                    <label for="huey">공개</label>
                                </div>
                                <div>
                                    <input type="radio" id="dewey" name="isPrivate" value="T">
                                    <label for="dewey">비공개</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="content-label">내용</label>
                                <textarea name="content" class="form-control content" style="height: 150px;"
                                    placeholder="Message" id="message_contact" name="content"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="box_general padding_bottom add-Img-row">
                        <div class="header_box version_2 add-Img">
                            <h2><i class="fa fa-list"></i>사진 및 영수증 추가</h2>
                        </div>
                        <div class="row">
                            <div class="form-group review-group">
                                <label class="review-img-label">사진</label>
                                <div class="dropzone col-md-12 review-img" id="review-dropzone"></div>
                                <input type="file" name="reviewImgFile" class="dz-hidden-input hidden-review-img"
                                    multiple="multiple" accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                    style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                            </div>

                            <div class="form-group receipt-group">
                                <label class="receipt-img-label">영수증</label>
                                <div class="dropzone" id="receipt-dropzone"></div>
                                <input type="file" class="dz-hidden-input hidden-receipt-img"
                                    accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                    style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /box_general -->

                <!-- /.container-wrapper-->
                <p class="save-buttons"><button type="button" class="btn_1 medium save">저장</button> <a href="/"
                        class="btn_1 medium gray">취소</a>
                </p>

                <input type="file">
        </form>
    </div>

    </div>


    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/vendor/chart.js/Chart.min.js"></script>
    <script src="/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/js/admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="/vendor/dropzone.min.js"></script>
    <script src="/vendor/bootstrap-datepicker.js"></script>
    <script>
        $('input.date-pick').datepicker();
    </script>
    <!-- WYSIWYG Editor -->
    <script src="/js/editor/summernote-bs4.min.js"></script>
    <script>
        $('.editor').summernote({
            fontSizes: ['10', '14'],
            toolbar: [
                // [groupName, [list of button]]
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough']],
                ['fontsize', ['fontsize']],
                ['para', ['ul', 'ol', 'paragraph']]
            ],
            placeholder: 'Write here ....',
            tabsize: 2,
            height: 200
        });
    </script>


    <script>
        const starRate = document.querySelector('.star span');
        starRate.style.width = (`${review.starRate}` * 10) + '%';

        const drawStar = (target) => {
            console.log(target.value);
            console.log(target.value * 10);
            document.querySelector('.star span').style.width = (target.value * 10) + '%';
        }
    </script>

    <!-- dropzone -->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

    <!-- 주소검증 script -->
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
    <!-- /주소 검증 -->

    <script>
        /* -------------------------------- save 시 검증 -------------------------------- */
        const $titleTag = $('.title');
        const $storeNameTag = $('.store-name');
        const $contentTag = $('.content');
        const checkArr = [false, false, false];

        $contentTag.text(`${review.content}`.replace(/<br>/gi, "\n"));


        // ------------------ 필수정보 --------------------
        $titleTag.on('keyup', function () {

            if ($titleTag.val().trim() === '') {
                $titleTag.css('border-color', 'red');
                $('.title-label').html('리뷰 제목 <b class="c-red title-red">[ 제목은 필수정보입니다. ]</b>');
                checkArr[0] = false;
            } else {
                $titleTag.css('border-color', 'green');
                $('.title-red').remove();
                checkArr[0] = true;
            }
        });

        $storeNameTag.on('keyup', function () {

            if ($storeNameTag.val().trim() === '') {
                $storeNameTag.css('border-color', 'red');
                $('.store-name-label').html('가게 이름 <b class="c-red store-name-red">[가게이름은 필수정보입니다. ]</b>');
                checkArr[1] = false;
            } else {
                $storeNameTag.css('border-color', 'green');
                $('.store-name-red').remove();
                checkArr[1] = true;
            }
        });


        $contentTag.on('keyup', function () {

            if ($contentTag.val().trim() === '') {
                $('.content').css('border-color', 'red');
                $('.content-label').html('내용 <b class="c-red content-red">[ 내용은 필수정보입니다. ]</b>');
                checkArr[2] = false;
            } else {
                $('.content').css('border-color', 'green');
                $('.content-red').remove();
                checkArr[2] = true;
            }
        });

        /* -------------------------------- /save 시 검증 -------------------------------- */


        /* -------------------------------- /입력 검증 -------------------------------- */
    </script>



    <script>
        // -------------- fiel upload and file dropzone --------------

        Dropzone.autoDiscover = false;

        const receiptDropzone = new Dropzone("#receipt-dropzone.dropzone", {
            url: "#",
            method: 'post',
            autoProcessQueue: false,
            clickable: true,
            createImageThumbnails: true,
            thumbnailHeight: 120,
            thumbnailWidth: 300,
            maxFiles: 1,
            maxFilesize: 10,
            addRemoveLinks: true,
            dictRemoveFile: 'X',
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
        });

        console.log("??2");

        let overlapSet = new Set();
        const reviewDropzone = new Dropzone("#review-dropzone.dropzone", {
            url: "/review/write",
            method: 'post',
            autoProcessQueue: false,
            clickable: true,
            createImageThumbnails: true,
            thumbnailWidth: 100,
            thumbnailHeight: 100,
            maxFiles: 5,
            maxFilesize: 10000000,
            addRemoveLinks: true,
            dictRemoveFile: 'X',
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
            parallelUploads: 5,
            uploadMultiple: true,
            init: function () {

                console.log("?");
                let myDropzone = this;

                // dorpzone은 파일을 올릴 때마다 기존 파일들은 삭제되고 새로운 file list가 생성 
                this.on('addedfiles', function (files) { // detail - menu 추가시  
                    let overResult = ''; // 중북된 파일 경고문구

                    if (myDropzone.files.length > 5) { // detail - img 5개 제한 

                        for (const file of files) {
                            myDropzone.removeFile(file); // 5개 이상일 경우 자동 삭제 
                        }
                        $('.review-img-label').html(
                            '리뷰 사진 <b class="c-red detail-red">[ 이미지는 5개까지만 가능합니다. ]</b>');
                        setTimeout(function () {
                            $('.detail-red').remove();
                        }, 5000); // 5초동안만 경고문구 발생 
                        return;

                    } else {
                        for (const setFile of overlapSet) { // 기존 file list  
                            for (const file of files) { // 새 file list 
                                if (setFile === file.name) {
                                    overResult += file.name + ' ';
                                    myDropzone.removeFile(file); // 중복 시 삭제
                                }
                            }
                        }
                    }

                    if (overResult.length > 1) { // 중복된 파일 경우 
                        $('.review-img-label').html(
                            '리뷰 사진 <b class="c-red detail-red">[ 중복된 파일은 ' + overResult +
                            '입니다.]</b>');

                        setTimeout(function () {
                            $('.detail-red').remove();
                        }, 5000);
                        return;

                    }

                    // 5개 이상 X , 중복 X 경우 set List에 추가 
                    for (const file of files) {
                        overlapSet.add(file.name);
                    }
                });

                myDropzone.on('removedfile', function (file) {
                    const overlapArr = [];
                    for (const dropFile of myDropzone.files) {
                        overlapArr.push(dropFile.name);
                    }
                    overlapSet = new Set(overlapArr); // 삭제 후 남은 file list 다시 담음 
                })
            }
        });


        fetch("/review/modify/page/fileImg/"+${reviewBno})
        .then(res=>res.json())
        .then(list=>{

         for (let index = 0; index < list.length; index++) {
            // console.log("!!!!! ", list[index]);
            console.log(list[index].fileSize);
            console.log(list[index].fileByte.length);
            const newFile = new File([list[index].fileByteArray], list[index].fileName, {
                type: list[index].fileType,
                size: list[index].fileSize,
                status: reviewDropzone.ADDED,
                accepted: true
            });
            
            // let mockFile = {name : list[index].fileName , size : list[index].fileSize};

            // reviewDropzone.displayExistingFile(mockFile,list[index].fileData)

            // console.log("!! ",list[index].fileByte);
            reviewDropzone.emit("addedfile", newFile);
            // console.log(list[index].filedata);
            reviewDropzone.emit("thumbnail", newFile, list[index].fileData);
            reviewDropzone.emit("complete", newFile);
            reviewDropzone.files.push(newFile);
           
            //  filessss = new File([list[index].fileByte],list[index].fileName,{
            //     type : list[index].fileType,
            //     size : list[index].fileSize
            //     });

        }

        });


        // const list = new Array();
        // <c:forEach items="${reviewFile}" var="it">

        //     list.push("${it}");
            
        // </c:forEach>
        // console.log(list);

        // console.log("size : ", list.length);
        // console.log("name : ", list[0].length);
        

        // for (let index = 0; index < list.length; index++) {
        //     // console.log("!!!!! ", list[index]);
        //     const newFile = new File(['file'], list[index].fileName, {
        //         type: list[index].fileType,
        //         size: list[index].fileSize,
        //         status: reviewDropzone.ADDED,
        //         accepted: true
        //     });
            
        //     // console.log("!! ",list[index].fileByte);
        //     reviewDropzone.emit("addedfile", newFile);
        //     // console.log(list[index].filedata);
        //     reviewDropzone.emit("thumbnail", newFile, list[index].fileData);
        //     reviewDropzone.emit("complete", newFile);
        //     reviewDropzone.files.push(newFile);

        //     console.log("?? ",reviewDropzone.files);
        // }

        // for (const iterator in list) {
        //     console.log("!!!!! ", iterator.fileName);
        //     const newFile = new File(['file'], iterator.fileName, {
        //         type: iterator.fileType,
        //         size: iterator.fileSize,
        //         status: reviewDropzone.ADDED,
        //         accepted: true
        //     });
            
        //     console.log("!! ",iterator.fileByte);
        //     reviewDropzone.emit("addedfile", newFile);
        //     console.log(iterator.filedata);
        //     reviewDropzone.emit("thumbnail", newFile, iterator.fileByte);
        //     reviewDropzone.emit("complete", newFile);
        //     reviewDropzone.files.push(newFile);

        //     console.log("?? ",reviewDropzone.files);
        // }

        // console.log(list);
        // console.log(list.length);
    

        // const list = ${reviewFile};
        // const lllist = [];
        // // lllist = list;
        // for (let index = 0; index < list.length; index++) {
        //         console.log(list[index].fileName);
        // }

        // const list = "${reviewFile}".length;

        // console.log("${reviewFile[0].filePath}");
        // console.log(list);
        // for (let i = 0; i = "${reviewFile}".length; i++) {
        //     console.log("??3");
        //     const newFile = new File(['file'], "${rf.fileName}", {
        //         type: "${rf.fileType}",
        //         size: "${rf.fileSize}",
        //         status: reviewDropzone.ADDED,
        //         accepted: true
        //     });
            
        //     console.log("!! ",newFile);
        //     reviewDropzone.emit("addedfile", newFile);
        //     reviewDropzone.emit("thumbnail", newFile, "${rf.fileData}");
        //     reviewDropzone.emit("complete", newFile);
        //     reviewDropzone.files.push(newFile);

        //     console.log("?? ",reviewDropzone.files);

        // }

        // const newFile = new File(['file'], "${reviewUpload1.fileName}", {
        //         type: "${reviewUpload1.fileType}",
        //         size: "${reviewUpload1.fileSize}",
        //         status: reviewDropzone.ADDED,
        //         accepted: true
        //     });
            
        //     console.log("!! ",newFile);
        //     reviewDropzone.emit("addedfile", newFile);
        //     reviewDropzone.emit("thumbnail", newFile, "${reviewUpload1.fileData}");
        //     reviewDropzone.emit("complete", newFile);
        //     reviewDropzone.files.push(newFile);

        //     console.log("?? ",reviewDropzone.files);






        // -------------- // fiel upload and file dropzone --------------


        // ---------------------------- submit -------------------------------

        $('.save').on('click', e => {

            e.preventDefault();

            console.log(e.target);

            // 이미지 file 변환 및 form 태그 내 input에 추가. 
            const $reviewHiddenTag = document.querySelector('.hidden-review-img');


            // form 내 input hidden files 속성에 file list를 넣으려면 dataTransfer 변환 필요  
            const reviewDataTranster = new DataTransfer();

            if (reviewDropzone.files.length == 0) {
                alert('리뷰 사진은 필수입니다.');
                return;
            }

            console.log("dkdk", reviewDropzone.files);

            if (reviewDropzone.files.length > 0) {
                for (const reviewF of reviewDropzone.files) {
                    reviewDataTranster.items.add(reviewF);
                }
                $reviewHiddenTag.files = reviewDataTranster.files;

            }


            // 주소
            const $addrApiInputList = $('.addr-api');
            const $addrChk = $('#addrChk');

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

            if (!checkArr.includes(false)) {

                // 내용 \n -> <br>으로 치환
                const content = $contentTag.val().replace(/\n/gi, "<br>");
                $contentTag.val(content)

                $('#review-modify-form').submit();
            } else {
                alert("입력값을 확인해주세요.");
            }


        });
    </script>


</body>

</html>
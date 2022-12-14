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
            z-index: 1000;
            width: 100% !important;
            height: 100% !important;
            position: absolute !important;
            left: 0 !important;
            opacity: 0 !important;
            cursor: pointer !important;
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

        .rangeslider {
            background: #e6e6e6;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
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
                        <h2><i class="fa fa-file"></i>?????? ?????? <span style="margin-left: 5px; font-size: 8px;"><strong
                            style="color: red;">* </strong>????????? ??????????????????!</span></h2>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <span style="color: red;">*</span>
                                <label class="title-label">?????? ??????</label>
                                <input type="text" class="form-control title" placeholder="????????? ??????~" maxlength="40"
                                    name="title" value="${review.title}">
                                <input type="hidden" name="reviewBno" value="${review.reviewBno}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <span style="color: red;">*</span>
                                <label>?????????</label>
                                <input type="text" class="form-control" placeholder="abc1234@naver.com"
                                    value="${review.email}" disabled>
                                <input type="hidden" name="email" value="${review.email}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <span style="color: red;">*</span>
                                <label class="store-name-label">????????????</label>
                                <input type="text" class="form-control store-name" placeholder="???????????????"
                                    value="${review.storeName}" name="storeName">
                                <input type="hidden" name="businessNo" value="${review.businessNo}">
                            </div>
                        </div>
                    </div>
                    <!-- /row-->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>??????</label>
                                <div>
                                    <span id="addrChk"></span>
                                </div>
                                <span style="color: red; margin-right: 1px;">*</span>
                                <input class="form-group" type="text" id="sample4_postcode" placeholder="????????????">
                                <input class="form-group" type="button" onclick="sample4_execDaumPostcode()"
                                    value="???????????? ??????"><br>
                                    <span style="color: red;">*</span>
                                <input class="form-group addr-api store-address" type="text" id="sample4_roadAddress"
                                    placeholder="???????????????" name="storeAddress" value="${review.storeAddress}">
                                <input class="form-group" type="text" id="sample4_jibunAddress" placeholder="????????????">
                                <span id=" guide" style="color:#999;display:none"></span><br>
                                <span style="color: red;">*</span>
                                <input class="form-group addr-api store-detail-address" type="text"
                                    id="sample4_detailAddress" placeholder="????????????" name="storeDetailAddress"
                                    value="${review.storeDetailAddress}">
                                <input class="form-group store-extra-address" type="text" id="sample4_extraAddress"
                                    placeholder="????????????" name="storeExtraAddress" value="${review.storeExtraAddress}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group" style="margin-top: 30px;">
                                <label>??????</label>
                                <div></div>
                                <span class="star">
                                    ???????????????
                                    <span>???????????????</span>
                                    <input type="range" oninput="drawStar(this)" value="${review.starRate}" step="1" min="0" max="10"
                                        name="starRate">
                                </span>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="form-group" style="margin-top: 30px;">
                                <label style="margin-bottom: 10px;">?????? ??????</label>
                                <div>
                                    <input type="radio" id="huey" name="isPrivate" value="F" checked>
                                    <label for="huey">??????</label>
                                </div>
                                <div>
                                    <input type="radio" id="dewey" name="isPrivate" value="T">
                                    <label for="dewey">?????????</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <span style="color: red;">*</span>
                                <label class="content-label">??????</label>
                                <textarea name="content" class="form-control content" style="height: 150px;"
                                    placeholder="Message" id="message_contact" name="content"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="box_general padding_bottom add-Img-row">
                        <div class="header_box version_2 add-Img">
                            <h2><i class="fa fa-list"></i>?????? ??? ????????? ??????</h2>
                        </div>
                        <div class="row">
                            <div class="form-group review-group">
                                <span style="color: red;">*</span>
                                <label class="review-img-label">??????</label>
                                <div class="dropzone col-md-12 review-img" id="review-dropzone"></div>
                                <input type="file" name="reviewImgFile" class="dz-hidden-input hidden-review-img"
                                    multiple="multiple" accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                    style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                            </div>

                            <!-- <div class="form-group receipt-group">
                                <label class="receipt-img-label">?????????</label>
                                <div class="dropzone" id="receipt-dropzone"></div>
                                <input type="file" class="dz-hidden-input hidden-receipt-img"
                                    accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                    style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                            </div> -->
                        </div>
                    </div>
                </div>
                <!-- /box_general -->

                <!-- /.container-wrapper-->
                <p class="save-buttons"><button type="button" class="btn_1 medium save">??????</button> <a href="/review?sort=latest"
                        class="btn_1 medium gray">??????</a>
                </p>
        </form>
    </div>
    <%@ include file="../include/footer.jsp" %>
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

    <!-- ???????????? script -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //??? ??????????????? ????????? ?????? ?????? ????????? ?????? ????????? ??????, ???????????? ???????????? ???????????? ????????? ????????? ???????????? ????????? ???????????????.
        function sample4_execDaumPostcode() {

            new daum.Postcode({
                oncomplete: function (data) {
                    // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                    // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
                    // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                    var roadAddr = data.roadAddress; // ????????? ?????? ??????
                    var extraRoadAddr = ''; // ?????? ?????? ??????

                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if (data.bname !== '' && /[???|???|???]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data
                            .buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                    document.getElementById('sample4_postcode').value = data
                        .zonecode;
                    document.getElementById("sample4_roadAddress").value =
                        roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data
                        .jibunAddress;

                    // ???????????? ???????????? ?????? ?????? ?????? ????????? ?????????.
                    if (roadAddr !== '') {
                        document.getElementById("sample4_extraAddress").value =
                            extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value =
                            '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // ???????????? '?????? ??????'??? ????????? ??????, ?????? ???????????? ????????? ?????????.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(?????? ????????? ?????? : ' + expRoadAddr +
                            ')';
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(?????? ?????? ?????? : ' + expJibunAddr +
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
    <!-- /?????? ?????? -->

    <script>
        /* -------------------------------- save ??? ?????? -------------------------------- */
        const $titleTag = $('.title');
        const $storeNameTag = $('.store-name');
        const $contentTag = $('.content');

        $contentTag.text(`${review.content}`.replace(/<br>/gi, "\n"));


        // ------------------ ???????????? --------------------
        $titleTag.on('keyup', function () {

            if ($titleTag.val().trim() === '') {
                $titleTag.css('border-color', 'red');
                $('.title-label').html('?????? ?????? <b class="c-red title-red">[ ????????? ?????????????????????. ]</b>');
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
                $('.store-name-label').html('?????? ?????? <b class="c-red store-name-red">[??????????????? ?????????????????????. ]</b>');
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
                $('.content-label').html('?????? <b class="c-red content-red">[ ????????? ?????????????????????. ]</b>');
                checkArr[2] = false;
            } else {
                $('.content').css('border-color', 'green');
                $('.content-red').remove();
                checkArr[2] = true;
            }
        });

        /* -------------------------------- /save ??? ?????? -------------------------------- */


        /* -------------------------------- /?????? ?????? -------------------------------- */
    </script>



    <script>
        // -------------- fiel upload and file dropzone --------------

        Dropzone.autoDiscover = false;

        // const receiptDropzone = new Dropzone("#receipt-dropzone.dropzone", {
        //     url: "#",
        //     method: 'post',
        //     autoProcessQueue: false,
        //     clickable: true,
        //     createImageThumbnails: true,
        //     thumbnailHeight: 120,
        //     thumbnailWidth: 300,
        //     maxFiles: 1,
        //     maxFilesize: 10,
        //     addRemoveLinks: true,
        //     dictRemoveFile: 'X',
        //     acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
        // });

        // console.log("??2");

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

                // dorpzone??? ????????? ?????? ????????? ?????? ???????????? ???????????? ????????? file list??? ?????? 
                this.on('addedfiles', function (files) { // detail - menu ?????????  
                    let overResult = ''; // ????????? ?????? ????????????

                    if (myDropzone.files.length > 5) { // detail - img 5??? ?????? 

                        for (const file of files) {
                            myDropzone.removeFile(file); // 5??? ????????? ?????? ?????? ?????? 
                        }
                        $('.review-img-label').html(
                            '?????? ?????? <b class="c-red detail-red">[ ???????????? 5???????????? ???????????????. ]</b>');
                        setTimeout(function () {
                            $('.detail-red').remove();
                        }, 5000); // 5???????????? ???????????? ?????? 
                        return;

                    } else {
                        for (const setFile of overlapSet) { // ?????? file list  
                            for (const file of files) { // ??? file list 
                                if (setFile === file.name) {
                                    overResult += file.name + ' ';
                                    myDropzone.removeFile(file); // ?????? ??? ??????
                                }
                            }
                        }
                    }

                    if (overResult.length > 1) { // ????????? ?????? ?????? 
                        $('.review-img-label').html(
                            '?????? ?????? <b class="c-red detail-red">[ ????????? ????????? ' + overResult +
                            '?????????.]</b>');

                        setTimeout(function () {
                            $('.detail-red').remove();
                        }, 5000);
                        return;

                    }

                    // 5??? ?????? X , ?????? X ?????? set List??? ?????? 
                    for (const file of files) {
                        overlapSet.add(file.name);
                    }
                });

                myDropzone.on('removedfile', function (file) {
                    const overlapArr = [];
                    for (const dropFile of myDropzone.files) {
                        overlapArr.push(dropFile.name);
                    }
                    overlapSet = new Set(overlapArr); // ?????? ??? ?????? file list ?????? ?????? 
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


        // -------------- // fiel upload and file dropzone --------------


        // ---------------------------- submit -------------------------------

        $('.save').on('click', e => {

            e.preventDefault();

            console.log(e.target);

            // ????????? file ?????? ??? form ?????? ??? input??? ??????. 
            const $reviewHiddenTag = document.querySelector('.hidden-review-img');


            // form ??? input hidden files ????????? file list??? ???????????? dataTransfer ?????? ??????  
            const reviewDataTranster = new DataTransfer();

            const $titleTag = $('.title');
            const $storeNameTag = $('.store-name');
            const $contentTag = $('.content');
            // ------------------ ???????????? --------------------

            if ($titleTag.val().trim() == '') {
                alert('????????? ????????? ?????????!!');
                return;
            }

            if ($storeNameTag.val().trim() == '') {
                alert('??????????????? ????????? ?????????!!');
                return;
            }

            if ($contentTag.val().trim() == '') {
                alert('????????? ????????? ?????????!!');
                return;
            }

            if (reviewDropzone.files.length == 0) {
                alert('?????? ????????? ???????????????.');
                return;
            }

            console.log("dkdk", reviewDropzone.files);

            if (reviewDropzone.files.length > 0) {
                for (const reviewF of reviewDropzone.files) {
                    reviewDataTranster.items.add(reviewF);
                }
                $reviewHiddenTag.files = reviewDataTranster.files;

            }


            // ??????
            const $addrApiInputList = $('.addr-api');
            const $addrChk = $('#addrChk');

            for (let addrInput of $addrApiInputList) {
                if (addrInput.value.trim() === '') {
                    alert('????????? ????????? ?????????!!');
                    addrInput.style.borderColor = 'red';
                    $addrChk.text('?????? ?????????????????????. ????????? ????????? ????????? ?????? ????????? ????????? ???????????????.');
                    $addrChk.css('color', 'red');
                    return;
                } else {
                    addrInput.style.borderColor = 'yellowgreen';
                }
            }

            
            

                // ?????? \n -> <br>?????? ??????
                const content = $contentTag.val().replace(/\n/gi, "<br>");
                $contentTag.val(content)

                $('#review-modify-form').submit();
            


        });
    </script>


</body>

</html>
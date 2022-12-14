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

        .rangeslider {
            background: #e6e6e6;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
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

        .readOnly {
            background-color: #e9ecef;
            border: #999;
        }
    </style>

</head>

<body class="fixed-nav" id="page-top">
    <%@ include file="../include/detail-header.jsp" %>

    <div class="content-wrapper">
        <form id="review-write-form" action="/review/write" class="review-form" method="post"
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
                                    name="title">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <span style="color: red;">*</span>
                                <label>?????????</label>
                                <input type="text" class="form-control" placeholder="abc1234@naver.com"
                                    value="${loginUser.name}" disabled>
                                <input type="hidden" name="email" value="${loginUser.email}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <span style="color: red;">*</span>
                                <label class="store-name-label">????????????</label>
                                <c:if test="${referer != null}">
                                    <input type="text" class="form-control store-name" placeholder="???????????????"
                                        value="${master.storeName}" name="storeName" readonly>
                                </c:if>
                                <c:if test="${referer == null}">
                                    <input type="text" class="form-control store-name" placeholder="???????????????"
                                        value="${master.storeName}" name="storeName">
                                </c:if>
                                <input type="hidden" name="businessNo" class="businessNo" value="${master.businessNo}">
                                <input type="hidden" name="receipt" class="receipt" value="N">
                            </div>
                        </div>
                    </div>
                    <!-- /row-->
                    <div class="row">
                        <c:if test="${referer != null}">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>?????? <span style="color: red;">[?????? ????????? ????????? ?????? ?????? ?????? (?????? ??????)]</span></label>
                                    <div>
                                        <span id="addrChk"></span>
                                    </div>
                                    <span style="color: red;">*</span>
                                    <input style="background-color: #e9ecef; border: #999;" class="form-group"
                                        type="text" id="sample4_postcode" placeholder="????????????" readonly>
                                    <br>
                                    <span style="color: red;">*</span>
                                    <input style="background-color: #e9ecef; border: #999"
                                        class="form-group addr-api store-address" type="text" id="sample4_roadAddress"
                                        placeholder="???????????????" name="storeAddress" value="${master.storeAddress}" readonly>
                                    <input style="background-color: #e9ecef; border: #999" class="form-group store-"
                                        type="text" id="sample4_jibunAddress" placeholder="????????????" readonly>
                                    <span id=" guide" style="color:#999;display:none"></span><br>
                                    <span style="color: red;">*</span>
                                    <input style="background-color: #e9ecef; border: #999"
                                        class="form-group addr-api store-detail-address" type="text"
                                        id="sample4_detailAddress" placeholder="????????????" name="storeDetailAddress"
                                        value="${master.storeDetailAddress}" readonly>
                                    <input style="background-color: #e9ecef; border: #999"
                                        class="form-group store-extra-address" type="text" id="sample4_extraAddress"
                                        placeholder="????????????" name="storeExtraAddress" value="${master.storeExtraAddress}"
                                        readonly>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${referer == null}">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>?????? <span style="color: red;">[?????? ????????? ????????? ?????? ?????? ?????? (?????? ??????)]</span></label>
                                    <div>
                                        <span id="addrChk"></span>
                                    </div>
                                    <span style="color: red;">*</span>
                                    <input class="form-group addressNum" type="text" id="sample4_postcode"
                                        placeholder="????????????">
                                    <input class="form-group addressBtn" type="button"
                                        onclick="sample4_execDaumPostcode()" value="???????????? ??????"><br>
                                    <span style="color: red;">*</span>
                                    <input class="form-group addr-api store-address" type="text"
                                        id="sample4_roadAddress" placeholder="???????????????" name="storeAddress"
                                        value="${master.storeAddress}">
                                    <input class="form-group subAddress" type="text" id="sample4_jibunAddress"
                                        placeholder="????????????">
                                    <span id=" guide" style="color:#999;display:none"></span><br>
                                    <span style="color: red;">*</span>
                                    <input class="form-group addr-api store-detail-address" type="text"
                                        id="sample4_detailAddress" placeholder="????????????" name="storeDetailAddress"
                                        value="${master.storeDetailAddress}">
                                    <input class="form-group store-extra-address" type="text" id="sample4_extraAddress"
                                        placeholder="????????????" name="storeExtraAddress" value="${master.storeExtraAddress}">
                                </div>
                            </div>
                        </c:if>
                        <div class="col-md-2">
                            <div class="form-group" style="margin-top: 30px;">
                                <label>??????</label>
                                <div></div>
                                <span class="star">
                                    ???????????????
                                    <span>???????????????</span>
                                    <input type="range" oninput="drawStar(this)" value="5" step="1" min="0" max="10"
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

                            <div class="form-group receipt-group">
                                <label class="receipt-img-label">?????????
                                    <c:if test="${referer != null}">
                                        <span style="color: red;">[????????? ????????? ????????? ????????? ???????????????. ]</span>
                                    </c:if>
                                    <c:if test="${referer == null}">
                                        <span style="color: red;">[????????? ??? ????????? ????????? ????????? ????????? ???????????????. ]</span>

                                    </c:if>


                                </label>
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
                <p class="save-buttons"><button type="button" class="btn_1 medium save">??????</button> <a
                        href="/review?sort=latest" class="btn_1 medium gray">??????</a>
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
                    // if (data.autoRoadAddress) {
                    //     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //     guideTextBox.innerHTML = '(?????? ????????? ?????? : ' + expRoadAddr +
                    //         ')';
                    //     guideTextBox.style.display = 'block';
                    // } else if (data.autoJibunAddress) {
                    //     var expJibunAddr = data.autoJibunAddress;
                    //     guideTextBox.innerHTML = '(?????? ?????? ?????? : ' + expJibunAddr +
                    //         ')';
                    //     guideTextBox.style.display = 'block';
                    // } else {
                    //     // guideTextBox.innerHTML = '';
                    //     // guideTextBox.style.display = 'none';
                    // }
                },
                onclose: function (state) {
                    console.log(state);
                    //state??? ???????????? ?????? ????????? ????????? ??????????????? ?????? ?????? ?????? ??????, ?????? ????????? ?????? ???????????? ???????????? ??? ????????????.
                    if (state === 'FORCE_CLOSE') {
                        //???????????? ???????????? ?????? ????????? ?????? ???????????? ????????? ??????, ????????? ????????? ???????????? ???????????????.

                    } else if (state === 'COMPLETE_CLOSE') {
                        //???????????? ??????????????? ???????????? ???????????? ????????? ??????, ????????? ????????? ???????????? ???????????????.
                        //oncomplete ?????? ????????? ?????? ????????? ?????? ???????????????.
                    }
                }
            }).open();
        }
    </script>
    <!-- /?????? ?????? -->

    <script>
        // function createReceiptValHiddenInput(result) {
        //     const $newInput = document.createElement('input')
        //     $newInput.type = 'hidden';
        //     $newInput.name = 'receipt';
        //     $newInput.className = 'receipt';
        //     $newInput.value = result;

        //     $('.container-fluid').append($newInput);
        // }

        function getProboardInfo(result) {
            fetch('/review/write/master/' + result)
                .then(res => res.json())
                .then(infoMap => {
                    const proBoard = infoMap.proBoard;

                    const $addressBtn = $('.addressBtn');

                    const $storeAddress = $('.store-address');
                    const $storeDetailAddress = $('.store-detail-address');
                    const $storeExtraAddress = $('.store-extra-address');
                    const $storeName = $('.store-name');
                    const $addressNum = $('.addressNum');
                    const $subAddress = $('.subAddress');

                    $storeAddress.val(proBoard.storeAddress);
                    $storeDetailAddress.val(proBoard.storeDetailAddress);
                    $storeExtraAddress.val(proBoard.storeExtraAddress);
                    $storeName.val(proBoard.storeName);


                    $storeAddress.prop('readonly', true);
                    $storeDetailAddress.prop('readonly', true);
                    $storeExtraAddress.prop('readonly', true);
                    $storeName.prop('readonly', true);
                    $addressNum.prop('readonly', true);
                    $subAddress.prop('readonly', true);

                    $storeAddress.addClass('readOnly');
                    $storeDetailAddress.addClass('readOnly');
                    $storeExtraAddress.addClass('readOnly');
                    $storeName.addClass('readOnly');
                    $addressNum.addClass('readOnly');
                    $subAddress.addClass('readOnly');

                    $addressBtn.attr("disabled", true);

                })
        }

        function LoadingWithMask() {
            var maskHeight = $(document).height();
            var maskWidth = window.document.body.clientWidth;
            var mask =
                "<div id='mask' style='position:absolute; z-index:100000; background-color:#000000; display:none; left:0; top:0;'></div>";
            var loadingImg = '';
            loadingImg += "<div id='loadingImg'>";
            loadingImg +=
                "<img src='/img/loading.gif' style='position: absolute; width:30%; transform: translate(-50%, -50%);  left: 50%; top: 30%; '/>"
            loadingImg += "</div>";
            $('body#page-top').append(mask)
            $('.container-fluid').append(loadingImg)
            $('#mask').css({
                'width': maskWidth,
                'height': maskHeight,
                'opacity': '0.3'
            });

            $('#mask').show();
            $('#loadingImg').show();
        }

        function closeLoadingWithMask() {
            $('#mask, #loadingImg').hide();
            $('#mask, #loadingImg').remove();
        }


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

            init: function () {
                let myDropzone = this;

                // ?????? ?????? ??? input ??? ?????? 
                this.on('removedfile', function (file) {

                    if ('${referer}'.length === 0) // ?????????????????? ??????.
                    {
                        $('.businessNo').val('');

                        const $addressBtn = $('.addressBtn');

                        const $storeAddress = $('.store-address');
                        const $storeDetailAddress = $('.store-detail-address');
                        const $storeExtraAddress = $('.store-extra-address');
                        const $storeName = $('.store-name');
                        const $addressNum = $('.addressNum');
                        const $subAddress = $('.subAddress');

                        $storeAddress.removeClass('readOnly');
                        $storeDetailAddress.removeClass('readOnly');
                        $storeExtraAddress.removeClass('readOnly');
                        $storeName.removeClass('readOnly');
                        $addressNum.removeClass('readOnly');
                        $subAddress.removeClass('readOnly');

                        $storeAddress.prop('readonly', false);
                        $storeDetailAddress.prop('readonly', false);
                        $storeExtraAddress.prop('readonly', false);
                        $storeName.prop('readonly', false);
                        $addressNum.prop('readonly', false);
                        $subAddress.prop('readonly', false);

                        $storeAddress.val('');
                        $storeDetailAddress.val('');
                        $storeExtraAddress.val('');
                        $storeName.val('');
                        $addressNum.val('');
                        $subAddress.val('');

                        $addressBtn.attr("disabled", false);
                    }

                    $('.receipt').val('N');

                });

                this.on('addedfile', function (file) {

                    LoadingWithMask();
                    const formData = new FormData();
                    formData.append('file', file)

                    if ('${referer}'.length > 0) { // ??????????????? ????????? ????????? ?????? (??????????????? ???)

                        const uploadFile = {
                            method: "POST",
                            body: formData
                        };

                        fetch('/review/write/master/upload/receipt', uploadFile)
                            .then(res => res.text())
                            .then(result => {

                                console.log(result);
                                if (result != '') {

                                    const obj = {
                                        businessNo: '${master.businessNo}',
                                        fileName: result
                                    };

                                    const confirmReceipt = {
                                        method: "POST",
                                        headers: {
                                            'Content-Type': 'application/json'
                                        },
                                        body: JSON.stringify(obj)
                                    }

                                    fetch('/review/write/master/receipt', confirmReceipt)
                                        .then(res => res.text())
                                        .then(result => {
                                            if (result === 'Y') {
                                                alert("???????????? ??????????????????.")
                                                $('.receipt').val('Y');
                                            } else {
                                                alert("???????????? ?????? ??????????????????.")
                                                myDropzone.removeFile(file);
                                            }

                                            closeLoadingWithMask();
                                        })



                                } else {
                                    alert("?????? ?????? ?????? ?????? ????????????. ");
                                    myDropzone.removeFile(file);

                                    closeLoadingWithMask();
                                }
                            })

                    } else { // ??????????????? ?????? (??????????????? ???)

                        console.log("???");
                        const obj = {
                            method: "POST",
                            body: formData
                        };

                        fetch('/review/write/receipt', obj)
                            .then(res => res.text())
                            .then(result => {
                                if (result != "false") // ????????? ????????? ??????
                                {
                                    $('.receipt').val('Y');
                                    $('.businessNo').val(result);
                                    alert("?????????????????? ???????????????.");

                                    if (confirm("?????? ????????? ????????????????")) {
                                        getProboardInfo(result); // ?????? ?????? 
                                    }

                                } else {
                                    alert("?????????????????? ???????????????.");
                                    myDropzone.removeFile(file);
                                }
                                closeLoadingWithMask();
                            })
                    }
                });
            }
        });
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
            maxFilesize: 10,
            addRemoveLinks: true,
            dictRemoveFile: 'X',
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
            parallelUploads: 5,
            uploadMultiple: true,
            init: function () {
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
        // -------------- // fiel upload and file dropzone --------------
        // ---------------------------- submit -------------------------------
        $('.save').on('click', e => {
            e.preventDefault();
            console.log(e.target);

            if ($('.businessNo').length > 0) {

                const obj = {
                    email: `${email}`,
                    businessNo: $('.businessNo').val()
                }

                // const values = [`${email}`,$('.businessNo').val()]
                fetch('/review/write/is/master', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(obj)
                    }).then(res => res.text())
                    .then(result => {
                        if (result === "Y") {
                            alert(" ????????? ????????? ??? ????????????. \n ??????: ????????? ??????")
                            return;
                        }
                    })
            }

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
            if (reviewDropzone.files.length > 0) {
                for (const reviewFile of reviewDropzone.files) {
                    reviewDataTranster.items.add(reviewFile);
                }
                $reviewHiddenTag.files = reviewDataTranster.files;
            }
            // ??????
            const $addrApiInputList = $('.addr-api');
            const $addrChk = $('#addrChk');
            for (let addrInput of $addrApiInputList) {
                if (addrInput.value.trim() === '') {
                    alert('????????? ????????? ?????????!!')
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
            $contentTag.val(content);
            $('#review-write-form').submit();

        });
    </script>


</body>

</html>
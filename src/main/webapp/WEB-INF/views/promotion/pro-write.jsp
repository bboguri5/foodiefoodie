<%@ page contentType='text/html; charset=UTF-8' language='java' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Ansonika">
    <title>FOOGRA - Admin dashboard</title>
    <!-- jquery -->
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="/img/apple-touch-icon-144x144-precomposed.png">
    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Main styles -->
    <link href="/css/admin.css" rel="stylesheet">
    <!-- Icon fonts-->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Plugin styles -->
    <link href="/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- <link href="/vendor/dropzone.css" rel="stylesheet"> -->
    <link href="/css/date_picker.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link href="/css/custom.css" rel="stylesheet">
    <!-- WYSIWYG Editor -->
    <link rel="stylesheet" href="/js/editor/summernote-bs4.css">

    <!-- time picker : 시간/날짜 api -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

    <!-- dropzone -->
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

    <style>
        /* detail info */
        .content-wrapper {
            margin: 30px;
        }

        .row-form {
            display: flex;
            justify-content: start;
            align-items: center;
        }

        .col-md-6.master-detail {
            flex: 100%;
            max-width: 100%;
        }

        .form-group.detail-Info {
            margin-left: 5px;
        }


        /* menu add  */
        .menu-row {
            justify-content: center;
            align-items: center;
        }

        .menu-add-btn {
            display: flex;
            justify-content: center;
        }

        .menu-add-img .form-group {
            height: 100px;

        }

        /* add detail , title img  */

        .header_box.version_2 {
            border-bottom: 0;
        }

        .save-btn {
            display: flex;
            justify-content: center;
        }

        /* .preview {
            width: 100%;
            display: none;
        }

        #detail-preview {
            display: flex;
            justify-content: space-evenly;
        }

        .preview-title-img {
            width: 150px;
            height: 100px;
        }

        .preview-detail-img {
            width: 20%;
            height: 50px;
        }

        .preview-menu-img {
            width: 50px;
            height: 50px;
        } */

        .c-red {
            color: red;
        }

        .c-green {
            color: green;
        }

        select.form-control.selectDay {
            padding: 5px;
            width: 80px;
        }

        select.form-control:not([size]):not([multiple]) {
            height: calc(2.1rem + 2px);
        }

        .form-group.dayBox {
            display: flex;
            justify-content: space-between;
        }

        .day-delete {
            background: red;
        }

        .form-control.content {
            min-height: 300px;
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
            width: 25%;
            margin-left: 20px;
        }

        .add-Img-row .form-group:nth-child(2) {
            width: 70%;
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

        #menu-dropzone.dropzone {
            padding: 0;
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

        .dropzone#menu-dropzone {
            min-height: 50px;
        }

        .menu-add-img .dz-preview.dz-image-preview {
            min-height: 0;
        }

        .menu-add-img .dz-preview.dz-image-preview .dz-image {
            width: 80px;
            height: 80px;
        }
    </style>


</head>

<body class="fixed-nav sticky-footer" id="page-top">
    <form id="promotionWriteForm" action="/foodie/write" method="post" enctype="multipart/form-data">
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">Add listing</li>
                </ol>
                <div class="box_general padding_bottom">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-file"></i>
                            Promotional Article Write</h2>
                    </div>

                    <!-- detail info -->
                    <div class="row">
                        <div class="col-md-6 master-detail">
                            <input type="text" class="" hidden>
                            <div class="row-form">
                                <input type="text" name="businessNo" value="${businessNo}" hidden>
                                <div class="form-group detail-Info">
                                    <label>STORE NAME
                                    </label>
                                    <input type="text" class="form-control" value="${master.storeName}" readonly>
                                </div>
                                <div class="form-group detail-Info">
                                    <label>STORE MASTER NAME
                                    </label>
                                    <input type="text" class="form-control" value="${master.masterName}" readonly>
                                </div>
                                <div class="form-group detail-Info">
                                    <label>STORE CALL NUMBER
                                    </label>
                                    <input type="text" class="form-control" value="${master.storeCallNumber}" readonly>
                                </div>
                            </div>
                            <div class="form-group detail-Info detail-address">
                                <label>STORE ADDRESS
                                </label>
                                <input type="text" class="form-control" value="${totalAddress}" readonly>
                            </div>
                            <div class="form-group detail-Info">
                                <label class="title-label">Title
                                </label>
                                <input type="text" class="form-control title" name="title" value="${master.storeName}">
                            </div>
                            <div class="form-group detail-Info">
                                <div class="form-group">
                                    <label class="hashTag-label">HASH TAG</label>
                                    <input type="text" class="form-control hashTag" name="hashTag"
                                        placeholder="예시 : 띄어쓰기 기준으로 단어 10개 이상 입력 불가합니다.">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /detail info -->


                    <!-- CONTENT editor -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="content-label">CONTENT</label>
                                <textarea name="content" class="form-control content" style="height: 150px;"
                                    placeholder="Message" id="message_contact" name="message_contact"></textarea>
                            </div>
                        </div>
                    </div>
                    <!-- /CONTENT editor -->


                    <!-- add detail , title img row -->
                    <div class="box_general padding_bottom add-Img-row">
                        <div class="header_box version_2 add-Img">
                            <h2><i class="fa fa-list"></i>Title & Detail Image Add</h2>
                        </div>
                        <div class="row">
                            <div class="form-group title-group">
                                <label>Title</label>
                                <div class="dropzone col-md-12" id="title-dropzone"></div>
                            </div>

                            <div class="form-group detail-group">
                                <label class="detail-img-label">Detail</label>
                                <div class="dropzone" id="detail-dropzone"></div>
                                <input type="file" name="detailImgFiles" class="dz-hidden-input hidden-detail-img"
                                    multiple="multiple" accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                    style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- add detail , title img row -->
                <!-- <div class="box_general padding_bottom add-Img-row">
                        <div class="header_box version_2 add-Img">
                            <h2><i class="fa fa-list"></i>Title Image Add</h2>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Photos</label>
                                        <div>
                                            <input type="file" id="title-img" class="title"
                                                accept="image/gif, image/jpeg, image/png, image/bmp"></input>
                                        </div>
                                        <div class="preview"><span>미리보기</span>
                                            <div id="title-preview"></div>
                                        </div>
                                        <div id="hidden-title-box"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="header_box version_2 add-Img">
                            <h2><i class="fa fa-list"></i>Detail Image Add</h2>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Photos</label>
                                        <div>

                                            <input type="file" id="detail-img" class="detail" multiple
                                                accept="image/gif, image/jpeg, image/png, image/bmp"></input>
                                        </div>
                                        <div class="preview multiple"><span>미리보기</span>
                                            <div id="detail-preview"></div>
                                        </div>
                                        <div id="hidden-detail-box"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                <!-- /add detail , title img row -->

                <!-- add Menu List -->
                <div class="box_general padding_bottom menuImg">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-list"></i>Add item to Menu List</h2>
                    </div>
                    <!-- add Menu List row -->
                    <div class="row">
                        <div class="col-md-12">

                            <table id="pricing-list-container" style="width:100%;">
                                <tr class="pricing-list-item">
                                    <td>
                                        <div class="row menu-row">
                                            <div class="col-md-1">
                                                <h6>plus menu</h6>
                                            </div>
                                            <div class="col-md-1 menu-add-img">
                                                <div class="form-group">
                                                    <div class="dropzone menu1" id="menu-dropzone"></div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" name="menuName" class="form-control menu-name"
                                                        placeholder="메뉴명">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control menu-price" name="menuPrice"
                                                        placeholder="price">
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group delete-form">
                                                    <a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </div>
                    <!-- /add Menu List row -->

                    <div class="menu-add-btn">
                        <a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>Add
                            Item</a>
                    </div>
                    <div id="hidden-menu-box"></div>

                </div>
                <!-- /add Menu List -->


                <!-- store time -->
                <div class="box_general padding_bottom">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-clock-o"></i>Store Time</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h6>Item</h6>
                            <table id="store-time" style="width:100%;">
                                <tr class="store-time-colurm">
                                    <td>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="평일" readonly>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="weekdayOpenTime" type="text"
                                                        class="form-control select-time weekday-openTime">
                                                </div>

                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="weekdayCloseTime" type="text"
                                                        class="form-control select-time">
                                                </div>

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="store-time-colurm">
                                    <td>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="주말" readonly>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="weekendOpenTime" type="text"
                                                        class="form-control select-time" placeholder="오픈시간입력">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="weekendCloseTime" type="text"
                                                        class="form-control select-time" placeholder="마감시간입력">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="store-time-colurm">
                                    <td>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Break Time"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="breakStartTime" type="text"
                                                        class="form-control select-time" placeholder="시작시간">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="breakEndTime" type="text"
                                                        class="form-control select-time" placeholder="종료시간">
                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <tr class="store-time-colurm">
                                    <td>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="휴무"
                                                        readonly="">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" name="closedDay" class="form-control closedDay"
                                                        placeholder="휴무 옵션 선택" readonly>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group dayBox">
                                                    <select type="text" class="form-control selectDay"
                                                        placeholder="예시 : 화요일 (요일입력)">
                                                        <option value="월">월</option>
                                                        <option value="화">화</option>
                                                        <option value="수">수</option>
                                                        <option value="목">목</option>
                                                        <option value="금">금</option>
                                                        <option value="토">토</option>
                                                        <option value="일">일</option>
                                                        <option vlaue=null>없음</option>
                                                    </select>
                                                    <button type="button" class="btn_1 day-delete">제거</button>
                                                </div>
                                            </div>
                                    </td>
                                </tr>
                                </tr>
                            </table>
                        </div>
                        <!-- /store time -->
                        <script>
                            // select time 
                            $(".select-time").timepicker({
                                timeFormat: 'HH:mm a',
                                interval: 30,
                                maxTime: '23:30pm',
                                defaultTime: '24',
                                startTime: '08:00',
                                dynamic: false,
                                dropdown: true,
                                scrollbar: true
                            });
                        </script>
                    </div>
                    <!-- /row-->
                </div>
            </div>
        </div>
        </div>
        <div class="col-md-12 save-btn"><button type="button" class="btn_1 medium save">Save</button></div>
    </form>


    <!-- /content-wrapper -->
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
    <!-- <script src="/vendor/dropzone.min.js"></script> -->
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
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

    <!-- jungah script -->
    <script>
        /* -------------------------------- 요일 선택,제거 -------------------------------- */
        const $selectDay = $('.selectDay');
        const $closedDay = $('.closedDay');
        let result = [];
        $selectDay.on('change', function () {
            result.push($selectDay.val());
            $closedDay.val(result.join());

            if ($selectDay.val() === '없음') {
                result = [];
                $closedDay.val($selectDay.val());
            }

        });

        $('.day-delete').on('click', function () {
            result = [];
            $closedDay.val('');
        });
        /* -------------------------------- /요일 선택,제거 --------------------------------  */


        /* -------------------------------- save 시 검증 -------------------------------- */
        const $titleTag = $('.title');
        const $hashTag_Tag = $('.hashTag');
        const $contentTag = $('.content');
        const checkArr = [false, false, false];

        // ------------------ 필수정보 --------------------
        $titleTag.on('keyup', function () {

            if ($titleTag.val().trim() === '') {
                $titleTag.css('border-color', 'red');
                $('.title-label').html('TITLE <b class="c-red title-red">[ 제목은 필수정보입니다. ]</b>');
                checkArr[0] = false;
            } else {
                $titleTag.css('border-color', 'green');
                $('.title-red').remove();
                checkArr[0] = true;
            }
        });

        $hashTag_Tag.on('keyup', function () {

            if ($hashTag_Tag.val().trim() === '') {
                $hashTag_Tag.css('border-color', 'red');
                $('.hashTag-label').html('HASH TAG <b class="c-red hashTag-red">[ 해시태그는 필수정보입니다. ]</b>');
                checkArr[1] = false;
            } else {
                $hashTag_Tag.css('border-color', 'green');
                $('.hashTag-red').remove();
                checkArr[1] = true;
            }
        });

        $contentTag.on('keyup', function () {

            if ($contentTag.val().trim() === '') {
                $('.content').css('border-color', 'red');
                $('.content-label').html('CONTENT <b class="c-red content-red">[ 내용은 필수정보입니다. ]</b>');
                checkArr[2] = false;
            } else {
                $('.content').css('border-color', 'green');
                $('.content-red').remove();
                checkArr[2] = true;
            }
        });



        /* -------------------------------- /save 시 검증 -------------------------------- */

        /* -------------------------------- menu add -------------------------------- */

        // 첫번재 삭제버튼은 표시 안함
        const par = $('table#pricing-list-container').first().find('.delete').remove();

        // 메뉴 추가 script
        function newMenuItem() {
            var newElem = $('form-group').first().clone(); // 첫번쨰 메뉴 복사 
            newElem.find('input').val(''); // input 리셋 
            newElem.appendTo('table#pricing-list-container'); // 추가 
        }

        let count = 1;

        if ($("table#pricing-list-container").is('*')) { // 
            $('.add-pricing-list-item').on('click', function (e) {
                const $container = $('#pricing-list-container');
                e.preventDefault();
                newMenuItem();

                // add한 영역 delete 생성  
                $('.menu-row').last().find('.delete-form').append(
                    '<a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>')
                $(this).css('border-colore', 'none');
                priceInputOnlyInt(); // add 한 입력창 검증 

                const $target = $('#pricing-list-container').last().find('.menu1').last();

                // img박스 리셋  
                $target.last().removeClass('dz-started');
                $target.last().removeClass('dz-max-files-reached');
                $target.last()[0].innerHTML = '';

                // menuimg에 dropzone 일일히 적용하기 위한 코드 
                count++;
                $target.removeClass('menu1');
                $target.addClass('menu' + count)

                addMenuImg(count);

            });
            $(document).on("click", "#pricing-list-container .delete", function (e) {
                e.preventDefault();
                $(this).parent().parent().parent().parent().parent().remove();
            });

        }


        /* -------------------------------- /menu add -------------------------------- */

        /* -------------------------------- /입력 검증 -------------------------------- */


        // ------------------ 메뉴 price 숫자만 입력 ---------------------
        priceInputOnlyInt(); // 처음 입력창 검증 

        // 메뉴 price 입력창 검증 함수 (숫자만 입력) 
        function priceInputOnlyInt() {
            var replaceNotInt = /[^0-9]/gi;

            const $menuPrice = $('.menu-price');

            $menuPrice.on("keyup", function () {
                console.log(replaceNotInt);
                $(this).val($(this).val().replace(replaceNotInt, "")); // 입력값을 정규식으로 필터링

                var x = $(this).val(); // 필터링 된 숫자값만 들어 있음. 
                if (x.length > 0) { // 숫자값 길이가 0이상일 경우 
                    $(this).css('border-color', 'green'); // 정상이기때문에 green 
                    if (x.match(replaceNotInt)) { // 중간에 한글 쓸수도 있으니, 다시 매치 
                        x = x.replace(replaceNotInt, ""); // 한글쓰면 지워짐 
                    }
                    $(this).val(x); // 숫자 value값에 다시 담음
                } else {
                    $(this).css('border-color', 'red');
                }
            });
        }
        // ------------------ /menu price 숫자만 입력 ---------------------


        // ------- 해시태그 10개 제한 및 특수문자/불분명한 한글 제한 -------
        let leng = 0;
        const $hashTag = $('.hashTag');

        $hashTag.on("keyup", function () {

            // 특수문자 정규식 변수(공백 미포함)
            var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;

            // 완성형 아닌 한글 정규식
            var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

            const splitThisVal = $(this).val().split(" "); // 공백기준으로 단어 리스트 생성
            // $(this).val($(this).val().replace(replaceChar,''));

            const cleanArr = splitThisVal.filter(Boolean);

            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }
                $(this).val(x);
            }
            if (cleanArr.length >= 11 && cleanArr.length) // 단어 10개 이상일 경우 
            {
                if (leng <= $hashTag.val().length + 1) // leng = 단어 10개 이하의 마지막 글자수가 현재 글자수보다 작으면  
                {
                    $hashTag.val($hashTag.val().substring(0, leng)); // 마지막 글자수를 다시 hashtag value에 담아줌 
                    $(this).css('border-color', 'red'); // 공백 추가 시 빨간 경고 
                } else
                    $(this).css('border-color', 'green');
            } else { // 단어 10개 이하는 
                leng = $(this).val().length; // 전역변수에 마지막 글자수 저장 
            }
        });
        // ------- /해시태그 10개 제한 및 특수문자/불분명한 한글 제한 -------
    </script>

    <script>
        // image file upload and dropzone 
        Dropzone.autoDiscover = false;

        const titleDropzone = new Dropzone("#title-dropzone.dropzone", {
            url: "/foodie/write",
            method: 'post',
            autoProcessQueue: false,
            clickable: true,
            createImageThumbnails: true,
            thumbnailHeight: 120, // Upload icon size
            thumbnailWidth: 300, // Upload icon size
            maxFiles: 1, // 업로드 파일수
            maxFilesize: 10, // 최대업로드용량 : 100MB
            paramName: 'titleImg', // 서버에서 사용할 formdata 이름 설정 (default는 file)
            addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
            dictRemoveFile: 'X', // 삭제버튼 표시 텍스트
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 

            init: function () {
                let myDropzone = this; // closure 변수 (화살표 함수 쓰지않게 주의)

                // 서버에 제출 submit 버튼 이벤트 등록
                document.querySelector('.save').addEventListener('click', function () {

                    // 거부된 파일이 있다면
                    if (myDropzone.getRejectedFiles().length > 0) {
                        let files = myDropzone.getRejectedFiles();
                        console.log('거부된 파일이 있습니다.', files);
                        return;
                    }

                    // myDropzone.processQueue(); // autoProcessQueue: false로 해주었기 때문에, 메소드 api로 파일을 서버로 제출
                });

                // 업로드한 파일을 서버에 요청하는 동안 호출 실행
                this.on('sending', function (file, xhr, formData) {
                    console.log('보내는중');
                });

                // 서버로 파일이 성공적으로 전송되면 실행
                this.on('success', function (file, responseText) {
                    console.log('성공');
                });

                // 업로드 에러 처리
                this.on('error', function (file, errorMessage) {
                    alert(errorMessage);
                });
            }
        });

        let overlapSet = new Set();
        const detailDropzone = new Dropzone("#detail-dropzone.dropzone", {
            url: "/foodie/write",
            method: 'post',
            autoProcessQueue: false, // 바로 서버로 보낼건지 
            clickable: true, // 클릭 가능여부 
            createImageThumbnails: true, //이미지 미리보기처리
            thumbnailWidth: 100, // Upload icon size
            thumbnailHeight: 100, // Upload icon size
            maxFiles: 5, // 업로드 파일수
            maxFilesize: 100, // 최대업로드용량 : 100MB
            addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
            dictRemoveFile: 'X', // 삭제버튼 표시 텍스트
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 
            parallelUploads: 5,
            uploadMultiple: true,
            init: function () {

                let myDropzone = this;

                document.querySelector('.save').addEventListener('click', function () {
                    const $detailInput = myDropzone.hiddenFileInput;
                    const $detailTag = document.querySelector('.hidden-detail-img');

                    const dataTranster = new DataTransfer();

                    for (const img of imgList) {
                        dataTranster.items.add(img);
                    }

                    $detailTag.files = dataTranster.files;
                });

                let count = 0;
                this.on('addedfiles', function (files) {
                    let overResult = '';

                    if (myDropzone.files.length > 5) {

                        for (const file of files) {
                            myDropzone.removeFile(file);
                        }
                        $('.detail-img-label').html(
                            'detail <b class="c-red detail-red">[ 이미지는 5개까지만 가능합니다. ]</b>');
                        setTimeout(function () {
                            $('.detail-red').remove();
                        }, 5000); // 5초동안만 경고 노출
                        return;

                    } else {
                        for (const setFile of overlapSet) {
                            for (const file of files) {
                                if (setFile === file.name) {
                                    overResult += file.name + ' ';
                                    myDropzone.removeFile(file);
                                }
                            }
                        }
                    }

                    if (overResult.length > 1) {
                        $('.detail-img-label').html(
                            'detail <b class="c-red detail-red">[ 중복된 파일은 ' + overResult +
                            '입니다.]</b>');

                        setTimeout(function () {
                            $('.detail-red').remove();
                        }, 5000);
                        return;

                    } else {
                        for (const file of files) {
                            overlapSet.add(file.name);
                        }
                        return;
                    }

                    for (const file of files) {
                        overlapSet.add(file.name);
                    }
                });

                myDropzone.on('removedfile', function (file) {
                    const overlapArr = [];
                    for (const dropFile of myDropzone.files) {
                        overlapArr.push(dropFile.name);
                    }
                    overlapSet = new Set(overlapArr);
                })
            }
        });

        addMenuImg(1);

        function addMenuImg(index) {
            let dropName = '.menu' + index;
            console.log('index : ', index);

            const menuDropzone = new Dropzone(dropName, {
                url: "/foodie/write",
                method: 'post',
                autoProcessQueue: false, // 바로 서버로 보낼건지 
                clickable: true, // 클릭 가능여부 
                createImageThumbnails: true, //이미지 미리보기처리
                thumbnailHeight: 80, // Upload icon size
                thumbnailWidth: 80, // Upload icon size
                maxFiles: 1, // 업로드 파일수
                maxFilesize: 100, // 최대업로드용량 : 100MB
                paramName: '', // 서버에서 사용할 formdata 이름 설정 (default는 file)
                addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
                dictRemoveFile: 'X', // 삭제버튼 표시 텍스트
                acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF', // 

                init: function () {
                    // 최초 dropzone 설정시 init을 통해 호출
                    console.log('최초 실행');
                    let myDropzone = this; // closure 변수 (화살표 함수 쓰지않게 주의)

                    // 서버에 제출 submit 버튼 이벤트 등록
                    document.querySelector('.save').addEventListener('click', function () {

                        // 거부된 파일이 있다면
                        if (myDropzone.getRejectedFiles().length > 0) {
                            let files = myDropzone.getRejectedFiles();
                            console.log('거부된 파일이 있습니다.', files);
                            return;
                        }

                    });

                    // 업로드한 파일을 서버에 요청하는 동안 호출 실행
                    this.on('sending', function (file, xhr, formData) {
                        console.log('보내는중');
                    });

                    // 서버로 파일이 성공적으로 전송되면 실행
                    this.on('success', function (file, responseText) {
                        console.log('성공');
                    });

                    // 업로드 에러 처리
                    this.on('error', function (file, errorMessage) {
                        alert(errorMessage);
                    });

                }
            });
        }

        // ------------------ 저장 ---------------------

        $('.save').on('click', e => {

            const $detailTag = document.querySelector('.hidden-detail-img');
            const dataTranster = new DataTransfer();

            imgList = [];

            for (const file of detailDropzone.files) {
                dataTranster.items.add(file);
                imgList.push(file);
            }

            $detailTag.files = dataTranster.files;

            if (!checkArr.includes(false)) {

                /* 오픈시간,마감시간 0000 형식으로 변경  */
                const $selectTimeList = document.querySelectorAll('.select-time');
                $selectTimeList.forEach(element => {
                    const replaceNotInt = /[^0-9]/gi;
                    element.value = element.value.replace(replaceNotInt, '');
                    console.log(element.value);
                });

                console.log("out save");

                $('#promotionWriteForm').submit();

            } else {
                alert("입력값을 확인해주세요.");

            }
        });
    </script>

    <!-- /jungah script -->




    <!-- 이미지 파일 검증 및 미리보기 화면 출력하는 스크립트 영역 -->
    <!-- <script>
        const $titleInput = document.getElementById('title-img');
        const $detailInput = document.getElementById('detail-img');

        // 메뉴는 좀 다르게 처리해야 함.. 같은 형식의 input 태그가 계속해서 생기기 때문!!


        const $detailPreviewHidden = document.getElementById('detail-preview');
        $detailPreviewHidden.nextElementSibling
        const $hiddenTitleBox = document.getElementById('hidden-title-box');
        const $hiddenDetailBox = document.getElementById('hidden-detail-box');
        // const $hiddenMenuBox = document.getElementById('hidden-menu-box');


        // 
        function makeMenuPreviewDOM(nowInput, fileNames) {


            for (let fileName of fileNames) {

                let originFileName = fileName.substring(fileName.lastIndexOf('_') + 1);


                // 비동기로 받아온 이미지 띄우는 로직
                const $img = $(nowInput).parent().next().find('img');
                $img.attr('src', '/loadFile?fileName=' + fileName);
                $img.attr('alt', originFileName);


                const $menuPreviewBox = $(nowInput).parent().next();
                $menuPreviewBox.css('display', 'block');


                // 히든 인풋 태그 value에 이미지 src값 넣어주기
                const cloneSrcVal = $img.attr('src');
                const hiddenMenuInput = $img.parent().parent().next().find('input');
                hiddenMenuInput.val(cloneSrcVal);
            }

        }


        // 메뉴 이미지 비동기 요청
        function ajaxMenuPreview(nowInput) {
            const formData = new FormData();

            const input = $(nowInput);

            for (let file of input[0].files) {
                formData.append('files', file);
            }


            const reqObj = {
                method: 'POST',
                body: formData
            };

            fetch('/ajax-upload', reqObj)
                .then(res => res.json())
                .then(fileNames => {
                    makeMenuPreviewDOM(input, fileNames);
                });

       
        }


        // 디테일 이미지 미리보기 화면 렌더링
        function makeDetailPreviewDOM(fileNames) {


            for (let fileName of fileNames) {

                let originFileName = fileName.substring(fileName.lastIndexOf('_') + 1);


                const newHiddenInput = document.createElement('input');
                newHiddenInput.setAttribute('type', 'hidden');
                newHiddenInput.setAttribute('value', fileName);
                newHiddenInput.setAttribute('name', 'detailImg');
                newHiddenInput.classList.add('hidden-detail-img');

                // 삽입!
                $hiddenDetailBox.appendChild(newHiddenInput);


                const $img = document.createElement('img');
                $img.classList.add('preview-detail-img');

                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);

                // const $detailPreviewHidden = document.getElementById('detail-preview');

                $detailPreviewHidden.parentElement.style.display = 'block';
                $detailPreviewHidden.appendChild($img);
            }
        }


        // 디테일 이미지 미리보기 비동기 요청
        function ajaxDetailPreview() {
            const formData = new FormData();

            for (let file of $detailInput.files) {
                console.log(file);
                formData.append('files', file);
            }


            const reqObj = {
                method: 'POST',
                body: formData
            };


            fetch('/ajax-upload', reqObj)
                .then(res => res.json())
                .then(fileNames => {
                    // isExistDetailPreviewDOM();
                    makeDetailPreviewDOM(fileNames);
                });
        }


        // 디테일 이미지 파일 개수 제한 처리
        function uploadingFileCountCheck(obj) {
            // console.log($(obj)[0].files.length);

            // 최대 업로드 가능 파일 개수
            let maxFileCnt = 5;

            const detailPreviewBox = document.querySelector('#detail-preview');

            // console.log(detailPreviewBox.children.length);

            if ($(obj)[0].files.length > maxFileCnt || [...detailPreviewBox.children].length >= maxFileCnt) {
                $(obj).val('');
                return false;
            } else {
                return true;
            }
        }

        function uploadingFileSizeCheck(obj) {
            let maxFileSize = 10 * 1024 * 1024; // 파일 최대 용량 10MB

            for (let file of $(obj)[0].files) {
                if (file.size > maxFileSize) {
                    $(obj).val('');
                    return false;
                } 
            }

            return true;
        }


        // 타이틀 이미지 미리보기 렌더링
        function makeTitlePreviewDOM(fileNames) {

            // 여기서 이미 들어간 히든 인풋을 지워주면 되나..?
            if ($hiddenTitleBox.children.length > 0) {
                for (let hiddenInput of [...$hiddenTitleBox.children]) {
                    $hiddenTitleBox.removeChild(hiddenInput);
                }
            }

            for (let fileName of fileNames) {

                let originFileName = fileName.substring(fileName.lastIndexOf('_') + 1);

                // 동기요청 처리시 hidden 타입인 input 창에 src = 풀경로, alt는 orgin파일명을 넣어줘서
                // form 태그를 활용해 post 요청을 보낸다.
                const $newHiddenInput = document.createElement('input');
                $newHiddenInput.setAttribute('type', 'hidden');
                $newHiddenInput.setAttribute('name', 'titleImg');
                $newHiddenInput.setAttribute('value', fileName);
                $newHiddenInput.classList.add('hidden-title-img');


                // form 태그에 삽입
                $hiddenTitleBox.appendChild($newHiddenInput);


                // 비동기로 받아온 이미지 띄우는 로직
                const $img = document.createElement('img');
                $img.classList.add('preview-title-img');

                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);

                const $titlePreviewHidden = document.getElementById('title-preview');

                if ($titlePreviewHidden.children.length > 0) {
                    $titlePreviewHidden.removeChild($titlePreviewHidden.firstElementChild);
                }

                $titlePreviewHidden.parentElement.style.display = 'block';
                $titlePreviewHidden.appendChild($img);

                const $xBtn = document.createElement('button');
                $xBtn.classList.add('xBtn');
            }
        }


        // 타이틀 이미지 미리보기 위한 비동기 요청
        function ajaxTitlePreview() {
            const formData = new FormData();

            for (let file of $titleInput.files) {
                formData.append('files', file);
            }


            const reqObj = {
                method: 'POST',
                body: formData
            };

            fetch('/ajax-upload', reqObj)
                .then(res => res.json())
                .then(fileNames => {
                    makeTitlePreviewDOM(fileNames);
                });
        }

        // 실행부
        $(document).on("change", "input[type='file']", function (file) {

            Dropzone.autoDiscover = false; 
            const dropzone = new Dropzone("input.dropzone", { 
            url: "/foodie/write",
            method: 'post',
            // ... 옵션
            });

         
            // var file_path = $(this).val();

            // file_path = file_path.toLowerCase();
         
     

            // var reg = /(.*?)\.(jpg|bmp|jpeg|png|gif)$/;

            // // 허용되지 않은 확장자일 경우

            // if (file_path != "" && (file_path.match(reg) == null || reg.test(file_path) == false)) {

            //     $(this).val("");

            //     alert("이미지 파일만 업로드 가능합니다.");

            //     $(this).parent().next().css('display', 'none');

            // } else {

            //     // 정상적인 이미지 확장자 파일인 경우 : 여기서 비동기 처리가 들어가야 한다.
            //     if (!uploadingFileSizeCheck($(this))) {
            //         alert('첨부파일 사이즈는 10MB 이내로 등록 가능합니다.');
            //         return;
            //     }


            //     // title 이미지 미리보기 비동기 처리
            //     if ($(this).hasClass('title')) {
            //         ajaxTitlePreview();
            //     }


            //     // detail 이미지 미리보기 비동기 처리
            //     if ($(this).hasClass('detail')) {
            //         // 파일 개수 검증이 들어가야 한다.
            //         if (uploadingFileCountCheck($(this))) { // 파일 개수 검증
            //                 ajaxDetailPreview();
            //             }
            //         else {
            //             alert('최대 5개의 이미지 파일만을 업로드 하실 수 있습니다.');
            //         }
            //     }


            //     // menu 이미지 미리보기 비동기 처리
            //     if ($(this).hasClass('menu')) {
            //         ajaxMenuPreview($(this));
            //     }
            
            // }
        });
    </script> -->




</body>

</html>
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
    <script src="/js/jquery-3.3.1.min.js"></script>
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
    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
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
        main {
            width: 80%;
            margin: 0 auto;
            padding-bottom: 50px;
        }

        /* header */
        header {

            position: absolute;

        }

        .main-menu>ul>li>a {
            color: #000;
        }

        ul#top_menu li a.login,
        ul#top_menu li {
            color: #000;
        }

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
            width: 33%;
            margin-left: 20px;
        }

        .add-Img-row .form-group:nth-child(2) {
            width: 60%;
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

        /* picker */
        .ui-timepicker-standard {
            font-family: none;
        }
    </style>


</head>


<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/header.jsp" %>

    <main>
        <form id="promotionWriteForm" action="/foodie/write" method="post" enctype="multipart/form-data">
            <div class="content-wrapper">
                <div class="container-fluid">
                    <!-- write title -->
                    <div class="box_general padding_bottom">
                        <div class="header_box version_2">
                            <h2><i class="fa fa-list"></i>
                                사장님 홍보글 작성 </h2>
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
                                        <input type="text" class="form-control" value="${master.storeCallNumber}"
                                            readonly>
                                    </div>
                                </div>
                                <div class="form-group detail-Info detail-address">
                                    <label>STORE ADDRESS
                                    </label>
                                    <input type="text" class="form-control" value="${master.storeAddress}" readonly>
                                </div>
                                <div class="form-group detail-Info">
                                    <label class="title-label">Title
                                    </label>
                                    <input type="text" class="form-control title" name="title"
                                        value="${master.storeName}" style="border-color:green">
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
                                    <input type="file" name="titleImgFile" class="dz-hidden-input hidden-title-img"
                                        accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                        style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                                </div>

                                <div class="form-group detail-group">
                                    <label class="detail-img-label">Detail</label>
                                    <div class="dropzone" id="detail-dropzone"></div>
                                    <input type="file" name="detailImgFiles" class="dz-hidden-input hidden-detail-img"
                                        multiple="multiple" accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF"
                                        tabindex="-1"
                                        style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                                </div>
                            </div>
                        </div>
                    </div>

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
                                                        <input type="text" name="menuName"
                                                            class="form-control menu-name" placeholder="메뉴명">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control menu-price"
                                                            name="menuPrice" placeholder="price">
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group delete-form">
                                                        <a class="delete" href="#"><i
                                                                class="fa fa-fw fa-remove"></i></a>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                </table>

                                <input type="file" name="menuImgFiles" class="dz-hidden-input hidden-menu-img"
                                    multiple="multiple" accept=".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF" tabindex="-1"
                                    style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
                            </div>

                        </div>
                        <!-- /add Menu List row -->

                        <div class="menu-add-btn">
                            <a href="#0" class="btn_1 gray add-pricing-list-item"><i
                                    class="fa fa-fw fa-plus-circle"></i>Add
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
                                                        <input type="text" class="form-control" placeholder="평일"
                                                            readonly>
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
                                                        <input type="text" class="form-control" placeholder="주말"
                                                            readonly>
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
                                                        <input type="text" name="closedDay"
                                                            class="form-control closedDay" placeholder="휴무 옵션 선택"
                                                            readonly>
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
                                                            <option vlaue="" selected>없음</option>
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

                        </div>
                        <!-- /row-->
                    </div>
                </div>
            </div>
            </div>
            <div class="col-md-12 save-btn">
                <button type="button" class="btn_1 medium save">Save</button>
                <button type="button" class="btn_1 medium cancel">Cancel</button></div>
        </form>
    </main>

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
        Dropzone.autoDiscover = false;

        const $titleTag = $('.title');
        const $hashTag = $('.hashTag');
        const $contentTag = $('.content');
        const menuItem = document.querySelectorAll('.row.menu-row');
        const $menuNameList = document.querySelectorAll(".menu-name");
        const $menuPriceList = document.querySelectorAll(".menu-price");

        // title , hashTag , content , menu , hashTag overlap , time  
        const checkArr = [false, false, false];

        let menuFileList = []; // img file list


        $(function () {
            selectClosedDay();
            inputOnlyIntType(); // first menu item price 
            limitHashTag(); // hash tag 글자수/단어 제한 
            checkSaveData(); // title , content , hashTag 
        });

        addMenuImg(1); // first menu item dropzone 처리
        addMenuItem();


        /* 휴무 요일 선택,제거,중복처리 */
        function selectClosedDay() {
            const $selectDay = $('.selectDay');
            const $closedDay = $('.closedDay');
            let resultSet = new Set();
            let resultList = [];

            $selectDay.on('change', function () {

                if ($selectDay.val() === '없음') {
                    resultSet.clear();
                    resultList = Array.from(resultSet);
                    $closedDay.val('');
                    return;
                }

                resultSet.add($selectDay.val());
                resultList = Array.from(resultSet);
                $closedDay.val(resultList.join())
                console.log(resultList);
            });

            $('.day-delete').on('click', function () {
                resultList = [];
                $closedDay.val('');
            });
        }



        /* 필수 입력 검증 */
        function checkSaveData() {

            // 제목
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


            // 해시태그
            $hashTag.on('keyup', function () {

                if ($hashTag.val().trim() === '') {
                    $hashTag.css('border-color', 'red');
                    $('.hashTag-label').html('HASH TAG <b class="c-red hashTag-red">[ 해시태그는 필수정보입니다. ]</b>');
                    checkArr[1] = false;
                } else {
                    $hashTag.css('border-color', 'green');
                    $('.hashTag-red').remove();
                    checkArr[1] = true;
                }
            });


            // 내용 
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
        }


        /* add menu item dom */
        function makeNewMenuItemDom() {
            var newElem = $('form-group').first().clone(); // 첫 item 복사 
            newElem.find('input').val('');
            newElem.appendTo('table#pricing-list-container');
        }

        /* add menu item delete */
        function deleteMenuItem() {
            $(document).on("click", "#pricing-list-container .delete", function (e) {
                e.preventDefault();
                $(this).parent().parent().parent().parent().parent().remove();
            });
        }

        /* add menu item */
        function addMenuItem() {
            let count = 1;

            // default 이미지 없는 메뉴는 기본이미지으로 대체하기 위해 default으로 비어있는 파일. 
            // 첫 menu item을 위해 push 
            menuFileList.push(new File(["default"], "default", {
                type: "image/png",
                name: "foodie_default.PNG"
            }));

            const par = $('table#pricing-list-container').first().find('.delete').remove(); // menu x버튼 클릭 시 line 삭제 

            if ($("table#pricing-list-container").is('*')) {

                $('.add-pricing-list-item').on('click', function (e) {

                    ++count; // 추가된 menuItem 마다 번호 부여하여 구분 하기위함.

                    const $container = $('#pricing-list-container');
                    e.preventDefault();
                    makeNewMenuItemDom();

                    $('.menu-row').last().find('.delete-form').append(
                        '<a class="delete' + ' menuDelete' + count + '"' +
                        ' href="#"><i class="fa fa-fw fa-remove"></i></a>')
                    $(this).css('border-colore', 'none'); // 처음 menuItem 제외하고 추가 시 delete 버튼 생성 


                    inputOnlyIntType(); // 추가된 menuItem에서 price 숫자검증 


                    // add menu item 이미지 리셋 
                    const $target = $('#pricing-list-container').last().find('.menu1').last();

                    $target.last().removeClass('dz-started');
                    $target.last().removeClass('dz-max-files-reached');
                    $target.last()[0].innerHTML = '';

                    $target.removeClass('menu1');
                    $target.addClass('menu' + count)


                    // 추가할 때마다 리스트에 비어있는 파일 추가 
                    menuFileList.push(new File(["default"], "default", {
                        type: "image/png",
                        name: "foodie_default.PNG"
                    }));
                    console.log("add : ", menuFileList);

                    addMenuImg(count); // menu item add imgs 

                });

                deleteMenuItem();

            }
        }


        /* menu price - 숫자만 입력  */
        function inputOnlyIntType() {
            var replaceNotInt = /[^0-9]/gi;

            const $menuPrice = $('.menu-price');

            $menuPrice.on("keyup", function () {

                $(this).val($(this).val().replace(replaceNotInt, ""));

                var x = $(this).val();
                if (x.length > 0) {
                    // $(this).css('border-color', 'green');
                    if (x.match(replaceNotInt)) {
                        x = x.replace(replaceNotInt, "");
                    }
                    $(this).val(x);
                } else {
                    // $(this).css('border-color', 'red');
                }
            });
        }


        /* 해시태그 10개 제한 및 특수문자/불분명한 한글 제한 */
        function limitHashTag() {
            let leng = 0;

            $hashTag.on("keyup", function () {

                var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;

                var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;

                const splitThisVal = $(this).val().split(" ");

                const cleanArr = splitThisVal.filter(Boolean);

                var x = $(this).val();
                if (x.length > 0) {
                    if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                        x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                    }
                    $(this).val(x);
                }
                if (cleanArr.length >= 11 && cleanArr.length) {
                    if (leng <= $hashTag.val().length + 1) {
                        $hashTag.val($hashTag.val().substring(0, leng));
                        $(this).css('border-color', 'red');
                    } else
                        $(this).css('border-color', 'green');
                } else {
                    leng = $(this).val().length;
                }
            });
        }



        // -------------- fiel upload and file dropzone --------------



        const titleDropzone = new Dropzone("#title-dropzone.dropzone", {
            url: "/foodie/write",
            method: 'post',
            autoProcessQueue: false,
            clickable: true,
            createImageThumbnails: true,
            thumbnailHeight: 120,
            thumbnailWidth: 300,
            maxFiles: 1,
            maxFilesize: 5,
            addRemoveLinks: true,
            dictRemoveFile: 'X',
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
        });

        let overlapSet = new Set();

        const detailDropzone = new Dropzone("#detail-dropzone.dropzone", {
            url: "/foodie/write",
            method: 'post',
            autoProcessQueue: false,
            clickable: true,
            createImageThumbnails: true,
            thumbnailWidth: 100,
            thumbnailHeight: 100,
            maxFiles: 5,
            maxFilesize: 2,
            addRemoveLinks: true,
            dictRemoveFile: 'X',
            acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
            parallelUploads: 5,
            uploadMultiple: true,
            init: function () {

                let myDropzone = this;

                // dorpzone은 파일을 올릴 때마다 기존 파일들은 삭제되고 새로운 file list가 생성 
                this.on('addedfiles', function (files) { // detail - menu 추가시  
                    let overResult = ''; // 중북된 파일 경고문구

                    if (myDropzone.files.length > 5) { // detail - img 5개 제한 

                        for (const file of files) {
                            myDropzone.removeFile(file); // 5개 이상일 경우 자동 삭제 
                        }
                        $('.detail-img-label').html(
                            'detail <b class="c-red detail-red">[ 이미지는 5개까지만 가능합니다. ]</b>');
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
                        $('.detail-img-label').html(
                            'detail <b class="c-red detail-red">[ 중복된 파일은 ' + overResult +
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

        function addMenuImg(index) { // 추가된 menu item dropzone 처리 
            let dropName = '.menu' + index;
            let deleteName = '.menuDelete' + index;
            const menuDropzone = new Dropzone(dropName, {
                url: "/foodie/write",
                method: 'post',
                autoProcessQueue: false,
                clickable: true,
                createImageThumbnails: true,
                thumbnailHeight: 80,
                thumbnailWidth: 80,
                maxFiles: 1,
                maxFilesize: 5,
                addRemoveLinks: true,
                dictRemoveFile: 'X',
                acceptedFiles: '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',

                init: function () {
                    let myDropzone = this;
                    this.on('addedfile', function (file) { // menu item 추가 시 
                        menuFileList[index - 1] = file;
                        console.log("add : ", menuFileList);
                    });

                    $(deleteName).on('click', function (e) { // menu item 삭제 시 
                        delete menuFileList[index - 1];
                        --index;
                        console.log("delete : ", menuFileList);
                    });

                    myDropzone.on('removedfile', function (file) { // menu img 삭제 시 

                        for (const menu of menuFileList) {
                            if ((menu != null) && (menu.name === file.name)) {
                                menuFileList[index - 1] = new File(["default"], "default", {
                                    type: "image/png",
                                    name: "foodie_default.PNG"
                                });
                                console.log("remove : ", menuFileList);
                            }
                        }
                    })
                }
            });

            return menuDropzone;
        }

        // -------------- // fiel upload and file dropzone --------------


        $('.save').on('click', e => {

            AddFileList();
            if (!checkArr.includes(false)) { // title , hashTag , content 필수 입력 

                // let checkSave = [false, false, false];
                let checkSave = [false, false];

                checkSave[0] = checkMenuInput(); // 메뉴명만 입력했을 경우 , 메뉴가격만 입력했을 경우 검증
                checkSave[1] = checkOverlapHashTag(); // 해시태그 중복 검증 
                // checkSave[2] = checkInputTime(); // 시간 입력 검증 

                console.log("checkSave : ", checkSave);
                if (!checkSave.includes(false)) {
                    // changeFormatTime(); // 시간 00:00으로 변환
                    changeFormatContent() // 내용 \n -> <br>으로 치환

                    $('#promotionWriteForm').submit();
                }

            } else {
                alert("입력란을 확인해주세요.");

            }
        });

        function AddFileList() {
            // 이미지 file 변환 및 form 태그 내 input에 추가. 
            // form 내 input hidden files 속성에 file list를 넣으려면 dataTransfer 변환 필요  

            const $detailHiddenTag = document.querySelector('.hidden-detail-img');
            const $titleHiddenTag = document.querySelector('.hidden-title-img');
            const $menuHiddenTag = document.querySelector('.hidden-menu-img');

            const detailDataTranster = new DataTransfer();
            const titleDataTraster = new DataTransfer();
            const menuDataTraster = new DataTransfer();


            if ($menuPriceList[0].value.length === 0 || $menuNameList[0].value.leng === 0) {
                menuFileList = [];
            }

            if (menuFileList.length > 0) {
                for (const menuFile of menuFileList) {
                    if (menuFile != null) {
                        menuDataTraster.items.add(menuFile);
                    }
                }
                console.log("menuDataTraster : ", menuFileList);
                $menuHiddenTag.files = menuDataTraster.files;
            }

            if (titleDropzone.files.length > 0) {
                titleDataTraster.items.add(titleDropzone.files[0]);
                $titleHiddenTag.files = titleDataTraster.files;

            } else {
                alert("title 이미지는 필수입니다.");
                return;
            }

            if (detailDropzone.files.length > 0) {
                for (const detailFile of detailDropzone.files) {
                    detailDataTranster.items.add(detailFile);
                }
                $detailHiddenTag.files = detailDataTranster.files;

            }
        }

        // 메뉴명만 입력했을 경우 , 메뉴가격만 입력했을 경우 검증
        function checkMenuInput() {

            /* 
            1. menu item 1개 
                - input값 없으면 = true
                - name만 입력하면 = false
                - price만 입력하면 = false
                - 사진만 있으면 = false

            2. menu item 2개 이상
                - input값 없으면 = false
            */
            if (menuItem.length === 1) {

                if ($menuNameList[0].value.length === 0 && $menuPriceList[0].value.length === 0) {
                    if (menuFileList.length > 0 && menuFileList[0].name != 'default') {
                        alert("사진 등록 시 메뉴를 꼭 입력해주세요.");
                        return false;
                    }

                    return true;
                }

                if ($menuNameList[0].value.length === 0 || $menuPriceList[0].value.length === 0) {
                    alert("메뉴 입력란을 확인해주세요.");
                    return false;
                }

                return true;
            }


            if (menuItem.length > 1) {
                for (let index = 0; index < $menuNameList.length; index++) {

                    if ($menuPriceList[index].value.length === 0 || $menuNameList[index].value.leng === 0) {
                        alert("메뉴 입력란 추가시 메뉴 입력은 필수입니다.");
                        return false;
                    }

                    if ($menuNameList[0].value.length === 0 || $menuPriceList[0].value.length === 0) {
                        alert("메뉴 입력란을 확인해주세요.");
                        return false;
                    }
                }
                return true;
            }
        }

        // 해시태그 중복 확인
        function checkOverlapHashTag() {

            const hashTagList = $hashTag.val().split(' ');
            console.log(hashTagList);

            for (let i = 0; i < hashTagList.length; i++) {
                const tag = hashTagList[i];
                for (let index = i + 1; index < hashTagList.length; index++) {
                    console.log(tag, "vs", hashTagList[index]);
                    if (tag === hashTagList[index]) {
                        alert("해시태그에 중복된 단어가 있습니다. 다시 입력해주세요.")
                        return false;
                    }
                }
            }
            return true;
        }

        // store time check 
        function checkInputTime() {
            const timeList = document.querySelectorAll('.select-time')
            let checkTimeList = [];
            for (const time of timeList) {
                if (time.value.includes("00:00")) {
                    checkTimeList.push(true);
                }
            }

            if (checkTimeList.includes(true)) {
                alert("시간은 필수 입력입니다.")
                return false;
            }

            return true;

        }


        // 시간 00:00으로 변환 
        function changeFormatTime() {
            const $selectTimeList = document.querySelectorAll('.select-time');
            $selectTimeList.forEach(element => {

                console.log(element.value);
                if (element.value.includes("am")) {
                    element.value = element.value.replace(' am', '');
                } else if (element.value.includes("pm")) {
                    element.value = element.value.replace(' pm', '');
                }
            });
        }

        // 내용 \n -> <br>으로 변환
        function changeFormatContent() {
            const content = $contentTag.val().replace(/\n/gi, "<br>");
            $contentTag.val(content)
        }
    </script>
</body>

</html>
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
    <link href="/vendor/dropzone.css" rel="stylesheet">
    <link href="/css/date_picker.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link href="/css/custom.css" rel="stylesheet">
    <!-- WYSIWYG Editor -->
    <link rel="stylesheet" href="/js/editor/summernote-bs4.css">

    <!-- time picker : 시간/날짜 api -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

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

        .menu-add-img {
            width: 80px;
            min-height: 80px;
        }

        /* add detail , title img  */

        .header_box.version_2 {
            border-bottom: 0;
        }

        .add-Img {
            min-height: 0;
            width: 50%;
            height: 100px;
        }

        .add-Img-row {
            display: flex;
            justify-content: space-between;
            height: 300px;
        }

        .save-btn {
            display: flex;
            justify-content: center;
        }

        .preview {
            width: 100%;
            display: none;
        }

        .detail-preview {
            display: flex;
            justify-content: space-evenly;
        }

        .preview-title-img {
            width: 100%;
            height: 150px;
        }

        .preview-detail-img {
            width: 15%;
            height: 150px;

        }

        .menu-preview {}

        .preview-menu-img {
            width: 50px;
            height: 50px;
        }
    </style>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
    <form id="promotionWriteForm" action="/foodie/write" enctype="multipart/form-data">
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
                                <input type="text" class="form-control" value="${master.storeAddress}" readonly>
                            </div>
                            <div class="form-group detail-Info">
                                <label>Title
                                </label>
                                <input type="text" class="form-control" name="title" value="${master.storeName}">
                            </div>
                            <div class="form-group detail-Info">
                                <div class="form-group">
                                    <label>HASH TAG</label>
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
                                <label>CONTENT</label>
                                <div class="editor content"></div>
                            </div>
                        </div>
                    </div>
                    <!-- /CONTENT editor -->


                    <!-- add detail , title img row -->
                    <div class="box_general padding_bottom add-Img-row">
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

                    </div>
                    <!-- /add detail , title img row -->

                    <!-- add Menu List -->
                    <div class="box_general padding_bottom menuImg">
                        <div class="header_box version_2">
                            <h2><i class="fa fa-list"></i>Add item to Menu List</h2>
                        </div>
                        <!-- add Menu List row -->
                        <div class="row">
                            <div class="col-md-12">
                                <h6>Item</h6>
                                <table id="pricing-list-container" style="width:100%;">
                                    <tr class="pricing-list-item">
                                        <td>
                                            <div class="row menu-row">
                                                <div class="col-md-2 menu-add-img">
                                                    <div class="form-group">
                                                        <label>Menu-Photos</label>
                                                        <div>
                                                            <input type="file" class="menu"
                                                                accept="image/gif, image/jpeg, image/png, image/bmp"></input>
                                                        </div>
                                                        <div class="preview"><span>미리보기</span>
                                                            <div class="menu-preview"></div>
                                                        </div>
                                                        <div class="hidden-menu-box"></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control menu-name"
                                                            placeholder="메뉴명">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control menu-price" name="price"
                                                            placeholder="price">
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
                            <a href="#0" class="btn_1 gray add-pricing-list-item"><i
                                    class="fa fa-fw fa-plus-circle"></i>Add
                                Item</a>
                        </div>
                        <div id="hidden-menu-box"></div>
                        <script>
                            /* 
                                <div class="col-md-1">
                                                                                    <div class="form-group">
                                                                                        <a class="delete" href="#"><i
                                                                                                class="fa fa-fw fa-remove"></i></a>
                                                                                    </div>
                                                                                </div>

                                */


                            // Pricing add
                            function newMenuItem() {
                                var newElem = $('form-group ').first().clone();
                                newElem.find('input').val('');
                                newElem.appendTo('table#pricing-list-container');
                            }

                            if ($("table#pricing-list-container").is('*')) {
                                $('.add-pricing-list-item').on('click', function (e) {
                                    e.preventDefault();
                                    newMenuItem();
                                    $('#pricing-list-container:not(:first-child)').children.children.append(
                                        ' <div class="col-md-1"> <div class="form-group"> <a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a></div></div>'
                                    );
                                });
                                $(document).on("click", "#pricing-list-container .delete", function (e) {
                                    e.preventDefault();
                                    $(this).parent().parent().parent().parent().parent().remove();
                                });
                            }
                        </script>
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
                                                        <input name="weekday-openTime" type="text"
                                                            class="form-control select-time weekday-openTime">
                                                    </div>

                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input name="weekday-closeTime" type="text"
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
                                                        <input name="weekend-openTime" type="text"
                                                            class="form-control select-time" placeholder="오픈시간입력">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input name="weekend-closeTime" type="text"
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
                                                        <input type="text" class="form-control" placeholder="Brake Time"
                                                            readonly>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input name="brake-startTime" type="text"
                                                            class="form-control select-time" placeholder="시작시간">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input name="brake-endTime" type="text"
                                                            class="form-control select-time" placeholder="종료시간">
                                                    </div>
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
                                                <input type="text" class="form-control" placeholder="휴무" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="예시 : 화요일 (요일입력)">
                                            </div>
                                        </div>
                                    </div>
                                </td>
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
        <div class="col-md-12 save-btn"><a href="#0" class="btn_1 medium">Save</a></div>
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
        // 검증 - 가격 숫자만 입력되도록. 한글 입력할 경우 제한 

        // 숫자가 아닌 정규식 -----------------------------------------------------------------------
        var replaceNotInt = /[^0-9]/gi;
        const $menuPrice = $('.menu-price');

        $menuPrice.on("keyup", function () {
            console.log(replaceNotInt);
            $(this).val($(this).val().replace(replaceNotInt, "")); // 입력값을 정규식으로 필터링

            var x = $(this).val(); // 필터링 된 숫자값만 들어 있음. 
            if (x.length > 0) { // 숫자값 길이가 0이상일 경우 
                $menuPrice.css('border-color', 'green'); // 정상이기때문에 green 
                if (x.match(replaceNotInt)) { // 중간에 한글 쓸수도 있으니, 다시 매치 
                    x = x.replace(replaceNotInt, ""); // 한글쓰면 지워짐 
                }
                $(this).val(x); // 숫자 value값에 다시 담음
            } else {
                $menuPrice.css('border-color', 'red'); // 한글은 길이가 0이기때문에, red 
            }
        });


        // hasTag 10개 이상 제한 -----------------------------------------------------------------------
        let leng = 0;
        const $hashTag = $('.hashTag');

        $hashTag.on("keyup", function () {

            const splitThisVal = $(this).val().split(" "); // 공백기준으로 단어 리스트 생성

            if (splitThisVal.length >= 10) // 단어 10개 이상일 경우 
            {
                if (leng <= $hashTag.val().length + 1) // leng = 단어 10개 이하의 마지막 글자수가 현재 글자수보다 작으면  
                {
                    $hashTag.val($hashTag.val().substring(0, leng)); // 마지막 글자수를 다시 hashtag value에 담아줌 
                    $(this).css('border-color', 'red'); // 공백 추가 시 빨간 경고 
                } else
                    $(this).css('border-color', 'green');
            } else { // 단어 10개 이하는 
                leng = $(this).val().length; // 전역변수에 마지막 글자수 저장 
                $(this).css('border-color', 'green');
            }
        });
        const $weekdayOpenTime = document.querySelector('.weekday-openTime');
        var result = $weekdayOpenTime.value.replace(replaceNotInt, "");
        console.log(result);
    </script>




    <!-- 이미지 파일 검증 및 미리보기 화면 출력하는 스크립트 영역 -->
    <script>
        const $titleInput = document.getElementById('title-img');
        const $detailInput = document.getElementById('detail-img');

        // 메뉴는 좀 다르게 처리해야 함.. 같은 형식의 input 태그가 계속해서 생기기 때문!!


        const $detailPreviewHidden = document.getElementById('detail-preview');
        const $hiddenTitleBox = document.getElementById('hidden-title-box');
        const $hiddenDetailBox = document.getElementById('hidden-detail-box');
        // const $hiddenMenuBox = document.getElementById('hidden-menu-box');


        function makeMenuPreviewDOM(nowInput, fileNames) {

            // 이미 존재하는 hidden input 태그가 있다면 지우자
            // console.log($(nowInput).parent().next().next().children().length);
            const $nowMenuHiddenBox = $(nowInput).parent().next().next();

            if ($nowMenuHiddenBox.children().length > 0) {
                for (let hiddenInput of [...$nowMenuHiddenBox.children()]) {
                    $nowMenuHiddenBox.remove(hiddenInput);
                }
            }


            for (let fileName of fileNames) {

                let originFileName = fileName.substring(fileName.lastIndexOf('_') + 1);

                // 동기요청 처리시 hidden 타입인 input 창에 src = 풀경로, alt는 orgin파일명을 넣어줘서
                // form 태그를 활용해 post 요청을 보낸다.
                const $newHiddenInput = document.createElement('input');
                $newHiddenInput.setAttribute('type', 'hidden');
                $newHiddenInput.setAttribute('name', 'menuImg');
                $newHiddenInput.setAttribute('value', fileName);
                $newHiddenInput.classList.add('hidden-menu-img');


                // form 태그에 삽입
                $(nowInput).parent().next().next().append($newHiddenInput);


                // 비동기로 받아온 이미지 띄우는 로직
                const $img = document.createElement('img');
                $img.classList.add('preview-menu-img');

                $img.setAttribute('src', '/loadFile?fileName=' + fileName);
                $img.setAttribute('alt', originFileName);


                const $menuPreviewHidden = $(nowInput).parent().next().first();
                console.log($menuPreviewHidden);

                console.log($menuPreviewHidden.children().length);

                
                if ($menuPreviewHidden.children().length > 0) {
                    console.log($menuPreviewHidden.children().length);
                    $menuPreviewHidden.remove($menuPreviewHidden.first());
                }

                $menuPreviewHidden.css('display', 'block');
                $menuPreviewHidden.append($img);
            }

        }


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



        function isExistDetailPreviewDOM() {
            // console.log($detailPreviewHidden.children.length);

            if ($detailPreviewHidden.children.length > 0) {

                // console.log($detailPreviewHidden.children);


                for (let $img of [...$detailPreviewHidden.children]) {

                    // console.log($detailPreviewHidden.children.length);
                    $detailPreviewHidden.removeChild($img);
                }
            }
        }


        function makeDetailPreviewDOM(fileNames) {

            // 이미 존재하는 hidden 속성의 input 태그를 지우자.
            if ($hiddenDetailBox.children.length > 0) {
                for (let hiddenInput of [...$hiddenDetailBox.children]) {
                    $hiddenDetailBox.removeChild(hiddenInput);
                }
            }


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



        function ajaxDetailPreview() {
            const formData = new FormData();

            for (let file of $detailInput.files) {
                formData.append('files', file);
            }



            const reqObj = {
                method: 'POST',
                body: formData
            };

            fetch('/ajax-upload', reqObj)
                .then(res => res.json())
                .then(fileNames => {
                    isExistDetailPreviewDOM();
                    makeDetailPreviewDOM(fileNames);
                });
        }


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
            }
        }


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
        $(document).on("change", "input[type='file']", function () {

            var file_path = $(this).val();

            file_path = file_path.toLowerCase();

            var reg = /(.*?)\.(jpg|bmp|jpeg|png|gif)$/;

            // 허용되지 않은 확장자일 경우

            if (file_path != "" && (file_path.match(reg) == null || reg.test(file_path) == false)) {

                $(this).val("");

                alert("이미지 파일만 업로드 가능합니다.");

                $(this).parent().next().css('display', 'none');

            } else {

                // 정상적인 이미지 확장자 파일인 경우 : 여기서 비동기 처리가 들어가야 한다.


                // title 이미지 미리보기 비동기 처리
                if ($(this).hasClass('title')) {
                    ajaxTitlePreview();
                }


                // detail 이미지 미리보기 비동기 처리
                if ($(this).hasClass('detail')) {
                    ajaxDetailPreview();
                }


                // menu 이미지 미리보기 비동기 처리
                if ($(this).hasClass('menu')) {
                    const $nowInput = $(this);
                    ajaxMenuPreview($nowInput);
                }
            }
        });
    </script>

</body>

</html>
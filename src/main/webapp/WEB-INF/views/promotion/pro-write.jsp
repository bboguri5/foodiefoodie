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
            display: none;
        }
    </style>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
    <form action="" enctype="multipart/form-data">
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
                                    <input type="text" class="form-control" name="hashTag"
                                        placeholder="예시 : #비비 #미미 (띄어쓰기 필수)">
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
                                            <input type="file" name="titleImg" id="title-img"
                                                accept="image/gif, image/jpeg, image/png"
                                                onchange="titleFileTypeCheck(this)"></input>
                                        </div>
                                        <div class="preview"><span>미리보기</span>
                                            <div id="title-preview"></div>
                                        </div>
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
                                            <input type="file" name="detailImgList" id="detail-img" multiple
                                                accept="image/gif, image/jpeg, image/png"
                                                onchange="detailFileTypeCheck(this)"></input>
                                        </div>
                                        <div class="preview multiple"><span>미리보기</span>
                                            <div id="detail-preview"></div>
                                        </div>
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
                                                    <form action="/file-upload"
                                                        class="dropzone dz-clickable menu-add-img">
                                                        <div class="dz-default dz-message"><span>+</span></div>
                                                    </form>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control menu-name" name="menu"
                                                            placeholder="메뉴명">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control menu-price" name="price"
                                                            placeholder="price">
                                                    </div>
                                                </div>
                                                <div class="col-md-1">
                                                    <div class="form-group">
                                                        <a class="delete" href="#"><i
                                                                class="fa fa-fw fa-remove"></i></a>
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
                        <script>
                            // Pricing add
                            function newMenuItem() {
                                var newElem = $('form-group add-menu').first().clone();
                                newElem.find('input').val('');
                                newElem.appendTo('table#pricing-list-container');
                            }
                            if ($("table#pricing-list-container").is('*')) {
                                $('.add-pricing-list-item').on('click', function (e) {
                                    e.preventDefault();
                                    newMenuItem();
                                });
                                $(document).on("click", "#pricing-list-container .delete", function (e) {
                                    e.preventDefault();
                                    $(this).parent().parent().parent().remove();
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

        // 숫자가 아닌 정규식
        var replaceNotInt = /[^0-9]/gi;
        const $menuPrice = $('.menu-price');

        $menuPrice.on("keyup", function () {
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


        const $weekdayOpenTime = document.querySelector('.weekday-openTime');

        var result = $weekdayOpenTime.value.replace(replaceNotInt, "");
        console.log(result);
    </script>



    <!-- 이미지 파일만 올리도록 처리할 스크립트 영역 -->
    <!-- 여기서 이미지 태그에 정상적인 이미지를 올렸는지 체크하는 배열을 사용하기 때문에 
        필수 작성 요소(제목 등)를 여기서 체크해야 할거 같아요! -->
    <script>

        function makeTitlePreviewDOM(fileNames) {

            for (let fileName of fileNames) {
                
                let originFileName = fileName.substring(fileName.lastIndexOf('_') + 1);

                const $img = document.createElement('img');
                $img.classList.add('preview-title-img');

                $img.setAttribute('src', '/loadFile?fileName=' + fileName); 
                $img.setAttribute('alt', originFileName);

                document.getElementById('title-preview').appendChild($img);
            }

        }


        // 0번 인덱스 : 타이틀 이미지 확장자 체크, 1번 인덱스 : 디테일 이미지들 확장자 체크
        const inputImgCheckArr = [false, false];


        function titleFileTypeCheck(obj) {

            pathpoint = obj.value.lastIndexOf('.');

            filepoint = obj.value.substring(pathpoint + 1, obj.length);

            filetype = filepoint.toLowerCase();

            const $titleInput = document.getElementById('title-img');

            if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg') {

                // 정상적인 이미지 확장자 파일인 경우 : 여기서 비동기 처리가 들어가야 한다.

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
                    })


                checkArr[0] = true;

            } else {

                alert('이미지 파일만 첨부하실 수 있습니다! (사용 가능 확장자 : JPG, JPEG, GIF, PNG)');

                parentObj = obj.parentNode

                node = parentObj.replaceChild(obj.cloneNode(true), obj);

                

                const files = $titleInput.files;
                // console.log(files);


                return false;

            }
        }


        function detailFileTypeCheck(obj) {

            pathpoint = obj.value.lastIndexOf('.');

            filepoint = obj.value.substring(pathpoint + 1, obj.length);

            filetype = filepoint.toLowerCase();

            if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg') {

                // 정상적인 이미지 확장자 파일인 경우 : 여기서 비동기 처리가 들어가야 한다.

                

                fetch('/ajax/upload', reqObj)



                checkArr[1] = true;

            } else {

                alert('이미지 파일만 첨부하실 수 있습니다! (사용 가능 확장자 : JPG, JPEG, GIF, PNG)');

                parentObj = obj.parentNode

                node = parentObj.replaceChild(obj.cloneNode(true), obj);

                const $detailInput = document.getElementById('detail-img');

                const files = $detailInput.files;
                console.log(files);
                
                return false;

            }
        }
    </script>

</body>

</html>
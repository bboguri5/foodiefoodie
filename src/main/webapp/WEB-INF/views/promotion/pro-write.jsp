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
    </style>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

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
                    <!-- map 으로 만들어서 뿌리자 -> 사업자번호 / 가게명 / 대표자 / 카테고리 / 오픈일자 / 식당주소 / 핫딜여부 / 식당 연락처-->
                    <!-- jstl - foreach문 돌릴 예정  -->
                    <div class="col-md-6 master-detail">
                        <input type="text" class="" hidden>
                        <div class="row-form">
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
                            <div class="form-group">
                                <label>HASH TAG</label>
                                <input type="text" class="form-control" placeholder="예시 : #비비 #미미 (띄어쓰기 필수)">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /detail info -->



                <!-- editor -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>CONTENT</label>
                            <div class="editor"></div>
                        </div>
                    </div>
                </div>
                <!-- /editor -->


                <!-- add detail , title img row -->
                <div class="box_general padding_bottom add-Img-row">
                    <div class="header_box version_2 add-Img">
                        <h2><i class="fa fa-list"></i>Title Image Add</h2>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Photos</label>
                                    <form action="/file-upload" class="dropzone dz-clickable ">
                                        <div class="dz-default dz-message"><span>Drop files here to upload</span></div>
                                    </form>
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
                                    <form action="/file-upload" class="dropzone dz-clickable">
                                        <div class="dz-default dz-message"><span>Drop files here to upload</span></div>
                                    </form>
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
                                                <form action="/file-upload" class="dropzone dz-clickable menu-add-img">
                                                    <div class="dz-default dz-message"><span>+</span></div>
                                                </form>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="menu"
                                                        placeholder="메뉴명">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="가격">
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <div class="form-group">
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
                    <script>
                        // Pricing add
                        function newMenuItem() {
                            console.log("??");
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

                <label for="time">시간 선택</label>
                <input type="text" id="weekday-openTime" name="time1" class="form-control" style="width:200px;">
                <script>
                    $(function () {
                        $("#weekday-openTime").timepicker({
                            timeFormat: 'h:mm p',
                            interval: 60,
                            minTime: '10',
                            maxTime: '6:00pm',
                            defaultTime: '11',
                            startTime: '10:00',
                            dynamic: false,
                            dropdown: true,
                            scrollbar: true
                        });
                    });
                </script>

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
                                                    <input id="time1" type="text" class="form-control">
                                                </div>
                                                <script>
                                                    $("#time1").timepicker({
                                                        timeFormat: 'h:mm p',
                                                        interval: 60,
                                                        minTime: '10',
                                                        maxTime: '6:00pm',
                                                        defaultTime: '11',
                                                        startTime: '10:00',
                                                        dynamic: false,
                                                        dropdown: true,
                                                        scrollbar: true
                                                    });
                                                </script>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="마감시간입력">
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
                                                    <input type="text" class="form-control" placeholder="오픈시간입력">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="마감시간입력">
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
                                                    <input type="text" class="form-control" placeholder="시작시간">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="종료시간">
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

                </div>
                <!-- /row-->
            </div>
        </div>

    </div>
    <div class="col-md-12 save-btn"><a href="#0" class="btn_1 medium">Save</a></div>
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
</body>

</html>
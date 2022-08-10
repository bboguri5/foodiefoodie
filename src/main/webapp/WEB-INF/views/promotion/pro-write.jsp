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


    <style>

        /* detail info */
        .content-wrapper {
            margin: 30px;
        }

        .col-md-6.master-detail {
            flex: 100%;
            max-width: 100%;
        }

        /* add menu */
        .form-group.add-menu {
            display: flex;
            justify-content: space-between;
        }

        .dropzone.dz-clickable.add-Menu-Img {
            min-height: 0;
            min-width: 80px;
            height: 80px;
        }

        .col-md-8.menu-Input-Width {
            flex: 0 0 50%;
            max-width: 50%;
        }
        .col-md-4.menu-Input-Width {
            flex: 0 0 50%;
            max-width: 50%;
        }

        .addMenuBtn
        {
            margin-left: 46.5%;
        }

        /* add detail , title img  */
        .row-form {
            display: flex;
            justify-content: space-between;
        }

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
                    <h2><i class="fa fa-file"></i>홍보글 작성</h2>
                </div>
                <div class="row">
                    <!-- map 으로 만들어서 뿌리자 -> 사업자번호 / 가게명 / 대표자 / 카테고리 / 오픈일자 / 식당주소 / 핫딜여부 / 식당 연락처-->
                    <!-- jstl - foreach문 돌릴 예정  -->
                    <div class="col-md-6 master-detail">
                        <input type="text" class="" hidden>
                        <div class="row-form">
                            <div class="form-group detail-Info">
                                <label>가게명
                                </label>
                                <input type="text" class="form-control" value="${master.storeName}" readonly>
                            </div>
                            <div class="form-group detail-Info">
                                <label>대표자
                                </label>
                                <input type="text" class="form-control" value="${master.masterName}" readonly>
                            </div>
                            <div class="form-group detail-Info">
                                <label>식당연락처
                                </label>
                                <input type="text" class="form-control" value="${master.storeCallNumber}" readonly>
                            </div>
                        </div>
                        <div class="form-group detail-Info detail-address">
                            <label>식당주소
                            </label>
                            <input type="text" class="form-control" value="${master.storeAddress}" readonly>
                        </div>
                        <div class="form-group detail-Info">
                            <div class="form-group">
                                <label>해시태그</label>
                                <input type="text" class="form-control" placeholder="예시 : #비비 #미미 (띄어쓰기 필수)">
                            </div>
                        </div>
                    </div>
                </div>



                <!-- /row-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Description</label>
                            <div class="editor"></div>
                        </div>
                    </div>
                </div>
                <!-- add detail , title img row -->
                <div class="box_general padding_bottom add-Img-row">
                    <div class="header_box version_2 add-Img">
                        <h2><i class="fa fa-list"></i>타이틀 이미지 추가</h2>
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
                        <h2><i class="fa fa-list"></i>상세 이미지 추가</h2>
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

                <!-- add Menu List row -->
                <div class="box_general padding_bottom menuImg">
                    <div class="header_box version_2">
                        <h2><i class="fa fa-list"></i>Add item to Menu List</h2>
                    </div>
                        <div class="row">
                            <div class="form-group add-menu">
                                    <form action="/file-upload" class="dropzone dz-clickable add-Menu-Img">
                                        <div class="dz-default dz-message"><span>+</span></div>
                                    </form>
                                    <div class="col-md-2">
                                        <label class="fix_spacing">메뉴명</label>
                                    </div>
                                    <div class="col-md-5 menu-Input-Width">
                                        <div class="form-group">
                                            <input type="text" name="menu_item_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <label class="fix_spacing">가격</label>
                                    </div>
                                    <div class="col-md-5 menu-Input-Width">
                                        <div class="form-group">
                                            <input type="text" name="menu_item_title_price" class="form-control">
                                        </div>
                                    </div>
                                    </div>
                        </div><!-- End row -->
                    <button class="addMenuBtn btn_1 medium"> + </button>
                </div>

            <!-- /add Menu List -->
            
               <!-- /box_general-->
        <div class="box_general padding_bottom">
            <div class="header_box version_2">
                <h2><i class="fa fa-clock-o"></i>Opening</h2>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <label class="fix_spacing">Monday</label>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                       
                    </div>
                </div>
            </div>
            <!-- /row-->
        </div>
            
            </div>

        </div>

     
        <!-- /box_general-->
        <div class="box_general padding_bottom">
            <div class="header_box version_2">
                <h2><i class="fa fa-dollar"></i>Pricing</h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h6>Item</h6>
                    <table id="pricing-list-container" style="width:100%;">
                        <tr class="pricing-list-item">
                            <td>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Title">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Description">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Price">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>Add
                        Item</a>
                </div>
            </div>
            <!-- /row-->
        </div>
        <!-- /box_general-->
        <p><a href="#0" class="btn_1 medium">Save</a></p>
    </div>
    <!-- /.container-fluid-->
    </div>
    <!-- /.container-wrapper-->
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
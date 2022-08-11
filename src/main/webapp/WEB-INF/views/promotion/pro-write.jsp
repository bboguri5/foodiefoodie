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

                        <form action="/foodie/write" method="post">
                            <input type="text" name="businessNo" value="${master.businessNo}" hidden>
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
                                        placeholder="예시 : #비비 #미미 (띄어쓰기 필수)" value="">
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
                                    <button type="text">파일선택(1개)</button>
                                    <div class="dropzone dz-clickable"><span>Drop files here to upload</span>
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
                                    <button type="text">파일선택(여러개)</button>
                                    <div class="dropzone dz-clickable"><span>Drop files here to upload</span>
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
                                                <div class="dropzone dz-clickable menu-add-img">
                                                    <div class="dz-default dz-message"><span>+</span></div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control menu-name" name="menu"
                                                        placeholder="메뉴명">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input type="number" class="form-control menu-price" name="price"
                                                        placeholder="price">
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
                        <a class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>Add
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
                                                    <input type="text" class="form-control" placeholder="Brake Time"
                                                        readonly>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="brakeStartTime" type="text"
                                                        class="form-control select-time" placeholder="시작시간">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="brakeEndTime" type="text"
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
                                            <input type="text" class="form-control" name="closedDay"
                                                placeholder="예시 : 화요일 (요일입력)">
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
    <div class="col-md-12 save-btn"><button type="submit" class="btn_1 medium">Save</button></div>
    </form>

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
        //입력값 검증 정규표현식



        // ------------------------------- 숫자가 아닌 값은 튕김 --------------------------------
        var replaceNotInt = /[^0-9]/gi;
        const $menuPrice = $('.menu-price');

        $menuPrice.on("keyup", function () {
            $(this).val($(this).val().replace(replaceNotInt, "")); // 입력값을 정규식으로 필터링하여 다시 입력값에 담음 

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

        
        const $hashTag = $('.hashTag');
        $hashTag.on("keyup",function(){
            const result = $hashTag.val().split(' ');
            const reulstLength = $hashTag.val().length;
            console.log(result);

            if(result > 2)
            {
                $(this).val($(this).val(substring(0, reulstLength)));
                    
                $hashTag.css('border-color', 'red');
            }
        });

    </script>

    <script>
        // const $weekdayOpenTime = document.querySelector('.weekday-openTime');

        // var result = $weekdayOpenTime.value.replace(replaceNotInt, "");
        // console.log(result);

        // function validateFormValue() {
        //     const $writerInput = document.getElementById('writer-input');
        //     const $titleInput = document.getElementById('title-input');
        //     let flag = false; // 입력 제대로하면 true로 변경

        //     console.log('w: ', $writerInput.value);
        //     console.log('t: ', $titleInput.value);

        //     if ($writerInput.value.trim() === '') {
        //         alert('작성자는 필수값입니다~');
        //     } else if ($titleInput.value.trim() === '') {
        //         alert('제목은 필수값입니다~');
        //     } else {
        //         flag = true;
        //     }

        //     console.log('flag:', flag);

        //     return flag;
        // }
    </script>


    <script>
       
    </script>

</body>

</html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
    <%@ include file="../include/admin-static-head.jsp" %>

    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/mypage/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72"
        href="/mypage/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="/mypage/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="/mypage/img/apple-touch-icon-144x144-precomposed.png">

    <!-- Bootstrap core CSS-->
    <link href="/mypage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Main styles -->
    <link href="/mypage/css/admin.css" rel="stylesheet">
    <!-- Icon fonts-->
    <link href="/mypage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Plugin styles -->
    <link href="/mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/mypage/vendor/dropzone.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link href="/mypage/css/custom.css" rel="stylesheet">

    <style>
        .btnbox .btn {
            float: left;
            margin-left: 20px;
        }

        .modalBox {
            position: absolute;
            display: none;
            width: 25%;
            height: 20%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: white;
            border-radius: 5%;
            border: 2px solid green;
        }

        .modalBox .passwordModal {
            width: 80%;
            height: 60%;
            position: absolute;
            margin: 0 auto;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* background: blue; */
        }

        .modalBox .passwordModal .passwordModal-title {
            text-align: center;
            margin-bottom: 15px;
        }

        .modalBox .passwordModal .falseh5 {
            display: none;
            /* ?????? ?????????  */
            color: red;
            /* ??? ????????? ???????????? ;; */
            text-align: center;
        }

        .modalBox .passwordModal .passwordform {
            text-align: center;
        }

        .modalBox .passwordModal .passwordBtn {
            margin-left: 20px;
        }

        .modalBox .returnBtn {
            /* ????????????  */
            position: absolute;
            width: 20px;
            height: 20px;
            left: 85%;
            top: 10%;
            border-radius: 50%;
            background: green;
            text-align: center;
            color: #000;
        }

        /* ===================================================================== */

        .modalBox2 {
            position: absolute;
            display: none;
            width: 25%;
            height: 20%;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background: white;
            border-radius: 5%;
            border: 2px solid green;
        }

        .modalBox2 .passwordModal {
            width: 80%;
            height: 60%;
            position: absolute;
            margin: 0 auto;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            /* background: blue; */
        }

        .modalBox2 .passwordModal .passwordModal-title {
            text-align: center;
            margin-bottom: 15px;
        }

        .modalBox2 .passwordModal .falseh52 {
            display: none;
            /* ?????? ?????????  */
            color: red;
            /* ??? ????????? ???????????? ;; */
            text-align: center;
        }

        .modalBox2 .passwordModal .passwordform {
            text-align: center;
        }

        .modalBox2 .passwordModal .passwordBtn2 {
            margin-left: 20px;
        }

        .modalBox2 .returnBtn2 {
            /* ????????????  */
            position: absolute;
            width: 20px;
            height: 20px;
            left: 85%;
            top: 10%;
            border-radius: 50%;
            background: green;
            text-align: center;
            color: #000;
        }

        .hotDealLabel {
            color: red;
        }
    </style>


</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>

    <!-- /Navigation-->
    <!-- ????????? ?????? ?????? !! ==================================================================================================== -->
    <div class="content-wrapper">
        <div class="container-fluid">
            <div class="box_general padding_bottom">
                <div class="header_box version_2">
                    <h2><i class="fa fa-user"></i>${master.storeName} </h2>
                </div>
                <div class="row">
                    <!-- <div class="col-md-4">
					<div class="form-group">
					<label>Your photo</label>
						<form action="/file-upload" class="dropzone"></form>
				    </div>
				</div> -->
                    <!-- ????????? ?????? ?????? !!  -->
                    <div class="col-md-8 add_top_30">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>????????? ?????? </label>
                                    <input type="text" class="form-control" placeholder="${master.businessNo}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>email</label>
                                    <input type="text" class="form-control" placeholder="${master.email}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>master_name ????????? ?????? </label>
                                    <input type="text" class="form-control" placeholder="${master.masterName}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>store_name ???????????? </label>
                                    <input type="email" class="form-control" placeholder="${master.storeName}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>store_address ?????? ??????</label>
                                    <input type="text" class="form-control" placeholder="${master.storeAddress}"
                                        readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>?????? ON/OFF
                                        <a href="#0" data-toggle="modal"data-target=".hotDeal" class="hotDealLabel">Button</a></label>
                                    <input type="text" class="form-control" placeholder="${master.hotDeal}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>store_call_number ?????? ????????????</label>
                                    <input type="email" class="form-control" placeholder="${master.storeCallNumber}"
                                        readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>store_detail_address ???????????? </label>
                                    <input type="text" class="form-control" placeholder="${master.storeDetailAddress}"
                                        readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>store_extra_address ????????? ??????</label>
                                    <input type="email" class="form-control" placeholder="${master.storeExtraAddress}"
                                        readonly>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                </div>
            </div>
            

            <!-- ----------------------------------------------------------------------------------------------------------------- -->
            <!-- ????????? ???????????? ???????????? ???????????? ??????  -->
            <div class="modalBox">
                <div class="passwordModal">
                    <h5 class="passwordModal-title">??????????????? ???????????????</h5>
                    <h5 class="falseh5">[??????????????? ???????????????.]</h5>

                    <input type="password" name="password" class="passwordInput"> <button type="button"
                        class="passwordBtn">????????????</button>
                </div>
                <div class="returnBtn">X</div>

            </div>

            <!-- ?????? ?????? ?????? ?????? ???????????? ???????????? ??????  -->
            <form action="/delMaster/${masterNum}" method="post" class="deleteMasterForm">
                <div class="modalBox2">
                    <div class="passwordModal">
                        <h5 class="passwordModal-title">??????????????? ???????????????</h5>
                        <h5 class="falseh52">[??????????????? ???????????????.]</h5>
                        <input type="password" name="password" class="passwordInput2"> <button type="button"
                        class="passwordBtn2">????????????</button>
                    </div>
                    <div class="returnBtn2">X</div>
                </div>
            </form>

            <!-- ----------------------------------------------------------------------------------------------------------------- -->
            <div class="btnbox">
                <button type="button" class="btn modiBtn btn-success">????????????</button>
                <!-- <button type="button" class="btn masterRegistBtn btn-primary">?????? ?????? ??????</button> -->
                <button type="button" class="btn btn-secondary makeProBoard">????????? ????????????</button>
                <button type="button" class="btn btn-secondary detailProBoard">????????? ????????????</button>
                <button type="button" class="btn deleteStoreBtn btn-danger">?????? ?????? ????????????</button>
            </div>
        </div>
        <!-- /.container-fluid-->
    </div>


    <!-- hotDeal Modal -->
    <form action="/hotDealForm/${masterNum}" method="post" class="promotion-modal-form hotDealForm">
        <div class="modal fade hotDeal" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit_bookingLabel">??? ??? ON/OFF</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">??</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="radio" name="hotDealRadio" id="hotDealOn" value="ON"> ON <input type="radio"
                            name="hotDealRadio" id="hotDealOff" value="OFF"> OFF
                        <!-- ??????????????? ???????????? ?????? ??????????????? ????????? ???????????? ????????? ?????? ?????? ??????????????? -->
                        <!-- <input type="text" name=" businessNo" value="${master.businessNo}" hidden> -->
                        <!-- <div class="form-group">
                                <label>?????????</label>
                                <input type="text" class="form-control promotion-modal-report-no" name="hotdealPercent">
                            </div> -->
                        <div class="selectBox">
                            <select name="discountPrice" class="hotdealPercent">
                                <option value="0">0%</option>
                                <option value="5">5%</option>
                                <option value="10">10%</option>
                                <option value="15">15%</option>
                                <option value="20">20%</option>
                                <option value="25">25%</option>
                                <option value="30">30%</option>
                                <option value="35">35%</option>
                                <option value="40">40%</option>
                                <option value="45">45%</option>
                                <option value="50">50%</option>
                            </select>
                        </div>


                        <!-- /Row -->
                    </div>
                    <div class="modal-footer btn-wrap">
                        <button class="btn btn-primary del-btn promotion-complete-n hotdealBtn" type="button">??????
                            ??????</button>
                    </div>
                    <!-- </div>
    </div>
    </div> -->
    </form>
    <!-- Bootstrap core JavaScript-->
    <script src="/mypage/vendor/jquery/jquery.min.js"></script>
    <script src="/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/mypage/vendor/chart.js/Chart.min.js"></script>
    <script src="/mypage/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/mypage/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="/mypage/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/mypage/js/admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="/mypage/vendor/dropzone.min.js"></script>

    <!-- ????????? ???????????? ?????? script -->
    <script>
        const $modBtn = document.querySelector('.modiBtn');
        const $delBtn = document.querySelector('.del-btn');
        const $masterBtn = document.querySelector('.masterRegistBtn');
        const $modalBox = document.querySelector('.modalBox');
        const $returnBtn = document.querySelector('.returnBtn');
        const $passwordModal = document.querySelector('.passwordModal');
        const $passwordInput = document.querySelector('.passwordInput');

        const $body = document.body;

        // ?????? ?????? ?????? ?????????
        const $falseh5 = document.querySelector('.falseh5');
        const $brLabel = document.querySelector('.brLabel');
        const $passwordBtn = document.querySelector('.passwordBtn');


        // ?????? ?????? ?????? ???????????? ??????
        const $passwordInput2 = document.querySelector('.passwordInput2');
        const $modalBox2 = document.querySelector('.modalBox2');

        const $returnBtn2 = document.querySelector('.returnBtn2');
        const $falseh52 = document.querySelector('.falseh52');
        const $brLabel2 = document.querySelector('.brLabel2');

        const $deleteMasterForm = document.querySelector('.deleteMasterForm');

        if ($modBtn !== null) {
            //????????????
            $modBtn.addEventListener('click', e => {
                console.log("???????????? ?????????");

                // $body.style.opacity = 0.5;

                $modalBox.style.display = "block";
                // location.href = '/myPage-modify';
            });

        }



        if ($returnBtn !== null) {
            // ????????? ????????? x ?????? 

            $returnBtn.onclick = e => {
                console.log("????????? x ?????? ?????????");
                $falseh5.style.display = "none";

                $modalBox.style.display = "none";
                // location.href = '/myPage-modify';
            };
        }


        if ($returnBtn2 !== null) {
            // ?????? ?????? ?????? ?????? x

            $returnBtn2.onclick = e => {
                console.log("?????? x ?????????");
                $falseh52.style.display = "none";

                $modalBox2.style.display = "none";
                // location.href = '/myPage-modify';
            };
        }


        if ($delBtn !== null) {

            //????????????
            $delBtn.onclick = e => {
                if (!confirm('?????? ?????????????????????????')) {
                    return;
                }
                location.href = '/board/delete?boardNo=${b.boardNo}';
            };
        }
        

        // ?????? ?????? 
        if ($passwordBtn !== null) {
            $passwordBtn.onclick = e => {
                console.log('click password');
                trueAndFalsePassword();
            }
        }


        //????????? ?????? ??????// ???????????? ????????? ????????? ???????????? ????????? ?????????
        function trueAndFalsePassword(e) {

            const $passwordInput = document.querySelector('.passwordInput')

            // ????????? ????????? ????????????
            const password = {
                password: $passwordInput.value
            };

            // POST????????? ?????? ?????? ?????? ??????
            const reqInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(password)
            };

            fetch('/trueAndFalsePassword', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    console.log('aanjseqpw oqwf[ojqwo[fn [qownf'); // ?????????????????? 
                    if (msg === 'password-success') {
                        alert("??????????????? ???????????????. ?????????????????? ???????????????.");
                        location.href = '/masterInfoModi/${masterNum}';
                    } else if (msg === 'password-false') {
                        console.log(123123123123123123);
                        $falseh5.style.display = "block";
                        $falseh5.style.color = 'red';
                        $brLabel.style.display = "none";
                    }
                });
        }



         //?????? ?????? ??????// ???????????? ????????? ????????? ???????????? ????????? ?????????
        function trueAndFalsePassword2(e) {

            const $passwordInput2 = document.querySelector('.passwordInput2')

            // ????????? ????????? ????????????
            const password = {
                password: $passwordInput2.value
            };

            // POST????????? ?????? ?????? ?????? ??????
            const reqInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(password)
            };

            fetch('/trueAndFalsePassword', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'password-success') {
                        alert("??????????????? ???????????????.");
                        if(confirm("????????? ?????? ???????????????????")){
                            $deleteMasterForm.submit();
                        }else{
                            $modalBox2.style.display = "none";
                        }
                    } else if (msg === 'password-false') {
                        console.log(123123123123123123);
                        $falseh52.style.display = "block";
                        $falseh52.style.color = 'red';
                        $brLabel.style.display = "none";
                    }
                });
        }
    </script>

    <script>
        (function () {
            // ?????? ???????????? 


        })();


        // ?????? ?????? ???????????? ????????????
        const $deleteStoreBtn = document.querySelector('.deleteStoreBtn');
        // ???????????? ????????? ??????
        const $passwordBtn2 = document.querySelector('.passwordBtn2');


        $(document).ready(function () {


            // ?????? ?????? ???????????? ????????????
            const $deleteStoreBtn = document.querySelector('.deleteStoreBtn');

            $deleteStoreBtn.onclick = e => {
                console.log("???????????? ???????????? ?????? ?????????");

                // ????????? ?????????
                $modalBox2.style.display = "block";

                // // ????????? ?????? ???????????? !
                // location.href = "/delMaster/${masterNum}";
            };


            // ?????? ?????? ?????? ???????????? ????????? ??????
        if ($passwordBtn2 !== null) {
            $passwordBtn2.onclick = e => {
                console.log('click password2');
                trueAndFalsePassword2();
            }
        }




            // ?????? ????????? ??????
            const $onRadio = document.getElementById('hotDealOn');
            console.log($onRadio);
            const $offRadio = document.getElementById('hotDealOff');
            console.log($offRadio);

            const $checkArray = [$onRadio, $offRadio];

            const $selectBox = document.querySelector('.selectBox');
            console.log($selectBox);

            const $hotdealBtn = document.querySelector('.hotdealBtn');


            const $hotDealForm = document.querySelector('.hotDealForm');



            $onRadio.onclick = e => {
                // on ??? ???????????? 
                // $onRadio.checked = true;
                const onlog = $onRadio.checked;
                console.log(onlog); // ???????????? ?????? 

                // $offRadio.checked = false;
                const offlog = $offRadio.checked;
                console.log(offlog); // undefined ?????? ?????? 

                if (onlog && !offlog) {
                    console.log('wq wreqw');
                    $selectBox.style.display = 'block';
                }

            };

            $offRadio.onclick = e => {
                // on ??? ???????????? 
                // $onRadio.checked = false;
                const onlog = $onRadio.checked;
                console.log(onlog); // ???????????? ?????? 

                // $offRadio.checked = true;
                const offlog = $offRadio.checked;
                console.log(offlog); // undefined ?????? ?????? 

                if (!onlog && offlog) {
                    console.log('wq wr123123eqw');
                    $selectBox.style.display = 'none';
                }
            };

            $hotdealBtn.onclick = e => {

                const $hotDealRadioList = document.getElementsByName('hotDealRadio');

                console.log($checkArray);

                console.log($hotDealRadioList); // ??? ????????? 


                $hotDealRadioList.forEach((node) => {
                    if (node.checked) {
                        console.log(node.value);


                        // location.href = '/master/register';
                        $hotDealForm.submit();
                    }
                })

            };

            const $makeProBoardBtn = document.querySelector(".makeProBoard");

            console.log("$makeProBoardBtn==========");
            console.log($makeProBoardBtn);

            const $makeProBoard = $('.makeProBoard');

            console.log("????????? ???????????? ???????????? ");
            // ??????????????? ????????? .
            fetch('/countProBoard/' + '${masterNum}')
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'yes') {
                        console.log('====yes====');
                        // ???????????? ???????????? ??????
                        $makeProBoard.text("????????? ????????????");

                        $makeProBoard.on('click', function () {
                            location.href = "/proBoard/write/${master.businessNo}";
                        })

                        $('.detailProBoard').css('display', 'none');
                    } else if (msg === 'no') {
                        console.log('====no====');
                        $makeProBoard.text("????????? ????????????")
                        // ???????????? ???????????? ??????

                        $makeProBoard.on('click', function () {
                            location.href = "/proBoard/modify/${promotionBno}";
                        })

                        $('.detailProBoard').on('click', function () {
                            location.href = "/proBoard/detail/${promotionBno}";
                        });
                    }
                });
        });
    </script>




</body>

</html>
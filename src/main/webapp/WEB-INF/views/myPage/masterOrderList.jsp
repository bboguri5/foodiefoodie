<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">


<head>
    <%@ include file="../include/admin-static-head.jsp" %>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>

    <!-- 여기가 메인 ~~------------------------------------------------------------------------------------------ -->
    <!-- /Navigation-->
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->

            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> 내 가게 주문한사람</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>주문 번호 </th>
                                    <th>주문 한 사람</th>
                                    <th>주문 내역 </th>
                                    <th>할인 전 가격</th>
                                    <th>할인율</th>
                                    <th>할인 후 가격</th>
                                    <th>날 짜 </th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>주문 번호 </th>
                                    <th>주문 한 사람</th>
                                    <th>주문 내역 </th>
                                    <th>할인 전 가격</th>
                                    <th>할인율</th>
                                    <th>할인 후 가격</th>
                                    <th>날 짜 </th>
                                </tr>
                            </tfoot>

                            <!-- ================================================ -->

                            <tbody class="target-no">
                                <c:forEach var="masterOrder" items="${masterOrderList}">
                                    <tr>
                                        <th><a href="#0" data-toggle="modal" data-target=".edit_booking"
                                                data-orderno="${masterOrder.orderNo}"
                                                data-storename="${masterOrder.email}"
                                                data-orderrowmenulist="${masterOrder.orderRowMenuList}"
                                                data-totalnum="${masterOrder.totalNum}"
                                                data-discount="${masterOrder.discount}"
                                                data-realmoney="${masterOrder.realMoney}"
                                                data-dateandtime="${masterOrder.dateAndTime}">
                                                ${masterOrder.orderNo}</a>
                                        </th>
                                        <td>${masterOrder.orderNo}</td>
                                        <td>${masterOrder.email}</td>
                                        <td>${masterOrder.orderMenuList}</td>
                                        <td>${masterOrder.totalNum}</td>
                                        <td>${masterOrder.discount}</td>
                                        <td>${masterOrder.realMoney}</td>
                                        <td>${masterOrder.dateAndTime}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                            <!-- ================================================ -->
                        </table>
                    </div>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div>
            <!-- /tables-->
        </div>
        <!-- /container-fluid-->
    </div>

    <!-- Edit Booking Modal -->
    <form action="#" method="post" class="modal-form">
        <div class="modal fade edit_booking" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel" id="modal"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit_bookingLabel">주문 내역</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="xbtn">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>주문 번호</label>
                            <input type="text" class="form-control modal-orderno" name="orderNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>주문 한 가게</label>
                            <input type="text" class="form-control modal-storename" name="email" readonly>
                        </div>
                        <div class="form-group">
                            <label>주문 내역</label>
                            <textarea name="" id="123" cols="30" rows="5" class="form-control modal-orderrowmenulist"
                                readonly></textarea>
                         
                        </div>
                        <div class="form-group">
                            <label>할인 전 가격</label>
                            <input type="text" class="form-control modal-totalnum" name="total0num" readonly>
                        </div>
                        <div class="form-group">
                            <label>할인율</label>
                            <input type="text" class="form-control modal-discount" name="discount"
                                value="${userOrder.discount}" readonly>
                        </div>
                        <div class="form-group">
                            <label>할인 후 가격</label>
                            <input type="text" class="form-control modal-realmoney" name="realmoney"
                                value="${userOrder.realMoney}" readonly>
                        </div>
                        <div class="form-group">
                            <label>날짜</label>
                            <input type="text" class="form-control modal-dateandtime" name="dateandtime"
                                value="${userOrder.dateAndTime}" readonly>
                        </div>

                        <!-- /Row -->
                    </div>

                    <!-- <button class="btn btn-primary del-btn disapprove" type="button">거절</button> -->
                </div>
            </div>
        </div>
        </div>
    </form>


    <!-- Bootstrap core JavaScript-->
    <script src="/mypage/vendor/jquery/jquery.min.js"></script>
    <script src="/mypage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/mypage/vendor/chart.js/Chart.min.js"></script>
    <script src="/mypage/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/mypage/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="/mypage/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/mypage/js/admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="/mypage/js/admin-datatables.js"></script>

    <script>
        (function () {
            const $targetNo = document.querySelector('.target-no');
            // console.log($targetNo);

            $targetNo.addEventListener('click', e => {


                console.log("클릭이벤트");
                console.log(e.target.value);

                document.querySelector('.modal-orderno').value = e.target.dataset.orderno;
                document.querySelector('.modal-storename').value = e.target.dataset.storename;
                document.querySelector('.modal-orderrowmenulist').value = e.target.dataset.orderrowmenulist;
                document.querySelector('.modal-totalnum').value = e.target.dataset.totalnum;
                document.querySelector('.modal-discount').value = e.target.dataset.discount;

                document.querySelector('.modal-realmoney').value = e.target.dataset.realmoney;
                document.querySelector('.modal-dateandtime').value = e.target.dataset.dateAndTime;
            })






        }())
    </script>

</body>

</html>
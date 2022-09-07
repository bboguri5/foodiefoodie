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
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">내가 주문한 내역</a>
                </li>
            
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> 내가 먹은 내역 </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>주문 번호 </th>
                                    <th>주문 한 가게</th>
                                    <th>주문 내역</th>
                                    <th>할인 전 가격</th>
                                    <th>할인율</th>
                                    <th>할인 된 가격</th>
                                    <th>날 짜</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>주문 번호 </th>
                                    <th>주문 한 가게</th>
                                    <th>주문 내역</th>
                                    <th>할인 전 가격</th>
                                    <th>할인율</th>
                                    <th>할인 된 가격</th>
                                    <th>날 짜</th>
                                </tr>
                            </tfoot>

                            <!-- ================================================ -->

                            <tbody class="target-no">
                                <c:forEach var="userOrder" items="${userOrderList}">
                                    <tr>
                                        <th><a href="#0" data-toggle="modal" data-target=".edit_booking"
                                            data-orderno="${userOrder.orderNo}" data-storename="${userOrder.storeName}"
                                            data-orderrowmenulist="${userOrder.orderRowMenuList}" data-totalNum="${userOrder.totalNum}"
                                            data-discount="${userOrder.discount}" data-realmoney="${userOrder.realMoney}"
                                            data-orderdate="${userOrder.orderDate}">
                                            ${userOrder.orderNo}</a>
                                        </th>
                                        <td>${userOrder.storeName}</td>
                                        <td>${userOrder.orderMenuList}</td>
                                        <td>${userOrder.totalNum}</td>
                                        <td>${userOrder.discount}</td>
                                        <td>${userOrder.realMoney}</td>
                                        <td>${userOrder.orderDate}</td>
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
    <!-- /container-wrapper-->

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
                            <input type="text" class="form-control modal-orderNo" name="orderNo"  readonly>
                        </div>
                        <div class="form-group">
                            <label>주문 한 가게</label>
                            <input type="text" class="form-control modal-storeName" name="email" readonly>
                        </div>
                        <div class="form-group">
                            <label>주문 내역</label>
                            <textarea name="" id="123" cols="30" rows="5" class="form-control modal-orderRowMenuList" readonly></textarea>
                            <!-- <input type="text" class="form-control modal-master-name" name="masterName" readonly> -->
                        </div>
                        <div class="form-group">
                            <label>할인 전 가격</label>
                            <input type="text" class="form-control modal-totalNum"
                                name="totalNum"  readonly>
                        </div>
                        <div class="form-group">
                            <label>할인율</label>
                            <input type="text" class="form-control modal-discount" name="discount" value="${userOrder.discount}" readonly>
                        </div>
                        <div class="form-group">
                            <label>할인 후 가격</label>
                            <input type="text" class="form-control modal-realMoney" name="realMoney" value="${userOrder.realMoney}" readonly>
                        </div>
                        <div class="form-group">
                            <label>날짜</label>
                            <input type="text" class="form-control modal-orderDate" name="orderDate" value="${userOrder.orderDate}" readonly>
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
</body>

<script>

(function () {
            const $targetNo = document.querySelector('.target-no');
            // console.log($targetNo);

            $targetNo.addEventListener('click', e => {


                console.log("클릭이벤트");
                console.log(e.target.value);

                document.querySelector('.modal-orderNo').value = e.target.dataset.orderno;
                document.querySelector('.modal-storeName').value = e.target.dataset.storename;
                document.querySelector('.modal-orderRowMenuList').value = e.target.dataset.orderrowmenulist;
                document.querySelector('.modal-totalNum').value = e.target.dataset.totalnum;
                document.querySelector('.modal-discount').value = e.target.dataset.discount;

                document.querySelector('.modal-realMoney').value = e.target.dataset.realmoney;
                document.querySelector('.modal-orderDate').value = e.target.dataset.orderdate;
            })

        
          
          


        }())

</script>

</html>
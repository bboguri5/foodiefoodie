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
                    <a href="#">게시글 신고</a>
                </li>
                <li class="breadcrumb-item active">게시글 신고한사람~</li>
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> Data Table Example</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>신고 번호</th>
                                    <th>리뷰 번호</th>
                                    <th>리뷰 제목</th>
                                    <th>신고 내역</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>신고 번호</th>
                                    <th>리뷰 번호</th>
                                    <th>리뷰 제목</th>
                                    <th>신고 내역</th>
                                </tr>
                            </tfoot>
                            <!-- ==================================================== -->
                            <tbody class="target-no">
                                <c:forEach var="reviewReport" items="${reviewReports}">
                                    <tr>
                                        <th><a href="#0" data-toggle="modal" data-target=".edit_booking"
                                            data-refaqno="${reviewReport.reFaqNo}" data-reviewbno="${reviewReport.reviewBno}"
                                            data-reviewtitle="${reviewReport.reviewTitle}" data-realreviewcontent="${reviewReport.realReviewContent}">
                                            ${reviewReport.reFaqNo}</a>
                                        </th>
                                        <td>${reviewReport.reviewBno}</td>
                                        <td>${reviewReport.reviewTitle}</td>
                                        <td>${reviewReport.reviewFaqContent}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                            <!-- ================================================================= -->
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
                            <label>신고 번호</label>
                            <input type="text" class="form-control modal-refaqno" name="orderNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>리뷰 번호</label>
                            <input type="text" class="form-control modal-reviewbno" name="email" readonly>
                        </div>
                        <div class="form-group">
                            <label>리뷰 제목</label>
                            <input type="text" class="form-control modal-reviewtitle" name="totalNum" readonly>
                        </div>
                        <!-- <div class="form-group">
                            <label>신고 내역</label>
                            <input type="text" class="form-control modal-realreviewcontent" name="totalNum" readonly>
                        </div> -->
                        <div class="form-group">
                            <label>댓글 신고 내역</label>
                            <textarea name="" id="123" cols="30" rows="5" class="form-control modal-realreviewcontent" readonly></textarea>
                            <!-- <input type="text" class="form-control modal-master-name" name="masterName" readonly> -->
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/admin-datatables.js"></script>


    <script>

        (function () {
                    const $targetNo = document.querySelector('.target-no');
                    // console.log($targetNo);
        
                    $targetNo.addEventListener('click', e => {
        
                        document.querySelector('.modal-refaqno').value = e.target.dataset.refaqno;
                        document.querySelector('.modal-reviewbno').value = e.target.dataset.reviewbno;
                        document.querySelector('.modal-reviewtitle').value = e.target.dataset.reviewtitle;
                        document.querySelector('.modal-realreviewcontent').value = e.target.dataset.realreviewcontent;
                     
                    })
        
                }())
        
        </script>


</body>

</html>
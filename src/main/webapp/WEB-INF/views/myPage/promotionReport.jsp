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
                    <a href="#">프로모션 신고</a>
                </li>
                <li class="breadcrumb-item active">프로모션 신고한사람~</li>
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
                                    <th>가게 이름</th>
                                    <th>프로모션 번호</th>
                                    <th>프로모션 제목</th>
                                    <th>신고 내역</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>신고 번호</th>
                                    <th>가게 이름</th>
                                    <th>프로모션 번호</th>
                                    <th>프로모션 제목</th>
                                    <th>신고 내역</th>
                                </tr>
                            </tfoot>
                            <!-- ==================================================== -->
                            <tbody>
                                <c:forEach var="proReport" items="${proReportList}">
                                    <tr data-toggle="modal" data-target=".edit_booking"
                                        data-prfaqno="${proReport.prFaqNo}"
                                        data-promotionBno="${proReport.promotionBno}" 
                                        data-title="${proReport.title}"
                                        data-storeName="${proReport.storeName}" 
                                        data-content="${proReport.content}">
                                        <td>${proReport.prFaqNo}</td>
                                        <td>${proReport.storeName}</td>
                                        <td>${proReport.promotionBno}</td>
                                        <td>${proReport.title}</td>
                                        <td>${proReport.content}</td>
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

    <div class="modal fade edit_booking" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edit_bookingLabel">신고글 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>신고번호</label>
                        <input type="text" class="form-control modal-reportNo" name="prFaqNo" readonly>
                    </div>
                    <div class="form-group">
                        <label>홍보글 번호</label>
                        <input type="text" class="form-control modal-promotionBno" name="promotionBno" readonly>
                    </div>
                    <div class="form-group">
                        <label>홍보글 타이틀</label>
                        <input type="text" class="form-control modal-protitle" name="title" readonly>
                    </div>
                    <div class="form-group">
                        <label>홍보글 가게명</label>
                        <input type="text" class="form-control modal-storeName" name="storeName" readonly>
                    </div>
                    <div class="form-group">
                        <label>사유</label>
                        <input type="text" class="form-control modal-contents" name="content" readonly>
                    </div>
                    <input type="hidden" class="form-control complete-type" name="completeType">
                    <!-- /Row -->
                </div>
            </div>
        </div>
    </div>
    </div>

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
    <script src="/mypage/js/admin-datatables.js"></script>
</body>


<script>
    const targetList = document.querySelectorAll('table tbody tr');


    for (const target of targetList) {
        target.addEventListener('click', e => {

            console.log(target);
            document.querySelector('.modal-reportNo').value = target.dataset.prfaqno;
            document.querySelector('.modal-promotionBno').value = target.dataset.promotionbno;
            document.querySelector('.modal-protitle').value = target.dataset.title;
            document.querySelector('.modal-storeName').value = target.dataset.storename;
            document.querySelector('.modal-contents').value = target.dataset.content;
        })

    }
</script>

</html>
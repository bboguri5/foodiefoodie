<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <link rel="shortcut icon" href="/mypage/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/mypage/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/mypage/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="/mypage/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="/mypage/img/apple-touch-icon-144x144-precomposed.png">
    <!-- Bootstrap core CSS-->
    <link href="/mypage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Main styles -->
    <link href="/mypage/css/admin.css" rel="stylesheet">
    <!-- Icon fonts-->
    <link href="/mypage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Plugin styles -->
    <link href="/mypage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Your custom styles -->
    <link href="/mypage/css/custom.css" rel="stylesheet">
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
                <li class="breadcrumb-item active">주문 내역~</li>
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i> 내가 먹은 내역~ </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>주문 번호 </th>
                                    <th>주문 한 가게</th>
                                    <th>주문 내역</th>
                                    <th>총 가격</th>
                                    <th>날 짜</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>주문 번호 </th>
                                    <th>주문 한 가게</th>
                                    <th>주문 내역</th>
                                    <th>총 가격</th> 
                                    <th>날 짜</th>
                                </tr>
                            </tfoot>

                            <!-- ================================================ -->

                            <tbody>
                                <c:forEach var="userOrder" items="${userOrderList}">
                                    <tr>
                                        <td>${userOrder.orderNo}</td>
                                        <td>${userOrder.storeName}</td>
                                        <td>${userOrder.orderMenuList}</td>
                                        <td>${userOrder.totalNum}</td>
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
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

</html>
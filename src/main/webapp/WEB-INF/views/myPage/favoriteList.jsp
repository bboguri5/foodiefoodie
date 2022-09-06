<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">


<head>
    <%@ include file="../include/admin-static-head.jsp" %>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/myPage-nav.jsp" %>
    
    <!-- /Navigation-->
    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Bookmarks</li>
            </ol>
            <div class="box_general">
                <div class="header_box">
                    <h2 class="d-inline-block">&#128172; 즐겨찾기 &#9825;</h2>
                    <!-- <div class="filter">
                        <div class="styled-select short">
                            <select name="orderby">
                                <option value="Any time">Any time</option>
                                <option value="Latest">Latest</option>
                                <option value="Oldest">Oldest</option>
                            </select>
                        </div>
                    </div> -->
                </div>
                <div class="list_general">
                    <ul>
                        <c:forEach var="dto" items="${favorites}">
                           가게이름 ${dto.storeName}
                           <li>
                            <figure><img src="img/item_1.jpg" alt=""></figure>
                            <h3>${dto.storeName}</h3>
                            <p>${dto.storeAddress}</p>
                            <p>${dto.storeCallNumber}</p>
                            <p><a href="#0" class="btn_1 gray"><i class="fa fa-fw fa-eye"></i> ${dto.storeName}에 주문하기 </a></p>
                            <ul class="buttons">
                                <li><a href="#0" class="btn_1 gray delete wishlist_close"><i class="fa fa-fw fa-times-circle-o"></i> 즐겨찾기에서 지우기 </a></li>
                            </ul>
                        </li>

                        </c:forEach>

                    </ul>
                </div>
            </div>
            <!-- /box_general-->
            <nav aria-label="...">
                <ul class="pagination pagination-sm add_bottom_30">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
            <!-- /pagination-->
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
    <script src="/mypage/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="/mypage/vendor/chart.js/Chart.min.js"></script>
    <script src="/mypage/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/mypage/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="/mypage/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="/mypage/js/admin.js"></script>
</body>

</html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/admin-static-head.jsp" %>

    <style>
        .cancell{
            cursor: pointer;
        }
    </style>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/admin-nav.jsp" %>

    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">광고관리</a>
                </li>
                <li class="breadcrumb-item active">신청중</li>
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i>신청 목록</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>홍보글</th>
                                    <th>시작일자</th>
                                    <th>종료일자</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>홍보글</th>
                                    <th>시작일자</th>
                                    <th>종료일자</th>
                                    <th></th>
                                </tr>
                            </tfoot>
                            <tbody class="premiume-target">
                                <c:forEach var="pt" items="${premiumeT}">
                                    <tr>
                                        <th>
                                            <a href="#">${pt.title}</a>
                                        </th>
                                        <th>${pt.startDate}</th>
                                        <th>${pt.endDate}</th>
                                        <th data-promotionbno="${pt.promotionBno}" data-startdate="${pt.startDate}"
                                            data-enddate="${pt.endDate}">
                                            <span class="cancell">취소</span>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
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



    <form action="/admin/premiume-complete" method="POST" class="premiume-complete">
        <input type="hidden" name="promotionBno" class="promotionBno-data">
        <input type="hidden" name="startDate" class="startDate-data">
        <input type="hidden" name="endDate" class="endDate-data">
        <input type="hidden" name="complete" class="complete-data">
        <input type="hidden" name="menu" value="T">
    </form>







    <script>
        (function () {

            const $premiumeTarget = document.querySelector('.premiume-target');
            const $premiumeComplete = document.querySelector('.premiume-complete');
            // console.log($premiumeComplete);
            $premiumeTarget.onclick = e => {
                document.querySelector('.promotionBno-data').value = e.target.parentElement.dataset.promotionbno;
                document.querySelector('.startDate-data').value = e.target.parentElement.dataset.startdate;
                document.querySelector('.endDate-data').value = e.target.parentElement.dataset.enddate;
                if (e.target.getAttribute('class') === 'cancell') {
                    document.querySelector('.complete-data').value = 'N';
                    $premiumeComplete.submit();
                }
            }

        }())
    </script>

</body>

</html>
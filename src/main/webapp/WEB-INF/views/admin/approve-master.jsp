<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/admin-static-head.jsp" %>
</head>

<body class="fixed-nav sticky-footer" id="page-top">

    <%@ include file="../include/admin-nav.jsp" %>

    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">권한 관리</a>
                </li>
                <li class="breadcrumb-item active">권한 관리</li>
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
                                    <th>사업자 번호</th>
                                    <th>이메일</th>
                                    <th>사업자명</th>
                                    <th>가게이름</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>사업자 번호</th>
                                    <th>이메일</th>
                                    <th>사업자명</th>
                                    <th>가게이름</th>
                                </tr>
                            </tfoot>
                            <tbody class="target-no">
                                <c:forEach var="al" items="${approveList}">
                                    <tr>
                                        <th><a href="#0" data-toggle="modal" data-target=".edit_booking"
                                            data-businessno="${al.businessNo}" data-email="${al.email}"
                                            data-mastername="${al.masterName}" data-storename="${al.storeName}"
                                            data-storeaddress="${al.storeAddress}" data-storedetailaddress="${al.storeDetailAddress}"
                                            data-storecallnumber="${al.storeCallNumber}">
                                                ${al.businessNo}</a>
                                        </th>
                                        <th>${al.email}</th>
                                        <th>${al.masterName}</th>
                                        <th>${al.storeName}</th>
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


    <!-- Edit Booking Modal -->
    <form action="/admin/approve" method="post" class="modal-form">
        <div class="modal fade edit_booking" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit_bookingLabel">가게 정보</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>사업자 번호</label>
                            <input type="text" class="form-control modal-business-no" name="businessNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>이메일</label>
                            <input type="text" class="form-control modal-email" name="email" readonly>
                        </div>
                        <div class="form-group">
                            <label>사업자명</label>
                            <input type="text" class="form-control modal-master-name" name="masterName" readonly>
                        </div>
                        <div class="form-group">
                            <label>가게 이름</label>
                            <input type="text" class="form-control modal-store-name"
                                name="storeName" readonly>
                        </div>
                        <div class="form-group">
                            <label>가게 주소</label>
                            <input type="text" class="form-control modal-store-address" name="storeAddress" readonly>
                        </div>
                        <div class="form-group">
                            <label>상세 주소</label>
                            <input type="text" class="form-control modal-store-detail-address" name="storeDetailAddress" readonly>
                        </div>
                        <div class="form-group">
                            <label>가게 번호</label>
                            <input type="text" class="form-control modal-store-call-number" name="storeCallNumber" readonly>
                        </div>
                        <input type="hidden" class="form-control approve-type" name="approveType">
                        <!-- /Row -->
                    </div>
                    <div class="modal-footer btn-wrap">
                        <button class="btn btn-primary del-btn approve" type="button">승인</button>
                        <button class="btn btn-primary del-btn disapprove" type="button">거절</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        (function () {
            const $targetNo = document.querySelector('.target-no');
            // console.log($targetNo);
            
            $targetNo.addEventListener('click', e => {
                document.querySelector('.modal-business-no').value = e.target.dataset.businessno;
                document.querySelector('.modal-email').value = e.target.dataset.email;
                document.querySelector('.modal-master-name').value = e.target.dataset.mastername;
                document.querySelector('.modal-store-name').value = e.target.dataset.storename;
                document.querySelector('.modal-store-address').value = e.target.dataset.storeaddress;
                console.log(e.target.dataset.storedetailaddress);
                document.querySelector('.modal-store-detail-address').value = e.target.dataset.storedetailaddress;
                document.querySelector('.modal-store-call-number').value = e.target.dataset.storecallnumber;
            })

            const $btnWrap = document.querySelector('.btn-wrap');
            // console.log($btnWrap);
            const $modalForm = document.querySelector('.modal-form');
            // console.log($modalForm);
            $btnWrap.addEventListener('click', e => {
                console.log(e.target);
                
                if(e.target === document.querySelector('.approve')) {
                    document.querySelector('.approve-type').value = 'approve';
                    $modalForm.submit();
                } else if(e.target === document.querySelector('.disapprove')) {
                    document.querySelector('.approve-type').value = 'disapprove';
                    $modalForm.submit();
                }
            })



        }())
    </script>





</body>

</html>
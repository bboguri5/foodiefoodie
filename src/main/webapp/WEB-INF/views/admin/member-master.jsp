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
                    <a href="#">회원관리</a>
                </li>
                <li class="breadcrumb-item active">사업자 관리</li>
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i>사업자 목록</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>이메일</th>
                                    <th>이름</th>
                                    <th>닉네임</th>
                                    <th>가게명</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>이메일</th>
                                    <th>이름</th>
                                    <th>닉네임</th>
                                    <th>가게명</th>
                                </tr>
                            </tfoot>
                            <tbody class="target-email">
                                <c:forEach var="ml" items="${masterList}">
                                    <tr>
                                        <th><a href="#0" data-toggle="modal" data-target=".edit_booking"
                                                data-name="${ml.name}" data-nickname="${ml.nickName}"
                                                data-phonenumber="${ml.phoneNumber}" data-birth="${ml.birth}"
                                                data-address="${ml.address}" data-gender="${ml.gender}"
                                                data-registDate="${ml.regDate}" data-loginTime="${ml.recentLoginTime}"
                                                data-auth="${ml.auth}" data-businessNo="${ml.businessNo}" data-storeName="${ml.storeName}"
                                                data-storeAddress="${ml.storeAddress}" data-storeRegDate="${ml.storeRegDate}"
                                                data-hotDeal="${ml.hotDeal}" data-storeCallNumber="${ml.storeCallNumber}"
                                                data-detailaddress="${ml.detailAddress}" data-storedetailaddress="${ml.storeDetailAddress}">${ml.email}</a>
                                        </th>
                                        <th>${ml.name}</th>
                                        <th>${ml.nickName}</th>
                                        <th>${ml.storeName}</th>
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
    <form action="/admin/remove-member" method="post">
        <div class="modal fade edit_booking" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="edit_bookingLabel">회원상세정보</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>이메일</label>
                            <input type="text" class="form-control modal-email" name="email" readonly>
                        </div>
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control modal-name" disabled>
                        </div>
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control modal-nickName" disabled>
                        </div>
                        <div class="form-group">
                            <label>전화번호</label>
                            <input type="text" class="form-control modal-phoneNumber" disabled>
                        </div>
                        <div class="form-group">
                            <label>생일</label>
                            <input type="text" class="form-control modal-birth" disabled>
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" class="form-control modal-address" disabled>
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" class="form-control modal-detailAddress" disabled>
                        </div>
                        <div class="form-group">
                            <label>성별</label>
                            <input type="text" class="form-control modal-gender" disabled>
                        </div>
                        <div class="form-group">
                            <label>직급</label>
                            <input type="text" class="form-control modal-auth" disabled>
                        </div>
                        <div class="form-group">
                            <label>가입일</label>
                            <input type="text" class="form-control modal-registDate" disabled>
                        </div>
                        <div class="form-group">
                            <label>사업자 번호</label>
                            <input type="text" class="form-control modal-businessNo" disabled>
                        </div>
                        <div class="form-group">
                            <label>가게명</label>
                            <input type="text" class="form-control modal-storeName" disabled>
                        </div>
                        <div class="form-group">
                            <label>가게주소</label>
                            <input type="text" class="form-control modal-storeAddress" disabled>
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" class="form-control modal-storedetailAddress" disabled>
                        </div>
                        <div class="form-group">
                            <label>핫딜</label>
                            <input type="text" class="form-control modal-hotdeal" disabled>
                        </div>
                        <div class="form-group">
                            <label>가게 번호</label>
                            <input type="text" class="form-control modal-storeCallNumber" disabled>
                        </div>
                        <!-- /Row -->
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary del-btn" type="submit">강제 탈퇴</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        (function () {
            const $targetEmail = document.querySelector('.target-email');
            
            $targetEmail.onclick = e => {
                console.log(e.target);
                console.log(e.target.dataset.businessno);
                document.querySelector('.modal-email').value = e.target.textContent;
                document.querySelector('.modal-name').value = e.target.dataset.name;
                document.querySelector('.modal-nickName').value = e.target.dataset.nickname;
                document.querySelector('.modal-phoneNumber').value = e.target.dataset.phonenumber;
                document.querySelector('.modal-birth').value = e.target.dataset.birth;
                document.querySelector('.modal-address').value = e.target.dataset.address;
                document.querySelector('.modal-detailAddress').value = e.target.dataset.detailaddress;
                document.querySelector('.modal-gender').value = e.target.dataset.gender;
                document.querySelector('.modal-auth').value = e.target.dataset.auth;
                document.querySelector('.modal-registDate').value = e.target.dataset.registDate;
                document.querySelector('.modal-businessNo').value = e.target.dataset.businessno;
                document.querySelector('.modal-storeName').value = e.target.dataset.storename;
                document.querySelector('.modal-storeAddress').value = e.target.dataset.storeaddress;
                document.querySelector('.modal-storedetailAddress').value = e.target.dataset.storedetailaddress;
                document.querySelector('.modal-hotdeal').value = e.target.dataset.hotdeal;
                document.querySelector('.modal-storeCallNumber').value = e.target.dataset.storecallnumber;
            }

        }())
    </script>





</body>

</html>
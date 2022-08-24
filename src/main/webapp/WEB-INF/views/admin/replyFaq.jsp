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
                    <a href="#">신고관리</a>
                </li>
                <li class="breadcrumb-item active">댓글 관리</li>
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i>댓글 신고 목록</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>신고번호</th>
                                    <th>댓글</th>
                                    <th>신고 작성자</th>
                                    <th>댓글 작성자</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>신고번호</th>
                                    <th>댓글</th>
                                    <th>신고 작성자</th>
                                    <th>댓글 작성자</th>
                                </tr>
                            </tfoot>
                            <tbody class="target-no">
                                <c:forEach var="rf" items="${replyFaqList}">
                                    <tr>
                                        <th>
                                            <a href="#0" data-toggle="modal" data-target=".reply-faq"
                                                data-replyfaqno="${rf.replyFaqNo}" data-replyno="${rf.replyNo}"
                                                data-writeremail="${rf.writerEmail}"
                                                data-replyfaqcontent="${rf.replyFaqContent}"
                                                data-faqcomplete="${rf.faqComplete}"
                                                data-replywriteremail="${rf.replyWriterEmail}">
                                                ${rf.replyFaqNo}</a>
                                        </th>
                                        <th>
                                            <a href="#0" data-toggle="modal" data-target=".reply"
                                                data-reviewbno="${rf.reviewBno}" data-replyno="${rf.replyNo}"
                                                data-email="${rf.replyWriterEmail}"
                                                data-replycontent="${rf.replyContent}" data-nickname="${rf.nickName}"
                                                data-lastupdate="${rf.lastUpdate}">
                                                ${rf.shortContent}</a>
                                        </th>
                                        <th>${rf.writerEmail}</th>
                                        <th>${rf.replyWriterEmail}</th>
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


    <!-- replyFaq-modal -->
    <form action="/admin/reply-completeFaq" method="post" class="modal-form">
        <div class="modal fade reply-faq" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
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
                            <input type="text" class="form-control modal-report-no" name="replyFaqNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>댓글</label>
                            <input type="text" class="form-control modal-reply-no" name="replyNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>신고 작성자</label>
                            <input type="text" class="form-control modal-writer-email" name="writerEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>댓글 작성자</label>
                            <input type="text" class="form-control modal-reply-writer-email" name="replyWriterEmail"
                                readonly>
                        </div>
                        <div class="form-group">
                            <label>사유</label>
                            <input type="text" class="form-control modal-replyfaqcontents" name="content" readonly>
                        </div>
                        <input type="hidden" class="form-control complete-type" name="completeType">
                        <!-- /Row -->
                    </div>
                    <div class="modal-footer btn-wrap">
                        <button class="btn btn-primary del-btn complete-t" type="button">승인</button>
                        <button class="btn btn-primary del-btn complete-n" type="button">거절</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <!-- reply-modal -->
    <div class="modal fade reply" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edit_bookingLabel">댓글 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>리뷰글 번호</label>
                        <input type="text" class="form-control reply-modal-review-no" readonly>
                    </div>
                    <div class="form-group">
                        <label>댓글 번호</label>
                        <input type="text" class="form-control reply-modal-reply-no" readonly>
                    </div>
                    <div class="form-group">
                        <label>댓글 작성자 이메일</label>
                        <input type="text" class="form-control reply-modal-writer-email" readonly>
                    </div>
                    <div class="form-group">
                        <label>댓글 작성자 닉네임</label>
                        <input type="text" class="form-control reply-modal-nick-name" readonly>
                    </div>
                    <div class="form-group">
                        <label>댓글 내용</label>
                        <input type="text" class="form-control reply-modal-reply-content" readonly>
                    </div>
                    <div class="form-group">
                        <label>댓글 작성/수정 시간</label>
                        <input type="text" class="form-control reply-modal-last-update" readonly>
                    </div>
                    <!-- /Row -->
                </div>
            </div>
        </div>
    </div>



    <script>
        (function () {
            const $targetNo = document.querySelector('.target-no');
            // console.log($targetNo);
            $targetNo.addEventListener('click', e => {
                console.log(e.target);
                // replyFaq
                document.querySelector('.modal-report-no').value = e.target.dataset.replyfaqno;
                document.querySelector('.modal-reply-no').value = e.target.dataset.replyno;
                document.querySelector('.modal-writer-email').value = e.target.dataset.writeremail;
                document.querySelector('.modal-reply-writer-email').value = e.target.dataset
                    .replywriteremail;
                document.querySelector('.modal-replyfaqcontents').value = e.target.dataset.replyfaqcontent;

                // reply
                document.querySelector('.reply-modal-review-no').value = e.target.dataset.reviewbno;
                document.querySelector('.reply-modal-reply-no').value = e.target.dataset.replyno;
                document.querySelector('.reply-modal-writer-email').value = e.target.dataset.email;
                document.querySelector('.reply-modal-nick-name').value = e.target.dataset.nickname;
                document.querySelector('.reply-modal-reply-content').value = e.target.dataset.replycontent;
                document.querySelector('.reply-modal-last-update').value = e.target.dataset.lastupdate;
            })

            const $btnWrap = document.querySelector('.btn-wrap');
            // console.log($btnWrap);
            const $modalForm = document.querySelector('.modal-form');
            // console.log($modalForm);
            $btnWrap.addEventListener('click', e => {
                // console.log(e.target);

                if (e.target === document.querySelector('.complete-t')) {
                    document.querySelector('.complete-type').value = 'T';
                    $modalForm.submit();
                } else if (e.target === document.querySelector('.complete-n')) {
                    document.querySelector('.complete-type').value = 'N';
                    $modalForm.submit();
                }
            })



        }())
    </script>





</body>

</html>
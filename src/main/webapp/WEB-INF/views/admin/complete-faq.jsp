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
                <li class="breadcrumb-item active">처리 완료</li>
            </ol>
            <!-- Example DataTables Card-->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fa fa-table"></i>처리완료 목록</div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>카테고리</th>
                                    <th>신고번호</th>
                                    <th>이메일</th>
                                    <th>사업자 번호</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>카테고리</th>
                                    <th>신고번호</th>
                                    <th>이메일</th>
                                    <th>사업자 번호</th>
                                </tr>
                            </tfoot>
                            <tbody class="target-no">
                                <c:forEach var="pf" items="${promotionFaqList}">
                                    <tr>
                                        <th>홍보글</th>
                                        <th><a href="#0" data-toggle="modal" data-target=".promotion-faq"
                                                data-prfaqno="${pf.prFaqNo}" data-promotionbno="${pf.promotionBno}"
                                                data-writeremail="${pf.writerEmail}"
                                                data-promotionwriteremail="${pf.promotionWriterEmail}"
                                                data-content="${pf.content}" data-businessno="${pf.businessNo}">
                                                ${pf.prFaqNo}</a></th>
                                                <!-- <th><a href="#" data-target=".promotion-faq" data-toggle="modal"></a></th> -->
                                        <th><a href="#" data-target=".promotion-faq" data-toggle="modal">${pf.promotionWriterEmail}</a></th>
                                        <th>${pf.businessNo}</th>
                                    </tr>
                                </c:forEach>
                                <c:forEach var="rf" items="${reviewFaqList}">
                                    <tr>
                                        <th>리뷰</th>
                                        <th><a href="#0" data-toggle="modal" data-target=".review-faq"
                                            data-refaqno="${rf.reFaqNo}" data-reviewbno="${rf.reviewBno}"
                                            data-writeremail="${rf.writerEmail}" data-content="${rf.content}"
                                            data-faqcomplete="${rf.faqComplete}" data-reviewwriteremail="${rf.reviewWriterEmail}">
                                                ${rf.reFaqNo}</a></th>
                                        <th>${rf.reviewWriterEmail}</th>
                                        <th></th>
                                    </tr>
                                </c:forEach>
                                <c:forEach var="rf" items="${replyFaqList}">
                                    <tr>
                                        <th>댓글</th>
                                        <th><a href="#0" data-toggle="modal" data-target=".reply-faq"
                                            data-replyfaqno="${rf.replyFaqNo}" data-replyno="${rf.replyNo}"
                                            data-writeremail="${rf.writerEmail}" data-content="${rf.content}"
                                            data-faqcomplete="${rf.faqComplete}" data-replywriteremail="${rf.replyWriterEmail}">
                                                ${rf.replyFaqNo}</a></th>
                                        <th>${rf.replyWriterEmail}</th>
                                        <th></th>
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


    <!-- promotion-faq Modal -->
    <form action="/admin/promotion-completeFaq-cancel" method="post" class="promotion-modal-form">
        <div class="modal fade promotion-faq" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
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
                            <input type="text" class="form-control promotion-modal-report-no" name="prFaqNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>홍보글</label>
                            <input type="text" class="form-control promotion-modal-promotion-bno" name="promotionBno" readonly>
                        </div>
                        <div class="form-group">
                            <label>신고 작성자</label>
                            <input type="text" class="form-control promotion-modal-writer-email" name="writerEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>홍보 작성자</label>
                            <input type="text" class="form-control promotion-modal-promotion-writer-email"
                                name="promotionWriterEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>홍보 작성자 사업자번호</label>
                            <input type="text" class="form-control promotion-modal-businessno" name="businessNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>사유</label>
                            <input type="text" class="form-control promotion-modal-contents" name="content" readonly>
                        </div>
                        <input type="hidden" class="form-control promotion-complete-type" name="completeType">
                        <!-- /Row -->
                    </div>
                    <div class="modal-footer pro-btn-wrap">
                        <button class="btn btn-primary del-btn promotion-complete-n" type="button">신고 취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <!-- review-faq Modal -->
    <form action="/admin/review-completeFaq-cancel" method="post" class="review-modal-form">
        <div class="modal fade review-faq" tabindex="-1" role="dialog" aria-labelledby="edit_bookingLabel"
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
                            <input type="text" class="form-control review-modal-report-no" name="reFaqNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>리뷰글</label>
                            <input type="text" class="form-control review-modal-review-bno" name="reviewBno" readonly>
                        </div>
                        <div class="form-group">
                            <label>신고 작성자</label>
                            <input type="text" class="form-control review-modal-writer-email" name="writerEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>리뷰 작성자</label>
                            <input type="text" class="form-control review-modal-review-writer-email"
                                name="reviewWriterEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>사유</label>
                            <input type="text" class="form-control review-modal-contents" name="content" readonly>
                        </div>
                        <input type="hidden" class="form-control review-complete-type" name="completeType">
                        <!-- /Row -->
                    </div>
                    <div class="modal-footer review-btn-wrap">
                        <button class="btn btn-primary del-btn review-complete-n" type="button">신고 취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <!-- reply-faq Modal -->
    <form action="/admin/reply-completeFaq-cancel" method="post" class="reply-modal-form">
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
                            <input type="text" class="form-control reply-modal-report-no" name="replyFaqNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>리뷰글</label>
                            <input type="text" class="form-control reply-modal-reply-no" name="replyNo" readonly>
                        </div>
                        <div class="form-group">
                            <label>신고 작성자</label>
                            <input type="text" class="form-control reply-modal-writer-email" name="writerEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>리뷰 작성자</label>
                            <input type="text" class="form-control reply-modal-reply-writer-email"
                                name="replyWriterEmail" readonly>
                        </div>
                        <div class="form-group">
                            <label>사유</label>
                            <input type="text" class="form-control reply-modal-contents" name="content" readonly>
                        </div>
                        <input type="hidden" class="form-control reply-complete-type" name="completeType">
                        <!-- /Row -->
                    </div>
                    <div class="modal-footer reply-btn-wrap">
                        <button class="btn btn-primary del-btn reply-complete-n" type="button">신고 취소</button>
                    </div>
                </div>
            </div>
        </div>
    </form>






    <script>
        function promotionModalData() {
            const $targetNo = document.querySelector('.target-no');
            $targetNo.addEventListener('click', e => {
                document.querySelector('.promotion-modal-report-no').value = e.target.dataset.prfaqno;
                document.querySelector('.promotion-modal-promotion-bno').value = e.target.dataset.promotionbno;
                document.querySelector('.promotion-modal-writer-email').value = e.target.dataset.writeremail;
                document.querySelector('.promotion-modal-promotion-writer-email').value = e.target.dataset
                    .promotionwriteremail;
                document.querySelector('.promotion-modal-businessno').value = e.target.dataset.businessno;
                document.querySelector('.promotion-modal-contents').value = e.target.dataset.content;
            })

            const $btnWrap = document.querySelector('.pro-btn-wrap');
            const $modalForm = document.querySelector('.promotion-modal-form');
            
            $btnWrap.addEventListener('click', e => {
            

                if (e.target === document.querySelector('.promotion-complete-n')) {
                    document.querySelector('.promotion-complete-type').value = 'N';
                    $modalForm.submit();
                }
            })
        }

        function reviewModalData() {
            const $targetNo = document.querySelector('.target-no');
            $targetNo.addEventListener('click', e => {
                document.querySelector('.review-modal-report-no').value = e.target.dataset.refaqno;
                document.querySelector('.review-modal-review-bno').value = e.target.dataset.reviewbno;
                document.querySelector('.review-modal-writer-email').value = e.target.dataset.writeremail;
                document.querySelector('.review-modal-review-writer-email').value = e.target.dataset
                    .reviewwriteremail;
                document.querySelector('.review-modal-contents').value = e.target.dataset.content;
            })

            const $btnWrap = document.querySelector('.review-btn-wrap');
            const $modalForm = document.querySelector('.review-modal-form');
            
            $btnWrap.addEventListener('click', e => {
                
                if(e.target === document.querySelector('.review-complete-n')) {
                    document.querySelector('.review-complete-type').value = 'N';
                    $modalForm.submit();
                }
            })
        }

        function replyModalData() {
            
            const $targetNo = document.querySelector('.target-no');
            $targetNo.addEventListener('click', e => {
                console.log(e.target);
                document.querySelector('.reply-modal-report-no').value = e.target.dataset.replyfaqno;
                document.querySelector('.reply-modal-reply-no').value = e.target.dataset.replyno;
                document.querySelector('.reply-modal-writer-email').value = e.target.dataset.writeremail;
                document.querySelector('.reply-modal-reply-writer-email').value = e.target.dataset
                    .replywriteremail;
                document.querySelector('.reply-modal-contents').value = e.target.dataset.content;
            })

            const $btnWrap = document.querySelector('.reply-btn-wrap');
            const $modalForm = document.querySelector('.reply-modal-form');
            $btnWrap.addEventListener('click', e => {
                
                if(e.target === document.querySelector('.reply-complete-n')) {
                    document.querySelector('.reply-complete-type').value = 'N';
                    $modalForm.submit();
                }
            })
        }


        (function () {
            
            promotionModalData();
            reviewModalData();
            replyModalData();

        }())
    </script>





</body>

</html>
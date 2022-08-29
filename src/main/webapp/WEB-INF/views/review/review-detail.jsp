<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="../include/static-head.jsp" %>


    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap"
        rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="/css/detail-page.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="/css/custom.css" rel="stylesheet">

    <link href="/css/home.css" rel="stylesheet">

    <style>
        .col-lg-9 {
            margin: auto;
        }

        .comment_write {
            height: 150px;
        }

        /* 페이지 액티브 기능 */
        .pagination .page-item.p-active a {
            background: #589442 !important;
            color: #fff !important;
            cursor: default;
            pointer-events: none;
        }

        .pagination .page-item:hover a {
            background: #a6c09c !important;
            color: #fff !important;
        }

        p {
            overflow-wrap: break-word;
        }

        h1 {
            margin-bottom: 15px;
        }

        .page_header .container .row form {
            width: 75%;

        }

        .page_header .container .row .col-xl-8 {
            width: 20%;
        }

        nav.main-menu {
            height: 100%;
            margin-right: 40px;
        }

        .submenu .show-submenu {
            color: #589442;
        }
    </style>

</head>

<body>

    <%@ include file="../include/detail-header.jsp" %>

    <main>

        <div class="page_header element_to_stick">
            <div class="container">
                <div class="row">
                    <form action="/review/search" method="get">
                        <div class="col-xl-4 col-lg-5 col-md-5">
                            <div class="search_bar_list">
                                <input required value="${search}" name="search" type="text" class="form-control"
                                    placeholder="Search in blog...">
                                <input type="submit" value="Search">
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /row -->
            </div>
        </div>
        <!-- /page_header -->

        <div class="container margin_30_40">
            <div class="row">
                <div class="col-lg-9">
                    <div class="singlepost">
                        <figure>
                            <div class="owl-carousel owl-theme carousel_1 magnific-gallery owl-loaded owl-drag">
                                <div class="owl-stage-outer">
                                    <div class="owl-stage"
                                        style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 2488px;">
                                        <c:forEach var="uploads" items="${uploads}">
                                            <div class="owl-item active" style="width: 829.325px;">
                                                <div class="item">
                                                    <a href="${uploads.filePath}" title="Photo title"
                                                        data-effect="mfp-zoom-in"><img src="${uploads.filePath}"
                                                            alt=""></a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="owl-nav disabled"><button type="button" role="presentation"
                                        class="owl-prev"><span aria-label="Previous">‹</span></button><button
                                        type="button" role="presentation" class="owl-next"><span
                                            aria-label="Next">›</span></button></div>
                            </div>

                        </figure>
                        <h1>${review.title}</h1>
                        <div class="postmeta">
                            <ul>
                                <!-- <li><a href="#"><i class="icon_folder-alt"></i> Category</a></li> -->
                                <li><i class="icon_calendar"></i> ${review.lastUpdated}</li>
                                <li><a href="#"><i class="icon_pencil-edit"></i> ${review.email}</a></li>
                                <li><a href="#section-comment"><i class="icon_comment_alt"></i> (${replyCount})
                                        Comments</a></li>
                                <li class="upCount"><a href="#"><i id="${review.reviewBno}"
                                            class="icon_heart_alt"></i><span
                                            id="heart${review.reviewBno}">${review.likeCnt}</span></a></li>


                            </ul>
                        </div>
                        <!-- /post meta -->
                        <div class="post-content">
                            <p>식당 이름: <a href="#">${review.storeName}</a></p>
                            <p>식당 주소: ${review.storeAddress}</p>
                            <p>${review.content}</p>
                        </div>
                        <!-- /post -->
                    </div>
                    <!-- /single-post -->

                    <a name="section-comment"></a>
                    <div id="comments">
                        <h5>Comments</h5>
                        <ul id="replyData"></ul>

                    </div>

                    <!-- 댓글 페이징 영역 -->
                    <ul class="pagination justify-content-center">
                        <!-- < JS로 댓글 페이징 DIV삽입 > -->
                    </ul>

                    <hr>

                    <h5>Leave a comment</h5>
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="form-group">
                                <input readonly type="text" value="${loginUser.nickName}" name="name" id="name2"
                                    class="form-control" placeholder="이름">
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="form-group">
                                <input readonly type="text" value="${loginUser.email}" name="email" id="email2"
                                    class="form-control" placeholder="이메일">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control comment_write" name="comments" id="comments2" rows="6"
                            placeholder="Comment"></textarea>
                    </div>
                    <div id="replyAddBtn" class="form-group">
                        <button type="submit" id="submit2" class="btn_1 add_bottom_15">Submit</button>
                    </div>
                </div>
                <!-- /col -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->


        <!-- 댓글 수정 모달 -->
        <div class="modal fade bd-example-modal-lg" id="replyModifyModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header" style="background: #343A40; color: white;">
                        <h4 class="modal-title">댓글 수정하기</h4>
                        <button type="button" class="close text-white" data-bs-dismiss="modal">X</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="form-group">
                            <input id="modReplyId" type="hidden">
                            <label for="modReplyText" hidden>댓글내용</label>
                            <textarea id="modReplyText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요."
                                rows="3"></textarea>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button id="replyModBtn2" type="button" class="btn btn-dark">수정</button>
                        <button id="modal-close" type="button" class="btn btn-danger"
                            data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- end replyModifyModal -->


    </main>
    <!-- /main -->

    <%@ include file="../include/footer.jsp" %>
    <script src="/js/sticky_sidebar.min.js"></script>
    <script src="/js/specific_detail.js"></script>
    <script src="/js/datepicker_func_1.js"></script>
    <script src="/js/switcher.js"></script>

    <script>
        //원본 글 번호
        const bno = '${review.reviewBno}';

        // 메인 실행부
        (function () {
            // 초기 화면 렌더링시 댓글 1페이지 렌더링
            showReplies();

            // 댓글 페이지 버튼 클릭이벤트 처리
            makePageButtonClickEvent();

            // // 댓글 등록 버튼 클릭이벤트 처리
            makeReplyRegisterClickEvent();

            // 좋아요 비동기로 올려주는 이벤트 처리
            upLikeCountEvent();

            // // 댓글 수정 모달 오픈, 삭제 이벤트 처리
            // openModifyModalAndRemoveEvent();

            // // 댓글 수정 완료 버튼 이벤트 처리
            // replyModifyEvent();
        })();


        // 댓글 목록을 서버로부터 비동기요청으로 불러오는 함수
        function showReplies(pageNum = 1) {
            fetch('/reply?reviewBno=' + bno + '&pageNum=' + pageNum)
                .then(res => res.json())
                .then(replyMap => {
                    // console.log(replyMap.replyList);
                    makeReplyDOM(replyMap);
                });
        }

        // 댓글 목록 DOM을 생성하는 함수
        function makeReplyDOM({
            replyList,
            count,
            maker
        }) {
            // 각 댓글 하나의 태그
            let tag = '';
            if (replyList === null || replyList.length === 0) {
                tag += "<div id='replyContent' class='card-body'>댓글이 아직 없습니다! ㅠㅠ</div>";
            } else {

                const loginEmail = "${loginUser.email}";
                // console.log("login email - ", typeof log inEmail);

                for (let rep of replyList) {

                    // if (loginEmail === rep.email) {
                    //     console.log("it works bitch")
                    // }

                    tag +=
                        `   <li id="` + rep.replyNo + `">` +
                        `       <div class="avatar">` +
                        `           <a href="#"><img src="/img/avatar1.jpg" alt=""></a>` +
                        `       </div>` +
                        `       <div class="comment_right clearfix">` +
                        `           <div class="comment_info">By <a href="#">` + rep.nickName + `</a><span>|</span>` +
                        rep.lastUpdated;

                    if (loginEmail === rep.email) {
                        tag +=
                            `<span>|</span><a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>` +
                            `<span>|</span><a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>Remove</a>`;
                    }

                    tag +=
                        `           </div>` +
                        `           <p>` + rep.content + `</p>` +
                        `       </div>` +
                        `   </li> `;

                }

            }

            // 댓글 목록에 생성된 DOM 추가
            document.getElementById('replyData').innerHTML = tag;

            // 댓글 수 배치
            // document.getElementById('replyCnt').textContent = count;

            // 댓글 삭제 수정 이벤트
            openModifyModalAndRemoveEvent();

            // 댓글 수정 완료 버튼 이벤트 처리
            replyModifyEvent();

            // 페이지 렌더링
            makePageDOM(maker);
        }

        // 댓글 수정 화면 열기, 삭제 이벤트 처리
        function openModifyModalAndRemoveEvent() {
            const $replyData = document.getElementById('replyData');
            $replyData.onclick = makeReplyModAndDelHandler;
        }

        // 댓글 수정화면 열기, 삭제 처리 핸들러 정의
        function makeReplyModAndDelHandler(e) {
            // const clicked = document.getElementById('replyData');
            e.preventDefault();
            const rno = e.target.parentElement.parentElement.parentElement.id;
            if (e.target.id === 'replyModBtn') {
                processModifyShow(e, rno);
            } else if (e.target.id === 'replyDelBtn') {
                processRemove(rno);
            }
        }

        // 댓글 수정화면 열기 상세처리
        function processModifyShow(e, rno) {
            // console.log('수정버튼 클릭함!! after');
            // 클릭한 버튼 근처에 있는 댓글 내용텍스트를 얻어온다.
            const replyText = e.target.parentElement.parentElement.lastElementChild.textContent;
            // console.log('댓글내용:', replyText);

            // 모달에 해당 댓글내용을 배치한다.
            document.getElementById('modReplyText').value = replyText;

            // 모달을 띄울 때 다음 작업(수정완료처리)을 위해 댓글번호를 모달에 달아두자.
            const $modal = document.querySelector('.modal');
            $modal.dataset.rno = rno;
        }


        // 댓글 삭제 상세처리
        function processRemove(rno) {
            if (!confirm('정말로 삭제하시겠습니까??')) return;
            fetch('/reply/' + rno, {
                    method: 'DELETE'
                })
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'del-success') {
                        alert('삭제 성공!!');
                        showReplies(); // 댓글 새로불러오기
                    } else {
                        alert('삭제 실패!!');
                    }
                });
        }


        // 댓글 수정 비동기 처리 이벤트
        function replyModifyEvent() {
            const $modal = $('#replyModifyModal');
            // console.log(document.getElementById('replyModBtn2'));
            document.getElementById('replyModBtn2').onclick =
                e => {
                    // console.log('수정 완료 버튼 클릭!');
                    // 서버에 수정 비동기 요청 보내기
                    const rno = e.target.closest('.modal').dataset.rno;
                    // console.log(rno);
                    const reqInfo = {
                        method: 'PUT',
                        headers: {
                            'content-type': 'application/json'
                        },
                        body: JSON.stringify({
                            content: $('#modReplyText').val(),
                            replyNo: rno
                        })
                    };
                    fetch('/reply/' + rno, reqInfo)
                        .then(res => res.text())
                        .then(msg => {
                            if (msg === 'mod-success') {
                                alert('수정 성공!!');
                                $modal.modal('hide'); // 모달창 닫기
                                showReplies(); // 댓글 새로불러오기
                            } else {
                                alert('수정 실패!!');
                            }
                        });
                };
        }





        // 댓글 페이지 태그 생성 렌더링 함수
        function makePageDOM(pageInfo) {
            let tag = "";
            const begin = pageInfo.beginPage;
            const end = pageInfo.endPage;
            //이전 버튼 만들기
            if (pageInfo.prev) {
                tag += "<li class='page-item'><a class='page-link page-active' href='" + (begin - 1) +
                    "'>이전</a></li>";
            }
            //페이지 번호 리스트 만들기
            for (let i = begin; i <= end; i++) {
                let active = '';
                if (pageInfo.page.pageNum === i) {
                    active = 'p-active';
                }
                tag += "<li class='page-item " + active + "'><a class='page-link page-custom' href='" + i +
                    "'>" + i + "</a></li>";
            }
            //다음 버튼 만들기
            if (pageInfo.next) {
                tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
                    "'>다음</a></li>";
            }

            // 페이지태그 렌더링
            const $pageUl = document.querySelector('.pagination');
            $pageUl.innerHTML = tag;

            // ul에 마지막페이지 번호 저장.
            $pageUl.dataset.fp = pageInfo.finalPage;
        }

        // 페이지 버튼 클릭이벤트 등록 함수
        function makePageButtonClickEvent() {
            // 페이지 버튼 클릭이벤트 처리
            const $pageUl = document.querySelector('.pagination');
            $pageUl.onclick = e => {
                if (!e.target.matches('.page-item a')) return;
                e.preventDefault();
                // 누른 페이지 번호 가져오기
                const pageNum = e.target.getAttribute('href');
                // 페이지 번호에 맞는 목록 비동기 요청
                showReplies(pageNum);
            };
        }

        // 댓글 등록 이벤트 처리 핸들러 등록 함수
        function makeReplyRegisterClickEvent() {
            const notLogged = document.querySelector('.comment_write');
            if ('${loginUser}' === '') {
                notLogged.setAttribute('disabled', 'true');
                notLogged.setAttribute('placeholder', '로그인 후 사용해 주세요')
            } else {
                notLogged.removeAttribute('disabled');
                notLogged.setAttribute('placeholder', 'Comment')
            }

            document.getElementById('replyAddBtn').onclick = makeReplyRegisterClickHandler;
        }

        // 댓글 등록 이벤트 처리 핸들러 함수
        function makeReplyRegisterClickHandler(e) {
            const $writerInput = document.getElementById('email2');
            const $contentInput = document.getElementById('comments2');
            // 서버로 전송할 데이터들
            const replyData = {
                email: $writerInput.value,
                content: $contentInput.value,
                reviewBno: bno,
                nickName: '${loginUser.nickName}'
            };
            // POST요청을 위한 요청 정보 객체
            const reqInfo = {
                method: 'POST',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify(replyData)
            };
            fetch('/reply', reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'insert-success') {
                        alert('댓글 등록 성공');
                        // 댓글 입력창 리셋
                        $contentInput.value = '';
                        // 댓글 목록 재요청
                        showReplies();
                    } else {
                        alert('댓글 등록 실패');
                    }
                });
        }


        function upLikeCountEvent() {


            if ('${isLiked}' === "true") {
                document.getElementById(bno).classList.add('icon_heart');
                document.getElementById(bno).classList.remove('icon_heart_alt');
            }

            const upCount = document.querySelector('.upCount');
            upCount.onclick = e => {
                if ('${loginUser}' === '') {
                    alert('로그인 후 사용 가능합니다');
                } else {
                    likeOrUnlike(e);
                }
            };
        }

        function likeOrUnlike() {
            // 서버에 수정 비동기 요청 보내기
            // console.log(rno);
            const reqInfo = {
                method: 'PUT',
                headers: {
                    'content-type': 'application/json'
                }
            };

            const email = '${loginUser.email}';
            fetch('/review/updownlike?reviewBno=' + bno + '&email=' + email, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'up-success') {
                        alert('upLike 성공!!');
                        showUpLike(); // 좋아요 새로불러오기
                    } else {
                        alert('downLike 성공!!');
                        showDownLike();
                    }
                });
        }

        function showUpLike() {
            fetch('/review/getLike?reviewBno=' + bno)
                .then(res => res.text())
                .then(likeCnt => {
                    document.getElementById(bno).classList.add('icon_heart');
                    document.getElementById(bno).classList.remove('icon_heart_alt');
                    document.getElementById("heart" + bno).innerHTML = likeCnt;
                });
        }

        function showDownLike() {
            fetch('/review/getLike?reviewBno=' + bno)
                .then(res => res.text())
                .then(likeCnt => {
                    document.getElementById(bno).classList.remove('icon_heart');
                    document.getElementById(bno).classList.add('icon_heart_alt');
                    document.getElementById("heart" + bno).innerHTML = likeCnt;
                });
        }
    </script>


</body>

</html>
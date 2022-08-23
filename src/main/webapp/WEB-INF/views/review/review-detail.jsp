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

    <style>
        .col-lg-9 {
            margin: auto;
        }

        .comment_write {
            height: 150px;
        }

        /* 페이지 액티브 기능 */
        .pagination .page-item.p-active a {
            background: #333 !important;
            color: #fff !important;
            cursor: default;
            pointer-events: none;
        }

        .pagination .page-item:hover a {
            background: #888 !important;
            color: #fff !important;
        }
    </style>

</head>

<body>

    <%@ include file="../include/detail-header.jsp" %>

    <main>
        <%@ include file="../include/page-header.jsp" %>

        <div class="page_header element_to_stick">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
                        <div class="breadcrumbs blog">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Category</a></li>
                                <li>Page active</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="search_bar_list">
                            <input type="text" class="form-control" placeholder="Search in blog...">
                            <input type="submit" value="Search">
                        </div>
                    </div>
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
                                <!-- <div class="owl-dots"><button role="button"
                                        class="owl-dot active"><span></span></button><button role="button"
                                        class="owl-dot"><span></span></button><button role="button"
                                        class="owl-dot"><span></span></button></div> -->
                            </div>

                        </figure>
                        <h1>${review.title}</h1>
                        <div class="postmeta">
                            <ul>
                                <!-- <li><a href="#"><i class="icon_folder-alt"></i> Category</a></li> -->
                                <li><i class="icon_calendar"></i> ${review.lastUpdated}</li>
                                <li><a href="#"><i class="icon_pencil-edit"></i> ${review.email}</a></li>
                                <li><a href="#"><i class="icon_comment_alt"></i> (${replyCount}) Comments</a></li>
                                <li class="upCount"><a href="#"><i class="icon_heart_alt"></i><span
                                            id="heart">${review.likeCnt}</span></a></li>


                            </ul>
                        </div>
                        <!-- /post meta -->
                        <div class="post-content">

                            <p>${review.content}</p>
                        </div>
                        <!-- /post -->
                    </div>
                    <!-- /single-post -->

                    <div id="comments">
                        <h5>Comments</h5>

                    </div>

                    <!-- 댓글 페이징 영역 -->
                    <ul class="pagination justify-content-center">
                        <!-- < JS로 댓글 페이징 DIV삽입 > -->
                    </ul>

                    <hr>

                    <a name="section-comment"></a>
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
                for (let rep of replyList) {

                    tag += `<ul>` +
                        `   <li>` +
                        `       <div class="avatar">` +
                        `           <a href="#"><img src="/img/avatar1.jpg" alt=""></a>` +
                        `       </div>` +
                        `       <div class="comment_right clearfix">` +
                        `           <div class="comment_info">By <a href="#">` + rep.nickName + `</a><span>|</span>` +
                        rep.lastUpdated + `<span>|</span><a href="#">Reply</a></div>` +
                        `           <p>` + rep.content + `</p>` +
                        `       </div>` +
                        `   </li> ` +
                        `</ul>`

                }
            }

            // 댓글 목록에 생성된 DOM 추가
            document.getElementById('comments').innerHTML = tag;

            // 댓글 수 배치
            // document.getElementById('replyCnt').textContent = count;

            // 페이지 렌더링
            makePageDOM(maker);
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
            const upCount = document.querySelector('.upCount');
            upCount.onclick = e => {
                upLikeCount();
            };
        }

        function upLikeCount() {
            // 서버에 수정 비동기 요청 보내기
            // const rbno = '${review.reviewBno}';
            const reqInfo = {
                method: 'PUT',
                headers: {
                    'content-type': 'application/json'
                },
                body: JSON.stringify({
                    likeCnt: document.getElementById('heart').innerHTML,
                    reviewBno: bno
                })
            };
            fetch('/review/uplike?reviewBno=' + bno, reqInfo)
                .then(res => res.text())
                .then(msg => {
                    if (msg === 'up-success') {
                        alert('upCount 성공!!');
                        showLikes(); // 좋아요 새로불러오기
                    } else {
                        alert('upCount 실패!!');
                    }
                });
        }

        function showLikes() {
            // const bno = e.target.id;
            fetch('/review/getLike?reviewBno=' + bno)
                .then(res => res.text())
                .then(likeCnt => {
                    document.getElementById("heart").innerHTML = likeCnt;
                });
        }
    </script>


</body>

</html>
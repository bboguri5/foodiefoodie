<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="/WEB-INF/views/include/static-head.jsp" %>

    <style>
        main {
            height: 65vh;
        }

        .box_booking_2 {
            margin-top: 70px;
        }

    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <main class="bg_gray pattern">

        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <c:if test="${flag == true}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>비밀번호 변경하기</h3>
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <p>계정 이메일로 인증 코드 메일을 전송했습니다. <br>메일 확인 후 하단 입력창에 인증코드를 입력하세요.</p>
                                    <form action="/check/member/authCode" method="post">
                                        <input type="text" name="inputAuthCode" placeholder="이메일 인증코드">
                                        <button type="submit">전송</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${flag == false}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>비밀번호 변경 실패</h3>
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <p>잘못된 현재 비밀번호를 입력하셨습니다. <br> 다시 시도하세요.</p>
                                    <a href="/change/pw">다시 시도하기</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <!-- /box_booking -->
                </div>
                <!-- /col -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

</body>

</html>
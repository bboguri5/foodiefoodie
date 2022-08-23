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

        .title {
            margin-bottom: 70px;
        }
    </style>

</head>

<body>

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <main class="bg_gray pattern">

        <div class="container margin_60_40">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <c:if test="${authCode != null}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>비밀번호 변경하기.</h3>
                                    <!-- <a href="#">Get directions</a> -->
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <h3>계정 이메일로 인증 코드 메일을 전송했습니다. <br>메일 확인 후 하단 입력창에 인증코드를 입력하세요.</h3>
                                    <br>
                                    <form action="/check-authCode" method="post">
                                        <input type="text" name="authCode" placeholder="이메일 인증코드">
                                        <input type="hidden" name="email" value="${email}">
                                        <input type="hidden" name="realAuthCode" value="${authCode}">
                                        <button type="submit">전송</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${authCode == null}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>비밀번호 변경에 실패했습니다.</h3>
                                    <!-- <a href="#">Get directions</a> -->
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <h3>입력하신 정보와 일치하는 계정이 존재하지 않습니다. <br> 다시 시도해주세요.</h3>
                                    <a href="/find-pw">비밀번호 다시 찾기</a>
                                    <br>
                                    <a href="/register">회원가입</a>
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

</body>

</html>
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
                    <c:if test="${foundEmail != null}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>계정 이메일을 찾았습니다.</h3>
                                    <br>
                                    <!-- <a href="#">Get directions</a> -->
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <h3>계정 이메일 : '${foundEmail}'</h3>
                                    <br>
                                    <a href="/login">바로 로그인하기</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${foundEmail == null}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>계정 이메일 찾기에 실패했습니다.</h3>
                                    <br>
                                    <!-- <a href="#">Get directions</a> -->
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <h3>입력하신 정보와 일치하는 계정이 존재하지 않습니다. <br> 다시 시도해주세요.</h3>
                                    <br>
                                    <a href="/find/email">계정 이메일 다시 찾기</a>
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
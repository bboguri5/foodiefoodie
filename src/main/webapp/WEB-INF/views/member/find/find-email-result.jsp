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
                    <c:if test="${emailListSize > 0}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <div class="icon icon--order-success svg add_bottom_15">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="72" height="72">
                                            <g fill="none" stroke="#8EC343" stroke-width="2">
                                                <circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
                                                <path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
                                            </g>
                                        </svg>
                                    </div>
                                    <h3>계정 이메일을 ${emailListSize}개 찾았습니다.</h3>
                                    <br>
                                    <!-- <a href="#">Get directions</a> -->
                                </div>
                            </div>
                            <!-- /head -->
                            <div class="main">
                                <div id="confirm">
                                    <c:forEach var="foundEmail" items="${foundEmailList}">
                                    <p>계정 이메일 : '${foundEmail}'</p>
                                    </c:forEach>
                                    <br>
                                    <a href="/login">바로 로그인하기</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${emailListSize == 0}">
                        <div class="box_booking_2">
                            <div class="head">
                                <div class="title">
                                    <h3>계정 이메일 찾기에 실패했습니다.</h3>
                                    <br>
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
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

	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

	<main class="bg_gray pattern">

		<div class="container margin_60_40">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="box_booking_2">
						<div class="head">
							<div class="title">
								<h3>비밀번호 변경 성공!</h3>
							</div>
						</div>
						<!-- /head -->
						<div class="main">
							<div id="confirm">
								<p>로그인한 상태에서 비밀번호 변경을 한 경우에는 자동 로그아웃 처리됩니다. <br> 새로운 비밀번호로 다시 로그인하세요.</p>
								<a href="/login">바로 로그인하기</a>
							</div>
						</div>
					</div>
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
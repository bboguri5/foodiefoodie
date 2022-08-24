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
				<div class="col-lg-5">
					<div class="box_booking_2">
						<div class="head">
							<div class="title">
								<h3>비밀번호 변경 성공!</h3>
							</div>
						</div>
						<!-- /head -->
						<div class="main">
							<div id="confirm">
								<div class="icon icon--order-success svg add_bottom_15">
									<svg xmlns="http://www.w3.org/2000/svg" width="72" height="72">
										<g fill="none" stroke="#8EC343" stroke-width="2">
											<circle cx="36" cy="36" r="35"
												style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;">
											</circle>
											<path d="M17.417,37.778l9.93,9.909l25.444-25.393"
												style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
										</g>
									</svg>
								</div>
								<br>
								<h3>비밀번호 변경에 성공했습니다.</h3>
								<p>로그인한 상태에서 비밀번호 변경을 한 경우에는 자동 로그아웃 처리됩니다. <br> 새로운 비밀번호로 다시 로그인하세요.</p>
								<br>
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
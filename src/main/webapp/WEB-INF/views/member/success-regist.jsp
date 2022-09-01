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
								<h3>회원가입 성공!</h3>
							</div>
						</div>
						<!-- /head -->
						<div class="main">
							<div id="confirm">
								<p>축하합니다. 회원가입이 완료되었습니다!</p>
								<p>다양한 가게 홍보글과 회원들의 리뷰글을 확인해보세요!</p>
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
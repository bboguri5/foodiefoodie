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
			margin-top: 50px;
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
								<h3>주문 성공!</h3>
							</div>
						</div>
						<!-- /head -->
						<div class="main">
							<div id="confirm">
								<p>가게별 변동사항 발생에 따른 정책이 다르니 변동사항에 따른 문의는 홍보글 참고 또는 가게로 직접 문의하시기 바랍니다.</p>
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
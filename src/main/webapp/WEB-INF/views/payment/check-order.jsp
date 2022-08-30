<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="../include/static-head.jsp" %>

	<style>
		.box_booking_2 {
			margin-top: 50px;
		}
	</style>

</head>

<body>
	<%@ include file="../include/header.jsp" %>


	<main class="bg_gray pattern">

		<div class="container margin_60_40">
			<div class="row justify-content-center">
				<div class="col-xl-5 col-lg-6 col-sm-8">
					<div class="box_booking_2">
						<div class="head">
							<div class="title">
								<h3>주문 확인서</h3>
							</div>
						</div>
						<!-- /head -->
						<div class="main">
							<h6>주문 정보</h6>
							<ul>
								<form action="/kakao/order/request" id="reqOrderForm" method="post">
									<c:if test="${orderInfoList != null}">
										<input type="hidden" name="businessNo" value="${orderInfoList[0].businessNo}">
										<c:forEach var="orderInfo" items="${orderInfoList}">
											<li>${orderInfo.menuName} *
												${orderInfo.quantity}<span>${orderInfo.menuPrice}</span></li>
											<input type="hidden" name="menu" value="${orderInfo.menuName}">
										</c:forEach>
									</c:if>
									<li class="total">Total<span id="total">${totalPrice}</span></li>
									<input type="hidden" name="totalQuantity" value="${totalQuantity}">
									<input type="hidden" name="totalPrice" value="${totalPrice}">
							</ul>
							<a href="#" class="btn_1 full-width outline mb_5" id="reOrder">다시 주문하기</a>
							<hr>

							<button type="button" class="btn_1 full-width mb_5" id="reqOrderBtn">주문하기</button>
							</form>
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

	<%@ include file="../include/footer.jsp" %>

	<script>
		const $reOrderBtn = $('#reOrder');

		$reOrderBtn.on('click', e => {
			e.preventDefault();
			sessionStorage.removeItem('orderInfoList');
			sessionStorage.removeItem('totalPrice');
			sessionStorage.removeItem('totalQuantity');
			fetch('/reOrder')
				.then(res => res.text())
				.then(referer => {
					location.href = referer;
				})
			// window.history.back();
		});


		const $reqOrderForm = $('#reqOrderForm');
		const $reqOrderBtn = $('#reqOrderBtn');
		$reqOrderBtn.on('click', e => {
			$reqOrderForm.submit();
		});
		

		if ('${pcUrl}' != '') {
			location.href ='${pcUrl}';
		}

	</script>


</body>

</html>
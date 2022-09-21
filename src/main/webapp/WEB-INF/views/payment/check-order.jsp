<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="en">

<head>
	<%@ include file="../include/static-head.jsp" %>

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
									<c:if test="${menuInfoList != null}">
										<c:forEach var="menuInfo" items="${menuInfoList}">
											<li>${menuInfo.menuName} *
												${menuInfo.quantity}<span>${menuInfo.menuPrice}</span></li>
										</c:forEach>
									</c:if>
									<c:if test="${discount == 0}">
										<li class="total">Total<span id="total">${totalPrice}</span></li>
									</c:if>
									<c:if test="${discount != 0}">
										<li class="total">Total<span id="total">
												<fmt:parseNumber var="i" type="number"
													value="${totalPrice - (totalPrice * (discount / 100))}" /><c:out value = "${i}" />
											</span></li>
										<p>핫딜 할인이 적용된 가격입니다.</p>
									</c:if>
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
			sessionStorage.removeItem('menuInfoList');
			sessionStorage.removeItem('totalPrice');
			sessionStorage.removeItem('totalQuantity');
			sessionStorage.removeItem('discount');
			sessionStorage.removeItem('businessNo');
			
			location.href = '${referer}';
		});


		const $reqOrderForm = $('#reqOrderForm');
		const $reqOrderBtn = $('#reqOrderBtn');
		$reqOrderBtn.on('click', e => {
			$reqOrderForm.submit();
		});


		if ('${pcUrl}' != '') {
			location.href = '${pcUrl}';
		}
	</script>

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

</body>

</html>
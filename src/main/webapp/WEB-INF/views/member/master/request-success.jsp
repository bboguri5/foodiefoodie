<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    
	<%@ include file="/WEB-INF/views/include/static-head.jsp" %>

</head>

<body>
				
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<main class="bg_gray pattern">
		
		<div class="container margin_60_40">
		    <div class="row justify-content-center">
		        <div class="col-lg-4">
		        	<div class="box_booking_2">
		                <div class="head">
		                    <div class="title">
		                    <h3>사업자 권한 요청 성공!</h3>
		                    <!-- <a href="#">Get directions</a> -->
		                </div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                	<div id="confirm">
								<div class="icon icon--order-success svg add_bottom_15">
									<svg xmlns="http://www.w3.org/2000/svg" width="72" height="72">
										<g fill="none" stroke="#8EC343" stroke-width="2">
											<circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
											<path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
										</g>
									</svg>
								</div>
								<h3>성공적으로 권한 요청이 완료되었습니다!</h3>
								<p>수 일내 관리자 확인 후 권한 부여 처리됩니다. 마이페이지에서 결과를 확인하세요!</p>
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
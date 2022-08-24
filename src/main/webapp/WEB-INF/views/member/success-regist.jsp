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
		        <div class="col-lg-4">
		        	<div class="box_booking_2">
		                <div class="head">
		                    <div class="title">
		                    <h3>회원가입 성공!</h3>
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
								<h3>축하합니다. 회원가입이 완료되었습니다!</h3>
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
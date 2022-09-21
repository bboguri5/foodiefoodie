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
		                    <h3>사업자 권한 요청 성공!</h3>
		                    <!-- <a href="#">Get directions</a> -->
		                </div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                	<div id="confirm">
								<p>성공적으로 권한 요청이 완료되었습니다!</p>
								<p>수 일내 관리자 확인 후 권한 부여 처리됩니다. <br> 마이페이지에서 결과를 확인하세요!</p>
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
	<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
     crossorigin="anonymous"></script>

</body>
</html>
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

    <%@ include file="/WEB-INF/views/include/headear.jsp" %>


    <main class="bg_gray pattern">
		
		<div class="container margin_60_40">
		    <div class="row justify-content-center">
		        <div class="col-lg-4">
		        	<div class="box_booking_2">
		                <div class="head">
		                    <div class="title">
		                    <h3>이런..!!</h3>
		                </div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                	<div id="confirm">
								<h3>주문이 취소되었습니다.</h3>
								<p>재주문을 원하시면 처음부터 다시 시도하세요.</p>
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

	<script>

		sessionStorage.removeItem('orderInfoList');
		sessionStorage.removeItem('totalPrice');
		sessionStorage.removeItem('totalQuantity');

	</script>

</body>
</html>
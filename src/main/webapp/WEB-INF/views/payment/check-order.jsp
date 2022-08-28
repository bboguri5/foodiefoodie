<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en"><head>
	<%@ include file="../include/static-head.jsp" %>


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
		                    <h3>${order.storeName}</h3>
		                    ${order.storeAddress} - <a href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x47e66e1de36f4147:0xb6615b4092e0351f!2sAssistance+Publique+-+H%C3%B4pitaux+de+Paris+(AP-HP)+-+Si%C3%A8ge!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361" target="blank">Get directions</a>
		                </div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                	<h6>Order summary</h6>
		                	<ul>
		                		<li>Date<span>Today 23/11/2019</span></li>
		                		<li>Hour<span>08.30pm</span></li>
		                		<li>Type<span>Delivery</span></li>
		                		<li class="total">Total<span>$66</span></li>
		                	</ul>
		                	<a href="detail-restaurant-delivery.html" class="btn_1 full-width outline mb_5">Change Order</a>
		                	<hr>

		                    <a href="confirm-delivery.html" class="btn_1 full-width mb_5">Order Now</a>          
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



</body></html>
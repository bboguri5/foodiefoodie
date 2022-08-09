<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Foogra - Discover & Book the best restaurants at the best price">
    <meta name="author" content="Ansonika">
    <title>FoodieFoodie</title>
a
    <!-- Favicons-->
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="/img/apple-touch-icon-144x144-precomposed.png">

     <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="/css/home.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="/css/custom.css" rel="stylesheet">

</head>

<body>
				
    <%@ include file="../include/header.jsp" %>

	<main>
		<div class="hero_single version_2">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)" style="background: url('img/main_background.jpg') no-repeat fixed 90% / 120%">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>푸디푸디</h1>
							<p>Foodies Welcome Here</p>
							<form method="post" action="grid-listing-filterscol.html">
								<div class="row g-0 custom-search-input">
									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control no_border_r" type="text" placeholder="지역, 식당, 또는 음식">
											<i class="icon_pin_alt"></i>
										</div>
									</div>
									<div class="col-lg-2">
										<input type="submit" value="Search">
									</div>
								</div>
								<!-- /row -->
							</form>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
		</div>
		<!-- /hero_single -->
		
		<div class="bg_gray">
			<div class="container margin_60_40">
				<div class="main_title center">
					<span><em></em></span>
					<h2>무엇이 먹고싶으신가요? ㅋㅋ</h2>
					<p>카테고리 골라골라</p>
				</div>
				<!-- /main_title -->
				<div class="owl-carousel owl-theme categories_carousel">
					<div class="item">
						<a href="#0">
							<span>98</span>
							<i class="icon-food_icon_pizza"></i>
							<h3>양식</h3>
							<small>Avg price $40</small>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>87</span>
							<i class="icon-food_icon_sushi"></i>
							<h3>일식</h3>
							<small>Avg price $50</small>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>96</span>
							<i class="icon-food_icon_burgher"></i>
							<h3>한식</h3>
							<small>Avg price $55</small>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>78</span>
							<i class="icon-food_icon_vegetarian"></i>
							<h3>더 없나?</h3>
							<small>Avg price $40</small>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>65</span>
							<i class="icon-food_icon_cake_2"></i>
							<h3>카페/디저트</h3>
							<small>Avg price $60</small>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>65</span>
							<i class="icon-food_icon_chinese"></i>
							<h3>중식</h3>
							<small>Avg price $40</small>
						</a>
					</div>
				</div>
				<!-- /carousel -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_gray -->
		
		<div class="container margin_60_40">
			<div class="main_title">
				<span><em></em></span>
				<h2>오늘의 맛집</h2>
				<p>Cum doctus civibus efficiantur in imperdiet deterruisset.</p>
				<a href="#0">View All</a>
			</div>

			<div class="owl-carousel owl-theme carousel_4">
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_1.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Pizza</small>
			                    <div class="item_title">
			                        <h3>Da Alfredo</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-40%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_2.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Burghers</small>
			                    <div class="item_title">
			                        <h3>Best Burghers</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>9.5</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_3.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Vegetarian</small>
			                    <div class="item_title">
			                        <h3>Vego Life</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>7.5</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-25%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_4.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Japanese</small>
			                    <div class="item_title">
			                        <h3>Sushi Temple</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>9.5</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_5.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Pizza</small>
			                    <div class="item_title">
			                        <h3>Auto Pizza</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>7.0</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-15%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_6.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Burghers</small>
			                    <div class="item_title">
			                        <h3>Alliance</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_7.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Chinese</small>
			                    <div class="item_title">
			                        <h3>Alliance</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_closed">Now Closed</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			</div>
			<!-- /carousel -->







			<div class="main_title">
				<span><em></em></span>
				<h2>어떤 지역 맛집</h2>
				<p>Cum doctus civibus efficiantur in imperdiet deterruisset.</p>
				<a href="#0">View All</a>
			</div>

			<div class="owl-carousel owl-theme carousel_4">
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_1.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Pizza</small>
			                    <div class="item_title">
			                        <h3>Da Alfredo</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-40%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_2.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Burghers</small>
			                    <div class="item_title">
			                        <h3>Best Burghers</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>9.5</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_3.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Vegetarian</small>
			                    <div class="item_title">
			                        <h3>Vego Life</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>7.5</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-25%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_4.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Japanese</small>
			                    <div class="item_title">
			                        <h3>Sushi Temple</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>9.5</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_5.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Pizza</small>
			                    <div class="item_title">
			                        <h3>Auto Pizza</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>7.0</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-15%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_6.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Burghers</small>
			                    <div class="item_title">
			                        <h3>Alliance</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_open">Now Open</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			    <div class="item">
			        <div class="strip">
			            <figure>
			                <span class="ribbon off">-30%</span>
			                <img src="img/lazy-placeholder.png" data-src="img/location_7.jpg" class="owl-lazy" alt="">
			                <a href="detail-restaurant.html" class="strip_info">
			                    <small>Chinese</small>
			                    <div class="item_title">
			                        <h3>Alliance</h3>
			                        <small>27 Old Gloucester St</small>
			                    </div>
			                </a>
			            </figure>
			            <ul>
			                <li><span class="loc_closed">Now Closed</span></li>
			                <li>
			                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
			                </li>
			            </ul>
			        </div>
			    </div>
			</div>
			<!-- /carousel -->










			<div class="banner lazy" data-bg="url(img/banner_bg_desktop.jpg)">
				<div class="wrapper d-flex align-items-center opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.2)" style="background: url('img/food_review.jpg') no-repeat 100% / 100%">
					<div>
						<small>foogra</small>
						<h3>먹어본 사람들의 솔직한 리뷰 보러 고고 하슈</h3>
						<p>많이 많이 있다구, 맛집 찾아 보라구</p>
						<a href="grid-listing-filterscol.html" class="btn_1">맛집 리뷰 보러가기</a>
					</div>
				</div>
				<!-- /wrapper -->
			</div>
			<!-- /banner -->

			<div class="row">
				<div class="col-12">
					<div class="main_title version_2">
						<span><em></em></span>
						<h2>핫딜</h2>
						<p>오늘의 핫딜 놓치지 마세요!</p>
						<a href="#0">더보기</a>
					</div>
				</div>
				<div class="col-md-6">
					<div class="list_home">
						<ul>
							<li>
								<a href="detail-restaurant.html">
									<figure>
										<img src="img/location_list_placeholder.png" data-src="img/location_list_1.jpg" alt="" class="lazy">
									</figure>
									<div class="score"><strong>9.5</strong></div>
									<em>Italian</em>
									<h3>La Monnalisa</h3>
									<small>8 Patriot Square E2 9NF</small>
									<ul>
										<li><span class="ribbon off">-30%</span></li>
										<li>Average price $35</li>
									</ul>
								</a>
							</li>
							<li>
								<a href="detail-restaurant.html">
									<figure>
										<img src="img/location_list_placeholder.png" data-src="img/location_list_2.jpg" alt="" class="lazy">
									</figure>
									<div class="score"><strong>8.0</strong></div>
									<em>Mexican</em>
									<h3>Alliance</h3>
									<small>27 Old Gloucester St, 4563</small>
									<ul>
										<li><span class="ribbon off">-40%</span></li>
										<li>Average price $30</li>
									</ul>
								</a>
							</li>
							<li>
								<a href="detail-restaurant.html">
									<figure>
										<img src="img/location_list_placeholder.png" data-src="img/location_list_3.jpg" alt="" class="lazy">
									</figure>
									<div class="score"><strong>9.0</strong></div>
									<em>Sushi - Japanese</em>
									<h3>Sushi Gold</h3>
									<small>Old Shire Ln EN9 3RX</small>
									<ul>
										<li><span class="ribbon off">-25%</span></li>
										<li>Average price $20</li>
									</ul>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-6">
					<div class="list_home">
						<ul>
							<li>
								<a href="detail-restaurant.html">
									<figure>
										<img src="img/location_list_placeholder.png" data-src="img/location_list_4.jpg" alt="" class="lazy">
									</figure>
									<div class="score"><strong>9.5</strong></div>
									<em>Vegetarian</em>
									<h3>Mr. Pepper</h3>
									<small>27 Old Gloucester St, 4563</small>
									<ul>
										<li><span class="ribbon off">-30%</span></li>
										<li>Average price $20</li>
									</ul>
								</a>
							</li>
							<li>
								<a href="detail-restaurant.html">
									<figure>
										<img src="img/location_list_placeholder.png" data-src="img/location_list_5.jpg" alt="" class="lazy">
									</figure>
									<div class="score"><strong>8.0</strong></div>
									<em>Chinese</em>
									<h3>Dragon Tower</h3>
									<small>22 Hertsmere Rd E14 4ED</small>
									<ul>
										<li><span class="ribbon off">-50%</span></li>
										<li>Average price $35</li>
									</ul>
								</a>
							</li>
							<li>
								<a href="detail-restaurant.html">
									<figure>
										<img src="img/location_list_placeholder.png" data-src="img/location_list_6.jpg" alt="" class="lazy">
									</figure>
									<div class="score"><strong>8.5</strong></div>
									<em>Pizza - Italian</em>
									<h3>Bella Napoli</h3>
									<small>135 Newtownards Road BT4</small>
									<ul>
										<li><span class="ribbon off">-45%</span></li>
										<li>Average price $25</li>
									</ul>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
			<p class="text-center d-block d-md-block d-lg-none"><a href="grid-listing-filterscol.html" class="btn_1">View All</a></p>
			<!-- /button visibile on tablet/mobile only -->
		</div>
		<!-- /container -->

		

		<div class="call_section lazy" data-bg="url(img/owner.jpg)">
		    <div class="container clearfix">
		        <div class="col-lg-5 col-md-6 float-end wow">
		            <div class="box_1">
		                <h3>사장님이신가용?</h3>
		                <p>Join Us to increase your online visibility. You'll have access to even more customers who are looking to enjoy your tasty dishes at home.</p>
		                <a href="submit-restaurant.html" class="btn_1">Read more</a>
		            </div>
		        </div>
    		</div>
    	</div>
   		<!--/call_section-->
		
	</main>
	<!-- /main -->

	<%@ include file="../include/footer.jsp" %>


	<div id="toTop"></div><!-- Back to top button -->
	
	<div class="layer"></div><!-- Opacity Mask Menu Mobile -->
	
	<!-- Sign In Modal -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="modal_header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#0" class="social_bt facebook">Login with Facebook</a>
				<a href="#0" class="social_bt google">Login with Google</a>
				<div class="divider"><span>Or</span></div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-start">
						<label class="container_check">Remember me
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-end"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center">
					<input type="submit" value="Log In" class="btn_1 full-width mb_5">
					Don’t have an account? <a href="account.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Modal -->
	
	<!-- COMMON SCRIPTS -->
    <script src="js/common_scripts.min.js"></script>
    <script src="js/common_func.js"></script>
    <script src="assets/validate.js"></script>

</body>
</html>
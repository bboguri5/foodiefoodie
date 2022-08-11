<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../include/static-head.jsp" %>

	<style>

	</style>
</head>

<body>

	<%@ include file="../include/header.jsp" %>

	<main>
		<div class="hero_single version_2">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)" 
				style="background: url('img/main_background.jpg') no-repeat fixed 90% / cover">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<p>Foodies Welcome Here</p>
							<form method="post" action="grid-listing-filterscol.html">
								<div class="row g-0 custom-search-input">
									<div class="col-lg-6">
										<div class="form-group">
											<input class="form-control no_border_r" type="text"
												placeholder="지역, 식당, 또는 음식">
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
							<span>96</span>
							<i class="icon-food_icon_dish"></i>
							<h3>한식</h3>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>65</span>
							<i class="icon-food_icon_chinese"></i>
							<h3>중식</h3>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>87</span>
							<i class="icon-food_icon_sushi"></i>
							<h3>일식</h3>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>98</span>
							<i class="icon-food_icon_pizza"></i>
							<h3>양식</h3>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>78</span>
							<i class="icon-food_icon_beer"></i>
							<h3>술집</h3>
						</a>
					</div>
					<div class="item">
						<a href="#0">
							<span>65</span>
							<i class="icon-food_icon_cake_2"></i>
							<h3>카페/디저트</h3>
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
				<a href="/foodlist">View All</a>
			</div>

			<div class="owl-carousel owl-theme carousel_4">
				<c:forEach var="pmd" items="${pmd}" varStatus="status">
					<div class="item">
						<div class="strip">
							<figure>
								<img src="img/lazy-placeholder.png" data-src="img/location_1.jpg" class="owl-lazy"
									alt="">
								<a href="detail-restaurant.html" class="strip_info">
									<div class="item_title">
										<h3>${pmd.storeName}</h3>
										<small>${pmd.storeAddress}</small>
									</div>
								</a>
							</figure>
							<ul>
								<li><span class="loc_open">Now Open</span></li>
								<li>
									<div class="score"><span>최고맛집<em>${pmd.reviewCnt}개
												리뷰</em></span><strong>${pmd.avgStarRate}</strong></div>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /carousel -->


			<div class="main_title">
				<span><em></em></span>
				<h2>푸디푸디 추천 맛집</h2>
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
				<a id="viewAll" href="#0">View All</a>
			</div>

			<div id="locationList" class="owl-carousel owl-theme carousel_4">
				<!-- <div class="owl-stage-outer">
					<div class="owl-stage">
						<div id="locationList" class="owl-item active">

						</div>
					</div>
					<div class="owl-nav">
						<button type="button" role="presentation" class="owl-prev disabled">
							<i class="arrow_carrot-left"></i>
						</button>
						<button type="button" role="presentation" class="owl-next"><i class="arrow_carrot-right"></i>
						</button>
					</div>
					<div class="owl-dots">
						<button role="button" class="owl-dot active"><span></span></button>
						<button role="button" class="owl-dot"><span></span></button>
						<button role="button" class="owl-dot"><span></span></button>
						<button role="button" class="owl-dot"><span></span></button>
						<button role="button" class="owl-dot"><span></span></button>
						<button role="button" class="owl-dot"><span></span></button>
						<button role="button" class="owl-dot"><span></span></button>
					</div>
				</div> -->
			</div>
			<!-- /carousel -->

			<div class="banner lazy" data-bg="url(img/banner_bg_desktop.jpg)">
				<div class="wrapper d-flex align-items-center opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.2)"
					style="background: url('img/food_review.jpg') no-repeat 100% / 100%">
					<div>
						<small>Foodie Foodie</small>
						<h3>직접 먹어본 사람들만의 솔직한 리뷰</h3>
						<p>많은 후기를 보고 맛집을 찾아보세요!</p>
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
						<a href="/hotdeals">더보기</a>
					</div>
				</div>

				<c:forEach var="hd" items="${hotDeals}" varStatus="status">
					<c:if test="${hotDeals.indexOf(hd) gt 2}">
						<div class="col-md-6">
							<div class="list_home">
								<ul>
									<li>
										<a href="detail-restaurant.html">
											<figure>
												<img src="/img/location_list_placeholder.png"
													data-src="/img/location_list_1.jpg" alt="" class="lazy">
											</figure>
											<div class="score">
												<strong>${hd.avgStarRate}</strong>
											</div>
											<h3>${hd.storeName}</h3>
											<small>${hd.storeAddress}</small>
											<ul>
												<li><span class="ribbon off">${hd.discountPrice}원</span>
												</li>
												<li>할인 가격</li>
											</ul>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</c:if>
					<c:if test="${hotDeals.indexOf(hd) le 2}">
						<div class="col-md-6">
							<div class="list_home">
								<ul>
									<li>
										<a href="detail-restaurant.html">
											<figure>
												<img src="/img/location_list_placeholder.png"
													data-src="/img/location_list_1.jpg" alt="" class="lazy">
											</figure>
											<div class="score">
												<strong>${hd.avgStarRate}</strong></div>
											<h3>${hd.storeName}</h3>
											<small>${hd.storeAddress}</small>
											<ul>
												<li><span class="ribbon off">${hd.discountPrice}원</span>
												</li>
												<li>할인 가격</li>
											</ul>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- /row -->
			<p class="text-center d-block d-md-block d-lg-none"><a href="grid-listing-filterscol.html"
					class="btn_1">View All</a></p>
			<!-- /button visibile on tablet/mobile only -->
		</div>
		<!-- /container -->



		<div class="call_section lazy" data-bg="url(img/owner.jpg)">
			<div class="container clearfix">
				<div class="col-lg-5 col-md-6 float-end wow">
					<div class="box_1">
						<h3>사장님이신가용?</h3>
						<p>Join Us to increase your online visibility. You'll have access to even more
							customers who are
							looking to enjoy your tasty dishes at home.</p>
						<a href="submit-restaurant.html" class="btn_1">Read more</a>
					</div>
				</div>
			</div>
		</div>
		<!--/call_section-->

	</main>
	<!-- /main -->

	<%@ include file="../include/footer.jsp" %>

	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			var options = {
				enableHighAccuracy: true,
				timeout: 5000,
				maximumAge: 0
			};

			function success(position) {
				//좌표를 알아낼 수 있는데, 여기서 알아낸 좌표를 kakaoAPI url에 사용할 것이다.
				console.log('위도 : ' + position.coords.latitude);
				console.log('경도: ' + position.coords.longitude);
			};

			function error(err) {
				console.warn('ERROR(' + err.code + '): ' + err.message);
			};


			function onGeoOk(position) {
				const lat = position.coords.latitude;
				const lon = position.coords.longitude;

				//kakao REST API에 get 요청을 보낸다.
				//파라미터 x,y에 lon,lat을 넣어주고 API_KEY를 Authorization헤더에 넣어준다.
				axios.get(
						`https://dapi.kakao.com/v2/local/geo/coord2address.json?x=` + lon + '&y=' +
						lat + '&input_coord=WGS84', {
							headers: {
								Authorization: `KakaoAK 5653dd9c92eb40c48bfce93c60c9cc5f`
							}
						}
					)
					.then(res => {
						const si = res.data.documents[0].address.region_1depth_name;
						const gu = res.data.documents[0].address.region_2depth_name;
						const address = si + ' ' + gu;
						console.log('this is the address : ', address);

						fetch('/mylocation?storeAddress=' + address)
							.then(res => res.json())
							.then(replyMap => {
								makeLocationDom(replyMap);
								const $viewAll = document.getElementById('viewAll');
								$viewAll.onclick = e => {
									location.href = '/locationlist?storeAddress=' + address;
								};
							});
					}).catch(e => console.log('e: ', e))
			}



			function makeLocationDom({
				masterList
			}) {
				console.log(masterList);

				// 각 리스트 하나의 태그
				let tag = '';


				if (masterList === null || masterList.length === 0) {
					tag += "<div id='locationList'>주변에 식당이 없습니다! ㅠㅠ</div>";
				} else {
					for (let i = 0; i < masterList.length; i++) {
						tag +=
							// `<div class="owl-item">` +
							`<div class="item">` +
							`   <div class="strip">` +
							`       <figure>` +
							`           <img src="img/lazy-placeholder.png" data-src="img/location_1.jpg" class="owl-lazy" alt="">` +
							`           <a href="detail-restaurant.html" class="strip_info">` +
							`               <div class="item_title">` +
							`                   <h3>` + masterList[i].storeName + `</h3>` +
							`                   <small>` + masterList[i].storeAddress + `</small>` +
							`               </div>` +
							`           </a>` +
							`       </figure>` +
							`       <ul>` +
							`           <li><span class="loc_open">Now Open</span></li>` +
							`           <li>` +
							`               <div class="score"><span>근처 맛집<em>` + masterList[i].reviewCnt +
							`개 리뷰</em></span><strong>` + masterList[i].avgStarRate + `</strong></div>` +
							`           </li>` +
							`       </ul>` +
							`   </div>` +
							`</div>`;
						// `</div>`;
					}

				}

				document.getElementById('locationList').innerHTML = tag;
			}

			// function printAddress(address) {
			//     console.log(address);

			// }


			function onGeoError() {
				alert("위치권한을 확인해주세요");
			}


			//navigator.geolocation.getCurrentPosition(위치받는함수, 에러났을때 함수)
			navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError)
		});
	</script>

</body>

</html>
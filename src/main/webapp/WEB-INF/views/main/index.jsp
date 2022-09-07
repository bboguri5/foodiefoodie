<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../include/static-head.jsp" %>
	<link href="/css/help.css" rel="stylesheet">

	<style>
		#locationList {
			display: flex;
		}

		#locationList .item {
			width: 24%;
			margin-right: 1%;
		}


		form {
			width: 80%;
			margin: auto;
		}
	</style>
</head>

<body>

	<%@ include file="../include/header.jsp" %>

	<main>
		<div class="hero_single version_2">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)"
				style="background: url('/img/main_background.jpg') no-repeat fixed 90% / cover">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>푸디푸디</h1>
							<p>Foodies Welcome Here</p>
							<form action="/list?sort=star" method="get">
								<div class="search_bar">
									<input required type="text" class="form-control" placeholder="지역, 식당, 또는 음식"
										name="keyword" value="${s.keyword}">
									<input type="submit" value="Search">
								</div>
							</form>
							<!-- </div> -->
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
					<h2>카테고리 모아보기</h2>
				</div>
				<!-- /main_title -->
				<div class="owl-carousel owl-theme categories_carousel">
					<div class="item">
						<a href="/hashtag?tag=한식">
							<span>${hashTags.korean}</span>
							<i class="icon-food_icon_dish"></i>
							<h3>한식</h3>
						</a>
					</div>
					<div class="item">
						<a href="/hashtag?tag=중식">
							<span>${hashTags.chinese}</span>
							<i class="icon-food_icon_chinese"></i>
							<h3>중식</h3>
						</a>
					</div>
					<div class="item">
						<a href="/hashtag?tag=일식">
							<span>${hashTags.japanese}</span>
							<i class="icon-food_icon_sushi"></i>
							<h3>일식</h3>
						</a>
					</div>
					<div class="item">
						<a href="/hashtag?tag=양식">
							<span>${hashTags.western}</span>
							<i class="icon-food_icon_pizza"></i>
							<h3>양식</h3>
						</a>
					</div>
					<div class="item">
						<a href="/hashtag?tag=술집">
							<span>${hashTags.bar}</span>
							<i class="icon-food_icon_beer"></i>
							<h3>술집</h3>
						</a>
					</div>
					<div class="item">
						<a href="/hashtag?tag=카페">
							<span>${hashTags.cafe}</span>
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
				<p>평점이 높은 인기 식당</p>
				<a href="/foodlist">더보기</a>
			</div>

			<div class="owl-carousel owl-theme carousel_4">
				<c:if test="${empty topToday}">등록된 맛집이 없습니다.</c:if>
				<c:forEach var="tt" items="${topToday}" varStatus="status">
					<div class="item">
						<div class="strip">
							<figure>
								<img class="index-img-css" src="${tt.fileData}" alt="">
								<a href="/proBoard/detail/${tt.promotionBno}" class="strip_info">
									<small>${tt.isOpen}</small>
									<c:if test="${tt.hotDeal.toLowerCase() == 'on'}">
										<span class="ribbon off">-${tt.discountPrice}%</span>
									</c:if>
									<div class="item_title">
										<h3>${tt.storeName}</h3>
										<small># : ${tt.hashTag}</small>
									</div>
								</a>
							</figure>
							<ul>
								<!-- <li><span class="loc_open">Now Open</span></li> -->
								<li><span>${tt.storeAddress}</span></li>
								<li>
									<div class="score"><span>최고맛집<em>${tt.reviewCnt}개
												리뷰</em></span><strong>${tt.avgStarRate}</strong></div>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /carousel -->


			<!-- <div class="main_title">
				<span><em></em></span>
				<h2>푸디푸디 추천 맛집</h2>
				<p>푸디푸디 광고 맛집</p>
				<a href="/premiumlist">더보기</a>
			</div>

			<div class="owl-carousel owl-theme carousel_4"> -->
				<%-- <c:if test="${empty premiumList}">광고 진행중인 맛집이 없습니다.</c:if>
				<c:forEach var="pl" items="${premiumList}" varStatus="status">  -->
					<!-- <div class="item">
						<div class="strip">
							<figure>
								<img class="index-img-css" src="${pl.fileData}" alt="">
								<a href="/proBoard/detail/${pl.promotionBno}" class="strip_info">
									<small>${pl.isOpen}</small>
									<c:if test="${pl.hotDeal.toLowerCase() == 'on'}">
										<span class="ribbon off">-${pl.discountPrice}%</span>
									</c:if>
									<div class="item_title">
										<h3>${pl.storeName}</h3>
										<small># : ${pl.hashTag}</small>
									</div>
								</a>
							</figure>
							<ul>
								<li><span>${pl.storeAddress}</span></li>
								<li>
									<div class="score"><span>푸디푸디 추천 맛집<em>${pl.reviewCnt}개
												리뷰</em></span><strong>${pl.avgStarRate}</strong></div>
								</li>
							</ul>
						</div>
					</div> -->
				<%-- </c:forEach> -->
			<!-- </div> -->
			<!-- /carousel -->




			<div class="main_title">
				<span><em></em></span>
				<h2 id="locationHeader"></h2>
				<p>근처 맛집을 찾아보기</p>
				<a id="viewAll" href="#0">더보기</a>
			</div>

			<div id="locationList" class="owl-carousel owl-theme carousel_4">

			</div>
			<!-- /carousel -->

			<div class="banner lazy" data-bg="url(img/banner_bg_desktop.jpg)">
				<div class="wrapper d-flex align-items-center opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.2)"
					style="background: url('img/food_review.jpg') no-repeat 100% / 100%">
					<div>
						<small>Foodie Foodie</small>
						<h3>직접 먹어본 사람들만의 솔직한 리뷰</h3>
						<p>많은 후기를 보고 맛집을 찾아보세요!</p>
						<a href="/review?sort=latest" class="btn_1">맛집 리뷰 보러가기</a>
					</div>
				</div>
				<!-- /wrapper -->
			</div>
			<!-- /banner -->

			<div class="row">
				<div class="col-12">
					<div class="main_title version_2">
						<span><em></em></span>
						<h2>핫딜 진행중인 식당</h2>
						<p>오늘의 핫딜 놓치지 마세요!!</p>
						<a href="/hotdeals">더보기</a>
					</div>
				</div>

				<c:if test="${empty hotDeals}">핫딜 진행중인 맛집이 없습니다.</c:if>
				<c:forEach var="hd" items="${hotDeals}" varStatus="status">
					<c:if test="${hotDeals.indexOf(hd) gt 2}">
						<div class="col-md-6">
							<div class="list_home">
								<ul>
									<li>
										<a href="/proBoard/detail/${hd.promotionBno}">
											<small>${hd.isOpen}</small>
											<figure>
												<img class="owl-lazy index-img-css" src="${hd.fileData}" alt="">
											</figure>
											<div class="score"><strong>${hd.avgStarRate}</strong></div>
											<em>${hd.storeAddress}</em>
											<h3>${hd.storeName}</h3>
											<small># : ${hd.hashTag}</small>
											<ul>
												<li><span class="ribbon off">-${hd.discountPrice}%</span></li>
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
										<a href="/proBoard/detail/${hd.promotionBno}">
											<small>${hd.isOpen}</small>
											<figure>
												<img class="owl-lazy index-img-css" src="${hd.fileData}" alt="">
											</figure>
											<div class="score"><strong>${hd.avgStarRate}</strong></div>
											<em>${hd.storeAddress}</em>
											<h3>${hd.storeName}</h3>
											<small># : ${hd.hashTag}</small>
											<ul>
												<li><span class="ribbon off">-${hd.discountPrice}%</span></li>
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
					class="btn_1">더보기</a></p>
			<!-- /button visibile on tablet/mobile only -->
		</div>
		<!-- /container -->



		<div class="call_section lazy" data-bg="url(img/owner.jpg)">
			<div class="container clearfix">
				<div class="col-lg-5 col-md-6 float-end wow">
					<div class="box_1">
						<h3>사장님이신가요?</h3>
						<p>
							온라인 가시성을 높이려면 저희와 함께하세요! 맛있는 요리를 즐기려는 더 많은 고객에게 접근할 수 있습니다.
						</p>

						<div class="btn_1 addMaster">사업자 등록하기</div>
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

		// 로그인 한 사람만 사업자 등록 할수있음
		document.querySelector('.addMaster').onclick = e => {
			if ('${loginUser}' != '') {
				location.href = '/master/register';
			} else {
				alert('로그인 해주세요');
			}
		};


		// 현재 위도 경도 계산하여 주소로 돌려주는 API
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
								makeLocationDom(replyMap, address);
								const $viewAll = document.getElementById('viewAll');
								$viewAll.onclick = e => {
									location.href = '/locationlist?storeAddress=' + address;
								};
							});
					}).catch(e => console.log('e: ', e))
			}



			function makeLocationDom({
				locationList
			}, address) {
				console.log(locationList);

				document.getElementById('locationHeader').innerHTML = address + ' 지역 맛집';

				// 각 리스트 하나의 태그
				let tag = '';


				if (locationList === null || locationList.length === 0) {
					tag += "<div id='locationList'>주변에 식당이 없습니다! ㅠㅠ</div>";
				} else {
					for (let i = 0; i < locationList.length; i++) {

						// console.log("typeof locationList[i].hotDeal", typeof locationList[i].hotDeal);
						// console.log("discountPrice: ", locationList[i].discountPrice);
						// console.log("locationList[i].hotDeal", locationList[i].hotDeal.toLowerCase() == 'on');

						// if (locationList[i].hotDeal.toLowerCase() == 'on') {
						// 	console.log("yes: ", locationList[i].discountPrice);
						// }


						const isHot = locationList[i].hotDeal.toLowerCase() == 'on';
						console.log(isHot);

						tag +=
							`<div class="item">` +
							`   <div class="strip">` +
							`       <figure>`;

						if (isHot) {
							tag += `<span class="ribbon off">-` + locationList[i].discountPrice + `%</span>`;
						}

						tag +=
							`		<img class="owl-lazy index-img-css" src="` + locationList[i].fileData + `" alt="">` +
							`           <a href="/proBoard/detail/` + locationList[i].promotionBno +
							`" class="strip_info">` +
							`				<small>` + locationList[i].isOpen + `</small>` +
							`               <div class="item_title">` +
							`                   <h3>` + locationList[i].storeName + `</h3>` +
							`                   <small># : ` + locationList[i].hashTag + `</small>` +
							`               </div>` +
							`           </a>` +
							`       </figure>` +
							`       <ul>` +
							`			<li><span>` + locationList[i].storeAddress + `</span></li>` +
							`           <li>` +
							`               <div class="score"><span>주변 맛집<em>` + locationList[i].reviewCnt +
							`개 리뷰</em></span><strong>` + locationList[i].avgStarRate + `</strong></div>` +
							`           </li>` +
							`       </ul>` +
							`   </div>` +
							`</div>`;
					}

				}

				document.getElementById('locationList').innerHTML = tag;
			}


			function onGeoError() {
				alert("위치권한을 확인해주세요");
			}


			//navigator.geolocation.getCurrentPosition(위치받는함수, 에러났을때 함수)
			navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError)
		});
	</script>

</body>

</html>
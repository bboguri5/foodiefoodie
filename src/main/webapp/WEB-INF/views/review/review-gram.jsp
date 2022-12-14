<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../include/static-head.jsp" %>

	<style>
		#locationList {
			display: flex;
			justify-content: space-between;
		}

		#locationList .item {
			width: 16%;
		}

		.search form {
			display: flex;
		}

		.search .form-select {
			flex: 1;
			margin-top: 8px;
			border-radius: 10px;
		}

		.search .row {
			flex: 10;
		}

		.col-lg-9 {
			margin: auto;
			width: 60%;
		}

		article.blog .post_info {
			padding: 20px 17px 30px 17px;
		}

		.post_info h2 {
			margin: 20px 0;
		}

		.post_info li i {
			margin-left: 10px;
		}

		.heartIcon:hover {
			cursor: pointer;
		}

		.icon_comment_alt {
			cursor: pointer;
		}

		p {
			overflow-wrap: break-word;
		}

		.page_header .container .row form {
			width: 75%;

		}

		.page_header .container .row .col-xl-8 {
			width: 20%;
		}

		nav.main-menu {
			height: 100%;
			margin-right: 40px;
		}

		.submenu .show-submenu {
			color: #589442;
		}

		.review-write-btn .review-write-text {
			color: #589442;
		}

		.star {
			position: relative;
			font-size: 2rem;
			color: #ddd;
		}

		.star input {
			width: 100%;
			height: 100%;
			position: absolute;
			left: 0;
			opacity: 0;
			cursor: pointer;
		}

		.star span {
			width: 0;
			position: absolute;
			left: 0;
			color: red;
			overflow: hidden;
			pointer-events: none;
		}
	</style>
</head>

<body>

	<%@ include file="../include/detail-header.jsp" %>

	<main>
		<div class="page_header element_to_stick">
			<div class="container">
				<div class="row">
					<form action="/review/search" method="get">
						<div class="col-xl-4 col-lg-5 col-md-5">
							<div class="search_bar_list">
								<input required value="${search}" name="search" type="text" class="form-control"
									placeholder="?????? ??????...">
								<input type="submit" value="??????">
							</div>
						</div>
					</form>
					<div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
						<nav class="main-menu">
							<ul>
								<c:if test="${loginUser != null}">
									<li class="review-write-btn">
										<a class="review-write-text" href="/review/write">?????? ??????</a>
									</li>
								</c:if>
								<li class="submenu">
									<a href="#0" class="show-submenu">??????<i class="arrow_carrot-down"></i></a>
									<ul>
										<c:if test="${not empty search}">
											<li><a href="/review/search?search=${search}&sort=like">?????????</a></li>
											<li><a href="/review/search?search=${search}&sort=latest">?????????</a></li>
										</c:if>
										<c:if test="${empty search}">
											<li><a href="/review?sort=like">?????????</a></li>
											<li><a href="/review?sort=latest">?????????</a></li>
										</c:if>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- /row -->
			</div>
		</div>
		<!-- /page_header -->


		<div class="container margin_30_40">
			<c:if test="${empty reviewList}">
				<p>???????????? ?????? ????????? ????????????.</p>
			</c:if>

			<div class="outer row">
				<div class="col-lg-9">
					<div class="row upCount">
						<c:forEach var="rl" items="${reviewList}" varStatus="status">
							<article class="blog">
								<figure>
									<a href="/review/detail?reviewBno=${rl.reviewBno}"><img
											src="${uploads[status.index]}" alt="">
										<div class="preview"><span>Read more</span></div>
									</a>
								</figure>
								<div class="post_info">
									<small>Last Updated -
										<fmt:formatDate type="both" value="${rl.lastUpdated}" /></small>
									<h2>
										<c:if test="${rl.receipt == 'Y'}">
											<img class="reviewReceipt" src="/img/receipt.png" alt=""
												style="width: 30px;">
										</c:if>
										<a href="#">${rl.title}</a>
									</h2>
									<label>??????: </label>
									<span class="star">
										???????????????
										<span style="width: ${rl.starRate * 10}%;">???????????????</span>
										<input type="hidden" oninput="drawStar(this)" value="" step="1" min="0" max="10"
											name="starRate">
									</span>
									<br>

									<span>?????? ??????: </span>
									<c:if test="${rl.receipt == 'Y' || rl.promotionBno > 0}">
										<a href="/proBoard/detail/${rl.promotionBno}"> ${rl.storeName} </a>
									</c:if>
									
									<c:if test="${rl.receipt == 'N' && rl.promotionBno == null}">
										${rl.storeName}
									</c:if>
									<br>
									<p>?????? ??????: ${rl.storeAddress}</p>
									<p>${rl.content}
										<ul>
											<li>
												<div class="thumb"><img src="/img/avatar.jpg" alt=""></div>
												${rl.email}
											</li>
											<li>

												<c:set var="contains" value="false" />
												<c:forEach var="item" items="${isLikedList}">
													<c:if test="${item eq rl.reviewBno}">
														<c:set var="contains" value="true" />
													</c:if>
												</c:forEach>
												<c:choose>
													<c:when test="${contains}">
														<i id="${rl.reviewBno}" class="heartIcon icon_heart"></i>
													</c:when>
													<c:otherwise>
														<i id="${rl.reviewBno}" class="heartIcon icon_heart_alt"></i>
													</c:otherwise>
												</c:choose>

												<span id="heart${rl.reviewBno}">${rl.likeCnt}</span>
												<a href="/review/detail?reviewBno=${rl.reviewBno}#section-comment"><i
														id="${rl.reviewBno}"
														class="icon_comment_alt"></i>${replyCount[status.index]}</a>
											</li>

										</ul>
								</div>
							</article>
						</c:forEach>

					</div>
					<!-- /row -->

				</div>
				<!-- /col -->

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->


	</main>

	<%@ include file="../include/footer.jsp" %>

	<script>

		(function () {
			likeUnlikeEvent();
		})();

		function likeUnlikeEvent() {
			const upCount = document.querySelector('.upCount');
			upCount.addEventListener('click', e => {
				if (e.target.classList.contains('heartIcon')) {
					if ('${loginUser}' === '') {
						alert('????????? ??? ?????? ???????????????');
					} else {
						likeOrUnlike(e);
					}
				} else if (e.target.className.classList.contains('icon_comment_alt')) {
					location.href = '/review/detail?reviewBno=' + e.target.id +
						'#section-comment';
				}
			});
		}

		function likeOrUnlike(e) {
			// ????????? ?????? ????????? ?????? ?????????
			const bno = e.target.id;
			// console.log(rno);
			const reqInfo = {
				method: 'PUT',
				headers: {
					'content-type': 'application/json'
				}
			};

			// const email = '${loginUser.email}';
			fetch('/review/updownlike?reviewBno=' + bno, reqInfo)
				.then(res => res.text())
				.then(msg => {
					if (msg === 'up-success') {
						// alert('upLike ??????!!');
						showUpLike(e); // ????????? ??????????????????
					} else {
						// alert('downLike ??????!!');
						showDownLike(e);
					}
				});
		}

		function showUpLike(e) {
			const bno = e.target.id;
			fetch('/review/getLike?reviewBno=' + bno)
				.then(res => res.text())
				.then(likeCnt => {
					document.getElementById(bno).classList.add('icon_heart');
					document.getElementById(bno).classList.remove('icon_heart_alt');
					document.getElementById("heart" + bno).innerHTML = likeCnt;
				});
		}

		function showDownLike(e) {
			const bno = e.target.id;
			fetch('/review/getLike?reviewBno=' + bno)
				.then(res => res.text())
				.then(likeCnt => {
					document.getElementById(bno).classList.remove('icon_heart');
					document.getElementById(bno).classList.add('icon_heart_alt');
					document.getElementById("heart" + bno).innerHTML = likeCnt;
				});
		}
	</script>

	<!-- ?????? -->
	<script>
		const starRate = document.querySelectorAll('.star span');
		starRate.style.width = (`${review.starRate}` * 10) + '%';
	</script>

<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3628802857247133"
crossorigin="anonymous"></script>
</body>

</html>
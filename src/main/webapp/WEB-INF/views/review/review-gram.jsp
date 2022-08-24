<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			margin-top: 10px;
		}

		.post_info li i {
			margin-left: 10px;
		}

		.icon_heart_alt:hover {
			cursor: pointer;
		}

		.icon_comment_alt {
			cursor: pointer;
		}

        p {
            overflow-wrap: break-word;
        }

        nav.main-menu {
            height: 100%;
            margin-right: 40px;
        }

        .submenu .show-submenu {
            color: #589442;
        }
	</style>
</head>

<body>

	<%@ include file="../include/detail-header.jsp" %>

	<main>
		<div class="page_header element_to_stick">
			<div class="container">
				<div class="row">
					<div class="col-xl-4 col-lg-5 col-md-5">
						<div class="search_bar_list">
							<input type="text" class="form-control" placeholder="Search in blog...">
							<input type="submit" value="Search">
						</div>
					</div>
					<div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
						<nav class="main-menu">
							<ul>
								<li class="submenu">
									<a href="#0" class="show-submenu">SORT <i class="arrow_carrot-down"></i></a>
									<ul>
										<li><a href="#">추천순</a></li>
										<li><a href="#">최신순</a></li>
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
			<div class="outer row">
				<div class="col-lg-9">
					<div class="row upCount">
						<c:forEach var="rl" items="${reviewList}" varStatus="status">
							<!-- <div class="col-md-6"> -->
							<article class="blog">
								<figure>
									<a href="/review/detail?reviewBno=${rl.reviewBno}"><img
											src="${uploads[status.index].filePath}" alt="">
										<div class="preview"><span>Read more</span></div>
									</a>
								</figure>
								<div class="post_info">
									<small>Last Updated - ${rl.lastUpdated}
										<fmt:formatDate type="both" value="${rl.lastUpdated}" /></small>
									<h2><a href="/review/detail?reviewBno=${rl.reviewBno}">${rl.title}</a></h2>
									<p>${rl.content}</p>
									<ul>
										<li>
											<div class="thumb"><img src="/img/avatar.jpg" alt=""></div>
											${rl.email}
										</li>
										<li>
											<i id="${rl.reviewBno}" class="icon_heart_alt"></i><span
												id="heart${rl.reviewBno}">${rl.likeCnt}</span>
											<i id="${rl.reviewBno}"
												class="icon_comment_alt"></i>${replyCount[status.index]}
										</li>

									</ul>
								</div>
							</article>
							<!-- /article -->
							<!-- </div> -->
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
		const upCount = document.querySelector('.upCount');
		upCount.addEventListener('click', e => {
			if (e.target.className === 'icon_heart_alt') {
				upLikeCount(e);
			} else if (e.target.className === 'icon_comment_alt') {
				location.href = '/review/detail?reviewBno=' + e.target.id + '#section-comment';
			}
		});

		function upLikeCount(e) {
			// 서버에 수정 비동기 요청 보내기
			const bno = e.target.id;
			// console.log(rno);
			const reqInfo = {
				method: 'PUT',
				headers: {
					'content-type': 'application/json'
				}
			};
			fetch('/review/uplike?reviewBno=' + bno, reqInfo)
				.then(res => res.text())
				.then(msg => {
					if (msg === 'up-success') {
						alert('upCount 성공!!');
						showLikes(e); // 좋아요 새로불러오기
					} else {
						alert('upCount 실패!!');
					}
				});
		}

		function showLikes(e) {
			const bno = e.target.id;
			fetch('/review/getLike?reviewBno=' + bno)
				.then(res => res.text())
				.then(likeCnt => {
					document.getElementById("heart" + bno).innerHTML = likeCnt;
				});
		}
	</script>


</body>

</html>
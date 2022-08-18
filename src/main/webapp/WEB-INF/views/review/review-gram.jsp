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

	</style>
</head>

<body>

	<%@ include file="../include/detail-header.jsp" %>

	<main>
		<%@ include file="../include/page-header.jsp" %>

		<div class="container margin_30_40">
			<div class="row">
				<div class="col-lg-9">
					<div class="row">
						<c:forEach var="rl" items="${reviewList}">
							<div class="col-md-6">
								<article class="blog">
									<figure>
										<a href="/review/detail?reviewBno=${rl.reviewBno}"><img src="img/blog-1.jpg" alt="">
											<div class="preview"><span>Read more</span></div>
										</a>
									</figure>
									<div class="post_info">
										<small>Last Updated - ${rl.lastUpdated}</small>
										<h2><a href="blog-post.html">${rl.title}</a></h2>
										<p>${rl.content}
										<ul>
											<li>
												<div class="thumb"><img src="img/avatar.jpg" alt=""></div> ${rl.email}
											</li>
											<li><i class="icon_comment_alt"></i>${rl.likeCnt}</li>
										</ul>
									</div>
								</article>
								<!-- /article -->
							</div>
						</c:forEach>

					</div>
					<!-- /row -->

				</div>
				<!-- /col -->

				<aside class="col-lg-3">
					<div class="widget">
						<div class="widget-title first">
							<h4>Latest Post</h4>
						</div>
						<ul class="comments-list">
							<li>
								<div class="alignleft">
									<a href="#0"><img src="img/blog-5.jpg" alt=""></a>
								</div>
								<small>Category - 11.08.2016</small>
								<h3><a href="#" title="">Verear qualisque ex minimum...</a></h3>
							</li>
							<li>
								<div class="alignleft">
									<a href="#0"><img src="img/blog-6.jpg" alt=""></a>
								</div>
								<small>Category - 11.08.2016</small>
								<h3><a href="#" title="">Verear qualisque ex minimum...</a></h3>
							</li>
							<li>
								<div class="alignleft">
									<a href="#0"><img src="img/blog-4.jpg" alt=""></a>
								</div>
								<small>Category - 11.08.2016</small>
								<h3><a href="#" title="">Verear qualisque ex minimum...</a></h3>
							</li>
						</ul>
					</div>
					<!-- /widget -->
					<div class="widget">
						<div class="widget-title">
							<h4>Categories</h4>
						</div>
						<ul class="cats">
							<li><a href="#">Food <span>(12)</span></a></li>
							<li><a href="#">Places to visit <span>(21)</span></a></li>
							<li><a href="#">New Places <span>(44)</span></a></li>
							<li><a href="#">Suggestions and guides <span>(31)</span></a></li>
						</ul>
					</div>
					<!-- /widget -->
					<div class="widget">
						<div class="widget-title">
							<h4>Popular Tags</h4>
						</div>
						<div class="tags">
							<a href="#">Food</a>
							<a href="#">Bars</a>
							<a href="#">Cooktails</a>
							<a href="#">Shops</a>
							<a href="#">Best Offers</a>
							<a href="#">Transports</a>
							<a href="#">Restaurants</a>
						</div>
					</div>
					<!-- /widget -->
				</aside>
				<!-- /aside -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->

	</main>

	<%@ include file="../include/footer.jsp" %>


</body>

</html>
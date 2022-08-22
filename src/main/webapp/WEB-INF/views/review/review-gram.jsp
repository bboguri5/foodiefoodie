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
	</style>
</head>

<body>

	<%@ include file="../include/detail-header.jsp" %>

	<main>
		<%@ include file="../include/page-header.jsp" %>

		<div class="container margin_30_40">
			<div class="outer row">
				<div class="col-lg-9">
					<div class="row">
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
									<p>${rl.content}
										<ul>
											<li>
												<div class="thumb"><img src="img/avatar.jpg" alt=""></div>
												${rl.email}
											</li>
											<li>
												<i class="icon_heart_alt"></i>${rl.likeCnt}
												<i class="icon_comment_alt"></i>${replyCount[status.index]}
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


</body>

</html>
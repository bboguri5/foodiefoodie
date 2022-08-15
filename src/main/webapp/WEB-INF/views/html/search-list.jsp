<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="../include/static-head.jsp" %>

    
    <style>
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
                <c:forEach var="sl" items="${searchList}" varStatus="status">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                        <div class="strip">
                            <figure>
                                <c:if test="${sl.hotDeal == 'Y'.charAt(0)}">
									<span class="ribbon off">${sl.discountPrice}</span>
								</c:if>
                                <img src="${sl.filePath}" data-src="${sl.filePath}" class="img-fluid lazy"
                                    alt="">
                                <a href="detail-restaurant.html" class="strip_info">
                                    <c:if test="${sl.hotDeal == 'Y'.charAt(0)}">
                                        <small>기간: ${sl.endDate}</small>
                                    </c:if>
                                    <div class="item_title">
                                        <h3>${sl.storeName}</h3>
                                    </div>
                                </a>
                            </figure>
                            <ul>
                                <li><span>${sl.storeAddress}</span></li>
                                <li>
                                    <div class="score"><span>푸디푸디 추천 맛집<em>${sl.reviewCnt}개
                                                리뷰</em></span><strong>${sl.avgStarRate}</strong></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- /row -->

            <div class="list-bottom">
                <!-- 페이지 버튼 -->
                <div class="paging">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-lg pagination-custom">

                            <c:if test="${pm.prev}">
                                <li class="page-item"><a class="page-link"
                                        href="/list?pageNum=${pm.beginPage - 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">Prev</a>
                                </li>
                            </c:if>

                            <!-- step=1인 경우,, 생략 가능!! -->
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/list?pageNum=${n}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">${n}</a>
                                </li>
                            </c:forEach>


                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/list?pageNum=${pm.endPage + 1}&amount=${pm.page.amount}&type=${s.type}&keyword=${s.keyword}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /container -->

    </main>
    <!-- /main -->

    <%@ include file="../include/footer.jsp" %>

</body>

</html>
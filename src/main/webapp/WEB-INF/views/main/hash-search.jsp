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

    <%@ include file="../include/detail-header.jsp" %>


    <main>
        <%@ include file="../include/page-header.jsp" %>

        <div class="container margin_30_40">
            <c:if test="${empty hashTagList}">
                <p>해당 카테고리 맛집이 없습니다.</p>
            </c:if>
            <div class="row">
                <c:forEach var="ht" items="${hashTagList}" varStatus="status">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                        <div class="strip">
                            <figure>

                                <c:if test="${ht.hotDeal.toLowerCase() == 'on'}">
									<span class="ribbon off">-${ht.discountPrice}%</span>
								</c:if>
                                <img class="img-fluid lazy index-img-css" src="${ht.fileData}" alt="">
                                <a href="/proBoard/detail/${ht.promotionBno}" class="strip_info">
                                    <small>${ht.isOpen}</small>
                                    <!-- <c:if test="${ht.hotDeal.toLowerCase() == 'on'}">
                                        <span class="ribbon off">${ht.discountPrice}%</span>
                                    </c:if> -->
                                    <div class="item_title">
                                        <h3>${ht.storeName}</h3>
                                        <small># : ${ht.hashTag}</small>
                                    </div>
                                </a>
                            </figure>
                            <ul>
                                <li><span>${ht.storeAddress}</span></li>
                                <li>
                                    <div class="score"><span>맛집이에요~<em>${ht.reviewCnt}개 리뷰</em></span><strong>${ht.avgStarRate}</strong></div>
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
                                        href="/hashtag?tag=${tag}&pageNum=${pm.beginPage - 1}&amount=${pm.getPage().getAmount()}">Prev</a>
                                </li>
                            </c:if>

                            <!-- step=1인 경우,, 생략 가능!! -->
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/hashtag?tag=${tag}&pageNum=${n}&amount=${pm.getPage().getAmount()}">${n}</a>
                                </li>
                            </c:forEach>


                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/hashtag?tag=${tag}&pageNum=${pm.endPage + 1}&amount=${pm.getPage().getAmount()}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

	<%@ include file="../include/footer.jsp" %>

</body>

</html>
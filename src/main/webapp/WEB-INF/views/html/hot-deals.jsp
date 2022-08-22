<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

	<%@ include file="../include/static-head.jsp" %>

    

</head>

<body>

    <%@ include file="../include/detail-header.jsp" %>

    <main>
        
        <%@ include file="../include/page-header.jsp" %>

        <div class="container margin_30_40">
            <div class="row">
                <c:forEach var="hd" items="${hotDeals}" varStatus="status">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                        <div class="strip">
                            <figure>
                                <span class="ribbon off">${hd.discountPrice}원</span>
                                <img src="${hd.filePath}" data-src="${hd.filePath}" class="img-fluid lazy"
                                    alt="">
                                    <a href="detail-restaurant.html" class="strip_info">
                                    <small>기간: ${hd.endDate}</small>
                                    <div class="item_title">
                                        <h3>${hd.storeName}</h3>
                                        <small># : ${hd.hashTag}</small>
                                    </div>
                                </a>
                            </figure>
                            <ul>
                                <li><span>${hd.storeAddress}</span></li>
                                <li>
                                    <div class="score"><span>핫딜!!<em>${hd.reviewCnt}개 리뷰</em></span><strong>${hd.avgStarRate}</strong></div>
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
                                        href="/hotdeals?pageNum=${pm.beginPage - 1}&amount=${pm.getPage().getAmount()}">Prev</a>
                                </li>
                            </c:if>

                            <!-- step=1인 경우,, 생략 가능!! -->
                            <c:forEach var="n" begin="${pm.beginPage}" end="${pm.endPage}" step="1">
                                <li data-page-num="${n}" class="page-item"><a class="page-link"
                                        href="/hotdeals?pageNum=${n}&amount=${pm.getPage().getAmount()}">${n}</a>
                                </li>
                            </c:forEach>


                            <c:if test="${pm.next}">
                                <li class="page-item"><a class="page-link"
                                        href="/hotdeals?pageNum=${pm.endPage + 1}&amount=${pm.getPage().getAmount()}">Next</a>
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
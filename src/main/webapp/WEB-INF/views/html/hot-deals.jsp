<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

	<%@ include file="../include/static-head.jsp" %>

</head>

<body>

    <header class="header_in clearfix">
        <div class="container">
            <div id="logo">
                <a href="index.html">
                    <img src="img/logo_sticky.svg" width="140" height="35" alt="">
                </a>
            </div>
            <ul id="top_menu">
                <li><a href="#sign-in-dialog" id="sign-in" class="login">Sign In</a></li>
                <li><a href="wishlist.html" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
            </ul>
            <!-- /top_menu -->
            <a href="#0" class="open_close">
                <i class="icon_menu"></i><span>Menu</span>
            </a>
            <nav class="main-menu">
                <div id="header_menu">
                    <a href="#0" class="open_close">
                        <i class="icon_close"></i><span>Menu</span>
                    </a>
                    <a href="index.html"><img src="img/logo.svg" width="140" height="35" alt=""></a>
                </div>
                <ul>
                    <li class="submenu">
                        <a href="/" class="show-submenu">메인페이지</a>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">맛집 리스트</a>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">리뷰 리스트</a>
                    </li>
    
                </ul>
            </nav>
        </div>
    </header>
    <!-- /header -->

    <main>
        <div class="page_header element_to_stick">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
                        <div class="breadcrumbs">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Category</a></li>
                                <li>Page active</li>
                            </ul>
                        </div>
                        <h1>145 restaurants in Convent Street 2983</h1>
                    </div>
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="search_bar_list">
                            <input type="text" class="form-control" placeholder="Search again...">
                            <input type="submit" value="Search">
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
        </div>
        <!-- /page_header -->

        <div class="filters_full clearfix">
            <div class="container">
                <div class="sort_select">
                    <select name="sort" id="sort">
                        <option value="popularity" selected="selected">Sort by Popularity</option>
                        <option value="rating">Sort by Average rating</option>
                        <option value="date">Sort by newness</option>
                        <option value="price">Sort by Price: low to high</option>
                        <option value="price-desc">Sort by Price: high to low</option>
                    </select>
                </div>
                <a class="btn_map mobile btn_filters" data-bs-toggle="collapse" href="#collapseMap"><i
                        class="icon_pin_alt"></i></a>
                <a href="#collapseFilters" data-bs-toggle="collapse" class="btn_filters"><i
                        class="icon_adjust-vert"></i><span>Filters</span></a>
            </div>
        </div>
        <!-- /filters_full -->

        <div class="collapse" id="collapseMap">
            <div id="map" class="map"></div>
        </div>
        <!-- /Map -->

        <div class="collapse filters_2" id="collapseFilters">
            <div class="container margin_detail">
                <div class="row">
                    <div class="col-md-4">
                        <div class="filter_type">
                            <h6>Categories</h6>
                            <ul>
                                <li>
                                    <label class="container_check">Pizza - Italian <small>12</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <li>
                                    <label class="container_check">Japanese - Sushi <small>24</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <li>
                                    <label class="container_check">Burghers <small>23</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <li>
                                    <label class="container_check">Vegetarian <small>11</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="filter_type">
                            <h6>Rating</h6>
                            <ul>
                                <li>
                                    <label class="container_check">Superb 9+ <small>06</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <li>
                                    <label class="container_check">Very Good 8+ <small>12</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <li>
                                    <label class="container_check">Good 7+ <small>17</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                                <li>
                                    <label class="container_check">Pleasant 6+ <small>43</small>
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="filter_type">
                            <h6>Distance</h6>
                            <div class="distance"> Radius around selected destination <span></span> km</div>
                            <div><input type="range" min="10" max="100" step="10" value="30"
                                    data-orientation="horizontal"></div>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
        </div>
        <!-- /filters -->

        <div class="container margin_30_40">
            <div class="row">
                <c:forEach var="hd" items="${hotDeals}" varStatus="status">
                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                        <div class="strip">
                            <figure>
                                <span class="ribbon off">${hd.discountPrice}</span>
                                <img src="img/lazy-placeholder.png" data-src="img/location_1.jpg" class="img-fluid lazy"
                                    alt="">
                                <a href="detail-restaurant.html" class="strip_info">
                                    <div class="item_title">
                                        <h3>${hotDealMasters[status.index].storeName}</h3>
                                        <small>${hotDealMasters[status.index].storeAddress}</small>
                                    </div>
                                </a>
                            </figure>
                            <ul>
                                <li><span>something about business</span></li>
                                <li>
                                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- /row -->
            <div class="pagination_fg">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

	<%@ include file="../include/footer.jsp" %>

</body>

</html>
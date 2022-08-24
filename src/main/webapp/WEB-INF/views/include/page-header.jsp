<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page_header element_to_stick">
    <div class="container">
        <div class="row">
            <div class="search">
                <form action="/list" method="get">
                    <div class="row g-0 custom-search-input">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input class="form-control no_border_r" type="text" placeholder="지역, 식당, 또는 음식"
                                    name="keyword" value="${s.keyword}">
                                <i class="icon_pin_alt"></i>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <input type="submit" value="Search">
                        </div>
                    </div>
                </form>
                <div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
                    <nav class="main-menu">
                        <ul>
                            <li class="submenu">
                                <a href="#0" class="show-submenu">SORT <i class="arrow_carrot-down"></i></a>
                                <ul>
                                    <li><a href="#">평점순</a></li>
                                    <li><a href="#">리뷰 많은순</a></li>
                                    <li><a href="#">최신순</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>


        </div>
    </div>
    <!-- /row -->
</div>
</div>
<!-- /page_header -->

<script>
    // keep select-option value
</script>
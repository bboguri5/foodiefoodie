<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page_header element_to_stick">
    <div class="container">
        <div class="row">
            <div class="search">
                <form action="/list" method="get">
                    <select class="form-select" name="type" id="search-type">
                        <option value="location">지역</option>
                        <option value="restaurant">식당</option>
                        <option value="food">음식</option>
                    </select>
                    <div class="row g-0 custom-search-input">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <input class="form-control no_border_r" type="text"
                                    placeholder="지역, 식당, 또는 음식" name="keyword" value="${s.keyword}">
                                <i class="icon_pin_alt"></i>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <input type="submit" value="Search">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- /row -->
    </div>
</div>
<!-- /page_header -->
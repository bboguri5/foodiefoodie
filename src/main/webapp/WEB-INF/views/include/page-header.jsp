<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page_header element_to_stick">
    <div class="container">
        <div class="row">
            <form action="/review/search" method="get">
                <div class="col-xl-4 col-lg-5 col-md-5">
                    <div class="search_bar_list">
                        <input required value="${search}" name="search" type="text" class="form-control"
                            placeholder="Search in blog...">
                        <input type="submit" value="Search">
                    </div>
                </div>
            </form>
        </div>
        <!-- /row -->
    </div>
</div>
<!-- /page_header -->

<script>
    // keep select-option value
</script>
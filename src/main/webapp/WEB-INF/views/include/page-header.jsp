<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page_header element_to_stick">
			<div class="container">
				<div class="row">
					<form action="/list?sort=star" method="get">
						<div class="col-xl-4 col-lg-5 col-md-5">
							<div class="search_bar_list">
                                <input required class="form-control no_border_r" type="text"
                                placeholder="지역, 식당, 또는 음식" name="keyword" value="${s.keyword}">
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
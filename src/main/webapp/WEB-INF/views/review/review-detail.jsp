<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="../include/static-head.jsp" %>


    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&amp;display=swap"
        rel="stylesheet">

    <!-- BASE CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="/css/detail-page.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="/css/custom.css" rel="stylesheet">

    <style>
        .col-lg-9 {
            margin: auto;
        }
    </style>

</head>

<body>

    <%@ include file="../include/detail-header.jsp" %>

    <main>
        <div class="page_header element_to_stick">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-7 col-md-7 d-none d-md-block">
                        <div class="breadcrumbs blog">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Category</a></li>
                                <li>Page active</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="search_bar_list">
                            <input type="text" class="form-control" placeholder="Search in blog...">
                            <input type="submit" value="Search">
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
        </div>
        <!-- /page_header -->

        <div class="container margin_30_40">
            <div class="row">
                <div class="col-lg-9">
                    <div class="singlepost">
                        <figure>
                            <div class="owl-carousel owl-theme carousel_1 magnific-gallery owl-loaded owl-drag">
                                <div class="owl-stage-outer">
                                    <div class="owl-stage"
                                        style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 2488px;">
                                        <c:forEach var="uploads" items="${uploads}">
                                            <div class="owl-item active" style="width: 829.325px;">
                                                <div class="item">
                                                    <a href="${uploads.filePath}" title="Photo title"
                                                        data-effect="mfp-zoom-in"><img
                                                            src="${uploads.filePath}"
                                                            alt=""></a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="owl-nav disabled"><button type="button" role="presentation"
                                        class="owl-prev"><span aria-label="Previous">‹</span></button><button
                                        type="button" role="presentation" class="owl-next"><span
                                            aria-label="Next">›</span></button></div>
                                <!-- <div class="owl-dots"><button role="button"
                                        class="owl-dot active"><span></span></button><button role="button"
                                        class="owl-dot"><span></span></button><button role="button"
                                        class="owl-dot"><span></span></button></div> -->
                            </div>

                        </figure>
                        <h1>${review.title}</h1>
                        <div class="postmeta">
                            <ul>
                                <!-- <li><a href="#"><i class="icon_folder-alt"></i> Category</a></li> -->
                                <li><i class="icon_calendar"></i> ${review.lastUpdated}</li>
                                <li><a href="#"><i class="icon_pencil-edit"></i> ${review.email}</a></li>
                                <li><a href="#"><i class="icon_comment_alt"></i> (${replyCount}) Comments</a></li>
                                <li><a href="#"><i id="${rl.reviewBno}" class="icon_heart_alt"></i><span id="heart">${review.likeCnt}</span></a></li>

												
                            </ul>
                        </div>
                        <!-- /post meta -->
                        <div class="post-content">

                            <p>${review.content}</p>
                        </div>
                        <!-- /post -->
                    </div>
                    <!-- /single-post -->

                    <div id="comments">
                        <h5>Comments</h5>
                        <ul>
                            <!-- <li>
                                <div class="avatar">
                                    <a href="#"><img src="/img/avatar1.jpg" alt="">
                                    </a>
                                </div>
                                <div class="comment_right clearfix">
                                    <div class="comment_info">
                                        By <a href="#">Anna Smith</a><span>|</span>25/10/2019<span>|</span><a
                                            href="#">Reply</a>
                                    </div>
                                    <p>
                                        Nam cursus tellus quis magna porta adipiscing. Donec et eros leo, non
                                        pellentesque arcu. Curabitur vitae mi enim, at vestibulum magna. Cum sociis
                                        natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed
                                        sit amet sem a urna rutrumeger fringilla. Nam vel enim ipsum, et congue ante.
                                    </p>
                                </div>
                                <ul class="replied-to">
                                    <li>
                                        <div class="avatar">
                                            <a href="#"><img src="/img/avatar4.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="comment_right clearfix">
                                            <div class="comment_info">
                                                By <a href="#">Anna Smith</a><span>|</span>25/10/2019<span>|</span><a
                                                    href="#">Reply</a>
                                            </div>
                                            <p>
                                                Nam cursus tellus quis magna porta adipiscing. Donec et eros leo, non
                                                pellentesque arcu. Curabitur vitae mi enim, at vestibulum magna. Cum
                                                sociis natoque penatibus et magnis dis parturient montes, nascetur
                                                ridiculus mus. Sed sit amet sem a urna rutrumeger fringilla. Nam vel
                                                enim ipsum, et congue ante.
                                            </p>
                                            <p>
                                                Aenean iaculis sodales dui, non hendrerit lorem rhoncus ut. Pellentesque
                                                ullamcorper venenatis elit idaipiscingi Duis tellus neque, tincidunt
                                                eget pulvinar sit amet, rutrum nec urna. Suspendisse pretium laoreet
                                                elit vel ultricies. Maecenas ullamcorper ultricies rhoncus. Aliquam erat
                                                volutpat.
                                            </p>
                                        </div>
                                        <ul class="replied-to">
                                            <li>
                                                <div class="avatar">
                                                    <a href="#"><img src="/img/avatar6.jpg" alt="">
                                                    </a>
                                                </div>
                                                <div class="comment_right clearfix">
                                                    <div class="comment_info">
                                                        By <a href="#">Anna
                                                            Smith</a><span>|</span>25/10/2019<span>|</span><a
                                                            href="#">Reply</a>
                                                    </div>
                                                    <p>
                                                        Nam cursus tellus quis magna porta adipiscing. Donec et eros
                                                        leo, non pellentesque arcu. Curabitur vitae mi enim, at
                                                        vestibulum magna. Cum sociis natoque penatibus et magnis dis
                                                        parturient montes, nascetur ridiculus mus. Sed sit amet sem a
                                                        urna rutrumeger fringilla. Nam vel enim ipsum, et congue ante.
                                                    </p>
                                                    <p>
                                                        Aenean iaculis sodales dui, non hendrerit lorem rhoncus ut.
                                                        Pellentesque ullamcorper venenatis elit idaipiscingi Duis tellus
                                                        neque, tincidunt eget pulvinar sit amet, rutrum nec urna.
                                                        Suspendisse pretium laoreet elit vel ultricies. Maecenas
                                                        ullamcorper ultricies rhoncus. Aliquam erat volutpat.
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li> -->
                            <c:forEach var="rl" items="${replyList}">
                                <li>
                                    <div class="avatar">
                                        <a href="#"><img src="/img/avatar1.jpg" alt="">
                                        </a>
                                    </div>

                                    <div class="comment_right clearfix">
                                        <div class="comment_info">
                                            By <a
                                                href="#">${rl.nickName}</a><span>|</span>${rl.lastUpdated}<span>|</span><a
                                                href="#">Reply</a>
                                        </div>
                                        <p>
                                            ${rl.content}
                                        </p>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <hr>

                    <h5>Leave a comment</h5>
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="form-group">
                                <input type="text" name="name" id="name2" class="form-control" placeholder="Name">
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="form-group">
                                <input type="text" name="email" id="email2" class="form-control" placeholder="Email">
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <div class="form-group">
                                <input type="text" name="email" id="website3" class="form-control"
                                    placeholder="Website">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="comments" id="comments2" rows="6"
                            placeholder="Comment"></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" id="submit2" class="btn_1 add_bottom_15">Submit</button>
                    </div>

                </div>
                <!-- /col -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

    <%@ include file="../include/footer.jsp" %>
    <script src="/js/sticky_sidebar.min.js"></script>
    <script src="/js/specific_detail.js"></script>
    <script src="/js/datepicker_func_1.js"></script>
    <script src="/js/switcher.js"></script>


</body>

</html>
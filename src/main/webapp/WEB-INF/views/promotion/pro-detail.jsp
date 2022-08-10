<%@ page contentType='text/html; charset=UTF-8' language='java' %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Foogra - Discover & Book the best restaurants at the best price">
    <meta name="author" content="Ansonika">
    <title>Foogra - Discover & Book the best restaurants at the best price</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114"
        href="../img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144"
        href="../img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <!-- BASE CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="../css/detail-page.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../css/custom.css" rel="stylesheet">

</head>

<body>
    <!-- header -->
    <header class="header_in clearfix">
        <div class="container">
            <div id="logo">
                <a href="index.html">
                    <img src="../img/logo_sticky.svg" width="140" height="35" alt="">
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
                    <a href="index.html"><img src="../img/logo.svg" width="140" height="35" alt=""></a>
                </div>
                <ul>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Home</a>
                        <ul>
                            <li><a href="index.html">Default</a></li>
                            <li class="third-level"><a href="#0">Sliders - Parallax <strong>New!</strong></a>
                                <ul>
                                    <li><a href="index-8.html">Revolution Slider 1</a></li>
                                    <li><a href="index-9.html">Revolution Slider 2</a></li>
                                    <li><a href="index-3.html">Owl Carousel</a></li>
                                    <li><a href="index-10.html">Parallax Youtube</a></li>
                                    <li><a href="index-11.html">Parallax Vimeo</a></li>
                                    <li><a href="index-12.html">Parallax Mp4 Video</a></li>
                                    <li><a href="index-13.html">Parallax Video Fullscreen</a></li>
                                    <li><a href="index-14.html">Parallax Image</a></li>
                                </ul>
                            </li>
                            <li><a href="index-15.html">Text Rotator</a></li>
                            <li><a href="index-5.html">Address Autocomplete</a></li>
                            <li><a href="index-6.html">Search Version 2</a></li>
                            <li><a href="index-7.html">Delivery/Takeaway version</a></li>
                            <li><a href="modal-advertise.html">Modal Advertise</a></li>
                            <li><a href="modal-newsletter.html">Modal Newsletter</a></li>
                            <li><a href="index-2.html">Video Bg Fallback Mobile</a></li>
                            <li><a href="index-4.html">GDPR Cookie Bar EU Law</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Listing</a>
                        <ul>
                            <li class="third-level"><a href="#0">List pages</a>
                                <ul>
                                    <li><a href="grid-listing-filterscol.html">List default</a></li>
                                    <li><a href="grid-listing-filterscol-map.html">List with map</a></li>
                                    <li><a href="listing-map.html">List side map</a></li>
                                    <li><a href="grid-listing-filterscol-full-width.html">List full width</a></li>
                                    <li><a href="grid-listing-filterscol-full-masonry.html">List Masonry Filter</a></li>
                                    <li><a href="grid-listing-filterscol-delivery.html">List Delivery/Takeaway</a></li>
                                </ul>
                            </li>
                            <li class="third-level"><a href="#0">Detail pages</a>
                                <ul>
                                    <li><a href="detail-restaurant.html">Detail page 1</a></li>
                                    <li><a href="detail-restaurant-2.html">Detail page 2</a></li>
                                    <li><a href="detail-restaurant-3.html">Mobile Fixed Booking</a></li>
                                    <li><a href="detail-restaurant-delivery.html">Delivery/Takeaway</a></li>
                                    <li><a href="detail-restaurant-4.html">Detail Menu Thumbs</a></li>
                                    <li><a href="detail-restaurant-5.html">Detail Contact Form</a></li>
                                </ul>
                            </li>
                            <li class="third-level"><a href="#0">OpenStreetMap</a>
                                <ul>
                                    <li><a href="grid-listing-filterscol-map-openstreetmap.html">List with map</a></li>
                                    <li><a href="listing-map-openstreetmap.html">List side map</a></li>
                                    <li><a href="grid-listing-filterscol-full-width-openstreetmap.html">List full
                                            width</a></li>
                                    <li><a href="grid-listing-filterscol-full-masonry-openstreetmap.html">List Masonry
                                            Filter</a></li>
                                </ul>
                            </li>
                            <li><a href="submit-restaurant.html">Submit Restaurant</a></li>
                            <li><a href="submit-rider.html">Submit Rider</a></li>
                            <li><a href="wishlist.html">Wishlist</a></li>
                            <li><a href="booking.html">Booking</a></li>
                            <li><a href="confirm.html">Confirm Booking</a></li>
                            <li><a href="confirm-delivery.html">Confirm Order</a></li>
                            <li><a href="booking-delivery-2.html">Order Delivery/Takeaway</a></li>
                            <li><a href="booking-delivery.html">Order Delivery/Takeaway 2</a></li>
                            <li><a href="admin_section/index.html" target="_blank">Admin Section</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#0" class="show-submenu">Other Pages</a>
                        <ul>
                            <li><a href="404.html">404 Error</a></li>
                            <li><a href="help.html">Help and Faq</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="leave-review.html">Leave a review</a></li>
                            <li><a href="user-logged-1.html">User Logged 1</a></li>
                            <li><a href="user-logged-2.html">User Logged 2</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                            <li><a href="coming_soon/index.html">Coming Soon</a></li>
                            <li><a href="account.html">Sign Up</a></li>
                            <li><a href="icon-pack-1.html">Icon Pack 1</a></li>
                            <li><a href="icon-pack-2.html">Icon Pack 2</a></li>
                        </ul>
                    </li>
                    <li><a href="submit-restaurant.html">Submit</a></li>
                    <li><a href="#0">Buy this template</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- /header -->

    <!-- main -->
    <main>
        <div class="hero_in detail_page background-image" data-background="url(img/restaurant_detail_hero.jpg)">
            <div class="wrapper opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">

                <div class="container">
                    <div class="main_info">
                        <div class="row">
                            <div class="col-xl-4 col-lg-5 col-md-6">
                                <div class="head">
                                    <div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div>
                                </div>
                                <h1>Pizzeria da Alfredo</h1>
                                ITALIAN - 27 Old Gloucester St, 4530 - <a
                                    href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x47e66e1de36f4147:0xb6615b4092e0351f!2sAssistance+Publique+-+H%C3%B4pitaux+de+Paris+(AP-HP)+-+Si%C3%A8ge!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361"
                                    target="blank">Get directions</a>
                            </div>
                            <div class="col-xl-8 col-lg-7 col-md-6 position-relative">
                                <div class="buttons clearfix">
                                    <span class="magnific-gallery">
                                        <a href="../img/detail_1.jpg" class="btn_hero" title="Photo title"
                                            data-effect="mfp-zoom-in"><i class="icon_image"></i>View photos</a>
                                        <a href="../img/detail_2.jpg" title="Photo title" data-effect="mfp-zoom-in"></a>
                                        <a href="../img/detail_3.jpg" title="Photo title" data-effect="mfp-zoom-in"></a>
                                    </span>
                                    <a href="#0" class="btn_hero wishlist"><i class="icon_heart"></i>Wishlist</a>
                                </div>
                            </div>
                        </div>
                        <!-- /row -->
                    </div>
                    <!-- /main_info -->
                </div>
            </div>
        </div>
        <!--/hero_in-->

        <div class="container margin_detail">
            <div class="row">
                <div class="col-lg-8">

                    <div class="tabs_detail">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a id="tab-A" href="#pane-A" class="nav-link active" data-bs-toggle="tab"
                                    role="tab">Information</a>
                            </li>
                            <li class="nav-item">
                                <a id="tab-B" href="#pane-B" class="nav-link" data-bs-toggle="tab"
                                    role="tab">Reviews</a>
                            </li>
                        </ul>

                        <div class="tab-content" role="tablist">
                            <div id="pane-A" class="card tab-pane fade show active" role="tabpanel"
                                aria-labelledby="tab-A">
                                <div class="card-header" role="tab" id="heading-A">
                                    <h5>
                                        <a class="collapsed" data-bs-toggle="collapse" href="#collapse-A"
                                            aria-expanded="true" aria-controls="collapse-A">
                                            Information
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapse-A" class="collapse" role="tabpanel" aria-labelledby="heading-A">
                                    <div class="card-body info_content">
                                        <p>Mei at intellegat reprehendunt, te facilisis definiebas dissentiunt usu.
                                            Choro delicata voluptatum cu vix. Sea error splendide at. Te sed facilisi
                                            persequeris definitiones, ad per scriptorem instructior, vim latine
                                            adipiscing no. Cu tacimates salutandi his, mel te dicant quodsi aperiri.
                                            Unum timeam his eu.</p>
                                        <p>An malorum ornatus nostrum vel, graece iracundia laboramus cu ius. No pro
                                            mazim blandit instructior, sumo voluptaria has et, vide persecuti abhorreant
                                            ne est.</p>
                                        <div class="add_bottom_25"></div>
                                        <h2>Pictures from our users</h2>
                                        <div class="pictures magnific-gallery clearfix">
                                            <figure><a href="../img/detail_gallery/detail_1.jpg" title="Photo title"
                                                    data-effect="mfp-zoom-in"><img
                                                        src="../img/thumb_detail_placeholder.jpg"
                                                        data-src="img/thumb_detail_1.jpg" class="lazy" alt=""></a>
                                            </figure>
                                            <figure><a href="../img/detail_gallery/detail_2.jpg" title="Photo title"
                                                    data-effect="mfp-zoom-in"><img
                                                        src="../img/thumb_detail_placeholder.jpg"
                                                        data-src="img/thumb_detail_2.jpg" class="lazy" alt=""></a>
                                            </figure>
                                            <figure><a href="../img/detail_gallery/detail_3.jpg" title="Photo title"
                                                    data-effect="mfp-zoom-in"><img
                                                        src="../img/thumb_detail_placeholder.jpg"
                                                        data-src="img/thumb_detail_3.jpg" class="lazy" alt=""></a>
                                            </figure>
                                            <figure><a href="../img/detail_gallery/detail_4.jpg" title="Photo title"
                                                    data-effect="mfp-zoom-in"><img
                                                        src="../img/thumb_detail_placeholder.jpg"
                                                        data-src="img/thumb_detail_4.jpg" class="lazy" alt=""></a>
                                            </figure>
                                            <figure><a href="../img/detail_gallery/detail_5.jpg" title="Photo title"
                                                    data-effect="mfp-zoom-in"><span
                                                        class="d-flex align-items-center justify-content-center">+10</span><img
                                                        src="../img/thumb_detail_placeholder.jpg"
                                                        data-src="../img/thumb_detail_5.jpg" class="lazy" alt=""></a>
                                            </figure>
                                        </div>
                                        <!-- /pictures -->
                                        <h2>Da Alfredo Menu</h2>
                                        <h3>Starters</h3>
                                        <div class="menu-gallery">
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_1.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-1.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€9.90</em>
                                                    <h4>Imported Salmon Steak</h4>
                                                    <p>Base de arroz, aguacate, salmón noruego, semillas de sésamo,
                                                        edamame, wakame</p>
                                                </div>
                                            </div>
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_2.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-2.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€7.90</em>
                                                    <h4>Poke bol</h4>
                                                    <p>Queso de cabra light, dátiles, jamón serrano y rúcula</p>
                                                </div>
                                            </div>
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_3.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-3.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€8.90</em>
                                                    <h4>Ensalada cesar</h4>
                                                    <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                        proteínico y salsa césar</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /menu-gallery -->
                                        <hr>
                                        <h3>Main Course</h3>
                                        <div class="menu-gallery">
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_1.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-4.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€15.90</em>
                                                    <h4>Oriental</h4>
                                                    <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
                                                </div>
                                            </div>
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_2.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-5.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€11.90</em>
                                                    <h4>Vegan Burguer</h4>
                                                    <p>Medio pollo asado acompañado de arroz o patatas al toque masala
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_3.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-6.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€10.90</em>
                                                    <h4>Indio Fit</h4>
                                                    <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                        proteínico</p>
                                                </div>
                                            </div>
                                            <div class="content_more">
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_4.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-7.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€15.90</em>
                                                        <h4>Oriental</h4>
                                                        <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_1.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-8.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€11.90</em>
                                                        <h4>Vegan Burguer</h4>
                                                        <p>Medio pollo asado acompañado de arroz o patatas al toque
                                                            masala</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_2.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-9.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€10.90</em>
                                                        <h4>Indio Fit</h4>
                                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                            proteínico</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /content_more -->
                                            <a href="#0" class="show_hide" data-content="toggle-text">Read More</a>
                                        </div>
                                        <!-- /menu-gallery -->
                                        <hr>
                                        <h3>Dessert</h3>
                                        <div class="menu-gallery">
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_1.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-10.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€15.90</em>
                                                    <h4>Oriental</h4>
                                                    <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
                                                </div>
                                            </div>
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_2.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-11.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€11.90</em>
                                                    <h4>Vegan Burguer</h4>
                                                    <p>Medio pollo asado acompañado de arroz o patatas al toque masala
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="menu_item thumbs">
                                                <figure>
                                                    <a href="../img/menu_item_large_3.jpg" title="Photo title"
                                                        data-effect="mfp-zoom-in">
                                                        <img src="../img/menu-thumb-placeholder.jpg"
                                                            data-src="../img/menu-thumb-12.jpg" alt="" class="lazy">
                                                    </a>
                                                </figure>
                                                <div>
                                                    <em>€10.90</em>
                                                    <h4>Indio Fit</h4>
                                                    <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                        proteínico y salsa césar 0%</p>
                                                </div>
                                            </div>
                                            <div class="content_more">
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_4.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-13.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€15.90</em>
                                                        <h4>Oriental</h4>
                                                        <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_1.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-14.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€11.90</em>
                                                        <h4>Vegan Burguer</h4>
                                                        <p>Medio pollo asado acompañado de arroz o patatas al toque
                                                            masala</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_2.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-15.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€10.90</em>
                                                        <h4>Indio Fit</h4>
                                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                            proteínico y salsa césar 0%</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /content_more -->
                                            <a href="#0" class="show_hide" data-content="toggle-text">Read More</a>
                                        </div>
                                        <!-- /menu-gallery -->
                                        <div class="add_bottom_45"></div>
                                        <div class="special_offers add_bottom_45">
                                            <h2>Special Offers</h2>
                                            <div class="menu-gallery">
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_4.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-16.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€10.90</em>
                                                        <h4>Indio Fit</h4>
                                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                            proteínico y salsa césar 0%</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_1.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-17.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€15.90</em>
                                                        <h4>Oriental</h4>
                                                        <p>Cama de tabule con taquitos de pollo a la mostaza light</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_2.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-18.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€11.90</em>
                                                        <h4>Vegan Burguer</h4>
                                                        <p>Medio pollo asado acompañado de arroz o patatas al toque
                                                            masala</p>
                                                    </div>
                                                </div>
                                                <div class="menu_item thumbs">
                                                    <figure>
                                                        <a href="../img/menu_item_large_3.jpg" title="Photo title"
                                                            data-effect="mfp-zoom-in">
                                                            <img src="../img/menu-thumb-placeholder.jpg"
                                                                data-src="../img/menu-thumb-18.jpg" alt="" class="lazy">
                                                        </a>
                                                    </figure>
                                                    <div>
                                                        <em>€10.90</em>
                                                        <h4>Indio Fit</h4>
                                                        <p>lechuga, tomate, espinacas, pollo asado, picatostes, queso
                                                            proteínico y salsa césar 0%</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /special_offers -->
                                        </div>
                                        <!-- /menu-gallery -->

                                        <div class="other_info">
                                            <h2>How to get to Pizzeria Alfredo</h2>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <h3>Address</h3>
                                                    <p>27 Old Gloucester St, 4530<br><a
                                                            href="https://www.google.com/maps/dir//Assistance+%E2%80%93+H%C3%B4pitaux+De+Paris,+3+Avenue+Victoria,+75004+Paris,+Francia/@48.8606548,2.3348734,14z/data=!4m15!1m6!3m5!1s0x47e66e1de36f4147:0xb6615b4092e0351f!2sAssistance+Publique+-+H%C3%B4pitaux+de+Paris+(AP-HP)+-+Si%C3%A8ge!8m2!3d48.8568376!4d2.3504305!4m7!1m0!1m5!1m1!1s0x47e67031f8c20147:0xa6a9af76b1e2d899!2m2!1d2.3504327!2d48.8568361"
                                                            target="blank"><strong>Get directions</strong></a></p>
                                                    <strong>Follow Us</strong><br>
                                                    <p class="follow_us_detail"><a href="#0"><i
                                                                class="social_facebook_square"></i></a><a href="#0"><i
                                                                class="social_instagram_square"></i></a><a href="#0"><i
                                                                class="social_twitter_square"></i></a></p>
                                                </div>
                                                <div class="col-md-4">
                                                    <h3>Opening Time</h3>
                                                    <p><strong>Lunch</strong><br> Mon. to Sat. 11.00am - 3.00pm<p>
                                                            <p><strong>Dinner</strong><br> Mon. to Sat. 6.00pm- 1.00am
                                                            </p>
                                                            <p><span class="loc_closed">Sunday Closed</span></p>
                                                </div>
                                                <div class="col-md-4">
                                                    <h3>Services</h3>
                                                    <p><strong>Credit Cards</strong><br> Mastercard, Visa, Amex</p>
                                                    <p><strong>Other</strong><br> Wifi, Parking, Wheelchair Accessible
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- /row -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab -->

                            <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
                                <div class="card-header" role="tab" id="heading-B">
                                    <h5>
                                        <a class="collapsed" data-bs-toggle="collapse" href="#collapse-B"
                                            aria-expanded="false" aria-controls="collapse-B">
                                            Reviews
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapse-B" class="collapse" role="tabpanel" aria-labelledby="heading-B">
                                    <div class="card-body reviews">
                                        <div class="row add_bottom_45 d-flex align-items-center">
                                            <div class="col-md-3">
                                                <div id="review_summary">
                                                    <strong>8.5</strong>
                                                    <em>Superb</em>
                                                    <small>Based on 4 reviews</small>
                                                </div>
                                            </div>
                                            <div class="col-md-9 reviews_sum_details">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h6>Food Quality</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 90%" aria-valuenow="90"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3"><strong>9.0</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                        <h6>Service</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 95%" aria-valuenow="95"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3"><strong>9.5</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                    </div>
                                                    <div class="col-md-6">
                                                        <h6>Location</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 60%" aria-valuenow="60"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3"><strong>6.0</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                        <h6>Price</h6>
                                                        <div class="row">
                                                            <div class="col-xl-10 col-lg-9 col-9">
                                                                <div class="progress">
                                                                    <div class="progress-bar" role="progressbar"
                                                                        style="width: 60%" aria-valuenow="60"
                                                                        aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-3 col-3"><strong>6.0</strong>
                                                            </div>
                                                        </div>
                                                        <!-- /row -->
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                            </div>
                                        </div>

                                        <div id="reviews">
                                            <div class="review_card">
                                                <div class="row">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="../img/avatar4.jpg" alt=""></figure>
                                                        <h5>Lukas</h5>
                                                    </div>
                                                    <div class="col-md-10 review_content">
                                                        <div class="clearfix add_bottom_15">
                                                            <span class="rating">8.5<small>/10</small> <strong>Rating
                                                                    average</strong></span>
                                                            <em>Published 54 minutes ago</em>
                                                        </div>
                                                        <h4>"Great Location!!"</h4>
                                                        <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros
                                                            eirmod scaevola sea. Et nec tantas accusamus salutatus, sit
                                                            commodo veritus te, erat legere fabulas has ut. Rebum laudem
                                                            cum ea, ius essent fuisset ut. Viderer petentium cu his.
                                                            Tollit molestie suscipiantur his et.</p>
                                                        <ul>
                                                            <li><a href="#0"><i
                                                                        class="icon_like"></i><span>Useful</span></a>
                                                            </li>
                                                            <li><a href="#0"><i class="icon_dislike"></i><span>Not
                                                                        useful</span></a></li>
                                                            <li><a href="#0"><i class="arrow_back"></i>
                                                                    <span>Reply</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                            </div>
                                            <!-- /review_card -->
                                            <div class="review_card">
                                                <div class="row">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="../img/avatar6.jpg" alt=""></figure>
                                                        <h5>Lukas</h5>
                                                    </div>
                                                    <div class="col-md-10 review_content">
                                                        <div class="clearfix add_bottom_15">
                                                            <span class="rating">8.5<small>/10</small> <strong>Rating
                                                                    average</strong></span>
                                                            <em>Published 10 Oct. 2019</em>
                                                        </div>
                                                        <h4>"Awesome Experience"</h4>
                                                        <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros
                                                            eirmod scaevola sea. Et nec tantas accusamus salutatus, sit
                                                            commodo veritus te, erat legere fabulas has ut. Rebum laudem
                                                            cum ea, ius essent fuisset ut. Viderer petentium cu his.
                                                            Tollit molestie suscipiantur his et.</p>
                                                        <ul>
                                                            <li><a href="#0"><i
                                                                        class="icon_like"></i><span>Useful</span></a>
                                                            </li>
                                                            <li><a href="#0"><i class="icon_dislike"></i><span>Not
                                                                        useful</span></a></li>
                                                            <li><a href="#0"><i class="arrow_back"></i>
                                                                    <span>Reply</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                            </div>
                                            <!-- /review_card -->
                                            <div class="review_card">
                                                <div class="row">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="../img/avatar1.jpg" alt=""></figure>
                                                        <h5>Marika</h5>
                                                    </div>
                                                    <div class="col-md-10 review_content">
                                                        <div class="clearfix add_bottom_15">
                                                            <span class="rating">9.0<small>/10</small> <strong>Rating
                                                                    average</strong></span>
                                                            <em>Published 11 Oct. 2019</em>
                                                        </div>
                                                        <h4>"Really great dinner!!"</h4>
                                                        <p>Eos tollit ancillae ea, lorem consulatu qui ne, eu eros
                                                            eirmod scaevola sea. Et nec tantas accusamus salutatus, sit
                                                            commodo veritus te, erat legere fabulas has ut. Rebum laudem
                                                            cum ea, ius essent fuisset ut. Viderer petentium cu his.
                                                            Tollit molestie suscipiantur his et.</p>
                                                        <ul>
                                                            <li><a href="#0"><i
                                                                        class="icon_like"></i><span>Useful</span></a>
                                                            </li>
                                                            <li><a href="#0"><i class="icon_dislike"></i><span>Not
                                                                        useful</span></a></li>
                                                            <li><a href="#0"><i class="arrow_back"></i>
                                                                    <span>Reply</span></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <!-- /row -->
                                                <div class="row reply">
                                                    <div class="col-md-2 user_info">
                                                        <figure><img src="../img/avatar.jpg" alt=""></figure>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="review_content">
                                                            <strong>Reply from Foogra</strong>
                                                            <em>Published 3 minutes ago</em>
                                                            <p><br>Hi Monika,<br><br>Eos tollit ancillae ea, lorem
                                                                consulatu qui ne, eu eros eirmod scaevola sea. Et nec
                                                                tantas accusamus salutatus, sit commodo veritus te, erat
                                                                legere fabulas has ut. Rebum laudem cum ea, ius essent
                                                                fuisset ut. Viderer petentium cu his. Tollit molestie
                                                                suscipiantur his et.<br><br>Thanks</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /reply -->
                                            </div>
                                            <!-- /review_card -->
                                        </div>
                                        <!-- /reviews -->
                                        <div class="text-end"><a href="leave-review.html" class="btn_1">Leave a
                                                review</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /tab-content -->
                    </div>
                    <!-- /tabs_detail -->
                </div>
                <!-- /col -->

                <div class="col-lg-4" id="sidebar_fixed">
                    <div class="box_booking mobile_fixed">
                        <div class="head">
                            <h3>Contact Us</h3>
                            <small>Or Call us at 0434 3432245</small>
                            <a href="#0" class="close_panel_mobile"><i class="icon_close"></i></a>
                        </div>
                        <!-- /head -->
                        <div class="main">
                            <div id="message-detail-contact"></div>
                            <form method="post" action="assets/detail_contact.php" id="detail_contact"
                                autocomplete="off">
                                <input type="text" name="restaurant_name" id="restaurant_name"
                                    value="Pizzeria Da Aldredo" hidden="hidden">
                                <div class="form-group">
                                    <input type="text" name="name_detail_contact" id="name_detail_contact"
                                        class="form-control" placeholder="Name and Last Name">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email_detail_contact" id="email_detail_contact"
                                        class="form-control" placeholder="Email address">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="telephone_detail_contact" id="telephone_detail_contact"
                                        class="form-control" placeholder="Telephone">
                                </div>
                                <div class="form-group add_bottom_15">
                                    <textarea class="form-control" name="message_detail" id="message_detail"
                                        placeholder="Your message"></textarea>
                                </div>
                                <div class="btn_1_mobile" style="position: relative;">
                                    <input class="btn_1 full-width" type="submit" value="Send message"
                                        id="submit-message">
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /box_booking -->
                    <div class="btn_reserve_fixed"><a href="#0" class="btn_1 full-width">Send message</a></div>
                    <ul class="share-buttons">
                        <li><a class="fb-share" href="#0"><i class="social_facebook"></i> Share</a></li>
                        <li><a class="twitter-share" href="#0"><i class="social_twitter"></i> Share</a></li>
                        <li><a class="gplus-share" href="#0"><i class="social_googleplus"></i> Share</a></li>
                    </ul>
                </div>

            </div>
            <!-- /row -->
        </div>
        <!-- /container -->

    </main>
    <!-- /main -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_1">Quick Links</h3>
                    <div class="collapse dont-collapse-sm links" id="collapse_1">
                        <ul>
                            <li><a href="submit-rider.html">Become a Rider</a></li>
                            <li><a href="submit-restaurant.html">Add your restaurant</a></li>
                            <li><a href="help.html">Help</a></li>
                            <li><a href="account.html">My account</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contacts.html">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_2">Categories</h3>
                    <div class="collapse dont-collapse-sm links" id="collapse_2">
                        <ul>
                            <li><a href="grid-listing-filterscol.html">Top Categories</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry.html">Best Rated</a></li>
                            <li><a href="grid-listing-filterscol-full-width.html">Best Price</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry.html">Latest Submissions</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_3">Contacts</h3>
                    <div class="collapse dont-collapse-sm contacts" id="collapse_3">
                        <ul>
                            <li><i class="icon_house_alt"></i>97845 Baker st. 567<br>Los Angeles - US</li>
                            <li><i class="icon_mobile"></i>+94 423-23-221</li>
                            <li><i class="icon_mail_alt"></i><a href="#0">info@domain.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h3 data-bs-target="#collapse_4">Keep in touch</h3>
                    <div class="collapse dont-collapse-sm" id="collapse_4">
                        <div id="newsletter">
                            <div id="message-newsletter"></div>
                            <form method="post" action="assets/newsletter.php" name="newsletter_form"
                                id="newsletter_form">
                                <div class="form-group">
                                    <input type="email" name="email_newsletter" id="email_newsletter"
                                        class="form-control" placeholder="Your email">
                                    <button type="submit" id="submit-newsletter"><i
                                            class="arrow_carrot-right"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="follow_us">
                            <h5>Follow Us</h5>
                            <ul>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="../img/twitter_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="../img/facebook_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="../img/instagram_icon.svg" alt="" class="lazy"></a></li>
                                <li><a href="#0"><img
                                            src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                            data-src="../img/youtube_icon.svg" alt="" class="lazy"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /row-->
            <hr>
            <div class="row add_bottom_25">
                <div class="col-lg-6">
                    <ul class="footer-selector clearfix">
                        <li>
                            <div class="styled-select lang-selector">
                                <select>
                                    <option value="English" selected>English</option>
                                    <option value="French">French</option>
                                    <option value="Spanish">Spanish</option>
                                    <option value="Russian">Russian</option>
                                </select>
                            </div>
                        </li>
                        <li>
                            <div class="styled-select currency-selector">
                                <select>
                                    <option value="US Dollars" selected>US Dollars</option>
                                    <option value="Euro">Euro</option>
                                </select>
                            </div>
                        </li>
                        <li><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="
                                data-src="../img/cards_all.svg" alt="" width="198" height="30" class="lazy"></li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <ul class="additional_links">
                        <li><a href="#0">Terms and conditions</a></li>
                        <li><a href="#0">Privacy</a></li>
                        <li><span>© Foogra</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/footer-->

    <div id="toTop"></div><!-- Back to top button -->

    <div class="layer"></div><!-- Opacity Mask Menu Mobile -->

    <!-- Sign In Modal -->
    <div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
        <div class="modal_header">
            <h3>Sign In</h3>
        </div>
        <form>
            <div class="sign-in-wrapper">
                <a href="#0" class="social_bt facebook">Login with Facebook</a>
                <a href="#0" class="social_bt google">Login with Google</a>
                <div class="divider"><span>Or</span></div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" id="email">
                    <i class="icon_mail_alt"></i>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" id="password" value="">
                    <i class="icon_lock_alt"></i>
                </div>
                <div class="clearfix add_bottom_15">
                    <div class="checkboxes float-start">
                        <label class="container_check">Remember me
                            <input type="checkbox">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="float-end"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
                </div>
                <div class="text-center">
                    <input type="submit" value="Log In" class="btn_1 full-width mb_5">
                    Don’t have an account? <a href="account.html">Sign up</a>
                </div>
                <div id="forgot_pw">
                    <div class="form-group">
                        <label>Please confirm login email below</label>
                        <input type="email" class="form-control" name="email_forgot" id="email_forgot">
                        <i class="icon_mail_alt"></i>
                    </div>
                    <p>You will receive an email containing a link allowing you to reset your password to a new
                        preferred one.</p>
                    <div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
                </div>
            </div>
        </form>
        <!--form -->
    </div>
    <!-- /Sign In Modal -->

    <!-- COMMON SCRIPTS -->
    <script src="../js/common_scripts.min.js"></script>
    <script src="../js/common_func.js"></script>
    <script src="../js/validate.js"></script>

    <!-- SPECIFIC SCRIPTS -->
    <script src="../js/sticky_sidebar.min.js"></script>
    <script src="../js/specific_detail.js"></script>

</body>

</html>
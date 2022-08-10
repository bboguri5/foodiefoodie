<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header clearfix element_to_stick">
    <div class="container">
    <div id="logo">
        <a href="index.html">
            <img src="/img/logo.svg" width="140" height="35" alt="" class="logo_normal">
            <img src="/img/logo_sticky.svg" width="140" height="35" alt="" class="logo_sticky">
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
            <a href="index.html"><img src="/img/logo.svg" width="140" height="35" alt=""></a>
        </div>
        <ul>
            <li class="submenu">
                <a href="#0" class="show-submenu">메인페이지</a>
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
                <a href="#0" class="show-submenu">맛집 리스트</a>
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
                            <li><a href="grid-listing-filterscol-full-width-openstreetmap.html">List full width</a></li>
                            <li><a href="grid-listing-filterscol-full-masonry-openstreetmap.html">List Masonry Filter</a></li>
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
                <a href="#0" class="show-submenu">리뷰 리스트</a>
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

        </ul>
    </nav>
</div>
</header>
<!-- /header -->
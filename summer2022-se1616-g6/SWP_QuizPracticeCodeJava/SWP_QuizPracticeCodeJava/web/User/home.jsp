<%-- 
    Document   : home
    Created on : May 25, 2022, 7:01:37 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Online Quiz System</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>

    <body>

        <%@include file="template/header.jsp"%>

        <!-- slider-start -->
        <div style="margin-bottom: 20px" class="slider-area pos-relative">
            <div class="slider-active">
                <c:forEach items="${requestScope.listSlider}" var="l">
                    <div class="single-slider slider-height d-flex align-items-center justify-content-center"
                         style="background-image: url(img/slider/${l.image});">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-9 col-md-12">
                                    <div class="slider-content slider-content-2">
                                        <h1 class="text-warning f-700" data-delay=".2s"><span>${l.sliderTitle}</span></h1>
                                        <p style="color:yellow" data-animation="fadeInUp" data-delay=".4s">Sorem ipsum dolor sit amet consectetur
                                            adipisicing elit sed do eiusmod tempor <br> incididunt ut labore et dolore magna
                                            aliqua enim ad minime.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- slider-end -->
        <!-- about start -->
        <div id="about" class="about-area pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-7">
                        <div class="about-title-section mb-30">
                            <h1>Welcome to Quizzy</h1>
                            <p>In this project-centered course*, you will design a series bible and write a complete pilot episode for your own unique television or web series, be it drama or comedy or something in between. You’ll learn to break down the creative process into components, 
                                and you’ll discover a structured process that allows you to produce a polished and pitch-ready script in just a few weeks. Completing this project will increase your confidence in your ideas and abilities, and you’ll feel prepared to pitch your first script 
                                and get started on your next. </p>
                            <p>Here is a link to a trailer for the course. To view the trailer, please copy and paste the link into your browser.
                                https://vimeo.com/423035246/6b3c18c4c5
                                This is a course designed to tap into your creativity and is based in "Active Learning". Most of the actual learning takes place within your own activities - that is, writing! You will learn by doing.
                                "Thank you so much for your direct way of teaching this course. It was encouraging for us all to creatively flow and find our own voice in writing and developing our scripts. This aspect was very important to me." Ingrid</p>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <div class="courses-details-sidebar-area">
                            <div class="widget mb-40 widget-padding white-bg">
                                <h4 class="widget-title">Latest Posts</h4>
                                <div class="sidebar-rc-post">
                                    <ul>
                                        <c:forEach items="${listBlogUpdated}" var="b" begin="0" end="3">
                                            <li>
                                                <div class="sidebar-rc-post-main-area d-flex mb-20">
                                                    <div class="rc-post-thumb">
                                                        <img src="img/blog/${b.getThumbnail()}" alt="" style="width: 70px;height: 60px">
                                                    </div>
                                                    <div class="rc-post-content">
                                                        <h4>
                                                            <a href="blogDetail?blogid=${b.getBlogId()}">${b.blogTitle}</a>
                                                        </h4>
                                                        <div class="widget-advisors-name">
                                                            <span>Author : <span class="f-500">${b.author.fullName}</span></span>
                                                        </div>
                                                        <div class="widget-advisors-name">
                                                            <span>Updated: <span class="f-500">${b.lastUpdated}</span></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--about end -->
<!-- courses start -->
<div id="courses" class="courses-area courses-bg-height pt-100 pb-70"
     style="background-image: url(img/courses/courseback.png);">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <div class="section-title mb-50 text-center">
                    <div class="section-title-heading mb-20">
                        <h1 class="white-color">Introduce subjects</h1>
                    </div>
                    <div class="section-title-para">
                        <p class="white-color">Our courses are very professional with all the best knowledge in order to help you guys.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="courses-list">
            <div class="row courses-active">
                <c:forEach items="${listSubject}" var="ls">
                    <div class="col-xl-12">
                        <div class="courses-wrapper course-radius-none mb-30">
                            <div class="courses-thumb">
                                <a href="subjectdetail?sid=${ls.subjectId}">
                                    <img src="${ls.thumbnailURL}" alt=""></a>
                            </div>
                            <div class="courses-author">
                                <img src="img/courses/coursesauthor1.png" alt="">
                            </div>
                            <div class="course-main-content clearfix">
                                <div class="courses-content">
                                    <div class="courses-category-name">
                                        <span>
                                            <a href="#">${ls.cat.catName}</a>
                                        </span>
                                    </div>
                                    <div class="courses-heading">
                                        <h1><a href="subjectdetail?sid=${ls.subjectId}">${ls.subjectName}</a></h1>
                                    </div>
                                    <div class="courses-para">
                                        <p>${ls.description}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="courses-wrapper-bottom clearfix">
                                <div class="courses-button f-right">
                                    <a href="subjectdetail?sid=${ls.subjectId}">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="events-view-btn">
            <div class="row">
                <div class="col-xl-12">
                    <div class="view-all-events text-center">
                        <button class="yewello-btn">
                            <a href="PublicSubjectList" style="color:white;">view all subjects</a><span>&rarr;</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- courses end -->
<!-- events start -->
<!--<div id="blog" class="events-area events-bg-height pt-100 pb-95" style="background-color: lightgrey">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-md-10 offset-md-1">
                <div class="section-title mb-50 text-center">
                    <div class="section-title-heading mb-20">
                        <h1 class="black-color">Interesting posts</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="events-list mb-30">
            <div class="row">
                <c:forEach items="${listBlogUpdated}" var="bl" begin="0" end="3">
                    <div class="col-xl-6 col-lg-6">
                        <div class="single-events mb-30">
                            <div class="events-wrapper">
                                <div class="events-inner d-flex">
                                    <div class="events-thumb">
                                        <img src="${bl.thumbnail}" alt="">
                                    </div>
                                    <div class="events-text white-bg">
                                        <div class="event-text-heading mb-20">
                                            <div class="events-text-title clearfix">
                                                <a href="blogDetail?blogid=${bl.getBlogId()}">
                                                    <h4>${bl.briefInfo}</h4>
                                                </a>
                                                <div class="time-area">
                                                    <span class="ti-time"></span>
                                                    <span class="published-time">${bl.lastUpdated}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="events-para">
                                            <p>${bl.blogTitle}</p>
                                        </div>
                                        <div class="events-speaker">
                                            <h2>Author : <span>${bl.author.fullName}</span></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="events-view-btn">
            <div class="row">
                <div class="col-xl-12">
                    <div class="view-all-events text-center">
                        <button class="yewello-btn">
                            <a href="blog" style="color:white;">view all posts</a><span>&rarr;</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>-->
<div id="blog" class="latest_news-area gray-bg pt-100 pb-70" style="background-color: lightgrey">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 offset-xl-3 col-md-8 offset-md-2">
                <div class="section-title mb-50 text-center">
                    <div class="section-title-heading mb-20">
                        <h1 class="primary-color">Interesting blogs</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${listBlogUpdated}" var="bl" begin="0" end="2">
                ${bl.thumbnail}
                <div class="col-xl-4 col-lg-4 col-md-6">
                    <div class="blog-wrapper mb-30">
                        <div class="blog-thumb mb-25">
                            <a href="blogDetail?blogid=${bl.getBlogId()}"><img src="img/blog/${bl.thumbnail}" alt=""></a>
                            <span class="blog-category">news</span>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <span>${bl.lastUpdated}</span>
                            </div>
                            <h5><a href="blogDetail?blogid=${bl.getBlogId()}">${bl.briefInfo}</a></h5>
                            <p>${bl.blogTitle}</p>
                            <div class="events-speaker">
                                <h2>Author : <span>${bl.author.fullName}</span></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="events-view-btn">
        <div class="row">
            <div class="col-xl-12">
                <div class="view-all-events text-center">
                    <button class="yewello-btn">
                        <a href="blog" style="color:white;">view all posts</a><span>&rarr;</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- events end -->
<!-- footer start -->
<footer id="Contact">
    <div class="footer-area primary-bg pt-150">
        <div class="container">
            <div class="footer-top pb-35">
                <div class="row">
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="footer-widget mb-30">
                            <div class="footer-heading">
                                <h1>Quick Links</h1>
                            </div>
                            <div class="footer-menu clearfix">
                                <ul>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Condition</a></li>
                                    <li><a href="#">Support</a></li>
                                    <li><a href="#">Consultation</a></li>
                                    <li><a href="#">Team Member</a></li>
                                    <li><a href="#">Our Services</a></li>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Who we are</a></li>
                                    <li><a href="#">Get a Quote</a></li>
                                    <li><a href="#">Recent Post</a></li>
                                    <li><a href="#">Who we are</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4  col-md-6">
                        <div class="footer-widget mb-30">
                            <div class="footer-heading">
                                <h1>Contact Us</h1>
                            </div>
                            <div class="footer-contact-list">
                                <div class="single-footer-contact-info">
                                    <span class="ti-headphone "></span>
                                    <span class="footer-contact-list-text">098977662</span>
                                </div>
                                <div class="single-footer-contact-info">
                                    <span class="ti-email "></span>
                                    <span class="footer-contact-list-text">abc@gmail.com</span>
                                </div>
                                <div class="single-footer-contact-info">
                                    <span class="ti-location-pin"></span>
                                    <span class="footer-contact-list-text">Ha Long, Quang Ninh</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom pt-25 pb-25">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="footer-copyright text-center">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer end -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/one-page-nav-min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/ajax-form.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/jquery.meanmenu.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/jquery.barfiller.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
</body>

</html>

<%-- 
    Document   : PublicSubjectList
    Created on : May 25, 2022, 12:26:18 AM
    Author     : LinhVT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Subject List</title>

        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styleList.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .mb-0 {
                margin-bottom: 0;
            }
        </style>

    </head>

    <body>
        <!-- Header -->
        <%@include file="template/header.jsp"%>
        <div class="slider-area">
            <div class="page-title">
                <div class="single-slider slider-height slider-height-breadcrumb d-flex align-items-center" style="background-image: url(img/bg/others_bg.jpg);">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="slider-content slider-content-breadcrumb text-center">
                                    <h1 class="white-color f-700">Our Course</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Subject List-->
        <div class="gray-bg pt-100">
            <div class="container">
                <div class="row">
                    <%@include file="template/advance_search.jsp" %>
                </div>

                <div class="row">
                    <div class="col-xl-8 col-lg-8">
                        <div class="courses-list">
                            <div class="row">
                                <c:forEach items="${listSubject}" var="subject">
                                    <div class="col-xl-6 col-lg-6 col-md-6">
                                        <div class="courses-wrapper courses-wrapper-3 mb-30">
                                            <div class="courses-thumb">
                                                <a href="subjectdetail?sid=${subject.subjectId}"><img src="${subject.thumbnailURL}" alt=""></a>
                                            </div>
                                            <div class="courses-content courses-content-3 clearfix">
                                                <div class="courses-heading mt-25 d-flex">
                                                    <div class="courses-top">
                                                        <span> Starting for 3 months with
                                                    </div>
                                                    <div class="courses-list-price">
                                                        <c:choose>
                                                            <c:when test="${subject.pricePack.salePrice != 0}">
                                                                <span><s>$${subject.pricePack.listPrice}</s></span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                <span>$${subject.pricePack.listPrice}</span>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                </div>
                                                <div class="courses-heading mt-25 d-flex">
                                                    <div class="course-title-3">
                                                        <h1><a href="subjectdetail?sid=${subject.subjectId}">${subject.subjectName}</a></h1>
                                                    </div>
                                                    <c:if test="${subject.pricePack.salePrice != 0}">
                                                        <div class="courses-sale-price">
                                                            <span>$${subject.pricePack.salePrice}</span>
                                                        </div>
                                                    </c:if>


                                                </div>

                                                <div class="courses-para mt-15">
                                                    <p>${subject.description}</p>
                                                </div>
                                                <div class="courses-wrapper-bottom clearfix mt-35 d-flex">
                                                    <div class="courses-button">
                                                        <a href="subjectdetail?sid=${subject.subjectId}">View Details</a>
                                                    </div>
                                                    <div class="register-button">
                                                        <a href="#">Register Now!</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                            <div class="row">
                                <div class="col-xl-12 text-center">
                                    <div class="single-events-btn mt-15 mb-30">
                                        <nav class="course-pagination mb-30" aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <c:choose>
                                                    <c:when test="${listSubject==null || listSubject.size()==0}">
                                                        <h4>Not found any subject</h4>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${page>1}">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="PublicSubjectList?page=${page-1}"><span class="ti-angle-left"></span></a>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#"><span class="ti-angle-left"></span></a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:forEach begin="1" end="${totalPage}" var="i">
                                                            <li class="page-item ${i==page?"active" : ""}">
                                                                <a class="page-link" href="PublicSubjectList?page=${i}">${i}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when test="${page>=totalPage}">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#"><span class="ti-angle-right"></span></a>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="PublicSubjectList?page=${page+1}"><span class="ti-angle-right"></span></a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>



                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <div class="courses-details-sidebar-area">
                            <div class="widget mb-40 white-bg">
                                <div class="sidebar-form">
                                    <form action="CourseSearch">
                                        <input id="autocomplete-dynamic" placeholder="Search course" type="text" name="keyword">
                                        <button type="submit">
                                            <i class="ti-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="widget mb-40 widget-padding white-bg">
                                <h4 class="widget-title">Category</h4>
                                <div class="widget-link">
                                    <ul class="sidebar-link">
                                        <c:forEach items="${listCategory}" var="category">
                                            <li>
                                                <a class="${category.catId==catID?"active" : ""}" href="FilterSubject?catID=${category.catId}">${category.catName}</a>
                                                <span>${category.subjectQuantity}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="widget mb-40 widget-padding white-bg">
                                <h4 class="widget-title">Featured Subjects</h4>
                                <div class="sidebar-rc-post">
                                    <ul>
                                        <c:forEach items="${listFeature}" var="feature">
                                            <li>
                                                <div class="sidebar-rc-post-main-area d-flex">
                                                    <div class="rc-post-content">
                                                        <h4>
                                                            <a href="subjectdetail?sid=${feature.subjectId}">${feature.subjectName}</a>
                                                        </h4>
                                                        <div class="widget-advisors-name">
                                                            <span>Expert : <span class="f-500">${feature.expertName}</span></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="widget mb-40 widget-padding white-bg">
                                <h4 class="widget-title">Contacts</h4>
                                <div class="widget-link">
                                    <ul class="sidebar-link">
                                        <li>
                                            <a data-toggle="modal"
                                               data-target="#modalLoginForm">Contact Us</a>
                                        </li>
                                        <li>
                                            <a href="#">Fanpage</a>
                                            <span>Online Quiz System</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h3 class="modal-title w-100 font-weight-bold">Contact</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body mx-3">
                                            <p>Phone: 0908887667</p>
                                            <p>Email: quizz@gmail.com</p>
                                            <p>Address: 15 Bach Dang, Ha Long, Quang Ninh</p>
                                            <p>Facebook: <a href="https://www.facebook.com/ClearVietnam/" target="_blank">https://www.facebook.com/ClearVietnam/</a></p>
                                            <p>Instagram: <a href="https://www.instagram.com/?hl=en" target="_blank">https://www.instagram.com/?hl=en</a></p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer id="Contact">
            <div class="footer-area primary-bg pt-150">
                <div class="container">
                    <div class="footer-top pb-35">
                        <div class="row">
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="footer-widget mb-30">
                                    <div class="footer-logo">
                                        <img src="img/logo/logo_2.png" alt="">
                                    </div>
                                    <div class="footer-para">
                                        <p>Sorem ipsum dolor sit amet conse ctetur adipiscing elit, sed do eiusmod
                                            incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis
                                            nostrud exercition ullamco laboris nisi </p>
                                    </div>
                                    <div class="footer-socila-icon">
                                        <span>Follow Us</span>
                                        <div class="footer-social-icon-list">
                                            <ul>
                                                <li><a href="#"><span class="ti-facebook"></span></a></li>
                                                <li><a href="#"><span class="ti-twitter-alt"></span></a></li>
                                                <li><a href="#"><span class="ti-dribbble"></span></a></li>
                                                <li><a href="#"><span class="ti-google"></span></a></li>
                                                <li><a href="#"><span class="ti-pinterest"></span></a></li>
                                                <li><a href="#"><span class="ti-instagram"></span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <div class="col-xl-3 col-lg-4 d-lg-none d-xl-block col-md-6">
                                <div class="footer-widget mb-30">
                                    <div class="footer-heading">
                                        <h1>Recent Post</h1>
                                    </div>
                                    <div class="recent-post d-flex mb-25">
                                        <div class="recent-post-thumb">
                                            <img src="img/post/recent_post1.jpg" alt="">
                                        </div>
                                        <div class="recent-post-text">
                                            <p>Neque porro quisquam est qui dolorem ipsum</p>
                                            <div class="footer-time">
                                                <span class="ti-time"></span>
                                                <span class="footer-published-time">05 May 2018</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-post d-flex">
                                        <div class="recent-post-thumb">
                                            <img src="img/post/recent_post1.jpg" alt="">
                                        </div>
                                        <div class="recent-post-text">
                                            <p>Neque porro quisquam est qui dolorem ipsum</p>
                                            <div class="footer-time">
                                                <span class="ti-time"></span>
                                                <span class="footer-published-time">05 May 2018</span>
                                            </div>
                                        </div>
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
                                            <span class="footer-contact-list-text">+003 (1234) 7894</span>
                                        </div>
                                        <div class="single-footer-contact-info">
                                            <span class="ti-email "></span>
                                            <span class="footer-contact-list-text"><a href="/cdn-cgi/l/email-protection"
                                                                                      class="__cf_email__"
                                                                                      data-cfemail="1a63756f687f777b73765a7d777b737634797577">[email&#160;protected]</a></span>
                                        </div>
                                        <div class="single-footer-contact-info">
                                            <span class="ti-location-pin"></span>
                                            <span class="footer-contact-list-text">123 New Street, 6th Floor, New
                                                York</span>
                                        </div>
                                    </div>
                                    <div class="opening-time">
                                        <span>Opening Hour</span>
                                        <span class="opening-date">
                                            Sun - Sat : 10:00 am - 05:00 pm
                                        </span>
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
                                        <span>Copyright © 2018. All rights reserved</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- JS here -->
        <script src="PublicSubjectList.jsp"></script>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
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
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/jquery.barfiller.js"></script>
        <script src="js/jquery.meanmenu.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        <script src="js/jquery.autocomplete.min.js"></script>

        <script type="text/javascript">
            $(function () {
                'use strict';
                var listSubject = [
            <c:forEach items="${listSubject}" var="list">
                    '<c:out value="${list.subjectName}" />',
            </c:forEach>
                ];
                $("#autocomplete-dynamic").autocomplete({
                    lookup: listSubject
                });
            });
            console.log(listSubject);
        </script>
    </body>

</html>
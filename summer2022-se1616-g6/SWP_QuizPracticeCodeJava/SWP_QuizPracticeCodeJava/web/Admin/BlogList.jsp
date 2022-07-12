<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="js sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers" lang="zxx"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <title>Blog list</title>

        <title>Blog Lists</title>

        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="https://themepure.net/template/sikkha-prv/sikkha/site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="https://themepure.net/template/sikkha-prv/sikkha/img/favicon.png">
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
        <!-- header-start -->
        <%@include file="template/header.jsp"%>
        <!-- header-end -->

        <!--blog list-->
        <div class="course-details-area gray-bg pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-8">
                        <c:forEach items="${requestScope.listBlog}" var="blog">
                            <div class="single-blog blog-wrapper blog-list blog-details blue-blog mb-40">
                                <div class="single-blog-main-content mb-30">
                                    <div class="blog-thumb mb-35">
                                        <a href="blogDetail?blogid=${blog.getBlogId()}"><img src="img/blog/${blog.getThumbnail()}" alt=""></a>
                                        <span class="blog-text-offer">${blog.getCateName(blog.getBlogCategoryId())}</span>
                                    </div>
                                    <div class="blog-content news-content">
                                        <div class="blog-meta news-meta">
                                            <span>${blog.getLastUpdated()}</span>
                                        </div>
                                        <h5><a href="blogDetail?blogid=${blog.getBlogId()}">${blog.getBlogTitle()}</a></h5>
                                        <p>${blog.getBriefInfo()}</p>
                                        <a href="blogDetail?blogid=${blog.getBlogId()}" class="blog-read-more-btn">Read more</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-xl-4 col-lg-4">
                        <div class="courses-details-sidebar-area">
                            <div class="widget mb-40 white-bg">
                                <div class="sidebar-form">
                                    <form action="searchBlog" method="get">
                                        <input name="searchBox" placeholder="Search blog" type="text">
                                        <button type="submit">
                                            <i class="ti-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="widget mb-40 widget-padding white-bg" style="padding-bottom: 10px">
                                <div data-toggle="collapse" data-target="#category" >
                                    <h4 class="widget-title" style="cursor: pointer">Category</h4>
                                </div>
                                <div class="widget-link collapse" id="category">
                                    <ul class="sidebar-link">
                                        <c:forEach items="${requestScope.listCate}" var="cate">
                                            <li>
                                                <a href="postCate?cateid=${cate.getBlogCateId()}">${cate.getCateName()}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="widget mb-40 widget-padding white-bg">
                                <h4 class="widget-title">Recent blogs</h4>
                                <div class="sidebar-rc-post">
                                    <ul>
                                        <c:forEach items="${requestScope.recentBLog}" var="blogList">
                                            <li>
                                                <div class="sidebar-rc-post-main-area d-flex mb-20">
                                                    <div class="rc-post-thumb">
                                                        <a href="https://themepure.net/template/sikkha-prv/sikkha/course_details.html">
                                                            <img src="./BlogDetail_files/rcourses_thumb01.png" alt="">
                                                        </a>
                                                    </div>
                                                    <div class="rc-post-content">
                                                        <h4>
                                                            <a href="blogDetail?blogid=${blogList.getBlogId()}">
                                                                ${blogList.getBlogTitle()}
                                                            </a>
                                                        </h4>
                                                        <div class="widget-advisors-name">
                                                            <span>Author : <span class="f-500">${blogList.getAuthorName()}</span></span>
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
        <!-- end blog-details-->

        <!--pagination/-->
        <div class="row">
            <div class="col-xl-12 text-center">
                <div class="single-events-btn mt-15 mb-30">
                    <nav class="course-pagination mb-30" aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <c:choose>
                                <c:when test="${listBlog == null || listBlog.size()==0}">
                                    <h4>There are no blogs</h4>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${pageIndex>1}">
                                            <li class="page-item">
                                                <a class="page-link" href="blog?page=${pageIndex-1}"><span class="ti-angle-left"></span></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#"><span class="ti-angle-left"></span></a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                        <li class="page-item ${i == page?"active" : ""}">
                                            <a class="page-link" href="blog?page=${i}"> ${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${pageIndex>=totalPage}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" ><span class="ti-angle-right"></span></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="page-link" href="blog?page=${pageIndex+1}"><span class="ti-angle-right"></span></a>
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
                                        <span>Copyright © 2018. All rights reserved</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer end -->


        <!-- JS here -->
        <script src="js/modernizr-3.5.0.min.js.download"></script>
        <script src="js/jquery-1.12.4.min.js.download"></script>
        <script src="js/popper.min.js.download"></script>
        <script src="js/bootstrap.min.js.download"></script>
        <script src="js/owl.carousel.min.js.download"></script>
        <script src="js/isotope.pkgd.min.js.download"></script>
        <script src="js/one-page-nav-min.js.download"></script>
        <script src="js/slick.min.js.download"></script>
        <script src="js/ajax-form.js.download"></script>
        <script src="js/wow.min.js.download"></script>
        <script src="js/jquery.scrollUp.min.js.download"></script>
        <script src="js/imagesloaded.pkgd.min.js.download"></script>
        <script src="js/jquery.counterup.min.js.download"></script>
        <script src="js/jquery.barfiller.js.download"></script>
        <script src="js/jquery.meanmenu.min.js.download"></script>
        <script src="js/waypoints.min.js.download"></script>
        <script src="js/jquery.magnific-popup.min.js.download"></script>
        <script src="js/plugins.js.download"></script>
        <!--<script src="js/main.js.download"></script><a id="scrollUp" href="https://themepure.net/template/sikkha-prv/sikkha/standard_blog.html#top" style="position: fixed; z-index: 2147483647; display: block;"><span class="ti-arrow-up"></span></a>-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.js"></script>
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


    </body></html>
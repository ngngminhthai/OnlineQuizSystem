<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="js sizes customelements history pointerevents postmessage webgl websockets cssanimations csscolumns csscolumns-width csscolumns-span csscolumns-fill csscolumns-gap csscolumns-rule csscolumns-rulecolor csscolumns-rulestyle csscolumns-rulewidth csscolumns-breakbefore csscolumns-breakafter csscolumns-breakinside flexbox picture srcset webworkers" lang="zxx"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Category</title>
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
        <!--        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <a href="#" class="navbar-brand"><b>Quizzy</b></a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                     Collection of nav links, forms, and other content for toggling 
                    <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
                        <div class="navbar-nav">
                            <a href="home" class="nav-item nav-link">Home</a>
                            <a href="#about" class="nav-item nav-link">About</a>
                                                <div class="nav-item dropdown">
                                                    <a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle">Services</a>
                                                    <div class="dropdown-menu">
                                                        <a href="#" class="dropdown-item">Web Design</a>
                                                        <a href="#" class="dropdown-item">Web Development</a>
                                                        <a href="#" class="dropdown-item">Graphic Design</a>
                                                        <a href="#" class="dropdown-item">Digital Marketing</a>
                                                    </div>
                                                </div>
                            <a href="#courses" class="nav-item nav-link active">Subject</a>
                            <a href="#blog" class="nav-item nav-link">Blog</a>
                            <a href="#Contact" class="nav-item nav-link">Contact</a>
                        </div>
                        <form class="navbar-form form-inline">
                            <div class="input-group search-box">
                                <input type="text" id="search" class="form-control" placeholder="Search here...">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="material-icons">&#xE8B6;</i>
                                    </span>
                                </div>
                            </div>
                        </form>
        
                        <div class="navbar-nav ml-auto action-buttons">
                             Login modal 
                            <div class="nav-item dropdown">
        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <div style="display:flex">
                    <div style="justify-content: flex-start">
                        <p>${sessionScope.user.fullName}</p>
                    </div>
                    <div class="avatar avatar-xl" style="justify-content: flex-end;margin-left: 10px">
                        <img style="width: 50px;height: 50px" src="${sessionScope.user.profilePic}" alt=""/>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:if test="${sessionScope.user != null}">
                    <a href="login"><button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                                            data-target="#modalLoginForm" style="margin-right: 10px">Login</button></a>
                </c:if>
            <button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                    data-target="#modalLoginForm" style="margin-right: 10px">Login</button>
            <form action="login" method="POST">
                <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <h3 class="modal-title w-100 font-weight-bold">Login</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body mx-3">
                                <div class="md-form mb-5">
                                    <input style="width:386px; margin-left: 13px;margin-top: 30px" type="text"
                                           id="defaultForm-email" class="form-control validate"
                                           placeholder="email" name="email" required >
                                </div>
                                <div class="md-form mb-4">
                                    <input style="width:386px; margin-left: 13px;margin-top: -34px;margin-bottom: 20px;" type="password"
                                           id="defaultForm-pass" class="form-control validate"
                                           placeholder="password" name="password" required>
                                </div>
                                <div class="md-form mb-4">
                                    <input style="margin-left:15px" type="checkbox" placeholder="Password" name="remember"> Remember me
                                </div>
                                <div>
                                    <a href="#"><u style="font-style:italic">Forget password</u></a>
                                    <a href="#" data-toggle="modal" data-target="#modalRegisterForm"><u
                                            style="font-style:italic;margin-left: 58px;">Don't have an
                                            account</u></a>
                                </div>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <button class="btn btn-default" type="submit">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </c:otherwise>
        </c:choose>
    </div>

     sign up modal 
    <div class="nav-item dropdown">
        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <a href="logout"><button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                                         data-target="#modalRegisterForm">Log out</button></a>
            </c:when>
            <c:otherwise>
            <button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                    data-target="#modalRegisterForm">Sign up</button>
            <form action="signup" method="POST">
                <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center">     
                                <h3 class="modal-title w-100 font-weight-bold">Sign Up</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div style="padding-top:30px;" class="modal-body mx-3">
                                <div class="md-form mb-5">
                                    <input
                                        style="width:386px; margin-left: 13px;margin-top: 0px;margin-bottom: -30px;"
                                        type="text" id="defaultForm-email" class="form-control validate"
                                        placeholder="Full name" name="fullname" required>
                                </div>
                                <div class="md-form mb-4">
                                    <input style="margin-left: 15px;" type="radio" name="gender"
                                           checked="checked" value="Male" required>Male
                                    <input style="margin-left: 20px;" type="radio" name="gender"
                                           value="Female" required>Female
                                </div>
                                <div class="md-form mb-4">
                                    <input
                                        style="width:386px; margin-left: 13px;margin-top: -8px;margin-bottom: -15px"
                                        type="text" id="defaultForm-pass" class="form-control validate"
                                        placeholder="Email" name="email" required>
                                </div>
                                <div class="md-form mb-4">
                                    <input
                                        style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                        type="text" id="defaultForm-pass" class="form-control validate"
                                        placeholder="Phone" name="phone" required>
                                </div>
                                <div class="md-form mb-4">
                                    <input
                                        style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                        type="text" id="defaultForm-pass" class="form-control validate"
                                        placeholder="Username" name="username" required>
                                </div>
                                <div class="md-form mb-4">
                                    <input
                                        style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                        type="password" id="defaultForm-pass" class="form-control validate"
                                        placeholder="Password" name="password" required>
                                </div>
                                <div class="md-form mb-4">
                                    <input
                                        style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                        type="password" id="defaultForm-pass" class="form-control validate"
                                        placeholder="Confirm password" name="confirmPass" required>
                                </div>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <button class="btn btn-default" type="submit" id="sweet">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
</nav>-->
        <%@include file="template/header.jsp"%>
        <!-- header-end -->
        <!-- slider-start -->
        <!--        <div class="slider-area">
                    <div class="pages-title">
                        <div class="single-slider slider-height slider-height-breadcrumb d-flex align-items-center" style="background-image: url(img/bg/others_bg.jpg);">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="slider-content slider-content-breadcrumb text-center">
                                            <h1 class="white-color f-700">Standard Blog</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <!-- slider-end -->
        <div class="course-details-area gray-bg pt-100 pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-8">
                        <c:forEach items="${requestScope.listBlog}" var="blog">
                            <div class="single-blog blog-wrapper blog-list blog-details blue-blog mb-40">
                                <div class="single-blog-main-content mb-30">
                                    <div class="blog-thumb mb-35">
                                        <a href="blogDetail?blogid=${blog.getBlogId()}"><img src="${blog.getThumbnail()}" alt=""></a>
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
                                    <form action="searchBlog">
                                        <input placeholder="Search blog" type="text" name="searchBox">
                                        <button type="submit">
                                            <i class="ti-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div class="widget mb-40 widget-padding white-bg" style="padding-bottom: 10px">
                                <div data-toggle="collapse" data-target="#category" ><h4 class="widget-title">Category</h4></div>
                                <div class="widget-link collapse" id="category">
                                    <ul class="sidebar-link">
                                        <c:forEach items="${requestScope.cate}" var="cate">
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
                                        <c:forEach items="${requestScope.listRecent}" var="blogList">
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
        <!-- end news-details-->

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
        <!--<script src="./BlogList2_files/main.js.download"></script><a id="scrollUp" href="https://themepure.net/template/sikkha-prv/sikkha/standard_blog.html#top" style="position: fixed; z-index: 2147483647; display: block;"><span class="ti-arrow-up"></span></a>-->
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
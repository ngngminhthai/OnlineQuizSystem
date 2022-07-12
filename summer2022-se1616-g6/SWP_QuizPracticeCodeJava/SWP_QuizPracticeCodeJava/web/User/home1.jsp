<%-- 
    Document   : home1.jsp
    Created on : Jun 19, 2022, 9:23:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SkillUp - Online Learning Platform</title>

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">
        <style>
            .carousel-inner .item,
            .carousel-inner .item.active,
            .carousel-inner .item img {
                margin: auto;
                padding: 0px;
            }
            .carousel-inner { padding: 0px !important; }

            .carousel-inner {
                height: calc(100vh - 50px); /* full screen */
            }
            .carousel-inner > .item > img {
                width: 100%; /* to make smaller images look full */
            }
        </style>
    </head>

    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp"%>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->


            <!-- ============================ Hero Banner  Start================================== -->
            <div class="hero_banner image-cover image_bottom" style="background:#f7f8f9 url(img/slider/businessEnglish.png) no-repeat;">
                <!--                <div class="container">
                                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                <c:forEach var="i" begin="0" end="${listSlider.size()-1}">

                    <c:choose>
                        <c:when test="${i == 0}">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="${listSlider.get(i).image}" alt="Second slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>${listSlider.get(i).sliderTitle}</h5>

                                </div>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="${listSlider.get(i).image}" alt="Second slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>${listSlider.get(i).sliderTitle}</h5>

                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>-->
            </div>
            <!-- ============================ Hero Banner End ================================== -->

            <!-- ============================ Our Awards Start ================================== -->
            <section class="p-0">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="crp_box ovr_top">
                                <div class="row align-items-center m-0">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                        <div class="crp_tags"><h1 style="    text-align: center;">Welcome to <span style="    font-weight: bold;
                                                                                                                   color: #03b97c !important;">Quizzy</span></h1></div>
                                    </div>
                                    <!--                                    <div class="col-xl-10 col-lg-9 col-md-8 col-sm-12">
                                                                            <div class="part_rcp">
                                                                                <ul>
                                                                                    <li><div class="crp_img"><img src="https://via.placeholder.com/400x110" class="img-fluid" alt="" /></div></li>
                                                                                    <li><div class="crp_img"><img src="https://via.placeholder.com/400x110" class="img-fluid" alt="" /></div></li>
                                                                                    <li><div class="crp_img"><img src="https://via.placeholder.com/400x110" class="img-fluid" alt="" /></div></li>
                                                                                    <li><div class="crp_img"><img src="https://via.placeholder.com/400x110" class="img-fluid" alt="" /></div></li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Our Awards End ================================== -->

            <!-- ============================ Latest Cources Start ================================== -->
            <section class="pt-0">
                <div class="container">				
                    <div class="row align-items-center justify-content-between">
                        <div class="col-xl-6 col-lg-6">
                            <div class="about-title-section mb-10" style="margin-top:60px;">
                                <p>In this project-centered course*, you will design a series bible and write a complete pilot episode for your own unique television or web series, be it drama or comedy or something in between. You’ll learn to break down the creative process into components, 
                                    and you’ll discover a structured process that allows you to produce a polished and pitch-ready script in just a few weeks. Completing this project will increase your confidence in your ideas and abilities, and you’ll feel prepared to pitch your first script 
                                    and get started on your next. </p>
                                <p>Here is a link to a trailer for the course. To view the trailer, please copy and paste the link into your browser.
                                    https://vimeo.com/423035246/6b3c18c4c5
                                    This is a course designed to tap into your creativity and is based in "Active Learning". Most of the actual learning takes place within your own activities - that is, writing! You will learn by doing.
                                    "Thank you so much for your direct way of teaching this course. It was encouraging for us all to creatively flow and find our own voice in writing and developing our scripts. This aspect was very important to me." Ingrid</p>
                            </div>
                        </div>

                        <div class="col-xl-5 col-lg-5 col-md-6 col-sm-12">
                            <div class="lmp_caption">
                                <ol class="list-unstyled p-0">
                                    <c:forEach items="${listBlogUpdated}" var="b" begin="0" end="3">
                                        <li class="d-flex align-items-start my-3 my-md-4">
                                            <div class="rounded-circle p-3 p-sm-4 d-flex align-items-center justify-content-center theme-bg">
                                                <div class="position-absolute text-white h5 mb-0">${b.blogId}</div>
                                            </div>
                                            <div class="ml-3 ml-md-4">
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
                                        </li>
                                    </c:forEach>

                                    <!--                                    <li class="d-flex align-items-start my-3 my-md-4">
                                                                            <div class="rounded-circle p-3 p-sm-4 d-flex align-items-center justify-content-center theme-bg">
                                                                                <div class="position-absolute text-white h5 mb-0">3</div>
                                                                            </div>
                                                                            <div class="ml-3 ml-md-4">
                                                                                <h4>Join Membership</h4>
                                                                                <p>
                                                                                    Error sit voluptatem actium doloremque laudantium, totam rem aperiam, eaque ipsa.
                                                                                </p>
                                                                            </div>
                                                                        </li>
                                                                        <li class="d-flex align-items-start my-3 my-md-4">
                                                                            <div class="rounded-circle p-3 p-sm-4 d-flex align-items-center justify-content-center theme-bg">
                                                                                <div class="position-absolute text-white h5 mb-0">3</div>
                                                                            </div>
                                                                            <div class="ml-3 ml-md-4">
                                                                                <h4>Start Learning</h4>
                                                                                <p>
                                                                                    Error sit voluptatem actium doloremque laudantium, totam rem aperiam, eaque ipsa.
                                                                                </p>
                                                                            </div>
                                                                        </li>
                                                                        <li class="d-flex align-items-start my-3 my-md-4">
                                                                            <div class="rounded-circle p-3 p-sm-4 d-flex align-items-center justify-content-center theme-bg">
                                                                                <div class="position-absolute text-white h5 mb-0">4</div>
                                                                            </div>
                                                                            <div class="ml-3 ml-md-4">
                                                                                <h4>Get Certificate</h4>
                                                                                <p>
                                                                                    Unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa.
                                                                                </p>
                                                                            </div>
                                                                        </li>-->
                                </ol>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <section>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7 col-md-8">
                            <div class="sec-heading center">
                                <h2>explore Featured <span class="theme-cl">Cources</span></h2>
                                <p>There are featured courses.</p>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                        <c:forEach items="${listSubject}" var="ls">

                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                <div class="crs_grid">
                                    <div class="crs_grid_thumb">
                                        <a href="subjectdetail?sid=${ls.subjectId}" class="crs_detail_link">
                                            <img style="width: 350px; height: 217px;" src="${ls.thumbnailURL}" class="img-fluid rounded" alt="" />
                                        </a>

                                    </div>
                                    <div class="crs_grid_caption">
                                        <div class="crs_flex">
                                            <div class="crs_fl_first">

                                                <div class="crs_cates cl_8"><span>${ls.cat.catName}</span></div>
                                            </div>
                                            <div class="crs_fl_last">
                                                <a <a href="subjectdetail?sid=${ls.subjectId}" class="crs_inrolled btn theme-bg enroll-btn" style="color: white;">View<i class="ti-angle-right"></i></a>
                                            </div>
                                        </div>
                                        <div class="crs_title"><h4><a href="subjectdetail?sid=${ls.subjectId}" class="crs_title_link">${ls.subjectName}</a></h4></div>
                                        <div class="crs_info_detail">
                                            <!--                                        <ul>
                                                                                        <li><i class="fa fa-clock text-danger"></i><span>10 hr 07 min</span></li>
                                                                                        <li><i class="fa fa-video text-success"></i><span>67 Lectures</span></li>
                                                                                        <li><i class="fa fa-signal text-warning"></i><span>Beginer</span></li>
                                                                                    </ul>-->
                                        </div>
                                    </div>
                                    <div class="crs_grid_foot">
                                        <div class="crs_flex">
                                            <div class="crs_fl_first">
                                                <div class="crs_tutor">
                                                    <p>${ls.description}</p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- Single Grid -->



                    </div>

                    <div class="row justify-content-center">
                        <div class="col-lg-7 col-md-8 mt-2">
                            <div class="text-center"><a href="PublicSubjectList" class="btn btn-md theme-bg-light theme-cl">Explore More Cources</a></div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- ============================ Latest Cources End ================================== -->

            <!-- ============================ Featured Categories Start ================================== -->

            <div class="clearfix"></div>
            <!-- ============================ Featured Categories End ================================== -->

            <!-- ============================ Work Process Start ================================== -->



            <!-- ============================ Work Process End ================================== -->

            <!-- ============================ Students Reviews ================================== -->

            <!-- ============================ Students Reviews End ================================== -->

            <!-- ============================ article Start ================================== -->
            <section class="min">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-lg-7 col-md-8">
                            <div class="sec-heading center">
                                <h2>Hotest News & <span class="theme-cl">Articles</span></h2>
                                <p>Here are our blogs.</p>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                        <c:forEach items="${listBlogUpdated}" var="bl" begin="0" end="2">
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                <div class="blg_grid_box">
                                    <div class="blg_grid_thumb">
                                        <a href="blogDetail?blogid=${bl.getBlogId()}"><img src="img/blog/${bl.thumbnail}" class="img-fluid" alt="" /></a>
                                    </div>
                                    <div class="blg_grid_caption">
                                        <div class="blg_tag"><span>Marketing</span></div>
                                        <div class="blg_title"><h4><a href="blogDetail?blogid=${bl.getBlogId()}">${bl.blogTitle}</a></h4></div>
                                        <div>${bl.briefInfo}</div>
                                    </div>
                                    <div class="crs_grid_foot">
                                        <div class="crs_flex">

                                            <div class="crs_fl_last">
                                                <div class="foot_list_info">
                                                    <ul>
                                                        <li><div class="elsio_ic"><i class="fa fa-eye text-success"></i></div><div class="elsio_tx">Author: ${bl.author.fullName}</div></li>
                                                        <li><div class="elsio_ic"><i class="fa fa-clock text-warning"></i></div><div class="elsio_tx">${bl.lastUpdated}</div></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Single Item -->




                    </div>
                    <div class="col-lg-12 col-md-12 mt-2">
                        <div class="text-center"><a href="blog" class="btn btn-md theme-bg-light theme-cl">Explore More Blogs</a></div>
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>
            <!-- ============================ article End ================================== -->

            <!-- ============================ Call To Action ================================== -->
            <section class="theme-bg call_action_wrap-wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="call_action_wrap">
                                <div class="call_action_wrap-head">
                                    <h3>Do You Have Questions ?</h3>
                                    <span>We'll help you to grow your career and growth.</span>
                                </div>
                                <a href="#" class="btn btn-call_action_wrap">Contact Us Today</a>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Call To Action End ================================== -->

            <!-- ============================ Footer Start ================================== -->
            <footer class="dark-footer skin-dark-footer style-2">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-5 col-md-5">
                                <div class="footer_widget">
                                    <img src="assets/img/logo-light.png" class="img-footer small mb-2" alt="" />
                                    <h4 class="extream mb-3">Do you need help with<br>anything?</h4>
                                    <p>Receive updates, hot deals, tutorials, discounts sent straignt in your inbox every month</p>
                                    <div class="foot-news-last">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Email Address">
                                            <div class="input-group-append">
                                                <button type="button" class="input-group-text theme-bg b-0 text-light">Subscribe</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-7 ml-auto">
                                <div class="row">

                                    <div class="col-lg-4 col-md-4">
                                        <div class="footer_widget">
                                            <h4 class="widget_title">Layouts</h4>
                                            <ul class="footer-menu">
                                                <li><a href="#">Home Page</a></li>
                                                <li><a href="#">About Page</a></li>
                                                <li><a href="#">Service Page</a></li>
                                                <li><a href="#">Property Page</a></li>
                                                <li><a href="#">Contact Page</a></li>
                                                <li><a href="#">Single Blog</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4">
                                        <div class="footer_widget">
                                            <h4 class="widget_title">All Sections</h4>
                                            <ul class="footer-menu">
                                                <li><a href="#">Headers<span class="new">New</span></a></li>
                                                <li><a href="#">Features</a></li>
                                                <li><a href="#">Attractive<span class="new">New</span></a></li>
                                                <li><a href="#">Testimonials</a></li>
                                                <li><a href="#">Videos</a></li>
                                                <li><a href="#">Footers</a></li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4">
                                        <div class="footer_widget">
                                            <h4 class="widget_title">Company</h4>
                                            <ul class="footer-menu">
                                                <li><a href="#">About</a></li>
                                                <li><a href="#">Blog</a></li>
                                                <li><a href="#">Pricing</a></li>
                                                <li><a href="#">Affiliate</a></li>
                                                <li><a href="#">Login</a></li>
                                                <li><a href="#">Changelog<span class="update">Update</span></a></li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer-bottom">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-12 col-md-12 text-center">
                                <p class="mb-0">© 2021 SkillUp. Designd By <a href="https://themezhub.com">ThemezHub</a>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- ============================ Footer End ================================== -->

            <!-- Log In Modal -->
            <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginmodal" aria-hidden="true">
                <div class="modal-dialog modal-xl login-pop-form" role="document">
                    <div class="modal-content overli" id="loginmodal">
                        <div class="modal-header">
                            <h5 class="modal-title">Login Your Account</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"><i class="fas fa-times-circle"></i></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="login-form">
                                <form>

                                    <div class="form-group">
                                        <label>User Name</label>
                                        <div class="input-with-icon">
                                            <input type="text" class="form-control" placeholder="User or email">
                                            <i class="ti-user"></i>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="input-with-icon">
                                            <input type="password" class="form-control" placeholder="*******">
                                            <i class="ti-unlock"></i>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-xl-4 col-lg-4 col-4">
                                            <input id="admin" class="checkbox-custom" name="admin" type="checkbox">
                                            <label for="admin" class="checkbox-custom-label">Admin</label>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-4">
                                            <input id="student" class="checkbox-custom" name="student" type="checkbox" checked>
                                            <label for="student" class="checkbox-custom-label">Student</label>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-4">
                                            <input id="instructor" class="checkbox-custom" name="instructor" type="checkbox">
                                            <label for="instructor" class="checkbox-custom-label">Tutors</label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-md full-width theme-bg text-white">Login</button>
                                    </div>

                                    <div class="rcs_log_125 pt-2 pb-3">
                                        <span>Or Login with Social Info</span>
                                    </div>
                                    <div class="rcs_log_126 full">
                                        <ul class="social_log_45 row">
                                            <li class="col-xl-4 col-lg-4 col-md-4 col-4"><a href="javascript:void(0);" class="sl_btn"><i class="ti-facebook text-info"></i>Facebook</a></li>
                                            <li class="col-xl-4 col-lg-4 col-md-4 col-4"><a href="javascript:void(0);" class="sl_btn"><i class="ti-google text-danger"></i>Google</a></li>
                                            <li class="col-xl-4 col-lg-4 col-md-4 col-4"><a href="javascript:void(0);" class="sl_btn"><i class="ti-twitter theme-cl"></i>Twitter</a></li>
                                        </ul>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="crs_log__footer d-flex justify-content-between mt-0">
                            <div class="fhg_45"><p class="musrt">Don't have account? <a href="signup.html" class="theme-cl">SignUp</a></p></div>
                            <div class="fhg_45"><p class="musrt"><a href="forgot.html" class="text-danger">Forgot Password?</a></p></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Modal -->

            <a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/daterangepicker.js"></script> 
        <script src="assets/js/summernote.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>	
        <script src="assets/js/custom.js"></script>
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		

    </body>
</html>

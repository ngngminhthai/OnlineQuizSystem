
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SkillUp - Online Learning Platform</title>

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">

    </head>

    <body>
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp" %>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Page Title Start================================== -->
            <section class="page-title bg-cover" style="background:url(https://via.placeholder.com/1920x1200)no-repeat;" data-overlay="8">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">

                            <div class="breadcrumbs-wrap">
                                <h1 class="breadcrumb-title text-light">Latest News</h1>
                                <nav class="transparent">
                                    <ol class="breadcrumb p-0">
                                        <li class="breadcrumb-item"><a href="home" class="text-light">Home</a></li>
                                        <li class="breadcrumb-item active theme-cl" aria-current="page">Blogs</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ article Start ================================== -->
            <section class="min">
                <div class="container">

                    <div class="row justify-content-center">
                        <div class="col-lg-7 col-md-8">
                            <div class="sec-heading center">
                                <h2><span class="theme-cl">Articles</span></h2>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                        <!-- Single Item -->
                        <c:forEach items="${listBlog}" var ="l">
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                <div class="blg_grid_box">
                                    <div class="blg_grid_thumb">
                                        <a href="blogDetail?blogid=${l.getBlogId()}"><img src="${l.getThumbnail()}" class="img-fluid" alt="" /></a>
                                    </div>
                                    <div class="blg_grid_caption">
                                        <div class="blg_tag"><span>${l.getCateName(l.getBlogCategoryId())}</span></div>
                                        <div class="blg_title"><h4><a href="blogDetail?blogid=${l.getBlogId()}">${l.getBlogTitle()}</a></h4></div>
                                        <div class="blg_desc"><p>${l.getBriefInfo()}</p></div>
                                    </div>
                                    <div class="crs_grid_foot">
                                        <div class="crs_flex">
                                            <div class="crs_fl_first">
                                                <div class="crs_tutor">
                                                    <div class="crs_tutor_thumb"><a href="instructor-detail.html"><img src="https://via.placeholder.com/500x500" class="img-fluid circle" alt="" /></a></div>
                                                </div>
                                            </div>
                                            <div class="crs_fl_last">
                                                <div class="foot_list_info">
                                                    <ul>
                                                        <!--<li><div class="elsio_ic"><i class="fa fa-eye text-success"></i></div><div class="elsio_tx">10k Views</div></li>-->
                                                        <li><div class="elsio_ic"><i class="fa fa-clock text-warning"></i></div><div class="elsio_tx">${l.getLastUpdated()}</div></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <div class="clearfix"></div>

            <!--page navigation-->
            <div class="row align-items-center justify-content-center" style="margin-left: 33px;">
                <div class="col-xl-12 col-lg-12 col-md-12">
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
                                        <li class="page-item ${i == pageIndex?"active" : ""}">

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


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
            <!-- Start Navigation -->
            <div class="header header-light head-shadow">
                <div class="container">
                    <nav id="navigation" class="navigation navigation-landscape">
                        <div class="nav-header">
                            <a class="nav-brand" href="#">
                                <img src="assets/img/logo.png" class="logo" alt="" />
                            </a>
                            <div class="nav-toggle"></div>
                            <div class="mobile_nav">
                                <ul>
                                    <li>
                                        <a href="javascript:void(0);" data-toggle="modal" data-target="#login" class="crs_yuo12 w-auto text-white theme-bg">
                                            <span class="embos_45"><i class="fas fa-sign-in-alt mr-1"></i>Sign In</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu">

                                <li><a href="#">Pages<span class="submenu-indicator"></span></a>
                                    <ul class="nav-dropdown nav-submenu">
                                        <li><a href="#">Shop Pages<span class="submenu-indicator"></span></a>
                                            <ul class="nav-dropdown nav-submenu">
                                                <li><a href="shop-with-sidebar.html">Shop Sidebar Left</a></li>
                                                <li><a href="shop-with-right-sidebar.html">Shop Sidebar Right</a></li>
                                                <li><a href="list-shop-with-sidebar.html">Shop List Style</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="product-detail.html">Product Detail</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>

                                <li><a href="dashboard.html">Dashboard</a></li>

                            </ul>

                            <ul class="nav-menu nav-menu-social align-to-right">

                                <li>
                                    <a href="#" class="alio_green" data-toggle="modal" data-target="#login">
                                        <i class="fas fa-sign-in-alt mr-1"></i><span class="dn-lg">Sign In</span>
                                    </a>
                                </li>
                                <li class="add-listing theme-bg">
                                    <a href="signup.html" class="text-white">Get Started</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Page Title Start================================== -->
            <section class="page-title">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">

                            <div class="breadcrumbs-wrap">
                                <h1 class="breadcrumb-title">Shop with Sidebar</h1>
                                <nav class="transparent">
                                    <ol class="breadcrumb p-0 bg-white">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active theme-cl" aria-current="page">Find Courses</li>
                                    </ol>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ Course Detail ================================== -->
            <section class="gray">
                <div class="container">
                    <div class="row">

                        <div class="col-xl-4 col-lg-4 col-md-12">
                            <div class="page-sidebar p-0">
                                <a class="filter_links" data-toggle="collapse" href="#fltbox" role="button" aria-expanded="false" aria-controls="fltbox">Open Advance Filter<i class="fa fa-sliders-h ml-2"></i></a>							
                                <div class="collapse" id="fltbox">
                                    <!-- Find New Property -->
                                    <div class="sidebar-widgets p-4">

                                        <div class="form-group">
                                            <div class="input-with-icon">
                                                <input type="text" class="form-control" placeholder="Search Your Cources">
                                                <i class="ti-search"></i>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="simple-input">
                                                <select id="cates" class="form-control">
                                                    <option value="">&nbsp;</option>
                                                    <option value="1">IT & Software</option>
                                                    <option value="2">Banking</option>
                                                    <option value="3">Medical</option>
                                                    <option value="4">Insurence</option>
                                                    <option value="5">Finance & Accounting</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <h6>Top Instructor</h6>
                                            <ul class="no-ul-list mb-3">
                                                <li>
                                                    <input id="aa-41" class="checkbox-custom" name="aa-41" type="checkbox">
                                                    <label for="aa-41" class="checkbox-custom-label">Keny White<i class="count">12</i></label>
                                                </li>
                                                <li>
                                                    <input id="aa-2" class="checkbox-custom" name="aa-2" type="checkbox">
                                                    <label for="aa-2" class="checkbox-custom-label">Hinata Hyuga<i class="count">10</i></label>
                                                </li>
                                                <li>
                                                    <input id="aa-3" class="checkbox-custom" name="aa-3" type="checkbox">
                                                    <label for="aa-3" class="checkbox-custom-label">Mike hussy<i class="count">56</i></label>
                                                </li>
                                                <li>
                                                    <input id="aa-71" class="checkbox-custom" name="aa-71" type="checkbox">
                                                    <label for="aa-71" class="checkbox-custom-label">Adam Riky <i class="count">42</i></label>
                                                </li>
                                                <li>
                                                    <input id="aa-81" class="checkbox-custom" name="aa-81" type="checkbox">
                                                    <label for="aa-81" class="checkbox-custom-label">Dev Patel<i class="count">12</i></label>
                                                </li>
                                                <li>
                                                    <input id="aa-91" class="checkbox-custom" name="aa-91" type="checkbox">
                                                    <label for="aa-91" class="checkbox-custom-label">Mike Hussy<i class="count">36</i></label>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="form-group">
                                            <h6>Skill Level</h6>
                                            <ul class="no-ul-list mb-3">
                                                <li>
                                                    <input id="l1" class="checkbox-custom" name="l1" type="checkbox">
                                                    <label for="l1" class="checkbox-custom-label">Beginning</label>
                                                </li>
                                                <li>
                                                    <input id="l2" class="checkbox-custom" name="l2" type="checkbox">
                                                    <label for="l2" class="checkbox-custom-label">Basic Level</label>
                                                </li>
                                                <li>
                                                    <input id="l3" class="checkbox-custom" name="l3" type="checkbox">
                                                    <label for="l3" class="checkbox-custom-label">Iner Level</label>
                                                </li>
                                                <li>
                                                    <input id="l4" class="checkbox-custom" name="l4" type="checkbox">
                                                    <label for="l4" class="checkbox-custom-label">Advance</label>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="form-group">
                                            <h6>Price</h6>
                                            <ul class="no-ul-list mb-3">
                                                <li>
                                                    <input id="p1" class="checkbox-custom" name="p1" type="checkbox">
                                                    <label for="p1" class="checkbox-custom-label">All<i class="count">89</i></label>
                                                </li>
                                                <li>
                                                    <input id="p2" class="checkbox-custom" name="p2" type="checkbox">
                                                    <label for="p2" class="checkbox-custom-label">Free<i class="count">56</i></label>
                                                </li>
                                                <li>
                                                    <input id="p3" class="checkbox-custom" name="p3" type="checkbox">
                                                    <label for="p3" class="checkbox-custom-label">Paid<i class="count">42</i></label>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 pt-4">
                                                <button class="btn theme-bg rounded full-width">Apply Filter</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- Sidebar End -->

                        </div>

                        <!-- Sidebar -->
                        <div class="col-xl-8 col-lg-8 col-md-12">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="short_wraping">
                                        <div class="row m-0 align-items-center justify-content-between">
                                            <!--
                                                                                        <div class="col-lg-4 col-md-5 col-sm-12  col-sm-6">
                                                                                            <div class="shorting_pagination_laft">
                                                                                                <h6 class="m-0">Showing 1-25 of 72</h6>
                                                                                            </div>
                                                                                        </div>-->

                                            <div class="col-lg-8 col-md-7 col-sm-12 col-sm-6">
                                                <div class="dlks_152">
                                                    <div class="shorting-right mr-2">
                                                        <label>Short By:</label>
                                                        <div class="dropdown show">
                                                            <a class="btn btn-filter dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <span class="selection">Most Rated</span>
                                                            </a>
                                                            <div class="drp-select dropdown-menu">
                                                                <a class="dropdown-item" href="JavaScript:Void(0);">Most Rated</a>
                                                                <a class="dropdown-item" href="JavaScript:Void(0);">Most Viewd</a>
                                                                <a class="dropdown-item" href="JavaScript:Void(0);">News Listings</a>
                                                                <a class="dropdown-item" href="JavaScript:Void(0);">High Rated</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="lmk_485">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </section>
            <!-- ============================ Course Detail ================================== -->


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

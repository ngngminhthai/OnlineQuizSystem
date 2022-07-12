
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit user profile</title>
        <!-- Custom CSS -->
        <link href="/SWP_QuizPracticeCodeJava/assets/css/styles.css" rel="stylesheet">
    </head>

    <style>
        select{
            margin-left: 17px;
            border-radius: 4px;
            border-color: #03b97c;
            border-width: 2px;
        }
    </style>
    <body>
        <div id="main-wrapper">
            <!-- Start Navigation -->
            <%@include file="template/header_new.jsp" %>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">
                    <div class="row">
                        <!--admin navbar-->
                        <div class="col-lg-3 col-md-3">
                            <%@include file="template/AdminSidebar.jsp" %>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="listUsers">List users</a></li>
                                                    <li class="breadcrumb-item" aria-current="page">User profile (id = ${user.userId})</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">
                                        <div class="form_blocs_wrap">
                                            <form action="viewEditUser" method="post">
                                                <div class="row justify-content-between">
                                                    <div class="col-xl-9 col-lg-8 col-md-7 col-sm-12">
                                                        <div class="tab-content" id="v-pills-tabContent">
                                                            <!-- Basic -->
                                                            <input type="hidden" name="uid" value="${user.userId}">
                                                            <div class="tab-pane fade show active" id="v-pills-basic" role="tabpanel" aria-labelledby="v-pills-basic-tab">
                                                                <div class="form-group smalls">
                                                                    <label>Full Name </label>
                                                                    <input type="text" class="form-control" value="${user.getFullName()}" readonly>
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Userame</label>
                                                                    <input type="text" class="form-control" value="${user.userName}" readonly>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Email</label>
                                                                    <input type="email" class="form-control" value="${user.email}" readonly>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Gender</label>
                                                                    <input type="text" class="form-control" value="${user.getUserGender(user.gender)}" readonly>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Phone</label>
                                                                    <input type="text" class="form-control" value="${user.phone}" readonly>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Role</label>
                                                                    <select name="role" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                                        <c:forEach items="${listRole}" var="r" begin="0" end="4">
                                                                            <option value="${r.getRoleId()}" ${roleValue == r.getRoleId() ? "selected" : ""}>${r.getRoleName()}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Address</label>
                                                                    <input type="text" class="form-control" value="${user.address}" readonly>
                                                                </div>
                                                                <div class="form-group smalls">
                                                                    <label>Status</label>
                                                                    <select name="status" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                                        <option value="1" ${status==1 ? "selected":""}>Active</option>
                                                                        <option value="0" ${status==0 ? "selected":""}>Deactive</option>
                                                                    </select>
                                                                </div>
                                                                <!-- Single Grid -->
                                                                <div class="form-group smalls">
                                                                    <label>User avatar</label>
                                                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                                                                        <div class="crs_grid">
                                                                            <div class="crs_grid_thumb">
                                                                                <img src="${pageContext.request.contextPath}/img/logo/${user.profilePic}" class="img-fluid rounded" alt="null" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="justify-content-between">
                                                                    <input type="submit" class="btn text-white full-width theme-bg" value="Save changes" onclick="AddUserSuccess()">
                                                                </div>    
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Dashboard: Dashboard End ================================== -->

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
            <a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="/SWP_QuizPracticeCodeJava/assets/js/jquery.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/popper.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/bootstrap.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/select2.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/slick.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/moment.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/daterangepicker.js"></script> 
        <script src="/SWP_QuizPracticeCodeJava/assets/js/summernote.min.js"></script>
        <script src="/SWP_QuizPracticeCodeJava/assets/js/metisMenu.min.js"></script>	
        <script src="/SWP_QuizPracticeCodeJava/assets/js/custom.js"></script>

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		

    </body>
</html>

<script>
                                                                        function AddUserSuccess() {
                                                                            alert("Changed successfully");
                                                                        }
</script>


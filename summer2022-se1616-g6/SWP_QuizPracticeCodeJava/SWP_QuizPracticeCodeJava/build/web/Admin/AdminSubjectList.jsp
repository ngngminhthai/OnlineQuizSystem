<%-- 
    Document   : lessonList
    Created on : Jun 23, 2022, 5:59:27 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
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

            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">

                    <div class="row">

                        <div class="page-sidebar p-0">
                            <a class="filter_links" data-toggle="collapse" href="#fltbox" role="button" aria-expanded="false" aria-controls="fltbox">Open Advance Filter<i class="fa fa-sliders-h ml-2"></i></a>							
                            <div class="collapse" id="fltbox">
                                <!-- Search users -->
                                <div class="sidebar-widgets p-4">
<!--                                    <form action="AdminSubjectList" method="post">
                                        
                                    </form>-->

                                    <!--Apply filter-->
                                    <form action="AdminSubjectList" method="get">
                                        <div class="form-group">
                                            <div class="input-with-icon">
                                                <input value="${search}" type="text" class="form-control" placeholder="Search subjects" name="search">
                                                <i class="ti-search"></i>
                                            </div>
                                        </div>
                                        <!--Role-->
                                        <div class="form-group">
                                            <h6>Category</h6>
                                            <div class="smalls">
                                                <select id="ins" class="form-control" name="catId">
                                                    <option value="12" ${catId == 12 ? "selected" : ""}>All</option>
                                                    <c:forEach items="${listCategory}" var="cat">
                                                        <option value="${cat.catId}" ${cat.catId == catId ? "selected" : ""}>${cat.catName}</option>
                                                    </c:forEach>    
                                                </select>
                                            </div>
                                        </div>
                                        <!--Status-->        
                                        <div class="form-group">
                                            <h6>Status</h6>
                                            <div class="smalls">
                                                <select id="sts" class="form-control" name="status">
                                                    <option value="2" ${stat == 2 ? "selected" : ""}>All</option>
                                                    <option value="1" ${stat == 1 ? "selected" : ""}>Published</option>
                                                    <option value="0" ${stat == 0 ? "selected" : ""}>Unpublished</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!--Filter button-->
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 pt-4">
                                                <button class="btn theme-bg rounded full-width">Apply Filter</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Subject List</li>
                                                </ol>
                                            </nav>
                                        </div>
                                        <div class="elkios">
                                            <a href="CreateSubject" class="add_new_btn"><i class="fas fa-plus-circle mr-1"></i>Add New Subject</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 mb-2">
                                                <div class="table-responsive">
                                                    <table class="table dash_list">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">ID</th>
                                                                <th scope="col">Subject Name</th>
                                                                <th scope="col">Category</th>
                                                                <th scope="col">Number of lessons</th>
                                                                <th scope="col">Owner</th>
                                                                <th scope="col">Status</th>
                                                                <th scope="col">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listSubject}" var="subject">
                                                                <tr>
                                                                    <td>${subject.subjectId}</td>
                                                                    <td>${subject.subjectName}</td>
                                                                    <td>${subject.cat.catName}</td>
                                                                    <td>${subject.totalLesson}</td>
                                                                    <td><div class="dhs_tags">${subject.expertName}</div></td>
                                                                    <c:choose>
                                                                        <c:when test="${subject.status == true}">
                                                                            <td><span class="trip theme-cl theme-bg-light">Published</span></td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                             <td><span class="trip theme-cl theme-bg-light">Unpublished</span></td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <td>
                                                                        <div class="dropdown show">
                                                                            <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                <i class="fas fa-ellipsis-h"></i>
                                                                            </a>
                                                                            <div class="drp-select dropdown-menu">
                                                                                <a class="dropdown-item" href="UpdateSubjectDetail?subjectID=${subject.subjectId}">Edit</a>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!--pagination-->
                                        <div class="row align-items-center justify-content-center" style="margin-left: 33px;">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <nav class="course-pagination mb-30" aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <c:choose>
                                                            <c:when test="${listSubject == null || listSubject.size()==0}">
                                                                <h4>No subject found</h4>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:choose>
                                                                    <c:when test="${page>1}">
                                                                        <li class="page-item">
                                                                            <a class="page-link" href="${url}&page=${page-1}"><span class="ti-angle-left"></span></a>
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
                                                                        <a class="page-link" href="${url}&page=${i}"> ${i}</a>
                                                                    </li>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${page>=totalPage}">
                                                                        <li class="page-item disabled">
                                                                            <a class="page-link" href="#" ><span class="ti-angle-right"></span></a>
                                                                        </li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li class="page-item">
                                                                            <a class="page-link" href="${url}&page=${page+1}"><span class="ti-angle-right"></span></a>
                                                                        </li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                        <!--End paging-->
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>

                </div>
            </section>
            <!-- ============================ Dashboard: Dashboard End ================================== -->

            <!-- ============================ Footer Start ================================== -->
<!--            <footer class="dark-footer skin-dark-footer style-2">
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
            </footer>-->
            <!-- ============================ Footer End ================================== -->

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

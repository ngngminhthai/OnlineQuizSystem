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
        <link href="css/style.css" rel="stylesheet">
        <!--<link href="css/stylesData.css" rel="stylesheet" />-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">

    </head>
    <style>
        .table{
            display: block !important;
            overflow-x: auto !important;
            width: 100% !important;
        }
        table th{
            padding: 0px 5px;
            white-space: no-wrap;
            font-size: 11px;
        }
        section.page-title{
            background-color: white;
        }
    </style>
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

                        <%@include file="template/menu.jsp" %>

                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">List of lesson</li>
                                                </ol>
                                            </nav>
                                        </div>
                                        <div class="elkios">
                                            <a href="createLesson" class="add_new_btn"><i class="fas fa-plus-circle mr-1"></i>Add Lesson</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">
                                        <form action="lesson?page=1" method="get">
                                            <div class="row align-items-end mb-5">
                                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <h6>Status</h6>
                                                        <div class="smalls">
                                                            <select id="sts" class="form-control" name="status">
                                                                <option value="2" ${status == 2 ? "selected" : ""}>All</option>
                                                                <option value="1" ${status == 1 ? "selected" : ""}>Active</option>
                                                                <option value="0" ${status == 0 ? "selected" : ""}>Deactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-2 col-lg-4 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <button class="btn theme-bg rounded full-width">Filter</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>

                                        <!--                                        <div class="row justify-content-between">
                                                                                    <div class="col-xl-4 col-lg-5 col-md-6">
                                                                                        <div class="form-group smalls row align-items-center">
                                                                                            <label class="col-xl-2 col-lg-2 col-sm-2 col-form-label">Search</label>
                                                                                            <div class="col-xl-10 col-lg-10 col-sm-10">
                                                                                                <input type="text" class="form-control">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>-->
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 mb-2">
                                                <!--                                                <div class="table-responsive">
                                                                                                    <table class="table dash_list">
                                                                                                        <thead>
                                                                                                            <tr>
                                                                                                                <th scope="col">#</th>
                                                                                                                <th scope="col">Lesson Name</th>
                                                                                                                <th scope="col">Subject Name</th>
                                                                                                                <th scope="col">Content</th>
                                                                                                                <th scope="col">Lesson Type</th>
                                                                                                                <th scope="col">Lesson Order</th>
                                                                                                                <th scope="col">Status</th>
                                                                                                                <th scope="col">Action</th>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                        <tbody>
                                                <c:forEach items="${listLesson}" var="les">
                                                    <tr>
                                                        <th scope="row">${les.lessonId}</th>
                                                        <td>${les.lessonName}</td>
                                                        <td>${les.subject.subjectName}</td>
                                                        <td>${les.content}</td>
                                                        <td><div class="dhs_tags">${les.lessonType.lessonTypeName}</div></td>
                                                        <td>${les.lessonOrder}</td>
                                                    <c:choose>
                                                        <c:when test="${les.status == true}">
                                                            <td><span class="trip theme-cl theme-bg-light">Active</span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><span class="trip theme-cl theme-bg-light">Inactive</span></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td>
                                                        <div class="dropdown show">
                                                            <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fas fa-ellipsis-h"></i>
                                                            </a>
                                                            <div class="drp-select dropdown-menu">
                                                                <a class="dropdown-item" href="editLesson?lid=${les.lessonId}">Edit</a>
                                                                <a class="dropdown-item" href="deleteLesson?did=${les.lessonId}"
                                                                   onclick="if (!(confirm('Are you sure to delete ?')))
                                                                               return false">Delete</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>-->

                                                <div class="card shadow mb-4">
                                                    <div class="card-body col-xl-12 col-lg-12 col-md-12 mb-2">
                                                        <div class="table-responsive">
                                                            <table class="table-striped table" id="datatablesSimple" width="100%" cellspacing="0">
                                                                <thead>
                                                                    <tr>
                                                                        <!--                                                                        <th style="padding-left: 0px !important;
                                                                                                                                                    padding-right: 0px !important;">ID</th>-->
                                                                        <th>#</th>
                                                                        <th>Lesson Name</th>
                                                                        <th>Subject Name</th>
                                                                        <th>Content</th>
                                                                        <th>Type</th>
                                                                        <th>Order</th>
                                                                        <th>Status</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>

                                                                <tbody>
                                                                    <c:forEach items="${listLesson}" var="les">
                                                                        <tr>
                                                                            <!--<th scope="row">${user.userId}</th>-->
                                                                            <td>${les.lessonId}</td>
                                                                            <td>${les.lessonName}</td>
                                                                            <td>${les.subject.subjectName}</td>
                                                                            <td>${les.content}</td>
                                                                            <td><div class="dhs_tags">${les.lessonType.lessonTypeName}</div></td>
                                                                            <td>${les.lessonOrder}</td>
                                                                            <c:choose>
                                                                                <c:when test="${les.status == true}">
                                                                                    <td><span class="trip theme-cl theme-bg-light">Active</span></td>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <td><span class="trip theme-cl theme-bg-light">Inactive</span></td>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <td>
                                                                                <div class="dropdown show">
                                                                                    <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                        <i class="fas fa-ellipsis-h"></i>
                                                                                    </a>
                                                                                    <div class="drp-select dropdown-menu">
                                                                                        <a class="dropdown-item" href="editLesson?lid=${les.lessonId}">Edit</a>
                                                                                        <a class="dropdown-item" href="deleteLesson?did=${les.lessonId}"
                                                                                           onclick="if (!(confirm('Are you sure to delete ?')))
                                                                                                       return false">Delete</a>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                            <!--                                                                            <td>
                                                                                                                                                            <div class="dropdown show">
                                                                                                                                                                    <a class="btn btn-action" href="viewEditUser?uid=${user.userId}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                                                                                    <i class="fas fa-ellipsis-h"></i>
                                                                                                                                                                </a>
                                                                                                                                                                <div class="drp-select dropdown-menu">
                                                                                                                                                                    <a class="dropdown-item" href="admin/viewEditUser?uid=${user.userId}">View & Edit</a>
                                                                                                                                                                </div>
                                                                                                                                                            </div>
                                                                                                                                                        </td>-->
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--pagination-->
                                        <!--                                        <div class="row align-items-center justify-content-center" style="margin-left: 33px;">
                                                                                    <div class="col-xl-12 col-lg-12 col-md-12">
                                                                                        <nav class="course-pagination mb-30" aria-label="Page navigation example">
                                                                                            <ul class="pagination justify-content-center">
                                        <c:choose>
                                            <c:when test="${listLesson == null || listLesson.size()==0}">
                                                <h4>There are no users</h4>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${page>1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="lesson?page=${page-1}&search=${search}&status=${status}"><span class="ti-angle-left"></span></a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#"><span class="ti-angle-left"></span></a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="1" end="${totalPage}" var="i">
                                                    <li class="page-item ${i == page ? "active" : ""}">
                                                        <a class="page-link" href="lesson?page=${i}&search=${search}&status=${status}"> ${i}</a>
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
                                                            <a class="page-link" href="lesson?page=${page+1}&search=${search}&status=${status}"><span class="ti-angle-right"></span></a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </nav>
                            </div>
                        </div>-->
                                        <!--End paging-->
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>

                </div>
            </section>
            <!-- ============================ Dashboard: Dashboard End ================================== -->

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>

        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet"/>

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		
        <script>

//                                    window.addEventListener('DOMContentLoaded', event => {
//                                        // Simple-DataTables
//                                        // https://github.com/fiduswriter/Simple-DataTables/wiki
//
//                                        const datatablesSimple = document.getElementById('datatablesSimple');
//                                        if (datatablesSimple) {
//                                            new simpleDatatables.DataTable(datatablesSimple)
//
//                                            $('.dataTable-input').addClass('form-control'); // <-- add this line
// 
//                                        }
//                                    });


                                                                                               $('#datatablesSimple').DataTable({
                                                                                                   "columnDefs": [
                                                                                                       {"orderable": false, "targets": 7}
                                                                                                   ]
                                                                                               }
                                                                                               );
                                                                                               $('.dataTables_filter label').contents().filter((_, el) => el.nodeType === 3).remove();
                                                                                               $('.dataTables_filter label').css('form-control');
                                                                                               $('.dataTables_filter input').addClass('form-control');
                                                                                               $('.dataTables_filter input').attr("placeholder", "Search");


                                                                                               window.addEventListener('DOMContentLoaded', event => {

                                                                                                   // Toggle the side navigation
                                                                                                   const sidebarToggle = document.body.querySelector('#sidebarToggle');
                                                                                                   if (sidebarToggle) {
                                                                                                       // Uncomment Below to persist sidebar toggle between refreshes
                                                                                                       // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                                                                                                       //     document.body.classList.toggle('sb-sidenav-toggled');
                                                                                                       // }
                                                                                                       sidebarToggle.addEventListener('click', event => {
                                                                                                           event.preventDefault();
                                                                                                           document.body.classList.toggle('sb-sidenav-toggled');
                                                                                                           localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                                                                                                       });
                                                                                                   }

                                                                                               });


        </script>
    </body>
</html>

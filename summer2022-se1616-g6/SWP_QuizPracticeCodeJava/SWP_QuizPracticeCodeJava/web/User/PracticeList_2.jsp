<%-- 
    Document   : UserRegistration
    Created on : Jun 17, 2022, 4:57:55 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <!--        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Merienda+One">
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="assets/css/styles.css" rel="stylesheet">
        <style>
            .table{
                display: block !important;
                overflow-x: auto !important;
                width: 100% !important;
            }
            table th{
                padding: 0px 5px;
                white-space: no-wrap;
                font-size: 10px;
            }
            section.page-title{
                background-color: white;
            }
            tr th{
                width: 25% !important;
            }
            tr th:first-child{
                width: 60% !important;
            }
            #datatablesSimple_wrapper{
                width: 100%;
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
            <%@include file="template/header_new.jsp" %>
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
                                <h1 class="breadcrumb-title">My Practices</h1>
                                <nav class="transparent">
                                    <ol class="breadcrumb p-0 bg-white">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active theme-cl" aria-current="page">My Practices</li>
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
                <div style="    max-width: 1200px;
                     " class="container">
                    <div class="row">

                        <c:choose>
                            <c:when test="${isDoingQuiz}">
                                
                                <a href="QuizHandle?quesnum=1&type=quizHandle" style="margin-left: 10px;" class="btn btn-success">Continue the last attempt</a>
                            </c:when>
                            <c:otherwise>
                                <%@include file="PracticeNew.jsp" %>
                                &nbsp; &nbsp; &nbsp;
                                <%@include file="ExamNew.jsp" %>
                            </c:otherwise>
                        </c:choose>


                    </div>
                    <div class="row">



                        <!-- Sidebar -->
                        <div class="col-xl-12 col-lg-12 col-md-12 order-lg-1">

                            <div class="table-responsive row justify-content-center">
                                <table id="datatablesSimple" style="background-color: white;" class="table table-striped table-hover table-sm">
                                    <thead>
                                        <tr>
                                            <!--                                                                        <th style="padding-left: 0px !important;
                                                                                                                        padding-right: 0px !important;">ID</th>-->
                                            <th>Subject Name/Exam Name</th>
                                            <th>Date taken</th>
                                            <th>Percent(%)</th>
                                            <th>Detail</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <c:forEach items="${requestScope.list}" var="p">
                                            <tr>
                                                <!--<th scope="row">${user.userId}</th>-->
                                                <td>"${p.quizId.subjectId.getSubjectName()}" - ${p.quizId.getQuizName()}</td>
                                                <td>${p.submitted}</td>


                                                <td>  <fmt:formatNumber type="number" 
                                                                  maxFractionDigits="1" value = "${p.point}" /></td>
                                                <td>
                                                    <div class="dropdown show">
                                                        <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="fas fa-ellipsis-h"></i>
                                                        </a>
                                                        <div class="drp-select dropdown-menu">
                                                            <a class="dropdown-item" href="quizreview?quizid=${p.quizId.getQuizId()}">View</a>
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
            </section>
            <!-- ============================ Course Detail ================================== -->

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
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet"/>

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
                    {"orderable": false, "targets": 3}
                ]
            }
            );
            $('.dataTables_filter label').contents().filter((_, el) => el.nodeType === 3).remove();
            $('.dataTables_filter label').css('form-control');
            $('.dataTables_filter input').addClass('form-control');
            $('label select').addClass('form-control');
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
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		
    </body>
</html>
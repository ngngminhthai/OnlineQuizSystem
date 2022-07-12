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
                                <h1 class="breadcrumb-title">My Registration</h1>
                                <nav class="transparent">
                                    <ol class="breadcrumb p-0 bg-white">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active theme-cl" aria-current="page">My Registration</li>
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

                        <div class="col-xl-3 col-lg-3 col-md-12 order-lg-2">
                            <%@include file="template/SubjectSideBar.jsp" %>
                            <!-- Sidebar End -->

                        </div>

                        <!-- Sidebar -->
                        <div class="col-xl-9 col-lg-9 col-md-12 order-lg-1">
                            <form action="userregistration" method="get">    

                                <div class="row">
                                    <div style="padding: 0px;" class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="short_wraping">
                                            <div class="row m-0 align-items-center justify-content-between">

                                                <div class="col-lg-3 col-md-4 col-sm-12  col-sm-6">
                                                    <div class="shorting_pagination_laft">
                                                        <h6 class="m-0">Showing ${count.to}-${count.from} of ${total}</h6>
                                                    </div>
                                                </div>

                                                <div class="col-lg-9 col-md-8 col-sm-12 col-sm-6">
                                                    <div class="dlks_152">
                                                        <!--                                                    <div class="shorting-right mr-2">
                                                                                                                <label>Sort By:</label>
                                                                                                                <div>
                                                                                                                                                                                <a class="btn btn-filter dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                                                                                                    <span class="selection">Registration Id</span>
                                                                                                                                                                                </a>
                                                                                                                    <select class="drp-select btn btn-filter" name="">
                                                                                                                        <option class="dropdown-item btn btn-filter">Registration Id</option>
                                                        
                                                                                                                    </select>
                                                                                                                </div>
                                                              <form>                                                  </div>-->

                                                        <div class="shorting-right mr-1">

                                                            <label>Search Course Name:</label>
                                                            <div>
                                                                <!--                                                            <a class="btn btn-filter dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                                                <span class="selection">Registration Id</span>
                                                                                                                            </a>-->
                                                                <input class="drp-select btn btn-filter" name="s">


                                                            </div>
                                                        </div>

                                                        <div class="shorting-right mr-1">
                                                            <div>
                                                                <!--                                                            <a class="btn btn-filter dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                                                <span class="selection">Registration Id</span>
                                                                                                                            </a>-->
                                                                <button class="btn theme-bg rounded full-width">Find</button>
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
                            </form>
                            <div class="table-responsive row justify-content-center">
                                <table style="background-color: white;" class="table table-striped table-hover table-sm">
                                    <thead class="thead-default">
                                        <tr>
                                            <th ><a id="regId" href="userregistration?order=regId&sort=asc">Id</a><i style="display: none;align-self: center;" class="fa fa-chevron-down" aria-hidden="true"></i></th>
                                            <th>Subject Name</th>
                                            <th ><a  id="validFrom" href="userregistration?order=validFrom&sort=asc">Valid From</a><i style="display: none;align-self: center;" class="fa fa-chevron-down" aria-hidden="true"></i></th>
                                            <th ><a  id="validTo" href="userregistration?order=validTo&sort=asc">Valid To</a><i style="display: none;align-self: center;" class="fa fa-chevron-down" aria-hidden="true"></i></th>
                                            <th ><a  id="cost" href="userregistration?order=cost&sort=asc">Cost</a><i style="display: none;align-self: center;" class="fa fa-chevron-down" aria-hidden="true"></i></th>
<!--                                            <th ><a  id="status" href="userregistration?order=status&sort=asc">Status</a><i style="display: none;align-self: center;" class="fa fa-chevron-down" aria-hidden="true"></i></th>-->
                                            <th ><a  id="status" href="userregistration?order=isAccepted&sort=asc">Status</a><i style="display: none;align-self: center;" class="fa fa-chevron-down" aria-hidden="true"></i></th>

                                            <th></th>
                                            <th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${rlist}" var="r">
                                            <tr>

                                                <th scope="row"><fmt:formatNumber minIntegerDigits="2" value="${r.regId}"></fmt:formatNumber></th>
                                                <td>${r.sub.subjectName}</td>
                                                <td><c:choose>
                                                        <c:when test="${r.validFrom == null}">
                                                            LifeTime
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${r.validFrom}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td><c:choose>
                                                        <c:when test="${r.validTo == null}">
                                                            LifeTime
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${r.validTo}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${r.pricepackage.listPrice}</td>
<!--                                                <td><c:choose>
                                                        <c:when test="">
                                                            Expired
                                                        </c:when>
                                                        <c:otherwise>

                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>-->
                                                <td><c:choose>
                                                        <c:when test="${r.isAccepted}">
                                                            Accepted
                                                        </c:when>
                                                        <c:otherwise>
                                                            Pending
                                                        </c:otherwise>
                                                    </c:choose></td>


                                                <td> <%@include file="EditUserRegistration.jsp"%></td>
                                                <td><a style="background-color: #bd2130 !important; color: white;" href="cancelregistration?rid=${r.regId}&page=${pageindex}&type=${order}&order=${sort}" class="btn btn-danger cancel_btn">Cancel</a></td>
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>

                            <div class="row align-items-center justify-content-center">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <nav class="float-none">
                                        <ul class="pagination smalls">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" tabindex="-1"><i class="fas fa-arrow-circle-left"></i></a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item active">
                                                <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item">
                                                <a class="page-link" href="#"><i class="fas fa-arrow-circle-right"></i></a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
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
        <script>
        var field = document.getElementById('<%= request.getAttribute("order")%>');
        var search = '${search}';
        var passField;
        if (field != null) {
            var sortIcon = field.nextSibling;

            var sort = '<%=request.getAttribute("sort")%>'
            var link = "";
            var reverseLink = "";
            if (sort == "asc") {
                passField = "";
                link = "userregistration?order=" + field.id + "&sort=asc";
                reverseLink = "order=" + field.id + "&sort=desc"
                field.setAttribute("href", link);
                sortIcon.className = "fa fa-chevron-down";
                sortIcon.style.display = "contents";
            } else if (sort == "desc") {
                link = "userregistration?order=" + field.id + "&sort=desc";
                reverseLink = "order=" + field.id + "&sort=asc"
                field.setAttribute("href", link);
                sortIcon.className = "fa fa-chevron-up";
                sortIcon.style.display = "contents";
            }
        }
        if (reverseLink != "") {
            reverseLink = "&" + reverseLink;
        }
        var thePath = window.location.pathname;
        var getLastItem = thePath.substring(thePath.lastIndexOf('/') + 1)

        pagger(thePath, ${pageindex}, ${totalpage}, reverseLink, search);

        function pagger(path, pageindex, totalpage, field, search)
        {
            var searchContent = "";
            if (search != "") {
                searchContent = `&search=` + search + ``;
            }
            var gap = 3;
            var container = document.querySelector(".pagination.smalls");
            currentPage = ${pageindex};
            var prev = currentPage - 1;
            var next = currentPage + 1;
            var result = '';
//    if (pageindex - gap > 1)
//        result += '<a href="list?page=1">First</a>';


            if (currentPage > 1)
                result += `<li class="page-item">
                                                                                    <a class="page-link" href="` + path + `?page=` + prev + `"><span class="ti-angle-left"></span></a>
                                                                                </li>`;


            for (var i = pageindex - gap; i < pageindex; i++) {
                if (i > 0)
                    result += `<li class="page-item">
                                                                                    <a class="page-link" href="` + path + `?page=` + i + `` + field + `` + searchContent + `">` + i + `</a>
                                                                                </li>`;
            }

            result += `<li class="page-item active">
                                                                                    <a class="page-link" href="` + path + `?page=` + i + `` + field + `` + searchContent + `">` + i + `</a>
                                                                                </li>`;


            for (var i = pageindex + 1; i <= pageindex + gap; i++)
                if (i <= totalpage)
                    result += `<li class="page-item">
                                                                                    <a class="page-link" href="` + path + `?page=` + i + `` + field + `` + searchContent + `">` + i + `</a>
                                                                                </li>`;

            if (pageindex < totalpage)
                result += `<li class="page-item">
                                                                                    <a class="page-link" href="` + path + `?page=` + next + `"><span class="ti-angle-right"></span></a>
                                                                                </li>`;

//    if (pageindex + gap < totalpage)
//        result += '<a href="list?page=' + totalpage + '">Last</a>';
            container.innerHTML = result;
        }




        var savebtn = document.querySelector(".save_btn");
        var pid = document.querySelector(".packageId");
        var sid = document.querySelector(".subjectId");
        var isUpdate = document.querySelector(".isUpdate");
        var regId = document.querySelector(".regId");


        var button = document.querySelectorAll(".pricing-plan-purchase-btn");
        var pricing_card = document.querySelectorAll(".pricing-card");

        button.forEach((ele) => {
            ele.addEventListener("click", () => {


                var radiobtn = ele.nextElementSibling;
                radiobtn.checked = true;


                pid.value = radiobtn.classList[0];
                sid.value = ele.classList[0];
                console.log(pid.value + " " + sid.value);

                var packageNameChoose = radiobtn.nextElementSibling;
                var classOfPackageName = ".fullName" + packageNameChoose.classList[1];
                var packageName = document.querySelector(classOfPackageName);
                packageName.placeholder = packageNameChoose.value;

                regId.value = packageNameChoose.nextElementSibling.value;
                console.log(regId.value);


                removeHightlight();
                ele.parentNode.parentNode.classList.toggle("pricing-card-hover")

                if (ele.parentNode.parentNode.classList.contains("pricing-plan-basic"))
                    ele.classList.toggle("pricing-plan-purchase-btn-hover")
                else if (ele.parentNode.parentNode.classList.contains("pricing-plan-pro"))
                    ele.classList.toggle("pricing-plan-purchase-btn-hover")
                else if (ele.parentNode.parentNode.classList.contains("pricing-plan-enterprise"))
                    ele.classList.toggle("pricing-plan-purchase-btn-hover")


            });

        })
        function removeHightlight() {
            button.forEach((ele) => {
                ele.classList.remove("pricing-plan-purchase-btn-hover");
            })
            pricing_card.forEach((ele) => {
                ele.classList.remove("pricing-card-hover");
            })
        }

        function formSubmit() {
            var userform = document.querySelector(".edituserregister");
            userform.submit();
        }</script>
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
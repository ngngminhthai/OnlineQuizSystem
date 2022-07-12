<%-- 
    Document   : registrationList
    Created on : Jun 8, 2022, 7:26:55 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Slider List</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styleSlider.css">
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
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input { 
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
        .sort{
            font-size: 20px;
            font-weight: bold;
            color:black;
            margin-top:20px;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
            z-index: 1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }

    </style>
    <body>
        <%@include file="template/header.jsp" %>
        <section class="ftco-section" style="padding-right: 80px">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section" style="font-size: 45px">Slider List</h2>
                    </div>
                </div>
                <div class="row">
                    <div class=" col-md-5 sidebar-form mb-10" style="width: 500px">
                        <form action="sliderlist" method="post">
                            <input placeholder="Search Title" type="text" name="keyword" value="${keyword}">
                            <button type="submit">
                                <i class="ti-search"></i>
                            </button>
                        </form>
                    </div>

                    <div class="mb-10 col-md-5" style="padding-left: 0;">
                        <div>
                            <button type="button" style="height: 60px;" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">Filter </button>
                            <!--<form action="sliderlist" method="post">-->
                                <ul class="dropdown-menu">
                                    By Status : 
                                    <li>
                                        <a href="sliderlist?keyword=${keyword}&page=1&status=1" 
                                           class="large" data-value="option1" tabIndex="-1">&nbsp;True</a>
                                    </li>
                                    <li>
                                        <a href="sliderlist?keyword=${keyword}&page=1&status=0" 
                                           class="large" data-value="option2" tabIndex="-1">&nbsp;False</a>
                                    </li>

                                </ul>
                            <!--</form>-->
                        </div>
                    </div>      
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr>
                                        <th>Slider ID</th>
                                        <th>Slider Title</th>
                                        <th>Subject Name (backlink)</th>
                                        <th>Image</th>
                                        <th>Note</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listslider}" var="l">
                                        <tr>
                                            <th scope="row">${l.sliderId}</th>
                                            <td>${l.sliderTitle}</td>
                                            <td>${l.subjectName}</td>
                                            <td><img class="" src="img/slider/${l.image}" alt="image" style="width: 360px;height: 200px;"></td>
                                            <td>${l.note}</td>
                                            <td>
                                                <label class="switch">
                                                    <input type="checkbox" onclick="return false;" ${l.status == true? "checked":""}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </td>
                                            <td>
                                                <a href="sliderdetail?id=${l.sliderId}">Update</a>
                                                <a href="#">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!--pagination/-->
            <div class="row">
                <div class="col-xl-12 text-center">
                    <div class="single-events-btn mt-15 mb-30">
                        <nav class="course-pagination mb-30" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:choose>
                                    <c:when test="${listslider == null || listslider.size()==0}">
                                        <h4>There are no slider</h4>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${pageIndex>1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="sliderlist?page=${pageIndex-1}&keyword=${keyword}&status=${status}"><span class="ti-angle-left"></span></a>
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
                                                <a class="page-link" href="sliderlist?page=${i}&keyword=${keyword}&status=${status}"> ${i}</a>
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
                                                    <a class="page-link" href="sliderlist?page=${pageIndex+1}&keyword=${keyword}&status=${status}"><span class="ti-angle-right"></span></a>
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
        </section>
        <%--<%@include file="template/footer.jsp"%>--%>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</html>

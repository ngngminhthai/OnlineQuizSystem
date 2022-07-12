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
        <title>Registration List</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styleTable.css">
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
        .p-sort{
            width: 130px;
            height: 40px;
            margin-right: 5px;
            text-align: center;
            padding-top: 8px;
            border-radius: 10px;
            
        }

        /* CSS */
        .button-34 {
            background: #5E5DF0;
            border-radius: 999px;
            box-shadow: #5E5DF0 0 10px 20px -10px;
            box-sizing: border-box;
            color: #FFFFFF;
            cursor: pointer;
            font-family: Inter,Helvetica,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Noto Color Emoji","Segoe UI Symbol","Android Emoji",EmojiSymbols,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans",sans-serif;
            font-size: 16px;
            font-weight: 700;
            line-height: 24px;
            opacity: 1;
            outline: 0 solid transparent;
            padding: 9px 30px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: fit-content;
            word-break: break-word;
            border: 0;
            margin-bottom: 9px;
            margin-top: 10px;
        }
    </style>
    <body>
        <%@include file="template/header.jsp" %>
        <section class="ftco-section" style="padding-right: 80px">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section" style="font-size: 45px">Registration List</h2>
                    </div>
                </div>
                <div class="row">
                    <div class=" col-md-5 sidebar-form mb-10" style="width: 500px">
                        <form action="registration?page=1&name=${sortName}&type=${sortType}" method="post">
                            <input placeholder="Search" type="text" name="search" value="<%=request.getParameter("search") != null ? request.getParameter("search") : ""%>">
                            <button type="submit">
                                <i class="ti-search"></i>
                            </button>
                        </form>
                    </div>

                    <div class="mb-10 col-md-5" style="padding-left: 0;">
                        <div>
                            <button type="button" style="height: 60px;" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">Filter </button>
                            <ul class="dropdown-menu" style="padding-left:10px">
                                By Subject : 
                                    <li><a href="registration?search=${search}&page=1&name=${sortName}&type=${sortType}&subName=Introduction to Management Senior&status=&from=&to=" 
                                           class="large" data-value="option1" tabIndex="-1">&nbsp;Introduction to Management</a></li>
                                    <li><a href="registration?search=${search}&page=1&name=${sortName}&type=${sortType}&subName=Pre-intermediate Business English&status=&from=&to="
                                           class="large" data-value="option1" tabIndex="-1">&nbsp;Pre-intermediate Business English</a></li>
                                By Status : 
                                <li><a href="registration?search=${search}&page=1&name=${sortName}&type=${sortType}&subName=&status=1&from=&to=" 
                                       class="large" data-value="option2" tabIndex="-1">&nbsp;True</a></li>
                                <li><a href="registration?search=${search}&page=1&name=${sortName}&type=${sortType}&subName=&status=0&from=&to=" 
                                       class="large" data-value="option2" tabIndex="-1">&nbsp;False</a></li>
                                       
                                By Registration Time : 
                                <li><a href="registration?search=${search}&page=1&name=${sortName}&type=${sortType}&subName=&status=&from=2021-10-07&to=2021-10-12" 
                                       class="large" data-value="option2" tabIndex="-1">&nbsp;From 2021-10-07 to 2021-10-12</a></li>
                                <li><a href="registration?search=${search}&page=1&name=${sortName}&type=${sortType}&subName=&status=&from=2020-12-12&to=2021-10-06" 
                                       class="large" data-value="option2" tabIndex="-1">&nbsp;From 2020-12-12 to 2021-10-06</a></li>

                            </ul>
                        </div>
                    </div>      
                </div>

                <p class="sort">Sort by</p>
                <div class="dropdown">
                    <p class="p-sort btn-info">Id</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=regId&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=regId&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Registration Time</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=regTime&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=regTime&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending </a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Subject</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=subjectName&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=subjectName&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Package</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=packageName&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=packageName&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Cost</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=cost&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=cost&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Status</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=[status]&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=[status]&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Valid From</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=validFrom&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=validFrom&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <div class="dropdown">
                    <p class="p-sort btn-info">Valid To</p>
                    <div class="dropdown-content">
                        <a href="registration?search=${search}&page=1&name=validTo&type=ASC&subName=${subName}&status=${status}&from=${from}&to=${to}">Ascending</a>
                        <a href="registration?search=${search}&page=1&name=validTo&type=DESC&subName=${subName}&status=${status}&from=${from}&to=${to}">Descending</a>
                    </div>
                </div>
                <a href="createRegis"><button class="button-34" role="button">Add</button></a>


                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Registration time</th>
                                        <th>Subject</th>
                                        <th>Package</th>
                                        <th>Cost</th>
                                        <th>Valid From</th>
                                        <th>Valid To</th>
                                        <th>Updated By</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listAll}" var="l">
                                        <tr>
                                            <th scope="row">${l.regId}</th>
                                            <td>${l.email}</td>
                                            <td>${l.regTime}</td>
                                            <td>${l.subject}</td>
                                            <td>${l.pack}</td>
                                            <td>${l.totalCost}</td>
                                            <td>${l.validFrom}</td>
                                            <td>${l.validTo}</td>
                                            <td>${l.lastUpdateBy}</td>
                                            <td>
                                                <label class="switch">
                                                    <input type="checkbox" onclick="return false;" ${l.status == true? "checked":""}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </td>
                                            <td>
                                                <a href="registrationDetail?regid=${l.regId}">Update</a>
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
            <div class="row">
                <div class="col-xl-12 text-center">
                    <div class="single-events-btn mt-15 mb-30">
                        <nav class="course-pagination mb-30" aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <c:choose>
                                    <c:when test="${listAll==null || listAll.size()==0}">
                                        <h4>Not found any subject</h4>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${page>1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="registration?page=${page-1}&search=${search}&name=${sortName}&type=${sortType}&subName=${subName}&status=${status}&from=${from}&to=${to}"><span class="ti-angle-left"></span></a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="#"><span class="ti-angle-left"></span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item ${i==page?"active" : ""}">
                                                <a class="page-link" href="registration?page=${i}&search=${search}&name=${sortName}&type=${sortType}&subName=${subName}&status=${status}&from=${from}&to=${to}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${page>=totalPage}">
                                                <li class="page-item">
                                                    <a class="page-link" href="#"><span class="ti-angle-right"></span></a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link" href="registration?page=${page+1}&search=${search}&name=${sortName}&type=${sortType}&subName=${subName}&status=${status}&from=${from}&to=${to}"><span class="ti-angle-right"></span></a>
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
        <%@include file="template/footer.jsp"%>
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

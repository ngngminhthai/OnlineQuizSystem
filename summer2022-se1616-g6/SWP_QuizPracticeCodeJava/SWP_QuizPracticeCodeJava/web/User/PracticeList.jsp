<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tag" uri="WEB-INF/tlds/tag.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Practice List</title>

        <link rel="icon" href="" type="image/x-icon" />
        <link rel="stylesheet" href="css/PracticeList.css" type="text/css" />
        <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
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

    <body>
        <div class="main">
            <!-- header start  -->
            <header>

                <%@include file="template/header.jsp"%>
            </header>
            <!-- header end  -->

            <div class="sheet" style="margin-top: 50px">
                <!-- title start  -->
                <div class="practice-title">
                    <h1>Practice List</h1>
                </div>

                <!-- title end  -->

                <!-- container start -->
                <div class="practice-details">
                    <form action="practicelist" method="GET" id="searchFrm" onchange="submitData();" style="display: flex">
                        <input name="id" value="${sessionScope.user.userId}" type="hidden" >
                        <div style="justify-content: flex-start; width: 570px">
                            <select name="subjectID" onchange="this.form.submit()" id="" class="option" style="height: 40px">
                                <option value="-1">All subject</option>
                                <c:forEach var="s" items="${requestScope.listSubject}">
                                    <option value="${s.subjectId}" ${sId==s.subjectId?"selected":""} >${s.subjectName}</option>
                                </c:forEach>            
                            </select>
                        </div>


                        <!--<form action="practicesearch" method="POST">-->
                        <!--                        <input class="in-search" id="autocomplete-dynamic" placeholder="Search subject name" type="text" name="keyword">
                                                <button class="btn-search" type="submit">
                                                    <i class="ti-search"></i>
                                                </button>-->
                        <!--</form>-->
                        <div style="justify-content: flex-end;">
                            <a href="PracticeNew.jsp" style="font-size:20px; margin-right: 40px">
                                New Practice
                            </a>
                            <a href="#" style="font-size:20px ">
                                Simulation Exam
                            </a>
                        </div>


                    </form>
                </div>

            </div>
            <!-- container end -->

            <!-- table start -->
            <div class="practice-container">
                <div class="table-wrapper">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="thfirst">Subject Name/Exam Name</th>
                                <th>Date taken</th>
                                <th>Correct/Questions</th>
                                <th>Percent(%)</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>



                            <c:forEach var="p" items="${requestScope.list}">
                                <tr>
                                    <td data-label="">"${p.quizId.subjectId.getSubjectName()}" - ${p.quizId.getQuizName()}</td>
                                    <td data-label="">${p.submitted}</td>
                                    <td data-label="">${p.point}point/${p.quizId.numberOfQuestion}questions</td>
                                    <td data-label="">${p.quizId.passRate}%</td>
                                    <td data-label=""><a href="practicedetail?id=${p.quizId.getQuizId()}">View Detail</a></td>
                                </tr>
                                <tr>
                                    <td id="time" colspan="5" class="time">Duration(h:m:s): ${p.quizId.secondtotime(p.quizId.duration)}</td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- table end -->

        <!-- table start -->
        <div class="row">
            <div class="col-xl-12 text-center">
                <div class="single-events-btn mt-15 mb-30">
                    <nav class="course-pagination mb-30" aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">


                            <c:choose>
                                <c:when test="${list==null || list.size()==0}">
                                    <h4>Not found any quiz</h4>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${page>1}">
                                            <li class="page-item">
                                                <a class="page-link" href="practicelist?id=${sessionScope.user.userId}&page=${page-1}"><span class="ti-angle-left"></span></a>
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
                                            <a class="page-link" href="practicelist?id=${sessionScope.user.userId}&page=${i}">${i}</a>
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
                                                <a class="page-link" href="practicelist?id=${sessionScope.user.userId}&page=${page+1}"><span class="ti-angle-right"></span></a>
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

        <!-- table end -->

    </div>
    <!-- footer start -->
    <%@include file="template/footer.jsp"%>
    <!-- footer end -->
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
    <script src="js/practice.js"></script>

</body>

</html>
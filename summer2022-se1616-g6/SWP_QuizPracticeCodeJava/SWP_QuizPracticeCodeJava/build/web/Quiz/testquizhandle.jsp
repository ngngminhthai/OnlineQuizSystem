<%-- 
    Document   : testquizhandle
    Created on : Jun 27, 2022, 7:50:34 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx"><head>
        <meta charset="utf-8">
        <meta name="author" content="Themezhub">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SkillUp - Online Learning Platform</title>

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">
        <style>
            .quesbox a{
                padding: 10px;
                background-color: gainsboro;
                border-radius: 5px;
                position: relative;
                top: 13px;
                margin-left: 5px;
            }
            a i {
                position: absolute;
                top: -3px;
                right: 1px;
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

            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ All Cources ================================== -->
            <section class="gray" style="padding-top: 5px;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-md-12 order-lg-first"><%@include file="QuizHandle_1.jsp" %></div>
                        <div class="col-lg-2 col-md-12 order-lg-last quesbox" style="">
                            <div class="row d-flex">

                                <c:forEach begin="0" end="${sessionScope.doingQuiz.getQ().size()-1}" var="i">
                                    <div style="height: 50px; width: fit-content;">

                                        <a class="q${i+1}" href="QuizHandle?quesnum=${i+1}"> 
                                            <c:if test="${sessionScope.doingQuiz.getQ().get(i).marked == true}">
                                                <i class="fa-solid fa-bookmark"></i>
                                            </c:if>
                                            ${i+1}
                                        </a>
                                    </div>

                                </c:forEach>


                            </div>
                            <div class="row">
                                <div class="btncontainer">
                                    <div type="button" data-toggle="modal" data-target="#wantSubmit"  style="color: white;" class="btn btn-danger">Finish</div>
                                </div>

                            </div>

                            <div class="row">
                                <p style="font-weight: bold; color: red;">Time remaining:&nbsp</p>
                                <span style="
                                      position: relative;
                                      top: 2px;
                                      ">   <span id="hour"></span>:<span id="min"></span>:<span id="sec"></span></span>

                            </div>

                        </div>

                    </div>
                </div>
            </section>
            <!-- ============================ All Cources ================================== -->

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
                                    <img src="assets/img/logo-light.png" class="img-footer small mb-2" alt="">
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
                                            <input id="student" class="checkbox-custom" name="student" type="checkbox" checked="">
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

            <a id="back2Top" class="top-scroll" title="Back to top" href="#" style="display: inline;"><i class="ti-arrow-up"></i></a>


            <!-- Button trigger modal -->
        

            <!-- Modal -->
            <div class="modal fade" id="wantSubmit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <span>Do you want to submit</span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
                            <button onclick="finish()" type="button" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="expired" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <span>Time of quiz is expired</span>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script>
//            window.onload = function (e) {
//                var box = document.querySelector(".quizHandle");
//                box.scrollIntoView({behavior: "smooth"});
//            }

        </script>
        <script>
            function mark() {
                document.querySelector("#mark").submit();
            }


            var quesnum = '.q' + '${quesnum}'
            var quesbox = document.querySelector(quesnum);
            quesbox.style.backgroundColor = "white";

            function finish() {
                resetTime();
                document.getElementById('autoSubmit').submit();
                resetTime();
            }
            var duration = parseInt('${sessionScope.doingQuiz.duration}');

            function resetTime() {
                sessionStorage.clear();
            }
            var today = new Date();
            var minutesLabel = document.getElementById("min");
            var secondsLabel = document.getElementById("sec");
            var hoursLabel = document.getElementById("hour");
            var totalSecond = 0;

            var startMilisecond;
//
//            if (sessionStorage.getItem("time") != null) {
//                startMilisecond = sessionStorage.getItem("time");
//            } else {
//                startMilisecond = today.getTime();
//            }
//            sessionStorage.setItem('time', startMilisecond);



            startMilisecond = parseInt('${time}');



            function setTime() {
                var today2 = new Date();
                var presentMilisecond = today2.getTime();
                totalSecond = duration - ((presentMilisecond - startMilisecond) / 1000);
                displayTime();
            }

            setInterval(autoSubmit, 1000);
            function autoSubmit() {
                if (totalSecond <= 1) {
                    $("#expired").modal("show");
                    var delayInMilliseconds = 3000; //1 second

                    setTimeout(function () {
                        resetTime();
                        document.getElementById('autoSubmit').submit();
                        resetTime();
                    }, delayInMilliseconds);
                }
            }

            function pad(val) {
                var valString = val + "";
                if (valString.length < 2) {
                    return "0" + valString;
                } else {
                    return valString;
                }
            }
            setInterval(setTime, 100)

            function displayTime() {
                var totalMinute = (totalSecond / 60) % 60;
                var totalHour = totalSecond / 60 / 60;
                var totalSec = totalSecond % 60;
                secondsLabel.innerHTML = pad(parseInt(totalSec));
                minutesLabel.innerHTML = pad(parseInt(totalMinute));
                hoursLabel.innerHTML = pad(parseInt(totalHour));
                document.getElementById('time').value = Math.round(totalSecond);
            }
//            resetTime()



            function submitForm(ele) {
                var quesnum = parseInt(document.querySelector(".clickBtn").value);
                if (ele.innerText == "PREV") {
                    quesnum--;
                    document.querySelector(".clickBtn").value = quesnum;

                    document.querySelector("form").submit();
                } else {
                    quesnum++;
                    document.querySelector(".clickBtn").value = quesnum;

                    document.querySelector("form").submit();
                }

            }
        </script>
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


    </body></html>

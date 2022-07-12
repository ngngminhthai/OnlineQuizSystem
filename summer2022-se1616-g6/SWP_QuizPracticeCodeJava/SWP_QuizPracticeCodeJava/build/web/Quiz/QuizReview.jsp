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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
            integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
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
            .body{
                margin: 0px;
                box-sizing: border-box;
                padding: 0px;
                font-family: sans-serif;
            }
            .container{
                padding-top: 5px;
            }
            .quiz_header{
                align-items: center;
                height: 10vh;
                border-bottom:3px solid #b6b6b6;
                border-top: 3px solid #b6b6b6;
                position: relative;
                font-family: sans-serif;
            }
            .quiz_count{
                font-size: 40px;
                padding: 5px;
                margin-right:  15px;
                font-family: sans-serif;
            }
            .quiz_timer{
                background-color: #8598ff;
                font-size: 40px;
                padding: 5px;
                font-family: sans-serif;
                color: white;
            }
            .quiz_counter{
                position: absolute;
                right: 0px;

                height: 100%;
                display: flex;
                align-items: center;
                font-family: sans-serif;
            }
            .quiz_body{
                position: relative;

                font-family: sans-serif;
                min-height:  73vh;
            }
            .quiz_footer{

                height: 15vh;
                /*                background-color: #4ac358;*/
                font-family: sans-serif;
            }
            .question_number{
                display: flex;
                justify-content: space-between;
                background-color: #575757;
                color: white;
                height: fit-content;
                width: 100%;

                border-radius: 2px;
                font-size: 15px;
                padding: 10px;

                font-family: sans-serif;
            }
            .question_content{
                color: #6e6d6d;
                font-size: 17px;
                width: 95%;
                margin: 0 auto;
                margin-top: 23px;
                font-family: sans-serif;          
            }
            input{
                width: 20px;
                cursor: pointer;
            }
            label{
                cursor: pointer;
                -webkit-touch-callout: none; /* iOS Safari */
                -webkit-user-select: none; /* Safari */
                -khtml-user-select: none; /* Konqueror HTML */
                -moz-user-select: none; /* Old versions of Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                      supported by Chrome, Edge, Opera and Firefox */
            }
            .question_peeker{
                height: 60px;
                width: 95%;
                justify-content: flex-end;
            }
            .question_peeker .peak, .marked{

                min-height: fit-content;
            }


            .question_peeker div{
                text-align: center;
                align-self: center;
            }
            .back_btn{
                position: absolute;
                left: 0px;
            }
            /*            .prev{
                            border: 3px solid white;
                            height: 42px;
                            width: 129px;
                            align-self: center;
                            margin-left: 21px;
                            color: white;
                            border-radius: 5px;
                        }*/
            .button_container{
                width: 95%;
                margin: 0 auto;
                justify-content: space-between;
                height: 40%;
                align-self: center;
            }
            .button_container button{
                width: 13%;

                color: black;
            }
            .btncontainer button{
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

            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ All Cources ================================== -->
            <section class="gray" style="padding-top: 5px;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-md-12 order-lg-first">
                            <section style="    padding-top: 0px;">

                                <form class="quizHandle" action="QuizHandle" method="get">
                                    <div class="container" style="    max-width: 1500px;">

                                        <c:set var="alphabet" value="ABCDEFGHIJKLMNOPQRSTUVWXYZ" />

                                        <div class="row quiz_body">
                                            <div class="question_number">
                                                <span>Question: ${quesnum} / ${sessionScope.quizReview.getQ().size()}</span>
                                                <span>Question ID: ${ques.questionId}</span>
                                            </div>
                                            <div style="min-height: 180px;" class="question_content">
                                                ${ques.questionContent}
                                            </div>
                                            <div class="question_content question_answer">
                                                <c:forEach begin="0" end="${ques.answer.size()-1}" var="i">
                                                    <div class="answer">

                                                        <label>
                                                            <input <c:forEach items="${mark}" var="m">
                                                                    <c:if test="${ques.answer.get(i).answerId == m}">checked=""
                                                                        <c:set var="isMark" value="true" />
                                                                    </c:if>
                                                                </c:forEach>
                                                                name="markedAnswer" disabled="" type="checkbox" value="${ques.answer.get(i).answerId}">
                                                            <c:choose>
                                                                <c:when test="${correctAnswer.contains(ques.answer.get(i).answerId) && mark.contains(ques.answer.get(i).answerId)}">
                                                                    <span style="color: green; font-weight: bold;">${alphabet.charAt(i)}. ${ques.answer.get(i).answerContent}</span>
                                                                    <span style="color: green; font-weight: bold;">  &nbsp&nbsp  You selected correct answer </span>
                                                                </c:when>
                                                                <c:when test="${!correctAnswer.contains(ques.answer.get(i).answerId) && mark.contains(ques.answer.get(i).answerId)}">
                                                                    <span style="color: red; font-weight: bold;">${alphabet.charAt(i)}. ${ques.answer.get(i).answerContent}</span>
                                                                    <span style="color: red; font-weight: bold;">  &nbsp&nbsp  You should not have selected this </span>
                                                                </c:when>
                                                                <c:when test="${correctAnswer.contains(ques.answer.get(i).answerId) && !mark.contains(ques.answer.get(i).answerId)}">
                                                                    <span style="color: #b6b6b6; font-weight: bold;">${alphabet.charAt(i)}. ${ques.answer.get(i).answerContent}</span>
                                                                    <span style="color: #b6b6b6; font-weight: bold;">  &nbsp&nbsp  You should have selected this </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>${alphabet.charAt(i)}. ${ques.answer.get(i).answerContent}</span>
                                                                    
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </label>
                                                    </div>
                                                </c:forEach>


                                            </div>
                                            <div class="question_content question_peeker d-flex mb-3 position-relative">
                                                <body>

                                                    <div data-toggle="modal" data-target="#exampleModalCenterPeak" class="peak btn btn-primary" style="margin-right: 10px;">Peak at answer</div>


                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModalCenterPeak" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button  style="position: absolute;
                                                                             right: 9px; cursor: pointer;" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <form class="profileSubmit" method="POST" action="profile2" enctype="multipart/form-data" >
                                                                    <div class="modal-body" style="text-align: justify;">
                                                                        <h1>Explanation</h1>
                                                                        <c:forEach begin="0" end="${sessionScope.quizReview.getQ().get(quesnum-1).getCorrectAnswer().size()-1}" var="i">
                                                                            <div style="text-align: justify; font-weight: bold;"> ${alphabet.charAt(i)}. ${sessionScope.quizReview.getQ().get(quesnum-1).getCorrectAnswer().get(i).answerContent}</div> 
                                                                        </c:forEach>


                                                                        ${sessionScope.quizReview.getQ().get(quesnum-1).explanation}
                                                                    </div>
                                                                </form>


                                                                <div class="modal fade modal-second" id="modalChangePassword" tabindex="-1" role="dialog"
                                                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered modal-md" role="document">
                                                                        <div class="modal-content" style="background-color: lightgrey">
                                                                            <div class="modal-header text-center">

                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body mx-3">

                                                                            </div>
                                                                            <div class="modal-footer d-flex justify-content-center">
                                                                                <button class="btn btn-default" type="submit">Submit</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!--                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                                        <button type="button" class="btn btn-primary">Continue</button>
                                                                                    </div>-->
                                                            </div>

                                                        </div>
                                                    </div>
                                                </body>

                                                <!--                        <div class="peak btn btn-primary" style="margin-right: 10px;">Peak at answer</div>-->

                                                <div onclick="mark()" class="marked btn btn-success"><i class="fa-solid fa-bookmark"></i> Marked for Review</div>

                                            </div>
                                        </div>
                                        <div class="row quiz_footer">

                                            <!--                <button class="prev">
                                                                Previous
                                                            </div>
                                            
                                                            <div class="next">
                                                                Next
                                                            </div>
                                            
                                                            <div class="submit">
                                                                Submit
                                                            </div>-->

                                            <div class="button_container d-flex position-relative">
                                                <div class="btncontainer">
                                                    <c:if test="${quesnum > 1}"> <button style="color: white;" onclick="submitForm(this)" class="btn btn-danger"><i class="ti-angle-left"></i>PREV</button></c:if>

                                                    </div>



                                                    <div class="btncontainer">
                                                    <c:if test="${quesnum < sessionScope.quizReview.getQ().size()}"><button style="color: white;" onclick="submitForm(this)" class="btn btn-danger">NEXT<i class="ti-angle-right"></i></button>
                                                        </c:if>
                                                </div>


                                            </div>

                                            <input hidden="" name="oldQues" value="${quesnum}">
                                            <input hidden="" class="clickBtn" name="quesnum" value="${quesnum}">

                                            <input hidden="" name="type" value="review">
                                        </div>
                                    </div>
                                </form>
                                <form id="autoSubmit" action="submitquiz" method="post">
                                    <input hidden="" id="time" value="0">
                                </form>

                                <form id="mark" action="markques" method="get">
                                    <input hidden="" name="oldQues" value="${quesnum}">
                                    <input hidden="" class="clickBtn" name="quesnum" value="${quesnum}">
                                </form>


                            </section>
                        </div>
                        <div class="col-lg-2 col-md-12 order-lg-last quesbox" style="">
                            <div class="row d-flex">

                                <c:forEach begin="0" end="${sessionScope.quizReview.getQ().size()-1}" var="i">
                                    <div style="height: 50px; width: fit-content;">

                                        <a class="q${i+1}" href="QuizHandle?type=review&quesnum=${i+1}"> 
                                            <c:if test="${sessionScope.quizReview.getQ().get(i).marked == true}">
                                                <i class="fa-solid fa-bookmark"></i>
                                            </c:if>
                                            ${i+1}
                                        </a>
                                    </div>

                                </c:forEach>


                            </div>
                            <div class="row">
                                <div class="btncontainer">
                                    <div type="button" data-toggle="modal" data-target="#wantSubmit"  style="color: white;" class="btn btn-primary">Back to practice list</div>
                                </div>

                            </div>

                            <div class="row">
                                <p style="font-weight: bold; color: blue;">Question Result: 
                                    <c:choose>
                                        <c:when test="${requestScope.result == true}">
                                            <span style="color: green">Correct</span> 
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: red">Incorrect</span> 
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <!--                                <span style="
                                                                      position: relative;
                                                                      top: 2px;
                                                                      ">   <span id="hour"></span>:<span id="min"></span>:<span id="sec"></span></span>-->

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
                            <span>Do you want to end reviewing</span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
                            <button onclick="finish()" type="button" class="btn btn-primary">Confirm</button>
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
            function finish(){
                window.location.href = "practicelist?id=${sessionScope.user.userId}";
            }
            function mark() {
                document.querySelector("#mark").submit();
            }
            var quesnum = '.q' + '${quesnum}'
            var quesbox = document.querySelector(quesnum);
            quesbox.style.backgroundColor = "white";

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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Practice Details</title>

        <link rel="icon" href="" type="image/x-icon" />
        <link rel="stylesheet" href="css/PracticeDetail.css" type="text/css" />
        <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
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

        <!-- header start  -->
        <header>

            <!--            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <a href="#" class="navbar-brand">Brand<b>Name</b></a>
                            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                             Collection of nav links, forms, and other content for toggling 
                            <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
                                <div class="navbar-nav">
                                    <a href="#" class="nav-item nav-link">Home</a>
                                    <a href="#" class="nav-item nav-link">About</a>
                                    <div class="nav-item dropdown">
                                        <a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle">Services</a>
                                        <div class="dropdown-menu">
                                            <a href="#" class="dropdown-item">Web Design</a>
                                            <a href="#" class="dropdown-item">Web Development</a>
                                            <a href="#" class="dropdown-item">Graphic Design</a>
                                            <a href="#" class="dropdown-item">Digital Marketing</a>
                                        </div>
                                    </div>
                                    <a href="#" class="nav-item nav-link active">Pricing</a>
                                    <a href="#" class="nav-item nav-link">Blog</a>
                                    <a href="#" class="nav-item nav-link">Contact</a>
                                </div>
                                <form class="navbar-form form-inline">
                                    <div class="input-group search-box">
                                        <input type="text" id="search" class="form-control" placeholder="Search here...">
                                        <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="material-icons">&#xE8B6;</i>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                                <div class="navbar-nav ml-auto action-buttons">
                                    <div class="nav-item dropdown">
                                        <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle mr-4">Login</a>
                                        <div class="dropdown-menu action-form">
                                            <form action="/examples/actions/confirmation.php" method="post">
                                                <p class="hint-text">Sign in with your social media account</p>
                                                <div class="form-group social-btn clearfix">
                                                    <a href="#" class="btn btn-secondary facebook-btn float-left"><i
                                                            class="fa fa-facebook"></i> Facebook</a>
                                                    <a href="#" class="btn btn-secondary twitter-btn float-right"><i
                                                            class="fa fa-twitter"></i> Twitter</a>
                                                </div>
                                                <div class="or-seperator"><b>or</b></div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Username"
                                                        required="required">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control" placeholder="Password"
                                                        required="required">
                                                </div>
                                                <input type="submit" class="btn btn-primary btn-block" value="Login">
                                                <div class="text-center mt-2">
                                                    <a href="#">Forgot Your password?</a>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="nav-item dropdown">
                                        <a href="#" data-toggle="dropdown" class="btn btn-primary dropdown-toggle sign-up-btn">Sign
                                            up</a>
                                        <div class="dropdown-menu action-form">
                                            <form action="/examples/actions/confirmation.php" method="post">
                                                <p class="hint-text">Fill in this form to create your account!</p>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Username"
                                                        required="required">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control" placeholder="Password"
                                                        required="required">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" class="form-control" placeholder="Confirm Password"
                                                        required="required">
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-check-label"><input type="checkbox" required="required"> I
                                                        accept the <a href="#">Terms &amp; Conditions</a></label>
                                                </div>
                                                <input type="submit" class="btn btn-primary btn-block" value="Sign up">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </nav>-->

            <%@include file="template/header.jsp"%>
        </header>
        <!-- header end  -->

        <div class="sheet" style="margin-bottom: 50px">
            <!-- title start  -->
            <div class="practice-title">
                <h1>Practice List</h1>
            </div>
            <div class="practice-underline">
            </div>
            <!-- title end  -->

            <!-- Subject start -->
            <div class="practice-subject">
                <h3>Subject name</h3>
                <select name="" id="" class="detail">
                    <option value="">${subbyquiz.subjectName}</option>
                </select>
            </div>
            <!-- Subject end -->

            <div class="practice-subject">
                <h3>Exam Name</h3>
                <input type="text" class="detail" value="${quizByID.getQuizName()}" readonly="readonly">
            </div>


            <!-- Number ques start -->
            <div class="practice-subject">
                <h3>Number of practicing questions</h3>
                <input type="text" class="detail" value="${quizByID.numberOfQuestion}" readonly="readonly">
            </div>
            <!-- Number ques end -->

            <!-- Question topics start -->
            <div class="practice-subject">
                <h3>Questions are selected by topic(s) or a specific dimension</h3>
                <select name="" id="" class="detail">
                    <!--<option value="">By subject topics</option>-->
                    <option value="" readonly="readonly">${dimenbysub.dimensionName}</option>
                </select>
            </div>
            <!-- Question topics end -->

            <!-- Question group start -->
            <div class="practice-subject">
                <h3>Question group (choose one or all topic/dimension(s)</h3>
                <select name="" id="" class="detail">
                    <option value="" readonly="readonly">${dimentypebydime.typeName}</option>
                </select>
            </div>
            <!-- Question group end -->
            <button class="confirm">Practice</button>

            <!-- footer start -->
        </div>

        <footer id="Contact">
            <div class="footer-area primary-bg pt-150">
                <div class="container">
                    <div class="footer-top pb-35">
                        <div class="row">
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="footer-widget mb-30">
                                    <div class="footer-logo">
                                        <img src="img/logo/logo_2.png" alt="">
                                    </div>
                                    <div class="footer-para">
                                        <p>Sorem ipsum dolor sit amet conse ctetur adipiscing elit, sed do eiusmod incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercition ullamco laboris nisi </p>
                                    </div>
                                    <div class="footer-socila-icon">
                                        <span>Follow Us</span>
                                        <div class="footer-social-icon-list">
                                            <ul>
                                                <li><a href="#"><span class="ti-facebook"></span></a></li>
                                                <li><a href="#"><span class="ti-twitter-alt"></span></a></li>
                                                <li><a href="#"><span class="ti-dribbble"></span></a></li>
                                                <li><a href="#"><span class="ti-google"></span></a></li>
                                                <li><a href="#"><span class="ti-pinterest"></span></a></li>
                                                <li><a href="#"><span class="ti-instagram"></span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="footer-widget mb-30">
                                    <div class="footer-heading">
                                        <h1>Quick Links</h1>
                                    </div>
                                    <div class="footer-menu clearfix">
                                        <ul>
                                            <li><a href="#">Privacy Policy</a></li>
                                            <li><a href="#">Condition</a></li>
                                            <li><a href="#">Support</a></li>
                                            <li><a href="#">Consultation</a></li>
                                            <li><a href="#">Team Member</a></li>
                                            <li><a href="#">Our Services</a></li>
                                            <li><a href="#">About Us</a></li>
                                            <li><a href="#">Contact Us</a></li>
                                            <li><a href="#">Who we are</a></li>
                                            <li><a href="#">Get a Quote</a></li>
                                            <li><a href="#">Recent Post</a></li>
                                            <li><a href="#">Who we are</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
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
    </body>

</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <%@include  file="template/header_new.jsp"%>
            <!-- End Navigation -->
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Page Title Start================================== -->
            <div class="ed_detail_head">
                <div class="container">
                    <div class="row align-items-center justify-content-between mb-2">

                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div class="dlkio_452">
                                <div class="ed_detail_wrap">
                                    <div class="crs_cates cl_1"><span>Category</span></div><div class="crs_cates cl_3"><span>${subject.category.catName} </span></div>
                                    <div class="ed_header_caption">
                                        <h2 class="ed_title">${subject.subjectName}</h2>
                                    </div>
                                    <div class="d-flex align-items-center mt-4">
                                        <div class="rounded-circle d-flex align-items-center justify-content-center">
                                            <img src="${pageContext.request.contextPath}/img/logo/${expert.get(0).img}" class="img-fluid circle" width="70" alt="" />
                                        </div>
                                        <div class="ml-2 ml-md-3">
                                            <span>Created By</span>
                                            <h6 class="m-0">${expert.get(0).expertName}</h6>
                                        </div>
                                    </div>

                                </div>
                            </div>	
                        </div>

                        <!--                        <div class="col-xl-4 col-lg-5 col-md-5 col-sm-12">
                                                    <ul class="row p-0">
                                                        <li class="col-lg-6 col-md-6 col-sm-6 pt-2 pb-2"><i class="fas fa-star mr-1 text-warning"></i><span>4.9 Star (5,254)</span></li>
                                                        <li class="col-lg-6 col-md-6 col-sm-6 pt-2 pb-2"><i class="fas fa-clock mr-1 text-success"></i><span>4 Hour 47 min</span></li>
                                                        <li class="col-lg-6 col-md-6 col-sm-6 pt-2 pb-2"><i class="fas fa-user mr-1 text-info"></i><span>2,54,740 Enrolled</span></li>
                                                        <li class="col-lg-6 col-md-6 col-sm-6 pt-2 pb-2"><i class="fas fa-video mr-1 text-danger"></i><span>47 Lectures</span></li>
                                                    </ul>
                                                </div>-->

                    </div>
                </div>
            </div>
            <!-- ============================ Page Title End ================================== -->

            <!-- ============================ Course Detail ================================== -->
            <section class="gray pt-5">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 col-md-12 order-lg-first">

                            <div class="property_video radius lg mb-4">
                                <div class="thumb">
                                    <img class="pro_img img-fluid w100" src="${subject.thumbnailURL}" alt="7.jpg">
                                    <div class="overlay_icon">

                                    </div>
                                </div>
                            </div>

                            <!-- All Info Show in Tab -->
                            <div class="tab_box_info mt-4">
                                <ul style="position: relative;" class="nav nav-pills mb-3 light" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="overview-tab" data-toggle="pill" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="curriculum-tab" data-toggle="pill" href="#curriculum" role="tab" aria-controls="curriculum" aria-selected="false">Curriculum</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="instructors-tab" data-toggle="pill" href="#instructors" role="tab" aria-controls="instructors" aria-selected="false">Instructor</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="reviews-tab" data-toggle="pill" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
                                    </li>
                                    <li class="nav-item" style="    position: absolute;
                                        right: 0px;">
                                        <%@include file="pricingplan.jsp" %>
                                    </li>
                                </ul>

                                <div class="tab-content" id="pills-tabContent">

                                    <!-- Overview Detail -->
                                    <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                                        <!-- Overview -->
                                        <div class="edu_wraper">
                                            <h4 class="edu_title">Course Overview</h4>
                                            <p>${subject.description}</p>
                                        </div>

                                        <!--                                        <div class="edu_wraper">
                                                                                    <h4 class="edu_title">Certification</h4>
                                                                                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>		
                                                                                    <p>Aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto. Sam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
                                                                                </div>-->

                                        <!-- Overview -->
                                        <!--                                        <div class="edu_wraper">
                                                                                    <h4 class="edu_title">What you'll learn</h4>
                                                                                    <ul class="lists-3 row">
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                        <li class="col-xl-4 col-lg-6 col-md-6 m-0">At vero eos et accusamus</li>
                                                                                    </ul>
                                                                                </div>-->
                                    </div>

                                    <!-- Curriculum Detail -->
                                    <div class="tab-pane fade" id="curriculum" role="tabpanel" aria-labelledby="curriculum-tab">
                                        <div class="edu_wraper">
                                            <h4 class="edu_title">Course Circullum</h4>
                                            <div id="accordionExample" class="accordion shadow circullum">

                                                <c:forEach items="${subject.lesson}" var="l">

                                                    ${l.lessonName} <br>

                                                </c:forEach>

                                                <!--                                                                                                 Part 1 
                                                                                                                                                <div class="card">
                                                                                                                                                    <div id="headingOne" class="card-header bg-white shadow-sm border-0">
                                                                                                                                                        <h6 class="mb-0 accordion_title"><a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="d-block position-relative text-dark collapsible-link py-2">Part 01: How To Learn Web Designing Step by Step</a></h6>
                                                                                                                                                    </div>
                                                                                                                                                    <div id="collapseOne" aria-labelledby="headingOne" data-parent="#accordionExample" class="collapse show">
                                                                                                                                                        <div class="card-body pl-3 pr-3">
                                                                                                                                                            <ul class="lectures_lists">
                                                                                                                                                                <li class="complete"><div class="lectures_lists_title"><i class="fas fa-check dios"></i></div>Web Designing Beginner<span class="cls_timing">40:20</span></li>
                                                                                                                                                                <li class="progressing"><div class="lectures_lists_title"><i class="fas fa-play dios"></i></div>Startup Designing with HTML5 & CSS3<span class="cls_timing">20:12</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To Call Google Map iFrame<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>Create Drop Down Navigation Using CSS3<span class="cls_timing">25:05</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to Create Sticky Navigation Using JS<span class="cls_timing">18:10</span></li>
                                                                                                                                                            </ul>
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                
                                                                                                                                                 Part 2 
                                                                                                                                                <div class="card">
                                                                                                                                                    <div id="headingTwo" class="card-header bg-white shadow-sm border-0">
                                                                                                                                                        <h6 class="mb-0 accordion_title"><a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="d-block position-relative collapsed text-dark collapsible-link py-2">Part 02: Learn Web Designing in Basic Level</a></h6>
                                                                                                                                                    </div>
                                                                                                                                                    <div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordionExample" class="collapse">
                                                                                                                                                        <div class="card-body pl-3 pr-3">
                                                                                                                                                            <ul class="lectures_lists">
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To Call Google Map iFrame<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To embed video in html5 banner?<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to use SVG card in html5?<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>Create Drop Down Navigation Using CSS3<span class="cls_timing">25:05</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to Create Sticky Navigation Using JS<span class="cls_timing">18:10</span></li>
                                                                                                                                                            </ul>
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                
                                                                                                                                                 Part 3 
                                                                                                                                                <div class="card">
                                                                                                                                                    <div id="headingThree" class="card-header bg-white shadow-sm border-0">
                                                                                                                                                        <h6 class="mb-0 accordion_title"><a href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="d-block position-relative collapsed text-dark collapsible-link py-2">Part 03: Learn Web Designing in Advance Level</a></h6>
                                                                                                                                                    </div>
                                                                                                                                                    <div id="collapseThree" aria-labelledby="headingThree" data-parent="#accordionExample" class="collapse">
                                                                                                                                                        <div class="card-body pl-3 pr-3">
                                                                                                                                                            <ul class="lectures_lists">
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To Call Google Map iFrame<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To embed video in html5 banner?<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to use SVG card in html5?<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>Create Drop Down Navigation Using CSS3<span class="cls_timing">25:05</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to Create Sticky Navigation Using JS<span class="cls_timing">18:10</span></li>
                                                                                                                                                            </ul>
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>
                                                                                                
                                                                                                                                                 Part 04 
                                                                                                                                                <div class="card">
                                                                                                                                                    <div id="headingFour" class="card-header bg-white shadow-sm border-0">
                                                                                                                                                        <h6 class="mb-0 accordion_title"><a href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="d-block position-relative collapsed text-dark collapsible-link py-2">Part 04: How To Become Succes in Designing & Development?</a></h6>
                                                                                                                                                    </div>
                                                                                                                                                    <div id="collapseFour" aria-labelledby="headingFour" data-parent="#accordionExample" class="collapse">
                                                                                                                                                        <div class="card-body pl-3 pr-3">
                                                                                                                                                            <ul class="lectures_lists">
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To Call Google Map iFrame<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How To embed video in html5 banner?<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to use SVG card in html5?<span class="cls_timing">32:10</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>Create Drop Down Navigation Using CSS3<span class="cls_timing">25:05</span></li>
                                                                                                                                                                <li class="unview"><div class="lectures_lists_title"><i class="fa fa-lock dios lock"></i></div>How to Create Sticky Navigation Using JS<span class="cls_timing">18:10</span></li>
                                                                                                                                                            </ul>
                                                                                                                                                        </div>
                                                                                                                                                    </div>
                                                                                                                                                </div>-->

                                            </div>
                                        </div>
                                    </div>

                                    <!-- Instructor Detail -->
                                    <div class="tab-pane fade" id="instructors" role="tabpanel" aria-labelledby="instructors-tab">
                                        <c:forEach items="${expert}" var="e">
                                            <div class="single_instructor">
                                                <div class="single_instructor_thumb">
                                                    <a href="#"><img src="${pageContext.request.contextPath}/img/logo/${e.img}" class="img-fluid" alt=""></a>
                                                </div>
                                                <div class="single_instructor_caption">
                                                    <h4><a href="#">${e.expertName}</a></h4>
                                                    <ul class="instructor_info">
                                                        <!--                                                        <li><i class="ti-video-camera"></i>72 Videos</li>
                                                                                                                <li><i class="ti-control-forward"></i>102 Lectures</li>
                                                                                                                <li><i class="ti-user"></i>Exp. 4 Year</li>-->
                                                    </ul>
                                                    <p>My Favourite is nothing</p>
                                                    <ul class="social_info">
                                                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                                                        <li><a href="#"><i class="ti-twitter"></i></a></li>
                                                        <li><a href="#"><i class="ti-linkedin"></i></a></li>
                                                        <li><a href="#"><i class="ti-instagram"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </c:forEach>



                                    </div>

                                    <!-- Reviews Detail -->
                                    <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">

                                        <!-- Overall Reviews -->
                                        <!--                                        <div class="rating-overview">
                                                                                    <div class="rating-overview-box">
                                                                                        <span class="rating-overview-box-total">4.2</span>
                                                                                        <span class="rating-overview-box-percent">out of 5.0</span>
                                                                                        <div class="star-rating" data-rating="5"><i class="ti-star"></i><i class="ti-star"></i><i class="ti-star"></i><i class="ti-star"></i><i class="ti-star"></i>
                                                                                        </div>
                                                                                    </div>
                                        
                                                                                    <div class="rating-bars">
                                                                                        <div class="rating-bars-item">
                                                                                            <span class="rating-bars-name">5 Star</span>
                                                                                            <span class="rating-bars-inner">
                                                                                                <span class="rating-bars-rating high" data-rating="4.7">
                                                                                                    <span class="rating-bars-rating-inner" style="width: 85%;"></span>
                                                                                                </span>
                                                                                                <strong>85%</strong>
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="rating-bars-item">
                                                                                            <span class="rating-bars-name">4 Star</span>
                                                                                            <span class="rating-bars-inner">
                                                                                                <span class="rating-bars-rating good" data-rating="3.9">
                                                                                                    <span class="rating-bars-rating-inner" style="width: 75%;"></span>
                                                                                                </span>
                                                                                                <strong>75%</strong>
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="rating-bars-item">
                                                                                            <span class="rating-bars-name">3 Star</span>
                                                                                            <span class="rating-bars-inner">
                                                                                                <span class="rating-bars-rating mid" data-rating="3.2">
                                                                                                    <span class="rating-bars-rating-inner" style="width: 52.2%;"></span>
                                                                                                </span>
                                                                                                <strong>53%</strong>
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="rating-bars-item">
                                                                                            <span class="rating-bars-name">1 Star</span>
                                                                                            <span class="rating-bars-inner">
                                                                                                <span class="rating-bars-rating poor" data-rating="2.0">
                                                                                                    <span class="rating-bars-rating-inner" style="width:20%;"></span>
                                                                                                </span>
                                                                                                <strong>20%</strong>
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>-->

                                        <!-- Reviews -->
                                        <div class="list-single-main-item fl-wrap">
                                            <!--                                            <div class="list-single-main-item-title fl-wrap">
                                                                                            <h3>Item Reviews -  <span> 3 </span></h3>
                                                                                        </div>-->
                                            <div class="reviews-comments-wrap">
                                                <c:forEach items="${subject.feedBack}" var="f">
                                                    <!-- reviews-comments-item -->  
                                                    <div class="reviews-comments-item">
                                                        <div class="review-comments-avatar">
                                                            <img src="${pageContext.request.contextPath}/img/logo/${f.img}" class="img-fluid" alt=""> 
                                                        </div>
                                                        <div class="reviews-comments-item-text">
                                                            <h4><a href="#">${f.fullName}</a><span class="reviews-comments-item-date"></span></h4>

                                                            <div class="listing-rating"><i class="fas fa-star active"></i><i class="fas fa-star active"></i><i class="fas fa-star active"></i><i class="fas fa-star active"></i><i class="fas fa-star active"></i></div>
                                                            <div class="clearfix"></div>
                                                            <p>" ${f.content} "</p>
                                                            <!--                                                            <div class="pull-left reviews-reaction">
                                                                                                                            <a href="#" class="comment-like active"><i class="ti-thumb-up"></i> 12</a>
                                                                                                                            <a href="#" class="comment-dislike active"><i class="ti-thumb-down"></i> 1</a>
                                                                                                                            <a href="#" class="comment-love active"><i class="ti-heart"></i> 07</a>
                                                                                                                        </div>-->
                                                        </div>
                                                    </div>
                                                    <!--reviews-comments-item end-->  

                                                </c:forEach>


                                            </div>
                                        </div>

                                        <!-- Submit Reviews -->
                                        <!--                                        <div class="edu_wraper">
                                                                                    <h4 class="edu_title">Submit Reviews</h4>
                                                                                    <div class="review-form-box form-submit">
                                                                                        <form>
                                                                                            <div class="row">
                                        
                                                                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                                                                    <div class="form-group">
                                                                                                        <label>Name</label>
                                                                                                        <input class="form-control" type="text" placeholder="Your Name">
                                                                                                    </div>
                                                                                                </div>
                                        
                                                                                                <div class="col-lg-6 col-md-6 col-sm-12">
                                                                                                    <div class="form-group">
                                                                                                        <label>Email</label>
                                                                                                        <input class="form-control" type="email" placeholder="Your Email">
                                                                                                    </div>
                                                                                                </div>
                                        
                                                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                                                    <div class="form-group">
                                                                                                        <label>Review</label>
                                                                                                        <textarea class="form-control ht-140" placeholder="Review"></textarea>
                                                                                                    </div>
                                                                                                </div>
                                        
                                                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                                                    <div class="form-group">
                                                                                                        <button type="submit" class="btn theme-bg btn-md">Submit Review</button>
                                                                                                    </div>
                                                                                                </div>
                                        
                                                                                            </div>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>-->

                                    </div>

                                </div>

                                <% if (u == null || !d.isRegistrated(s.getSubjectId(), u.getUserId())) {%>

                                <%} else {%>
                                <div style="display: flex; flex-direction: column;">
                                    <button type="button" <a href="#" class="btn theme-bg rounded full-width">
                                            Go To Course<i class="ti-angle-right"></i>
                                    </button>
                                </div>
                                <%}%>
                                <div>

                                </div>
                            </div>

                        </div>

                        <!-- Sidebar -->
                        <div class="col-lg-4 col-md-12 order-lg-last">

                            <%@include file="template/SubjectSideBar.jsp" %>

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
                                            <input id="student" class="checkbox-custom" name="student" type="checkbox" checked>
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

            <a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script>
            window.onload = function (e) {
                window.screenY(200);
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
        <%@include file="RegistrationForm.jsp" %>
    </body>
</html>
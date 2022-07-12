<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>SkillUp - Online Learning Platform</title>

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.css">
    </head>

    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <%@include file="template/header_new.jsp" %>
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <div class="dashboard-navbar">
                                <div class="d-user-avater">
                                    <img src="https://via.placeholder.com/500x500" class="img-fluid avater" alt="">
                                    <h4>Adam Harshvardhan</h4>
                                    <span>Senior Designer</span>
                                    <div class="elso_syu77">
                                        <div class="one_third"><div class="one_45ic text-warning bg-light-warning"><i class="fas fa-star"></i></div><span>Ratings</span></div>
                                        <div class="one_third"><div class="one_45ic text-success bg-light-success"><i class="fas fa-file-invoice"></i></div><span>Courses</span></div>
                                        <div class="one_third"><div class="one_45ic text-purple bg-light-purple"><i class="fas fa-user"></i></div><span>Enrolled User</span></div>
                                    </div>
                                </div>

                                <div class="d-navigation">
                                    <ul id="side-menu">
                                        <li class="active"><a href="dashboard.html"><i class="fas fa-th"></i>Dashboard</a></li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-shopping-basket"></i>Subjects<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="#">Manage Subjects</a></li>
                                                <li><a href="#">Add New Subjects</a></li>
                                                <li><a href="#">Subjects Details</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-gem"></i>Dimension<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="subjectdimension">Dimension Manage</a></li>
                                                <li><a href="dimensionadd">Add New Dimension</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-archive"></i>Report<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="admin-revenue.html">Admin Revenue</a></li>
                                                <li><a href="instructor-revenue.html">Instructor Revenue</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-user-shield"></i>Admins<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="manage-admins.html">Manage Admins</a></li>
                                                <li><a href="add-admin.html">Add New Admins</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-toolbox"></i>Instructors<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="manage-instructor.html">Manage Instructors</a></li>
                                                <li><a href="add-instructor.html">Add New Instructors</a></li>
                                                <li><a href="instructor-payout.html">Instructors Payouts</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-user"></i>Students<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="manage-students.html">Manage Students</a></li>
                                                <li><a href="add-students.html">Add New Student</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="addon-manager.html"><i class="fas fa-layer-group"></i>Addon</a></li>
                                        <li><a href="themes.html"><i class="fas fa-paint-brush"></i>Themes</a></li>
                                        <li><a href="messages.html"><i class="fas fa-comments"></i>Message</a></li>
                                        <li><a href="my-profile.html"><i class="fas fa-address-card"></i>My Profile</a></li>
                                        <li class="dropdown">
                                            <a href="javascript:void(0);"><i class="fas fa-cog"></i>Settings<span class="ti-angle-left"></span></a>
                                            <ul class="nav nav-second-level">
                                                <li><a href="website-settings.html">Website Settings</a></li>
                                                <li><a href="system-settings.html">System Settings</a></li>
                                                <li><a href="payment_settings.html">Payment Settings</a></li>
                                                <li><a href="social-login.html">Social Logins</a></li>
                                                <li><a href="smtp-setting.html">SMTP Settings</a></li>
                                                <li><a href="dash-about.html">About App</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                            </div>

                        </div>


                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Add New Dimension</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">

                                        <div class="form_blocs_wrap">
                                            <form id="create" action="dimensionadd" method="post">
                                                <div class="row justify-content-between">

                                                    <div class="col-xl-3 col-lg-4 col-md-5 col-sm-12">
                                                        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                                            <button class="nav-link active" id="v-pills-basic-tab" data-toggle="pill" data-target="#v-pills-basic" type="button" role="tab" aria-controls="v-pills-basic" aria-selected="true">Information</button>
                                                            <!--<input class="nav-link" type="submit" value="Finish">-->
                                                            <input type="submit" class="nav-link" id="sweet2" value="Finish">
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-9 col-lg-8 col-md-7 col-sm-12">

                                                        <div class="tab-content" id="v-pills-tabContent">
                                                            <!-- Basic -->
                                                            <div class="tab-pane fade show active" id="v-pills-basic" role="tabpanel" aria-labelledby="v-pills-basic-tab">
                                                                <input type="hidden" name="id" value="${id}" />
                                                                <div class="form-group smalls">
                                                                    <label>Dimension Name</label>
                                                                    <input name="name" type="text" class="form-control" value="">
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Description</label>
                                                                    <textarea name="descrip" class="summernote"></textarea>
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Type</label>
                                                                    <div class="simple-input">
                                                                        <select name="type" class="form-control">
                                                                            <c:forEach items="${listType}" var="type">
                                                                                <option value="${type.typeId}" >${type.typeName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group smalls">
                                                                    <label>Subject</label>
                                                                    <div class="simple-input">
                                                                        <select name="subject" class="form-control">
                                                                            <c:forEach items="${listSubject}" var="subject">
                                                                                <option value="${subject.subjectId}" >${subject.subjectName}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- finish -->
                                                            <!--                                                        <div class="tab-pane fade" id="v-pills-finish" role="tabpanel" aria-labelledby="v-pills-finish-tab">
                                                                                                                        <div class="succ_wrap">
                                                                                                                            <div class="succ_121"><i class="fas fa-thumbs-up"></i></div>
                                                                                                                            <div class="succ_122">
                                                                                                                                <h4>Update Successfully</h4>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>-->
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- ============================ Dashboard: Dashboard End ================================== -->


            <!-- ============================ Footer Start ================================== -->
            <%@include file="template/footer_new.jsp" %>>


        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.js"></script>
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
        <script>
                    document.getElementById("sweet2").addEventListener('click', (event) => {
                        event.preventDefault();
                        Swal.fire({
                            icon: 'success',
                            title: 'Create Successfully',
//                            footer: '<a href="">Why do I have this issue?</a>'
                          }).then(function(){
                                document.getElementById("create").submit();
                          });                          
                    });
        </script>

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->		

    </body>
</html>
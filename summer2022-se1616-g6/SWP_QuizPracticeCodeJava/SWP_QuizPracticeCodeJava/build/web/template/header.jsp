<%-- 
    Document   : header
    Created on : May 31, 2022, 4:35:01 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="home" class="navbar-brand"><b>Quizzy</b></a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Collection of nav links, forms, and other content for toggling -->
    <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
        <div class="navbar-nav">
            <a href="home" class="nav-item nav-link">Home</a>
            <a href="#about" class="nav-item nav-link">About</a>
            <a href="PublicSubjectList" class="nav-item nav-link active">Subject</a>
            <a href="blog" class="nav-item nav-link">Blog</a>
            <a href="#Contact" class="nav-item nav-link">Contact</a>
            <c:if test="${sessionScope.user != null}">
                <div class="nav-item dropdown">
                    <a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle">List</a>
                    <div class="dropdown-menu">
                        <c:if test="${sessionScope.user != null}">
                            <a href="practicelist?id=${sessionScope.user.userId}&subjectID=-1" class="dropdown-item">Practice List</a>
                        </c:if>
                        <a href="registration?search=&page=1&name=regId&type=ASC&subName=&status=&from=&to=" class="dropdown-item">Registration List</a>
                        <a href="postlist" class="dropdown-item">Post List</a>
                         <a href="sliderlist?keyword=&page=1&status=" class="dropdown-item">Slider List</a>
                    </div>
                </div>
            </c:if>


        </div>
        <form class="navbar-form form-inline">
            <div class="input-group search-box">
                <input type="text" id="search" class="form-control" placeholder="Search here...">
                <!--                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="material-icons">&#xE8B6;</i>
                                    </span>
                                </div>-->
            </div>
        </form>
        <div class="navbar-nav ml-auto action-buttons">
            <!-- Login modal -->
            <div class="nav-item dropdown">
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <div style="display:flex">
                            <div style="justify-content: flex-start">
                                <p>${sessionScope.user.fullName}</p>
                            </div>
                            <%@include file="../userprofile.jsp" %>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${sessionScope.user != null}">
                            <a href="login"><button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                                                    data-target="#modalLoginForm" style="margin-right: 10px">Login</button></a>
                            </c:if>
                        <button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                                data-target="#modalLoginForm" style="margin-right: 10px">Login</button>
                        <form action="login" method="POST">
                            <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h3 class="modal-title w-100 font-weight-bold">Login</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body mx-3">
                                            <div class="md-form mb-5">
                                                <p class="text-danger" role="alert">${mess}</p>
                                                <input style="width:386px; margin-left: 13px;margin-top: 30px" type="text"
                                                       id="defaultForm-email" class="form-control validate"
                                                       placeholder="email" name="email" required >
                                            </div>
                                            <div class="md-form mb-4">
                                                <input style="width:386px; margin-left: 13px;margin-top: -34px;margin-bottom: 20px;" type="password"
                                                       id="defaultForm-pass" class="form-control validate"
                                                       placeholder="password" name="password" required>
                                            </div>
                                            <div class="md-form mb-4">
                                                <input style="margin-left:15px" type="checkbox" placeholder="Password" name="remember"> Remember me
                                            </div>
                                            <div>
                                                <a href="forgetPassword"><u style="font-style:italic">Forget password</u></a>
                                                <a href="#" data-toggle="modal" data-target="#modalRegisterForm"><u
                                                        style="font-style:italic;margin-left: 58px;">Don't have an
                                                        account</u></a>
                                            </div>
                                        </div>
                                        <div class="modal-footer d-flex justify-content-center">
                                            <button class="btn btn-default" type="submit">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>

            </div>

            <!-- sign up modal -->
            <div class="nav-item dropdown">
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <a href="logout"><button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                                                 data-target="#modalRegisterForm">Log out</button></a>
                        </c:when>
                        <c:otherwise>
                        <button type="button" class="btn btn-primary dropdown-toggle login-up-btn" data-toggle="modal"
                                data-target="#modalRegisterForm">Sign up</button>
                        <form action="signup" method="POST">
                            <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">     
                                            <h3 class="modal-title w-100 font-weight-bold">Sign Up</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div style="padding-top:30px;" class="modal-body mx-3">
                                            <div class="md-form mb-5">
                                                <input
                                                    style="width:386px; margin-left: 13px;margin-top: 0px;margin-bottom: -30px;"
                                                    type="text" id="defaultForm-email" class="form-control validate"
                                                    placeholder="Full name" name="fullname" required>
                                            </div>
                                            <div class="md-form mb-4">
                                                <input style="margin-left: 15px;" type="radio" name="gender"
                                                       checked="checked" value="1" required>Male
                                                <input style="margin-left: 20px;" type="radio" name="gender"
                                                       value="0" required>Female
                                            </div>
                                            <div class="md-form mb-4">
                                                <input
                                                    style="width:386px; margin-left: 13px;margin-top: -8px;margin-bottom: -15px"
                                                    type="text" id="defaultForm-pass" class="form-control validate"
                                                    placeholder="Email" name="email" required>
                                            </div>
                                            <div class="md-form mb-4">
                                                <input
                                                    style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                                    type="text" id="defaultForm-pass" class="form-control validate"
                                                    placeholder="Phone" name="phone" required>
                                            </div>
                                            <div class="md-form mb-4">
                                                <input
                                                    style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                                    type="text" id="defaultForm-pass" class="form-control validate"
                                                    placeholder="Username" name="username" required>
                                            </div>
                                            <div class="md-form mb-4">
                                                <input
                                                    style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                                    type="password" id="defaultForm-pass" class="form-control validate"
                                                    placeholder="Password" name="password" required>
                                            </div>
                                            <div class="md-form mb-4">
                                                <input
                                                    style="width:386px; margin-left: 13px;margin-top: 40px;margin-bottom: -15px"
                                                    type="password" id="defaultForm-pass" class="form-control validate"
                                                    placeholder="Confirm password" name="confirmPass" required>
                                            </div>
                                        </div>
                                        <div class="modal-footer d-flex justify-content-center">
                                            <button class="btn btn-default" type="submit" id="sweet">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>


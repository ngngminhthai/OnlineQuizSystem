<%-- 
    Document   : userprofile
    Created on : May 30, 2022, 5:56:29 PM
    Author     : Admin
--%>

<%@page import="Models.User"%>
<%@page import="DAL.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.4/dist/sweetalert2.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body{
                font-family: 'Poppins', sans-serif;
                background-color: aliceblue;
            }

            .wrapper{
                padding: 30px 50px;
                border: 1px solid #ddd;
                border-radius: 15px;
                margin: 10px auto;
                max-width: 600px;
            }
            h4{
                letter-spacing: -1px;
                font-weight: 400;
            }
            .img{
                width: 70px;
                height: 70px;
                border-radius: 6px;
                object-fit: cover;
            }
            #img-section p,#deactivate p{
                font-size: 12px;
                color: #777;
                margin-bottom: 10px;
                text-align: justify;
            }
            #img-section b,#img-section button,#deactivate b{
                font-size: 14px; 
            }

            label{
                margin-bottom: 0;
                font-size: 14px;
                font-weight: 500;
                color: #777;
                padding-left: 3px;
            }

            .form-control{
                border-radius: 10px;
            }

            input[placeholder]{
                font-weight: 500;
            }
            .form-control:focus{
                box-shadow: none;
                border: 1.5px solid #0779e4;
            }
            select{
                display: block;
                width: 100%;
                border: 1px solid #ddd;
                border-radius: 10px;
                height: 40px;
                padding: 5px 10px;
                /* -webkit-appearance: none; */
            }

            select:focus{
                outline: none;
            }


            .danger{
                background-color: #fff;
                color: #e20404;
                border: 1px solid #ddd;
            }
            .danger:hover{
                background-color: #e20404;
                color: #fff;
            }
            @media(max-width:576px){
                .wrapper{
                    padding: 25px 20px;
                }
                #deactivate{
                    line-height: 18px;
                }
            }
            .warning{
                color: red;
            }
            .modal-second {
                z-index: 1052;
            }

            .modal-backdrop.fade {
                & + .modal-backdrop.fade {
                    z-index: 1051;
                }
            }

        </style>
    </head>
    <body>
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                    Enroll Now
                </button>-->
 
 
        <div style="display: none;" class="avatar avatar-xl" data-toggle="modal" data-target="#regisForm" style="justify-content: flex-end;margin-left: 10px">
            <img style="width: 50px;height: 50px" src="${pageContext.request.contextPath}/upload/}" alt=""/>
        </div>
   
    
    <!-- Modal -->
    <div class="modal fade" id="regisForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Registration Form</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="profileSubmit" method="POST" action="profile2" enctype="multipart/form-data" >
                    <div class="modal-body">
                        <div class="wrapper bg-white mt-sm-5">
                            <h4 class="pb-4 border-bottom">Registration Form</h4>
                           
                            <div class="py-2">
                                <div class="row py-2">
                                    <div class="col-md-6">
                                        <label for="firstname">Name</label>
                                        <input type="text" class="bg-light form-control fullName" placeholder="" value="" name="name">
                                        <div style="display: none;" class="warning warning_name bg-light">Name is empty</div>
                                    </div>


                                    <div class="col-md-6 pt-md-0 pt-3">
                                        <label for="gender" style="display: block;">Gender</label>
                                        <label for="male" style="">Male</label>
                                        <input id="male" type="radio" name="gender" value="Male" />
                                        <label for="female"  style="">Female</label>

                                        <input id="female" type="radio" name="gender" value="Female" />
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col-md-6">
                                        <label for="email">Email Address</label>
                                        <input readonly type="text" class="bg-light form-control" placeholder="${sessionScope.user.email}">
                                    </div>
                                    <div class="col-md-6 pt-md-0 pt-3">
                                        <label for="phone">Phone Number</label>
                                        <input name="phone" value="" type="tel" class="bg-light form-control phone">
                                        <div style="display: none;" class="warning warning_phone">Phone is empty</div>
                                    </div>

                                </div>

                                <div class="py-3 pb-4 border-bottom">
                                    <button type="button" class="btn btn-primary mr-3" onclick="">Register now</button>
                                </div>

                                <!--                                    <div class="py-3 pb-4 border-bottom">
                                                                        <a href="changePassword?uid=${sessionScope.user.getUserId()}">
                                                                            <button type="button" class="btn btn-primary mr-3">Change password</button>
                                                                        </a>
                                                                    </div>-->

                                <div class="d-sm-flex align-items-center pt-3" id="deactivate">
                                    <!--                                        <div>
                                                                                <b>Deactivate your account</b>
                                                                                <p>Details about your company account and password</p>
                                                                            </div>
                                                                            <div class="ml-auto">
                                                                                <button class="btn danger">Deactivate</button>
                                                                            </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <form action="changePassword" method="POST">
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
                                    <div class="md-form mb-4">
                                        <p class="text-danger" role="alert">${message}</p>
                                        <input type="password"
                                               id="defaultForm-email" class="form-control validate"
                                               placeholder="Enter your current password" name="oldPass" required >
                                    </div>
                                    <div class="md-form mb-4">
                                        <input  type="password"
                                                id="defaultForm-pass" class="form-control validate"
                                                placeholder="Enter your new password" name="newPass" required>
                                    </div>
                                    <div class="md-form mb-4">
                                        <input  type="password"
                                                id="defaultForm-pass" class="form-control validate"
                                                placeholder="Confirm new password" name="confirmPass" required>
                                    </div>
                                </div>
                                <div class="modal-footer d-flex justify-content-center">
                                    <button class="btn btn-default" type="submit">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!--                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Continue</button>
                                    </div>-->
            </div>

        </div>
    </div>


</body>
</html>

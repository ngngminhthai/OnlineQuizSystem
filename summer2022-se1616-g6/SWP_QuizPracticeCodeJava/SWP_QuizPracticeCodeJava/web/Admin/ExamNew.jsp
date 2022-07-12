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


        <button data-toggle="modal" data-target="#newExam" class="btn btn-danger">Examination</button>


        <!-- Modal -->
        <div class="modal fade" id="newExam" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h1>New Exam</h1>
                        <!--                        <div class="form-group" data-select2-id="5">
                                                    <div class="simple-input" data-select2-id="4">
                                                        <select id="cates" class="form-control select2-hidden-accessible" data-select2-id="cates" tabindex="-1" aria-hidden="true">
                                                            <option value="" data-select2-id="2">&nbsp;</option>
                                                            <option value="1" data-select2-id="10">IT &amp; Software</option>
                                                            <option value="2" data-select2-id="11">Banking</option>
                                                            <option value="3" data-select2-id="12">Medical</option>
                                                            <option value="4" data-select2-id="13">Insurence</option>
                                                            <option value="5" data-select2-id="14">Finance &amp; Accounting</option>
                                                        </select><span class="select2 select2-container select2-container--default select2-container--below select2-container--focus" dir="ltr" data-select2-id="1" style="width: 322px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-cates-container"><span class="select2-selection__rendered" id="select2-cates-container" role="textbox" aria-readonly="true"><span class="select2-selection__placeholder">Choose Category</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                                                    </div>
                                                </div>-->
                        <form action="examination" method="get">
                            Available Subject Exam: <select class="form-control" name="subjectid">
                                <c:forEach items="${subjectList}" var="s">
                                    <option value="${s.subjectId}">${s.subjectName}</option>
                                </c:forEach>
                            </select>
                            <br>
                            <button class="btn btn-success">Take Exam</button>
                        </form>

                    </div>


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
</html>

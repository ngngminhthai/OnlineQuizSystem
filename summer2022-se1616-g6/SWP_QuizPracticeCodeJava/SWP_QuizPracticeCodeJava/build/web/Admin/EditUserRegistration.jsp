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

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            body {
                font-family: 'Karla', sans-serif;
            }

            .pricing-table-subtitle {
                margin-top: 68px;
                font-weight: normal;
            }

            .pricing-table-title {
                font-weight: bold;
                margin-bottom: 68px;
            }

            .pricing-card {
                border: none;
                border-radius: 10px;
                margin-bottom: 40px;
                text-align: center;
                -webkit-transition: all 0.6s;
                transition: all 0.6s;
            }

            .pricing-card:hover {
                box-shadow: 0 2px 40px 0 rgba(205, 205, 205, 0.55);
            }

            .pricing-card.pricing-card-highlighted {
                box-shadow: 0 2px 40px 0 rgba(205, 205, 205, 0.55);
            }

            .pricing-card-hover {
                box-shadow: 0 2px 40px 0 rgba(205, 205, 205, 0.55);
                -webkit-transform: translateY(-10px);
                transform: translateY(-10px);
            }

            .pricing-card .card-body {
                padding-top: 55px;
                padding-bottom: 62px;
            }

            .pricing-plan-title {
                font-size: 20px;
                color: #000;
                margin-bottom: 11px;
                font-weight: normal;
            }

            .pricing-plan-cost {
                font-size: 50px;
                color: #000;
                font-weight: bold;
                margin-bottom: 29px;
            }

            .pricing-plan-icon {
                display: inline-block;
                width: 40px;
                height: 40px;
                font-size: 40px;
                line-height: 1;
                margin-bottom: 24px;
            }

            .pricing-plan-basic .pricing-plan-icon {
                color: #fe397a;
            }

            .pricing-plan-pro .pricing-plan-icon {
                color: #10bb87;
            }

            .pricing-plan-enterprise .pricing-plan-icon {
                color: #5d78ff;
            }

            .pricing-plan-features {
                list-style: none;
                padding-left: 0;
                font-size: 14px;
                line-height: 2.14;
                margin-bottom: 35px;
                color: #303132;
            }

            .pricing-plan-purchase-btn {
                color: #000;
                font-size: 16px;
                font-weight: bold;
                width: 145px;
                height: 45px;
                border-radius: 22.5px;
                -webkit-transition: all 0.4s;
                transition: all 0.4s;
                position: relative;
                display: -webkit-box;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                margin-left: auto;
                margin-right: auto;
                -webkit-box-pack: center;
                justify-content: center;
            }

            .pricing-plan-basic .pricing-plan-purchase-btn {
                background-color: #fe397a;
                color: #fff;
            }

            .pricing-plan-basic .pricing-plan-purchase-btn-hover {
                box-shadow: 0 3px 0 0 #b7013d;
            }

            .pricing-plan-basic .pricing-plan-purchase-btn:active {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
                box-shadow: none;
            }

            .pricing-plan-pro .pricing-plan-purchase-btn {
                background-color: #10bb87;
                color: #fff;
            }

            .pricing-plan-pro .pricing-plan-purchase-btn-hover {
                box-shadow: 0 3px 0 0 #0a7554;
            }

            .pricing-plan-pro .pricing-plan-purchase-btn:active {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
                box-shadow: none;
            }

            .pricing-plan-enterprise .pricing-plan-purchase-btn {
                background-color: #5d78ff;
                color: #fff;
            }

            .pricing-plan-enterprise .pricing-plan-purchase-btn-hover {
                box-shadow: 0 3px 0 0 #1138ff;
            }

            .pricing-plan-enterprise .pricing-plan-purchase-btn:active {
                -webkit-transform: translateY(3px);
                transform: translateY(3px);
                box-shadow: none;
            }


            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /*            body{
                            font-family: 'Poppins', sans-serif;
                            background-color: aliceblue;
                        }*/
            /*
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
                        }*/
            /*            #img-section p,#deactivate p{
                            font-size: 12px;
                            color: #777;
                            margin-bottom: 10px;
                            text-align: justify;
                        }
                        #img-section b,#img-section button,#deactivate b{
                            font-size: 14px; 
                        }*/

            label{
                margin-bottom: 0;
                font-size: 14px;
                font-weight: 500;
                color: #777;
                padding-left: 3px;
            }
            .wrapper{
                padding: 30px 50px;
                border: 1px solid #ddd;
                border-radius: 15px;
                margin: 10px auto;
                max-width: 600px;
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
            .modal-open, .modal, .show{
                padding-right: 0px !important;
            }
            body{
                padding-right: 0px !important;
            }
        </style>
        <% UserDAO ud = new UserDAO();
            User u = (User) request.getSession().getAttribute("user");
            String img = ud.findImg(u.getUserId());
            boolean gender = ud.findGender(u.getUserId());
            String phone = ud.findPhone(u.getUserId());
            String name = ud.findName(u.getUserId());
        %>
    </head>
    <body>
        <c:choose>
            <c:when test="${r.isAccepted}">
                
            </c:when>
            <c:otherwise>
                <a data-toggle="modal" href="#myModal${r.regId}e" class="btn btn-primary">Edit</a>
            </c:otherwise>
        </c:choose>



        <div class="modal" id="myModal${r.regId}e">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Modal title</h4>    
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div><div class="container"></div>
                    <div class="modal-body">
                        <div class="wrapper bg-white mt-sm-5">
                            <h4 class="pb-4 border-bottom">Edit Registration</h4>
                            <div class="d-flex align-items-start py-3 border-bottom">
                                <img style="width: 100px;
                                     height: 100px;
                                     object-fit: cover;" src="${pageContext.request.contextPath}/${r.sub.thumbnailURL}"
                                     >
                                <div class="pl-sm-4 pl-2" id="img-section">
                                    <b>${r.sub.subjectName}</b>
                                    <p>${r.sub.description}</p>
                                    <!--                                    <button class="btn button border"><b>Upload</b></button>-->



                                </div>
                            </div>
                            <div class="py-2">
                                <div class="row py-2">
                                    <div class="col-md-6">
                                        <label for="firstname">Pricing Plan</label>
                                        <input readonly="" type="text" class="bg-light form-control fullName${r.regId}" placeholder="${r.pricepackage.packageName}" name="name">
                                    </div>


                                    <div class="col-md-6 pt-md-0 pt-3">
                                        <button data-toggle="modal" href="#myModal${r.regId}p" style="
                                                transform: translate(-5px, 20px);
                                                " type="button" class="bg-light form-control fullName">Select Pricing Plan</button>
                                    </div>

                                </div>


                                <div class="py-3 pb-4 border-bottom">
                                    <button type="button" class="btn btn-primary mr-3" onclick="formSubmit()">Save</button>

                                </div>

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
                        <!--                                                <a data-toggle="modal" href="#myModal2" class="btn btn-primary">Launch modal</a>-->
                    </div>
                    <!--                    <div class="modal-footer">
                                            <a href="#" data-dismiss="modal" class="btn">Save</a>
                                        </div>-->
                </div>
            </div>
        </div>
        <div class="modal" id="myModal${r.regId}p" data-backdrop="static">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Pricing</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div><div class="container"></div>
                    <div class="modal-body">
                        <main class="pricing_plan">
                            <div class="container">
                                <h5 class="text-center pricing-table-subtitle">PRICING PLAN</h5>
                                <h1 class="text-center pricing-table-title">Pricing Table</h1>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card pricing-card pricing-plan-basic">
                                            <div class="card-body">
                                                <i class="mdi mdi-cube-outline pricing-plan-icon"></i>
                                                <p class="pricing-plan-title">${r.sub.pricePackage.get(0).packageName}</p>
                                                <h3 style="font-size: 18px;
                                                    text-decoration: line-through;
                                                    color: lightgray;" class="pricing-plan-cost ml-auto">${r.sub.pricePackage.get(0).listPrice}$</h3>
                                                <h4 class="pricing-plan-cost ml-auto">${r.sub.pricePackage.get(0).salePrice}$</h4>
                                                <ul class="pricing-plan-features">
                                                    <li>3 months subject available</li>

                                                </ul>
                                                <button type="button" class="${r.sub.subjectId} btn pricing-plan-purchase-btn">Upgrade plan</button>
                                                <input hidden="" type="radio" name="pricepackage" class="${r.sub.pricePackage.get(0).packageId} ${r.sub.subjectId}" />
                                                <input type="text" hidden="" class="packageName ${r.regId}" value="${r.sub.pricePackage.get(0).packageName}" >
                                                <input type="text" hidden="" value="${r.regId}" name="regId">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card pricing-card pricing-card-highlighted  pricing-plan-pro">
                                            <div class="card-body">
                                                <i class="mdi mdi-trophy pricing-plan-icon"></i>
                                                <p class="pricing-plan-title">${r.sub.pricePackage.get(1).packageName}</p>
                                                <h3 style="font-size: 18px;
                                                    text-decoration: line-through;
                                                    color: lightgray;" class="pricing-plan-cost ml-auto">${r.sub.pricePackage.get(1).listPrice}$</h3>
                                                <h4 class="pricing-plan-cost ml-auto">${r.sub.pricePackage.get(1).salePrice}$</h4>
                                                <ul class="pricing-plan-features">
                                                    <li>6 months subject available</li>
                                                </ul>
                                                <button type="button" class="${r.sub.subjectId} btn pricing-plan-purchase-btn">Upgrade plan</button>
                                                <input hidden="" type="radio" name="pricepackage" class="${r.sub.pricePackage.get(1).packageId} ${r.sub.subjectId}" />
                                                <input type="text" hidden="" class="packageName ${r.regId}" value="${r.sub.pricePackage.get(1).packageName}" >
                                                <input type="text" hidden="" value="${r.regId}" name="regId">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card pricing-card pricing-plan-enterprise">
                                            <div class="card-body">
                                                <i class="mdi mdi-wallet-giftcard pricing-plan-icon"></i>
                                                <p class="pricing-plan-title">${r.sub.pricePackage.get(2).packageName}</p>
                                                <h3 style="font-size: 18px;
                                                    text-decoration: line-through;
                                                    color: lightgray;" class="pricing-plan-cost ml-auto">${r.sub.pricePackage.get(2).listPrice}$</h3>
                                                <h4 class="pricing-plan-cost ml-auto">${r.sub.pricePackage.get(2).salePrice}$</h4>
                                                <ul class="pricing-plan-features">
                                                    <li>Lifetime subject available</li>
                                                </ul>
                                                <button type="button" class="${r.sub.subjectId} btn pricing-plan-purchase-btn">Upgrade plan</button>
                                                <input hidden="" type="radio" name="pricepackage" class="${r.sub.pricePackage.get(2).packageId} ${r.sub.subjectId}" />
                                                <input type="text" hidden="" class="packageName ${r.regId}" value="${r.sub.pricePackage.get(2).packageName}" >
                                                <input type="text" hidden="" value="${r.regId}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </main>
                    </div>
                    <div onclick="checkOverride()" class="modal-footer">
                        <a href="#" data-dismiss="modal" class="btn btn-primary">Save</a>
                        <!--                        <button class="btn btn-primary save_btn">Save changes</button>-->
                    </div>
                </div>
            </div>
        </div>

        <form action="editregistration" method="get" class="edituserregister">

            <input class="subjectId" hidden="" name="subjectId">
            <input class="packageId" hidden="" name="packageId">
            <input class="isUpdate" hidden="" name="isUpdate">
            <input class="regId" hidden="" name="regId">

        </form>
        <script>

        </script>
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

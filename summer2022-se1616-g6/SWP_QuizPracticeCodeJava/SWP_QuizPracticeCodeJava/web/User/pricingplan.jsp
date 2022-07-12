<%-- 
    Document   : pricingplan
    Created on : May 29, 2022, 8:32:02 PM
    Author     : Admin
--%>

<%@page import="Models.Subject"%>
<%@page import="DAL.RegistrationDAO"%>
<%@page import="Models.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
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
            .modal-content{
                height: 80% !important;
            }

            #exampleModalCenter2{
                  overflow: hidden !important;
            }
            .modal-dialog{
                overflow: hidden !important;
            }
            .modal-body{
                height: 77vh;
                overflow: hidden !important;

            }
            .modal-open {
                overflow: hidden !important;
            }
           
            /*# sourceMappingURL=pricing-plan.css.map */
        </style>
    </head>

    <body>
        <!--    <main class="pricing_plan" style="display: none;">
                <div class="container">
                    <h5 class="text-center pricing-table-subtitle">PRICING PLAN</h5>
                    <h1 class="text-center pricing-table-title">Pricing Table</h1>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card pricing-card pricing-plan-basic">
                                <div class="card-body">
                                    <i class="mdi mdi-cube-outline pricing-plan-icon"></i>
                                    <p class="pricing-plan-title">1 Month</p>
                                    <h3 class="pricing-plan-cost ml-auto">20$</h3>
                                    <ul class="pricing-plan-features">
                                        <li>Unlimited conferences</li>
                                        <li>100 participants max</li>
                                        <li>Custom Hold Music</li>
                                        <li>10 participants max</li>
                                    </ul>
                                    <a href="#!" class="btn pricing-plan-purchase-btn">Free</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card pricing-card pricing-card-highlighted  pricing-plan-pro">
                                <div class="card-body">
                                    <i class="mdi mdi-trophy pricing-plan-icon"></i>
                                    <p class="pricing-plan-title">6 Months</p>
                                    <h3 class="pricing-plan-cost ml-auto">$49</h3>
                                    <ul class="pricing-plan-features">
                                        <li>Unlimited conferences</li>
                                        <li>100 participants max</li>
                                        <li>Custom Hold Music</li>
                                        <li>10 participants max</li>
                                    </ul>
                                    <a href="#!" class="btn pricing-plan-purchase-btn">Purchase</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card pricing-card pricing-plan-enterprise">
                                <div class="card-body">
                                    <i class="mdi mdi-wallet-giftcard pricing-plan-icon"></i>
                                    <p class="pricing-plan-title">Life Time</p>
                                    <h3 class="pricing-plan-cost ml-auto">$69</h3>
                                    <ul class="pricing-plan-features">
                                        <li>Unlimited conferences</li>
                                        <li>100 participants max</li>
                                        <li>Custom Hold Music</li>
                                        <li>10 participants max</li>
                                    </ul>
                                    <a href="#!" class="btn pricing-plan-purchase-btn">Purchase</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
            </main>-->
        <!-- Button trigger modal -->
        <% User u = (User) request.getSession().getAttribute("user");
            RegistrationDAO d = new RegistrationDAO();
            Subject s = (Subject) request.getAttribute("subject");
            Boolean isLifeTime = false;
            if (u != null) {
                isLifeTime = d.isHaveLifeTime(s.getSubjectId(), u.getUserId());
            }
        %>
        <% if (u == null || !d.isRegistrated(s.getSubjectId(), u.getUserId())) {%>
        <button onclick="checkLogin()" type="button" <a href="#" class="btn theme-bg enroll-btn" data-target="#exampleModalCenter2">
                Enroll Now<i class="ti-angle-right"></i>

        </button>
        <%} else {%>
        <div style="display: flex; flex-direction: column;">
            <button onclick="checkLogin()" type="button" <a href="#" class="btn btn-secondary" data-target="#exampleModalCenter2">
                    Upgrade Plan<i class="ti-angle-right"></i>
            </button>
        </div>

        <%}%>



        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Pricing plan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <main class="pricing_plan">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card pricing-card pricing-plan-basic">
                                            <div class="card-body">
                                                <i class="mdi mdi-cube-outline pricing-plan-icon"></i>
                                                <p class="pricing-plan-title">${subject.pricePackage.get(0).packageName}</p>
                                                <h3 style="font-size: 18px;
                                                    text-decoration: line-through;
                                                    color: lightgray;" class="pricing-plan-cost ml-auto">${subject.pricePackage.get(0).listPrice}$</h3>
                                                <h4 class="pricing-plan-cost ml-auto">${subject.pricePackage.get(0).salePrice}$</h4>
                                                <ul class="pricing-plan-features">
                                                    <li>3 months subject available</li>

                                                </ul>
                                                <button type="button" class="${subject.subjectId} btn pricing-plan-purchase-btn">Upgrade plan</button>
                                                <input hidden="" type="radio" name="pricepackage" class="${subject.pricePackage.get(0).packageId} ${r.sub.subjectId}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card pricing-card pricing-card-highlighted  pricing-plan-pro">
                                            <div class="card-body">
                                                <i class="mdi mdi-trophy pricing-plan-icon"></i>
                                                <p class="pricing-plan-title">${subject.pricePackage.get(1).packageName}</p>
                                                <h3 style="font-size: 18px;
                                                    text-decoration: line-through;
                                                    color: lightgray;" class="pricing-plan-cost ml-auto">${subject.pricePackage.get(1).listPrice}$</h3>
                                                <h4 class="pricing-plan-cost ml-auto">${subject.pricePackage.get(1).salePrice}$</h4>
                                                <ul class="pricing-plan-features">
                                                    <li>6 months subject available</li>

                                                </ul>
                                                <button type="button" class="${subject.subjectId} btn pricing-plan-purchase-btn">Upgrade plan</button>
                                                <input hidden="" type="radio" name="pricepackage" class="${subject.pricePackage.get(1).packageId} ${subject.subjectId}" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card pricing-card pricing-plan-enterprise">
                                            <div class="card-body">
                                                <i class="mdi mdi-wallet-giftcard pricing-plan-icon"></i>
                                                <p class="pricing-plan-title">${subject.pricePackage.get(2).packageName}</p>
                                                <h3 style="font-size: 18px;
                                                    text-decoration: line-through;
                                                    color: lightgray;" class="pricing-plan-cost ml-auto">${subject.pricePackage.get(2).listPrice}$</h3>
                                                <h4 class="pricing-plan-cost ml-auto">${subject.pricePackage.get(2).salePrice}$</h4>
                                                <ul class="pricing-plan-features">
                                                    <li>Life time subject available for registrated subject</li>

                                                </ul>
                                                <button type="button" class="${subject.subjectId} btn pricing-plan-purchase-btn">Upgrade plan</button>
                                                <input hidden="" type="radio" name="pricepackage" class="${subject.pricePackage.get(2).packageId} ${subject.subjectId}" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <% if (!isLifeTime) {%>
                        <button onclick="sendData()" type="button" class="btn btn-primary">Confirm</button>
                        <%}%>
                    </div>
                </div>

            </div>
        </div>
        <form action="registersubject" method="get" class="registersubject">

            <input class="subjectId" hidden="" name="subjectId">
            <input class="packageId" hidden="" name="packageId">
            <input class="isUpdate" hidden="" name="isUpdate">
            <input class="regId" hidden="" name="regId">

        </form>
        <script>
            var isLifeTime = '<%=isLifeTime.toString()%>'
            var form = document.querySelector(".registersubject");
            var loginModal = document.querySelector("#login");
            var pid = document.querySelector(".packageId");
            var sid = document.querySelector(".subjectId");

            var button = document.querySelectorAll(".pricing-plan-purchase-btn");
            var pricing_card = document.querySelectorAll(".pricing-card");

            if (isLifeTime == "false") {
                button.forEach((ele) => {
                    ele.addEventListener("click", () => {

                        removeHightlight();
                        ele.parentNode.parentNode.classList.toggle("pricing-card-hover")

                        var radiobtn = ele.nextElementSibling;
                        radiobtn.checked = true;


                        pid.value = radiobtn.classList[0];
                        sid.value = ele.classList[0];
                        console.log(pid.value + " " + sid.value);

                        if (ele.parentNode.parentNode.classList.contains("pricing-plan-basic"))
                            ele.classList.toggle("pricing-plan-purchase-btn-hover")
                        else if (ele.parentNode.parentNode.classList.contains("pricing-plan-pro"))
                            ele.classList.toggle("pricing-plan-purchase-btn-hover")
                        else if (ele.parentNode.parentNode.classList.contains("pricing-plan-enterprise"))
                            ele.classList.toggle("pricing-plan-purchase-btn-hover")
                    });
                })
                function removeHightlight() {
                    button.forEach((ele) => {
                        ele.classList.remove("pricing-plan-purchase-btn-hover");
                    })
                    pricing_card.forEach((ele) => {
                        ele.classList.remove("pricing-card-hover");
                    })
                }

            } else {
                button.forEach((ele) => {
                    ele.style.backgroundColor = "#9e9e9e";
                })
            }



            function checkLogin() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/userregistration",
                    type: "post", //send it through get method
                    data: {
                    },
                    success: function (data) {

                        if (data == "notlogin")
                        {

                            $(document).ready(function () {
                                // Show the Modal on load
                                $("#regisForm").modal("show");
                            });
                        } else {
                            $(document).ready(function () {
                                // Show the Modal on load
                                $("#exampleModalCenter2").modal("show");
                            });
                        }
                        console.log(data);

                    },
                    error: function () {
                        //Do Something to handle error
                    }
                });
            }


            function sendData() {
                form.submit();
            }


        </script>


        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>

</html>

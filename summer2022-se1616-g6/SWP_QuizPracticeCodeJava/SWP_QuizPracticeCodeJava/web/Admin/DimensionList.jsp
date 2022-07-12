
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Themezhub" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Subject Dimension</title>

        <!-- Custom CSS -->
        <link href="assets/css/styles.css" rel="stylesheet">

        <!--data table-->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <!--<link href="css/datatable.css" rel="stylesheet" />-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

        <!--select input search -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.jquery.min.js"></script>

    </head>

    <style>
        .button-34 {
            background: #03b97c !important;
            border-radius: 999px;
            box-shadow: #5E5DF0 0 10px 20px -10px;
            box-sizing: border-box;
            color: #FFFFFF;
            cursor: pointer;
            font-family: Inter,Helvetica,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Noto Color Emoji","Segoe UI Symbol","Android Emoji",EmojiSymbols,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans",sans-serif;
            font-size: 16px;
            font-weight: 700;
            line-height: 24px;
            opacity: 1;
            outline: 0 solid transparent;
            padding: 9px 30px;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: fit-content;
            border: 0;
            margin-bottom: 9px;
            margin-top: 10px;
            margin-left: 20px;
        }
    </style>
    <body>

        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">

            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->
            <%@include file="template/header_new.jsp" %>>
            <div class="clearfix"></div>
            <!-- ============================================================== -->
            <!-- Top header  -->
            <!-- ============================================================== -->

            <!-- ============================ Dashboard: Dashboard Start ================================== -->
            <section class="gray pt-4">
                <div class="container-fluid">

                    <div class="row">

                        <%@include file="template/menu.jsp"%>

                        <div class="col-lg-9 col-md-9 col-sm-12">

                            <!-- Row -->
                            <div class="row justify-content-between">
                                <div class="col-lg-12 col-md-12 col-sm-12 pb-4">
                                    <div class="dashboard_wrap d-flex align-items-center justify-content-between">
                                        <div class="arion">
                                            <nav class="transparent">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Dimension</li>
                                                </ol>
                                            </nav>
                                        </div>
                                        <div class="elkios">
                                            <a href="dimensionadd" class="add_new_btn"><i class="fas fa-plus-circle mr-1"></i>Add Dimension</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Row -->

                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="dashboard_wrap">
                                        <form action="subjectdimension" method="post">
                                            <div class="row">
                                                <div class="col-xl-12 col-lg-12 col-md-12 mb-4">
                                                    <h6 class="m-0">All Dimension List</h6>
                                                </div>
                                            </div>

                                            <div class="row align-items-end" style="margin-left: 20px">

                                                <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Name</label>
                                                        <div class="smalls">
                                                            <select class="form-control chosen" id="ins" name="nameDimension" >
                                                                <option value="0">All</option>
                                                                <c:forEach items="${listName}" var="listN">
                                                                    <option value="${listN.dimensionId}" ${listN.dimensionId==dimenID?"selected":""}>${listN.dimensionName}</option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-2 col-lg-4 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Type</label>
                                                        <div class="smalls">
                                                            <select class="form-control chosen" id="cates" name="typeDimension">
                                                                <option value="0" ${typeId == 0?"selected":""}>All</option>
                                                                <option value="1"${typeId == 1?"selected":""}>1 - Domain</option>
                                                                <option value="2"${typeId == 2?"selected":""}>2 - Group</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                </div>
                                                
                                                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6" style="margin-right: 192px;"></div>
                                                
                                                <div class="col-xl-2 col-lg-4 col-md-6 col-sm-6">
                                                    <div class="form-group">
                                                        <!--<button type="button" class="btn text-white full-width theme-bg">Filter</button>-->
                                                        <input type="submit" class="btn text-white full-width theme-bg" value="Filter">
                                                    </div>
                                                </div>

                                            </div>
                                        </form>
                                        <!--                                        <script type="text/javascript">
                                                                                    $(".chosen").chosen();
                                                                                </script>-->

                                        <div class="card-body">
                                            <table id="datatablesSimple">
                                                <thead>
                                                    <tr>
                                                        <th>Type</th>
                                                        <th>Name</th>
                                                        <th>Description</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${listDimension}" var="list">
                                                        <tr>
                                                            <td>${list.typeName}</td>
                                                            <td>${list.dimensionName}</td>
                                                            <td>${list.description}</td>
                                                            <!--                                                            <td>
                                                                                                                            <a href="dimensionupdate?id=${list.dimensionId}" style="color:#03B97C;">Update</a>
                                                                                                                                                                                                    <a href="#">Delete</a>
                                                                                                                        </td>-->
                                                            <td>
                                                                <div class="dropdown show">
                                                                    <a class="btn btn-action" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-h"></i>
                                                                    </a>
                                                                    <div class="drp-select dropdown-menu">
                                                                        <a class="dropdown-item" href="dimensionupdate?id=${list.dimensionId}">Edit</a>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                            </table>
                                        </div>



                                    </div>
                                </div>

                                <!--pagination-->

                                <!--End paging-->


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
<!-- ============================ Footer End ================================== -->



</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
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

<!--data table-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->		

</body>
</html>

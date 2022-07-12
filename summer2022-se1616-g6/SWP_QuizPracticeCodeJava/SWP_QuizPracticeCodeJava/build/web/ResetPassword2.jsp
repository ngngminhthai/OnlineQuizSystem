
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset password</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://themepure.net/template/sikkha-prv/sikkha/img/favicon.png">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>

    <style>
        .container{
            margin-top: 33px;
        }
        .homeLink {
            margin-top: 23px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            padding: 10px;
        }
    </style>
    <body>
        <div class="container">
            <center>
                <div class="row">
                    <div class="col-sm-12">
                        <h3>Hello ${user.getFullName()}, reset your password here</h3>
                    </div>
                </div>
            </center>

            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <form method="post" id="passwordForm">
                        <input type="hidden" name="tokenValue" value="${tokenGet}">
                        <input type="password" class="input-lg form-control" name="pass" id="password1" placeholder="New Password" autocomplete="off" required>
                        <br>
                        <input type="password" class="input-lg form-control" name="confirmPass" id="password2" placeholder="Repeat Password" autocomplete="off" required>
                        <div class="row">
                            <div class="col-sm-12">
                                <span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match
                            </div>
                        </div>
                        <input type="submit" class="col-xs-12 btn btn-primary btn-load btn-lg" data-loading-text="Changing Password..." value="Change Password">
                    </form>
                </div><!--/col-sm-6-->
            </div><!--/row-->

            <div class="homeLink">
                Back to <a href="home">home</a>
            </div>
            <center>
                <h4>${message}</h4>
            </center>
        </div>
    </body>
</html>

<script>

    $("input[type=password]").keyup(function () {
        if ($("#password1").val() != "" || $("#password2").val() != "") {
            if ($("#password1").val() == $("#password2").val()) {
                $("#pwmatch").removeClass("glyphicon-remove");
                $("#pwmatch").addClass("glyphicon-ok");
                $("#pwmatch").css("color", "#00A41E");
                $(':input[type="submit"]').prop('disabled', false);
            } else {
                $("#pwmatch").removeClass("glyphicon-ok");
                $("#pwmatch").addClass("glyphicon-remove");
                $("#pwmatch").css("color", "#FF0004");
                $(':input[type="submit"]').prop('disabled', true);
            }
        }
    });
</script>

<%-- 
    Document   : Verify
    Created on : May 29, 2022, 3:06:55 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <title>Verify Page</title>
    </head>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .header{
            background-color: green; 
            width: 100%;
            height: 50px;
        }
        .text{
            margin-top: 100px;
            background-color: lightgrey;
            width: 500px;
            height: 200px;
            margin-left: auto;
            margin-right: auto;
            padding-top: 40px;
        }
        p{
            margin-top: 20px;
            text-align: center;
            font-size: 20px;
        }
    </style>
    <body>
        <div class="header"></div>
        <div class="text">
            <h1 style="text-align: center; padding-bottom: 8px; font-size: 30px">Email Verification</h1>
            <hr>
            <p style="font-style: italic">Thank you for registering</p>
            <p>Please check your email to verify to log into the system</p>
        </div>
    </body>
</html>

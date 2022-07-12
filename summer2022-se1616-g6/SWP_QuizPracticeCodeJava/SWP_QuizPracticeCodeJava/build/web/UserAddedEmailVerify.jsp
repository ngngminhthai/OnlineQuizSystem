<%-- 
    Document   : UserAddedEmailVerify
    Created on : Jun 30, 2022, 10:31:30 AM
    Author     : Halinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Added user verify email</title>
    </head>
    <body>
        <form action="addedUserVerifyEmail" method="post">
            Your email (${sessionScope.email}) has been added to Quizzy. 
            Do you want to register? <br> <br>
            <input type="radio" name="verify" value="true" ${verify2.equals("true") ? "checked" : ""}>Yes<br> <br>
            <input type="radio" name="verify" value="false" ${verify2.equals("false") ? "checked" : ""}>No<br> <br>
            <button>Submit</button>
        </form>
        <br>
        ${requestScope.message}
    </body>
</html>

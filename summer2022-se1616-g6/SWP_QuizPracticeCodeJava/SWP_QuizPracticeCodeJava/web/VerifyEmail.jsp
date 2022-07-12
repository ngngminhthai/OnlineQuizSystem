<%-- 
    Document   : VerifyEmail
    Created on : Jun 6, 2022, 8:15:58 AM
    Author     : Halinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <form action="verifyEmail" method="post">
            You just used your email (${sessionScope.email}) to register to Quizzy. 
            Was that truly you? <br> <br>
            <input type="checkbox" name="verify" value="true" ${verify2.equals("true") ? "checked" : ""}>Yes, that was me <br> <br>
            <input type="checkbox" name="verify" value="false" ${verify2.equals("false") ? "checked" : ""}>No, that was someone else <br> <br>
            <button>Submit</button>
        </form>
        <br>
        ${requestScope.message}
    </body>
</html>

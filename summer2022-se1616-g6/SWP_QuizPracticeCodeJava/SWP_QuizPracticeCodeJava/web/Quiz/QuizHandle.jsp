<%-- 
    Document   : QuizHandle
    Created on : Jun 26, 2022, 6:05:42 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
            integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link href="assets/css/styles.css" rel="stylesheet">
        <style>
            .body{
                margin: 0px;
                box-sizing: border-box;
                padding: 0px;
                font-family: sans-serif;
            }
            .container{
                padding-top: 5px;
            }
            .quiz_header{
                align-items: center;
                height: 10vh;
                border-bottom:3px solid #b6b6b6;
                border-top: 3px solid #b6b6b6;
                position: relative;
                font-family: sans-serif;
            }
            .quiz_count{
                font-size: 40px;
                padding: 5px;
                margin-right:  15px;
                font-family: sans-serif;
            }
            .quiz_timer{
                background-color: #8598ff;
                font-size: 40px;
                padding: 5px;
                font-family: sans-serif;
                color: white;
            }
            .quiz_counter{
                position: absolute;
                right: 0px;

                height: 100%;
                display: flex;
                align-items: center;
                font-family: sans-serif;
            }
            .quiz_body{
                position: relative;

                font-family: sans-serif;
                min-height:  73vh;
            }
            .quiz_footer{

                height: 15vh;
                background-color: #4ac358;
                font-family: sans-serif;
            }
            .question_number{
                display: flex;
                justify-content: space-between;
                background-color: #575757;
                color: white;
                height: fit-content;
                width: 100%;

                border-radius: 2px;
                font-size: 23px;
                padding: 10px;
                margin-top: 11px;
                font-family: sans-serif;
            }
            .question_content{
                color: #6e6d6d;
                font-size: 19px;
                width: 95%;
                margin: 0 auto;
                margin-top: 23px;
                font-family: sans-serif;          
            }
            input{
                width: 20px;
                cursor: pointer;
            }
            label{
                cursor: pointer;
                -webkit-touch-callout: none; /* iOS Safari */
                -webkit-user-select: none; /* Safari */
                -khtml-user-select: none; /* Konqueror HTML */
                -moz-user-select: none; /* Old versions of Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                      supported by Chrome, Edge, Opera and Firefox */
            }
            .question_peeker{
                height: 60px;
                width: 95%;
                justify-content: flex-end;
            }
            .question_peeker .peak, .marked{

                min-height: fit-content;
            }
            .back_btn{
                position: absolute;
                left: 0px;
            }
            /*            .prev{
                            border: 3px solid white;
                            height: 42px;
                            width: 129px;
                            align-self: center;
                            margin-left: 21px;
                            color: white;
                            border-radius: 5px;
                        }*/
            .button_container{
                width: 95%;
                margin: 0 auto;
                justify-content: space-between;
                height: 40%;
                align-self: center;
            }
            .button_container button{
                width: 13%;

                color: black;
            }
            .btncontainer button{
                width: 100%;
            }
        </style>
    </head>
    <body>

        <form class="quizHandle" action="QuizHandle" method="get">
            <div class="container" style="    max-width: 1500px;">
                <div class="row quiz_header">
                    <button class="back_btn btn btn-secondary"> <i class="ti-angle-double-left"></i>  Back</button>
                    <div class="quiz_counter" style="display: flex;">

                        <div class="quiz_count">
                            <i class="fa-solid fa-location-dot"></i> ${quesnum} / ${sessionScope.doingQuiz.getQ().size()}
                        </div>
                        <div class="quiz_timer">
                            <i class="fa-solid fa-clock"></i> 
                            <span id="hour"></span>:<span id="min"></span>:<span id="sec"></span>
                        </div>
                    </div>
                </div>
                <c:set var="alphabet" value="ABCDEFGHIJKLMNOPQRSTUVWXYZ" />

                <div class="row quiz_body">
                    <div class="question_number">
                        <span>${quesnum})</span>
                        <span>Question ID: ${ques.questionId}</span>
                    </div>
                    <div style="min-height: 180px;" class="question_content">
                        ${ques.questionContent}
                    </div>
                    <div class="question_content question_answer">
                        <c:forEach begin="0" end="${ques.answer.size()-1}" var="i">
                            <div class="answer">

                                <label><input <c:forEach items="${mark}" var="m">


                                            <c:if test="${ques.answer.get(i).answerId == m}">checked=""</c:if>
                                        </c:forEach>
                                        name="markedAnswer" type="checkbox" value="${ques.answer.get(i).answerId}">${alphabet.charAt(i)}. ${ques.answer.get(i).answerContent}</label>
                            </div>
                        </c:forEach>


                    </div>
                    <div class="question_content question_peeker d-flex mb-3 position-relative">
                        <button class="btn btn-secondary position-absolute" style="left: 0px;"> Review Progress </button>
                        <button class="peak btn btn-primary" style="margin-right: 10px;">Peak at answer</button>

                        <button class="marked btn btn-success"><i class="fa-solid fa-bookmark"></i> Marked for Review</button>

                    </div>
                </div>
                <div class="row quiz_footer">

                    <!--                <button class="prev">
                                        Previous
                                    </div>
                    
                                    <div class="next">
                                        Next
                                    </div>
                    
                                    <div class="submit">
                                        Submit
                                    </div>-->

                    <div class="button_container d-flex position-relative">
                        <div class="btncontainer">
                            <c:if test="${quesnum > 1}"> <button onclick="submitForm(this)" class="btn btn-light"><i class="ti-angle-left"></i>PREV</button></c:if>

                            </div>

                            <div class="btncontainer">
                                <div style="color: black;" onclick="finish()" class="btn btn-light">Finish</div>

                            </div>

                            <div class="btncontainer">
                            <c:if test="${quesnum < sessionScope.doingQuiz.getQ().size()}"><button onclick="submitForm(this)" class="btn btn-light">NEXT<i class="ti-angle-right"></i></button>
                                </c:if>
                        </div>


                    </div>

                    <input hidden="" name="oldQues" value="${quesnum}">
                    <input hidden="" class="clickBtn" name="quesnum" value="${quesnum}">


                </div>
            </div>
        </form>
        <form id="autoSubmit" action="submitquiz" method="post">
            <input hidden="" id="time" value="0">
        </form>
        <script>
            function finish() {
                resetTime();
                document.getElementById('autoSubmit').submit();
                resetTime();
            }
            var duration = parseInt('${sessionScope.doingQuiz.duration}');

            function resetTime() {
                localStorage.clear();
            }
            var today = new Date();
            var minutesLabel = document.getElementById("min");
            var secondsLabel = document.getElementById("sec");
            var hoursLabel = document.getElementById("hour");
            var totalSecond;
            var startMilisecond;
            if (localStorage.getItem("startMiliseconds") != null) {
                startMilisecond = localStorage.getItem("startMiliseconds");
            } else {
                startMilisecond = today.getTime();
            }
            localStorage.setItem('startMiliseconds', startMilisecond);



            function setTime() {
                var today2 = new Date();
                var presentMilisecond = today2.getTime();
                totalSecond = duration - ((presentMilisecond - startMilisecond) / 1000);
                displayTime();
            }

            setInterval(autoSubmit, 1000);
            function autoSubmit() {
                if (totalSecond <= 0) {
                    resetTime();
                    document.getElementById('autoSubmit').submit();
                    resetTime();
                }
            }

            function pad(val) {
                var valString = val + "";
                if (valString.length < 2) {
                    return "0" + valString;
                } else {
                    return valString;
                }
            }
            setInterval(setTime, 100)

            function displayTime() {
                var totalMinute = (totalSecond / 60) % 60;
                var totalHour = totalSecond / 60 / 60;
                var totalSec = totalSecond % 60;
                secondsLabel.innerHTML = pad(parseInt(totalSec));
                minutesLabel.innerHTML = pad(parseInt(totalMinute));
                hoursLabel.innerHTML = pad(parseInt(totalHour));
                document.getElementById('time').value = Math.round(totalSecond);
            }
//            resetTime()



            function submitForm(ele) {
                var quesnum = parseInt(document.querySelector(".clickBtn").value);
                if (ele.innerText == "PREV") {
                    quesnum--;
                    document.querySelector(".clickBtn").value = quesnum;

                    document.querySelector("form").submit();
                } else {
                    quesnum++;
                    document.querySelector(".clickBtn").value = quesnum;

                    document.querySelector("form").submit();
                }

            }
        </script>
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
    </body>
</html>

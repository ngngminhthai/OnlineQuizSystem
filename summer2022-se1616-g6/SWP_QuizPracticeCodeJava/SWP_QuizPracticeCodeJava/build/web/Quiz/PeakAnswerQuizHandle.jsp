<%-- 
    Document   : PeakAnswerQuizHandle
    Created on : Jun 29, 2022, 8:58:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div data-toggle="modal" data-target="#exampleModalCenterPeak" class="peak btn btn-primary" style="margin-right: 10px;">Peak at answer</div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenterPeak" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button  style="position: absolute;
                                 right: 9px; cursor: pointer;" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="profileSubmit" method="POST" action="profile2" enctype="multipart/form-data" >
                        <div class="modal-body" style="text-align: justify;">
                            <h1>Explanation</h1>
                            <c:forEach begin="0" end="${sessionScope.doingQuiz.getQ().get(quesnum-1).getCorrectAnswer().size()-1}" var="i">
                                <div style="text-align: justify; font-weight: bold;"> ${alphabet.charAt(i)}. ${sessionScope.doingQuiz.getQ().get(quesnum-1).getCorrectAnswer().get(i).answerContent}</div> 
                            </c:forEach>


                            ${sessionScope.doingQuiz.getQ().get(quesnum-1).explanation}
                        </div>
                    </form>


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
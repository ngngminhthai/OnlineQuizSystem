<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="shortcut icon" type="image/x-icon" href="https://themepure.net/template/sikkha-prv/sikkha/img/favicon.png">
<style>
    .mainDiv {
        display: flex;
        min-height: 100%;
        align-items: center;
        justify-content: center;
        background-color: #f9f9f9;
        font-family: 'Open Sans', sans-serif;
    }
    .cardStyle {
        width: 500px;
        border-color: white;
        background: #fff;
        padding: 36px 0;
        border-radius: 4px;
        margin: 30px 0;
        box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
    }
    #signupLogo {
        max-height: 100px;
        margin: auto;
        display: flex;
        flex-direction: column;
    }
    .formTitle{
        font-weight: 600;
        margin-top: 20px;
        color: #2F2D3B;
        text-align: center;
    }
    .inputLabel {
        font-size: 12px;
        color: #555;
        margin-bottom: 6px;
        margin-top: 24px;
    }
    .inputDiv {
        width: 70%;
        display: flex;
        flex-direction: column;
        margin: auto;
    }
    input {
        height: 40px;
        font-size: 16px;
        border-radius: 4px;
        border: none;
        border: solid 1px #ccc;
        padding: 0 11px;
    }
    input:disabled {
        cursor: not-allowed;
        border: solid 1px #eee;
    }
    .buttonWrapper {
        margin-top: 40px;
    }
    .submitButton {
        width: 70%;
        height: 40px;
        margin: auto;
        display: block;
        color: #fff;
        background-color: #065492;
        border-color: #065492;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
        box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
    }
    .submitButton:disabled,
    button[disabled] {
        border: 1px solid #cccccc;
        background-color: #cccccc;
        color: #666666;
    }

    #loader {
        position: absolute;
        z-index: 1;
        margin: -2px 0 0 10px;
        border: 4px solid #f3f3f3;
        border-radius: 50%;
        border-top: 4px solid #666666;
        width: 14px;
        height: 14px;
        -webkit-animation: spin 2s linear infinite;
        animation: spin 2s linear infinite;
    }
    #goHome{
        margin-top: -57px;
    }
</style>

<div class="mainDiv">
    <div class="cardStyle">
        <form action="resetPassword" method="post" id="signupForm">
            <h2 class="formTitle">Reset password</h2>
            <input type="hidden" value="${tokenGet}" name="tokenValue">
<!--            <div class="inputDiv">
                <label class="inputLabel" for="email">Enter your email again</label>
                <input type="text" id="password" name="email" required>
            </div>-->
            <div class="inputDiv">
                <label class="inputLabel" for="pass">New Password</label>
                <input type="password" id="password" name="pass" required>
            </div>
            <div class="inputDiv">
                <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPass">
            </div>

            <div class="buttonWrapper">
                <button type="submit" id="submitButton" class="submitButton pure-button pure-button-primary">
                    <span>Save</span>
                </button>
            </div>
        </form>
        <center>${message}</center>
    </div>
</div>
        <center>
            <h3 id="goHome">Go back to <a href="home">home</a></h3>
        </center>
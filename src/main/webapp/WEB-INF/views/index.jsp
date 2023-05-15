<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>

    <link rel="stylesheet" href="/assets/css/index.css">

</head>
<body>
<div class="wrapper">
    <div class="container">
        <a href="/assets/img/samjo-logo1.png"></a>
        <h1>삼조상사</h1>
        <div class="form-holder">
            <form action="" method="post">
                <div class="container">
                    <label for=><b>사원번호</b>
                        <input type="text" placeholder="사원번호를 입력해주세요" name="empNo" required>
                    </label>
                    <label for=><b>비밀번호</b>
                        <input type="password" placeholder="비밀번호를 입력해주세요" name="empPwd" required>
                    </label>
                    <button type="submit" class="submit-btn" id="login-button">로그인</button>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> 자동저장
                    </label>
                </div>
            </form>
        </div>
        <div class="container" style="background-color:#f1f1f1">
            <span class="psw"><a href="#" id="forgot-pwd"><p>비밀번호를 잊으셨나요?</p></a></span>
        </div>

    </div>
</div>
</body>
</html>
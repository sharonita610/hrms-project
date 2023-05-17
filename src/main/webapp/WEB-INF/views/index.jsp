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
    <style>
        .wrapper {
            width: 600px;
            height: 500px;
            border: 2px solid #333333;
            margin: 5% auto;
        }

        h1 {
            font-size: 1rem;
            text-align: center;
        }

        .container {
            text-align: center;

        }

    </style>

</head>
<body>
<div class="wrapper">
    <div class="container">
        <form action="/log-in">
            <div class="thumbnail-box">
                <img src="/assets/img/logo.png" alt="회사로고">
            </div>

            <h1>당신의 노고에 항상 감사드립니다</h1>
            <button id="start-btn" type="submit">시작하기</button>
        </form>
    </div>
</div>
</body>
</html>
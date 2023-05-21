<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon.png">

    <!-- 기본세팅 css	-->
    <link rel="stylesheet" href="/assets/css/common.css">
    <!-- 헤더, 배너 고정 틀용 css -->
    <link rel="stylesheet" href="/assets/css/header.css">
    <style>
        #change-phone-modal{

        }
    </style>

</head>
<body>
<header class="common_wrap">
    <div class="section-header">
        <div class="head">
            <ul>
                <li>
                    <div class="logo-img">
                        <a href="#">
                            <img src="/assets/img/samjo-logo.png" alt="로고">
                        </a>
                    </div>
                </li>
                <c:if test="${login == null}">
                    <li>삼조상사에 오신 것을 환영합니다.</li>
                </c:if>
                <c:if test="${login != null}">
                    <li>${login.empName} 님 환영합니다!!!!!</li>
                </c:if>
                <li>
                    <a href="/hrms/employees/updatePhoneNumber">
                        <span id="updateInfo-button">정보수정</span>
                    </a>

                    <a href="/log-out"><span id="logout-button">로그아웃</span></a>
                </li>

            </ul>
        </div>
    </div>
    <div class="section-sub-header">
        <div class="nav-bar">
            <ul id="tabs">
                <li><a href="hrms/main-page">HOME</a></li>
                <li id="board"><a href="hrms/board/board-list">게시판</a></li>
                <li><a href="hrms/confirm/list">결재</a></li>
                <li><a href="hrms/mail-list">메일</a></li>
                <li><a href="hrms/club/club-board-list">동호회</a></li>
            </ul>
        </div>
    </div>
</header>

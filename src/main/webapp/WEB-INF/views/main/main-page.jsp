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
    <!-- 기본세팅 css	-->
    <link rel="stylesheet" href="/assets/css/common.css">
    <!-- 헤더, 배너 고정 틀용 css -->
    <link rel="stylesheet" href="/assets/css/header-banner.css">
    <!-- 메인 페이지 list 포함 css -->
    <link rel="stylesheet" href="/assets/css/main-page.css">
</head>
<body>
<header class="common_wrap">
    <section class="section-header">
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
                <li><a href="#"><span id="logout-button">로그아웃</span></a></li>
            </ul>
        </div>
    </section>
    <section class="section-sub-header">
        <div class="nav-bar">
            <ul id="tabs">
                <li><a href="/main">HOME</a></li>
                <li><a href="/hrms/board-list">게시판</a></li>
                <li><a href="/confirm/list">결재</a></li>
                <li><a href="/hrms/mail-list">메일</a></li>
                <li><a href="#">동호회</a></li>
            </ul>
        </div>

    </section>
</header>
<!-- body-wrapper은 필수, 왼쪽 배너의 남은 부분을 나눠쓰기 위함 -->
<div id="body-wrapper">
    <section class="section-left-body">
        <div id="left-body">
            <div class="left-fix">
                <div class="information-box">
                    <ul id="profile">
                        <li id="photo"><a href="#">사원사진</a></li>
                    </ul>

                    <ul id="information">
                        <c:if test="${login != null}">
                            <li>사번: ${login.empNo}</li>
                            <li>이름: ${login.empName}</li>
                            <li>번호:
                                <span id="phoneNumberContainer">
                                    <c:choose>
                                        <c:when test="${numEditor}">
                                            <input type="text" id="phoneNumberInput" name="newPhoneNumber" value="${login.empPhone}">
                                            <button class="save-info" onclick="savePhoneNumber()">저장</button>
                                            <button class="cancel-info" onclick="cancelPhoneNumber()">취소</button>
                                        </c:when>
                                        <c:otherwise>
                                            ${login.empPhone}
                                            <button class="edit-info" onclick="editPhoneNumber()">수정</button>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </li>

                            <%--                            <li>번호:--%>
                            <%--                                    <c:choose>--%>
                            <%--                                        <c:when test="${numEditor}">--%>
                            <%--                                            <input type="text" name="newPhoneNumber" value="${login.empPhone}">--%>
                            <%--                                        </c:when>--%>
                            <%--                                        <c:otherwise>--%>
                            <%--                                            ${login.empPhone}--%>
                            <%--                                        </c:otherwise>--%>
                            <%--                                    </c:choose>--%>
                            <%--                                    ${login.empPhone}--%>
                            <%--                            </li>--%>
                            <li>부서:</li>
                            <li>직책:</li>
                        </c:if>
                        <li>
                            <form action="/change-phone">
                                <button class="change-info" type="submit">번호수정</button>
                            </form>
                            <form action="/change-pwd">
                                <button class="change-info" type="submit">비빌번호수정</button>
                            </form>
                        </li>
                    </ul>
                </div>
                <div id="calendar">
                    <%@include file="./include/calendar.jsp" %>
                </div>

            </div>
        </div>
    </section>
    <section class="main-page-list">
        <div id="main-list">
            <div id="top-list">
                <ul>
                    <li class="title-list"><h1>공지사항</h1></li>
                    <li>공지사항</li>
                    <li>공지사항</li>
                </ul>
                <ul>
                    <li class="title-list"><h1>동호회</h1></li>
                    <li>동호회</li>
                    <li>동호회</li>
                </ul>
            </div>
            <div id="bottom-list">
                <ul>
                    <li class="title-list"><h1>메일</h1></li>
                    <li>메일</li>
                    <li>메일</li>
                </ul>
                <ul>
                    <li class="title-list"><h1>결재</h1></li>
                    <li>결재</li>
                    <li>결재</li>
                </ul>
            </div>
        </div>
    </section>
</div>
</body>
<script>
    function editPhoneNumber() {
        var phoneNumberContainer = document.getElementById('phoneNumberContainer');
        var phoneNumber = '${login.empPhone}';

        var inputElement = document.createElement('input');
        inputElement.type = 'text';
        inputElement.id = 'phoneNumberInput';
        inputElement.name = 'newPhoneNumber';
        inputElement.value = phoneNumber;

        var saveButton = document.createElement('button');
        saveButton.className = 'save-info';
        saveButton.textContent = '저장';
        saveButton.onclick = savePhoneNumber;

        var cancelButton = document.createElement('button');
        cancelButton.className = 'cancel-info';
        cancelButton.textContent = '취소';
        cancelButton.onclick = cancelPhoneNumber;

        phoneNumberContainer.innerHTML = '';
        phoneNumberContainer.appendChild(inputElement);
        phoneNumberContainer.appendChild(saveButton);
        phoneNumberContainer.appendChild(cancelButton);
    }

    function savePhoneNumber() {
        var phoneNumber = document.getElementById('phoneNumberInput').value;

        fetch('/change-phone', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ phoneNumber: phoneNumber })
        })
                .then(response => {
                    if (response.ok) {
                        // 성공적으로 번호가 저장되었을 때 수행할 로직
                    } else {
                        // 에러 처리 로직
                    }
                })
                .catch(error => {
                    console.error(error);
                    // 에러 처리 로직
                });
    }

    function cancelPhoneNumber() {
        var phoneNumberContainer = document.getElementById('phoneNumberContainer');
        var phoneNumber = '${login.empPhone}';

        phoneNumberContainer.innerHTML = phoneNumber;
    }



</script>
</html>
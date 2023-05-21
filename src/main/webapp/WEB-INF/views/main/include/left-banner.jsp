<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <link rel="stylesheet" href="/assets/css/left-banner.css">

</head>
<!-- body-wrapper은 필수, 왼쪽 배너의 남은 부분을 나눠쓰기 위함 -->

<section class="section-left-body">
    <div id="left-body">
        <div class="left-fix">
            <div class="information-box">
                <ul id="profile">
                    <li id="photo"><a href="#">사원사진</a></li>
                </ul>

                <ul id="information">
                    <c:if test="${login != null}">
                        <li>사번 : ${login.empNo}</li>
                        <li>이름 : ${login.empName}</li>
                        <li>휴대폰 번호 :<br>${login.empPhone}</li>
                        <li>부서 : ${login.posCode}</li>
                        <li>직책 : ${login.roleCode}</li>
                        <li>메일 : ${login.empEmail}</li>
                    </c:if>

                </ul>

            </div>
            <div id="calendar">
                <%@include file="../include/calendar.jsp" %>
            </div>

        </div>
    </div>
</section>

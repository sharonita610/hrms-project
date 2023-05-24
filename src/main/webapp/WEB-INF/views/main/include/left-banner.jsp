<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
    <link rel="stylesheet" href="/assets/css/left-banner.css">
</head>



<section class="section-left-body">
    <div id="left-body">
        <div class="left-fix">
            <div class="information-box">
                <div id="profile">
                    <ul class="image-box">
                        <li>
                            <c:if test="${login != null && login.empGender == 'M' && login.profile == null}">
                                <img src="/assets/img/anonymous_m.png" alt="프사">
                            </c:if>
                            <c:if test="${login != null && login.empGender == 'F'  && login.profile == null}">
                                <img src="/assets/img/anonymous_w.png" alt="프사">
                            </c:if>
                            <c:if test="${login != null && login.profile != null}">
                                <img src="${login.profile}" alt="프사">
                            </c:if>
                        </li>
                    </ul>
                </div>

                <ul id="information">
                    <c:if test="${login != null}">
                        <li>사번 : ${login.empNo}</li><br>
                        <li>이름 : ${login.empName}</li><br>
                        <li id="left-banner-emp-phone">휴대폰 번호 :<br><span>${login.empPhone.replace("\"", "")}</span></li><br>
                        <li>부서 : ${login.deptName}</li><br>
                        <li>직책 : ${login.posName}</li><br>
                        <%-- <li>메일 : ${login.empEmail}</li> --%>
                    </c:if>
                </ul>
            </div>
            <div id="calendar">
                <%@include file="../include/calendar.jsp" %>
            </div>
        </div>
    </div>
</section>

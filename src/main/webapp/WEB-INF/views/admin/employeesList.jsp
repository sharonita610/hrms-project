<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/employeesList.css">

</head>
<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>

    <section class="section-admin-page">
        <div class="emp-list">
            <div id="emp-list-header">
                <h1>직원 관리 페이지</h1>

                <div class="admin-options">
                    <div class="admin-sortBy">
                        <div>전체조회</div>
                        <div>부서별조회</div>
                        <div>부서장조회</div>
                    </div>
                </div>

                <!--목록 용 태그-->
                <div id="emp-total-list">
                    <ul class = "employeeInfo">
                        <li class="empNo">사번</li>
                        <li class="empName">이름</li>
                        <li class="empBD">생년월일</li>
                        <li class="empHireD">입사일</li>
                        <li class="empMail">메일</li>
                        <li class="empGen">성별</li>
                        <li class="empSal">월급여</li>
                        <li class="empPhone">휴대폰번호</li>
                        <li class="empMyBoss">직속상사</li>
                        <li class="empDept">부서</li>
                        <li class="empPos">직급</li>
                    </ul>
                </div>
            </div>
            <!--목록 용 태그-->

            <!----------------------model----------------------------->
            <div class="emp-list-box">
                <ul class="admin-emp-list">
                    <li class="empNo">1</li>
                    <li class="empName">테스트</li>
                    <li class="empBD">2000-09-16</li>
                    <li class="empHireD">2000-02-08</li>
                    <li class="empMail">test!gmail.com</li>
                    <li class="empGen">F</li>
                    <li class="empSal">2000000</li>
                    <li class="empPhone">01000000000</li>
                    <li class="empMyBoss">부장님</li>
                    <li class="empDept">IT</li>
                    <li class="empPos">사원</li>
                </ul>


            </div>
        </div>
    </section>
</div>

<script>

    function allEmployeesRendering(){

    }




    //메인 실행부
    allEmployeesRendering();

</script>

</body>
</html>
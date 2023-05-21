<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/employeeList.css">

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
                        <div id = "viewAll">전체조회</div>
                        <select id="searchDept" class="inputblank">
                            <option value="none" selected disabled hidden>부서를 선택하세요</option>
                            <option value="001">IT</option>
                            <option value="002">HR</option>
                            <option value="003">SALES</option>
                            <option value="004">MARKETING</option>
                            <option value="005">FINANCE</option>
                            <option value="006">MANAGEMENT</option>
                        </select>
                        <div id = "viewDept">부서별조회</div>
                        <div id = viewDeptHead>부서장조회</div>
                    </div>
                    <div id = "addEmployee">사원 추가</div>
                    <div id = "searchEmployee"><h2>사원 이름으로 찾기</h2>
                    <input id = "targetEmpName" name = "empName">
<%--                        <div id = "searchBtn">검색</div>--%>
                    </div>
                </div>

                <!--목록 용 태그-->
                <div id="emp-total-list">
                    <ul class="employeeInfo">
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
            <div id = "emp-list-box" class="emp-list-box">
<%--                <ul class="admin-emp-list">--%>
                    <%--                    <li class="empNo">1</li>--%>
                    <%--                    <li class="empName">테스트</li>--%>
                    <%--                    <li class="empBD">2000-09-16</li>--%>
                    <%--                    <li class="empHireD">2000-02-08</li>--%>
                    <%--                    <li class="empMail">test!gmail.com</li>--%>
                    <%--                    <li class="empGen">F</li>--%>
                    <%--                    <li class="empSal">2000000</li>--%>
                    <%--                    <li class="empPhone">01000000000</li>--%>
                    <%--                    <li class="empMyBoss">부장님</li>--%>
                    <%--                    <li class="empDept">IT</li>--%>
                    <%--                    <li class="empPos">사원</li>--%>
<%--                </ul>--%>


            </div>
        </div>
    </section>
</div>

<script>
    const URL = '/hrms/employees';
    const $viewAll = document.getElementById('viewAll');
    const $searchDept = document.getElementById('searchDept');
    const $viewDeptHead = document.getElementById('viewDeptHead');
    // const $searchBtn = document.getElementById('searchBtn');
    const $targetName = document.getElementById('targetEmpName');

    $targetName.onkeyup = () => {
        let target = $targetName.value;
        if(target.trim().length === 0) {
            getAllEmployeesList();
        }else {

            fetch(`\${URL}/search/\${target}`)
                .then(res => res.json())
                .then(result => {
                    if (result !== null)
                        employeesRendering(result)
                });
        }
    }

    $viewAll.onclick = () => {
        getAllEmployeesList();
    }

    $viewDeptHead.onclick = () => {
        getDeptHeadList();
    }

    $searchDept.addEventListener('change', searchByDept)

    function searchByDept(){
        const selected = $searchDept.value;
        if(selected === 'none') { return; }
        fetch(`\${URL}/list/\${selected}`)
            .then(res => res.json())
            .then(result => {
                employeesRendering(result)
            });

    }

    function getAllEmployeesList() {
        fetch(`\${URL}/list/all`)
            .then(res => res.json())
            .then(result => {
                employeesRendering(result)
            });
    }

    function getDeptHeadList(){
        fetch(`\${URL}/list/head`)
            .then(res => res.json())
            .then(result => {
                employeesRendering(result)
            });
    }

    function employeesRendering(list) {

        const empList = document.getElementById('emp-list-box');
        let tag = '';
        for (const emp of list) {
            const {
                empNo, empName, empBirthDay, empHireDate,
                empEmail, empPassword, empGender, empSalary, empPhone,
                empBossName, posName, roleName, deptName, clubName
            } = emp

            const gender = empGender === 'M' ? '남자' : '여자';
            const salary = empSalary.toLocaleString();
            const myBoss = empBossName === null ? '' : empBossName

            tag += '<a href = "' + URL + '/modify/' + empNo +'">' +
                '<ul class="admin-emp-list">' +
                '<li class="empNo">' + empNo + '</li>' +
                '<li class="empName">' + empName + '</li>' +
                '<li class="empBD">' + empBirthDay + '</li>' +
                '<li class="empHireD">' + empHireDate + '</li>' +
                '<li class="empMail">' + empEmail + '</li>' +
                '<li class="empGen">' + gender + '</li>' +
                '<li class="empSal">' + salary + '</li>' +
                '<li class="empPhone">' + empPhone + '</li>' +
                '<li class="empMyBoss">' + myBoss + '</li>' +
                '<li class="empDept">' + deptName + '</li>' +
                '<li class="empPos">' + posName + '</li></ul></a>';
        }
        empList.innerHTML = tag;

    }

    document.getElementById('addEmployee').onclick = () => {
        window.location.href = URL + '/add';
    }


    //메인 실행부
    getAllEmployeesList();

</script>

</body>
</html>
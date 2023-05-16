<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/assets/css/addEmployee.css">
</head>

<body>

<div class="addEmpFormWrapper">
    <form action="/employees/add" method="post">
        <h1>사원 등록</h1>
        <div class="empProfileInput addInputForm">
            <h2>사진 : </h2>
            <input class="inputblank" id="prifileImage" name="profile" type="file" accept="image/*"
                   placeholder="홍길동">
        </div>
        <div class="empNameInput addInputForm">
            <h2>이름 : </h2>
            <input class="inputblank" type="text" name="empName" placeholder="홍길동">
        </div>
        <div class="empPhoneInput addInputForm">
            <h2>전화번호 : </h2>
            <input class="inputblank" name="empPhone" type="text" placeholder="0100000000">
        </div>
        <div class="empEmailInput addInputForm">
            <h2>이메일 : </h2>
            <input id = "setEmail" class="inputblank" type="text" name="empEmail" placeholder="hong">
            <h2 id="email-address">&nbsp;@samjosangsa.com</h2>
            <div id = "duplicatedEmail">이메일이 중복되었습니다.</div>
        </div>
        <div class="empGenderInput addInputForm">
            <h2>성별 : </h2>
            <label><input class="genderOption" type="radio" name="empGender" value="M" checked>남자</label>
            <label><input class="genderOption" type="radio" name="empGender" value="F">여자</label>
        </div>
        <div class="empBdayInput addInputForm">
            <h2>생일 : </h2><input class="inputblank" name="empBirthDay" type="date">
        </div>
        <div class="empSalaryInput addInputForm">
            <h2>급여 : </h2>
            <input class="inputblank" name="empSalary" type="text" placeholder="1000000">
        </div>
        <div class="empDeptInput addInputForm">
            <h2>부서코드 : </h2>
            <select id="setDept" class="inputblank" name="deptCode">
                <option value="none" selected disabled hidden>부서를 선택하세요</option>
                <option value="001">IT</option>
                <option value="002">HR</option>
                <option value="003">SALES</option>
                <option value="004">MARKETING</option>
                <option value="005">FINANCE</option>
                <option value="006">MANAGEMENT</option>
            </select>
        </div>
        <div class="empPosInput addInputForm">
            <h2>직급코드 : </h2>
            <select id="setPos" class="inputblank" name="posCode">
                <option value="none" selected disabled hidden>직급을 선택하세요</option>
                <option value="001">대표이사</option>
                <option value="002">부장</option>
                <option value="003">과장</option>
                <option value="004">대리</option>
                <option value="005">사원</option>
            </select>
        </div>
        <div class="empRoleInput addInputForm">
            <h2>직책코드 : </h2>
            <select class="inputblank" name="roleCode">
                <option value="none" selected disabled hidden>직책을 선택하세요</option>
                <option value="00000">관리자</option>
                <option value="11111">부서장</option>
            </select>
        </div>
        <div class="empBossInput addInputForm">
            <h2>직속상사 : </h2>
            <select id="setBoss" class="inputblank" name="empMyBoss">

            </select>
        </div>

        <div id = "emp-submit">사원 등록</div>
        <button type="submit">제출버튼</button>
    </form>
</div>

<script>
    const URL = '/employees';
    const $setDept = document.getElementById('setDept');
    const $setPos = document.getElementById('setPos');

    $setPos.addEventListener('click', setMyBoss);


    function setMyBoss() {

        if ($setDept.value === 'none' || $setPos.value === 'none') {
            return;
        }

        fetch(`\${URL}/boss/\${$setDept.value}/\${$setPos.value}`)
            .then(res => res.json())
            .then(result => {
                renderBossList(result);
            })
    }

    function renderBossList(result) {
        const $setBoss = document.getElementById('setBoss');

        let tag = '<option value = "none" selected disabled hidden>직속상사를 선택하세요</option>';
        for (const boss of result) {
            const {empName, empNo} = boss;
            tag += '<option value="' + empNo + '">' + empName + '</option>';
        }
        $setBoss.innerHTML = tag;
    }

    const $submit = document.getElementById('emp-submit');
    $submit.addEventListener('click', addEmployee);

    $emailInput = document.getElementById('setEmail');
    $emailInput.onkeyup = e => {
        const empEmail = $emailInput.value;

        fetch(`\${URL}/add/check?empMail=` + empEmail)
            .then(res => res.json())
            .then(flag => {
                if(flag){
                    //이메일이 중복되었습니다
                    const dupleMessage = document.getElementById('duplicatedEmail');
                    dupleMessage.style.display = 'block';
                }
            })
    }

    function addEmployee(){

    }
</script>

</body>
</html>
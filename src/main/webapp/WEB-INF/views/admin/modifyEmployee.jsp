<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/modifyEmployee.css">
</head>

<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>
    <div class="modiEmpFormWrapper">

        <form action="/hrms/employees/modify/${emp.empNo}" method="post" enctype="multipart/form-data">
            <h1>사원 상세 정보</h1>
            <div class="empProfileInput addInputForm">
                <h2>사진 : </h2>
                <input class="inputblank" id="profileImage" name="profile" type="file" accept="image/*" disabled>
                <div id="noPic" class="alert">사진이 선택되지 않았습니다.</div>
            </div>

            <div id="picFrame" class="profilePic"><img id="showPic" src="/hrms${emp.profile}"></div>


            <div class="empNameInput addInputForm">
                <input id = "empNo" type="hidden" name="empNo" value="${emp.empNo}">
                <h2>이름 : </h2>
                <input id="empName" class="inputblank" type="text" name="empName" value="${emp.empName}" readonly>
                <div id="noName" class="alert">최소 두 글자 이상의 이름을 입력해주세요.</div>
            </div>
            <div class="empPhoneInput addInputForm">
                <h2>전화번호 : </h2>
                <input id="empPhone" class="inputblank" name="empPhone" type="text" value="${emp.empPhone}" readonly>
                <div id="noPhone" class="alert">정확한 휴대폰 번호를 입력해주세요.</div>
            </div>
            <div class="empEmailInput addInputForm">
                <h2>이메일 : </h2>
                <input id="setEmail" class="inputblank" type="text" name="empEmail" value="${emp.empEmail}" readonly>
                <h2 id="email-address">&nbsp;@samjosangsa.com</h2>
                <div id="duplicatedEmail" class="alert">이메일이 중복되었습니다.</div>
                <div id="noEmail" class="alert">이메일을 입력해주세요.</div>
            </div>
            <div class="empPasswordInput addInputForm">
                <h2>비밀번호 : </h2>
                <input id="setPassword" class="inputblank" type="text" name="empPassword" readonly>
            </div>
            <div class="empBdayInput addInputForm">
                <h2>생일 : </h2><input id="empBirthDay" class="inputblank" name="empBirthDay" type="date"
                                     value="${emp.empBirthDay}" readonly>
                <div id="isAdult" class="alert">정확한 생년월일을 입력해주세요.</div>
            </div>
            <div class="empSalaryInput addInputForm">
                <h2>급여 : </h2>
                <input id="empSalary" class="inputblank" name="empSalary" type="text" value="${emp.empSalary}" readonly>
                <div id="payCheck" class="alert">정확한 급여를 입력해주세요</div>
            </div>
            <div class="empDeptInput addInputForm">
                <h2>부서코드 : </h2>
                <select id="setDept" class="inputblank" name="deptCode" disabled>
                    <option value="none" selected disabled hidden>부서를 선택하세요</option>
                    <option value="001">IT</option>
                    <option value="002">HR</option>
                    <option value="003">SALES</option>
                    <option value="004">MARKETING</option>
                    <option value="005">FINANCE</option>
                    <option value="006">MANAGEMENT</option>
                </select>
                <div id="noDept" class="alert">부서가 선택되지 않았습니다.</div>
            </div>
            <div class="empPosInput addInputForm">
                <h2>직급코드 : </h2>
                <select id="setPos" class="inputblank" name="posCode" disabled>
                    <option value="none" selected disabled hidden>직급을 선택하세요</option>
                    <option value="001">대표이사</option>
                    <option value="002">부장</option>
                    <option value="003">과장</option>
                    <option value="004">대리</option>
                    <option value="005">사원</option>
                </select>
                <div id="noPos" class="alert">직급이 선택되지 않았습니다.</div>
            </div>
            <div class="empRoleInput addInputForm">
                <h2>직책코드 : </h2>
                <select id="setRole" class="inputblank" name="roleCode" disabled>
                    <option value="none" selected>직책을 선택하세요</option>
                    <option value="00000">관리자</option>
                    <option value="11111">부서장</option>
                </select>
            </div>
            <div class="empBossInput addInputForm">
                <h2>직속상사 : </h2>
                <select id="setBoss" class="inputblank" name="empMyBoss" disabled>

                </select>
                <div id="noBoss" class="alert">직속상사를 선택해주세요.</div>
            </div>
            <%--        가입한 동호회 보여주기 블럭 --%>
            <div id = "clubs" class="emp-clubs addInputForm">
                <h2 id = "emp-enrolled-clubs">가입한 동호회 :</h2>
                <div id = "club-wrapper">
                </div>
            </div>
            <%--        가입한 동호회 보여주기 블럭 --%>

            <div class="goBack modi-btns" onclick="goBack()">뒤로 가기</div>
            <div id = "terminate" class = "modi-btns">사원 삭제</div>
            <div id="emp-submit" class = "modi-btns">정보 변경</div>
            <button id="modiBtn" type="submit">제출버튼</button>
        </form>

    </div>
</div>
<script>
    const URL = '/hrms/employees';
    const $setDept = document.getElementById('setDept');
    const $setPos = document.getElementById('setPos');
    const readyToAdd = [false, false, false, false, false, false, false];
    const $setBoss = document.getElementById('setBoss');
    const $profile = document.getElementById('profileImage');
    const $empName = document.getElementById('empName');
    const $empPhone = document.getElementById('empPhone');
    const $empBirthDay = document.getElementById('empBirthDay');
    const $salary = document.getElementById('empSalary');
    const $role = document.getElementById('setRole');
    const $emailInput = document.getElementById('setEmail');
    const $showPic = document.getElementById('showPic');
    const $deleteBtn = document.getElementById('terminate');
    const $submit = document.getElementById('emp-submit');
    const roleCode = "${emp.roleCode}";
    const posCode = "${emp.posCode}";
    const deptCode = "${emp.deptCode}";
    const empMyBoss = "${emp.empMyBoss}";

    //사원 삭제하기
    $deleteBtn.onclick = () => {
        let empName = document.getElementById('empName').value;
        let empNo = document.getElementById('empNo').value;
        if(!confirm(empName + ' 사원을 사원정보에서 삭제합니다.')){
            return;
        }
        window.location.href = URL + '/delete?empNo=' + empNo;
    }

    //부서 자동 선택
    const $defaultDept = document.getElementById('setDept').children;
    for (let option of $defaultDept) {
        if (option.value === deptCode) {
            option.setAttribute('selected', 'selected');
        }
    }


    //직급 자동선택
    const $defaultPos = document.getElementById('setPos').children;
    for (let option of $defaultPos) {
        if (option.value === posCode) {
            option.setAttribute('selected', 'selected');
        }
    }

    // 직책 자동 선택
    const $defaultRole = document.getElementById('setRole').children;
    for (let option of $defaultRole) {
        if (option.value === roleCode) {
            option.setAttribute('selected', 'selected');
        }
    }


    //직속상사 자동선택
    function pickMyBoss() {
        const $defaultBoss = document.getElementById('setBoss').children;
        for (let option of $defaultBoss) {
            console.log(option.value);
            if (option.value === empMyBoss) {
                option.setAttribute('selected', 'selected');
            }
        }
    }



    //입력 검증
    function readyToAddCheck() {

        //이름 검사
        if ($empName.value.trim().length >= 2) {
            document.getElementById('noName').style.display = 'none';
            readyToAdd[1] = true;
            console.log(readyToAdd[1]);
        } else {
            document.getElementById('noName').style.display = 'block';
            readyToAdd[1] = false;
            console.log(readyToAdd[1]);
        }


        //전화번호 검사

        if ($empPhone.value.trim().length >= 10) {
            document.getElementById('noPhone').style.display = 'none';
            readyToAdd[2] = true;
            console.log(readyToAdd[2]);
        } else {
            document.getElementById('noPhone').style.display = 'block';
            readyToAdd[2] = false;
            console.log(readyToAdd[2]);
        }

        //이메일 검사

        const empEmail = $emailInput.value;
        if (empEmail.trim().length !== 0) {
            document.getElementById('noEmail').style.display = 'none';
            readyToAdd[3] = true;
            console.log(readyToAdd[3]);
        } else {
            readyToAdd[3] = false;
            document.getElementById('noEmail').style.display = 'block';
            console.log(readyToAdd[3]);

        }


        //생일 검사
        const bday = $empBirthDay.value;
        if (bday.trim().length !== 0) {

            const today = new Date();
            const year = today.getFullYear(); // 년도
            console.log(year);
            const empBorn = +bday.substring(0, 4);
            console.log(empBorn);
            const age = year - empBorn + 1;

            if (+age >= 20) {
                readyToAdd[4] = true;
                document.getElementById('isAdult').style.display = 'none';
                console.log(readyToAdd[4]);
            } else {
                readyToAdd[4] = false;
                document.getElementById('isAdult').style.display = 'block';
                console.log(readyToAdd[4]);
            }
        } else {
            readyToAdd[4] = false;
            document.getElementById('isAdult').style.display = 'block';
            console.log(readyToAdd[4]);
        }

        //급여 검사

        const wage = +$salary.value;
        if (wage >= 2010580) {
            console.log(wage);
            readyToAdd[5] = true;
            document.getElementById('payCheck').style.display = 'none';
            console.log(readyToAdd[5]);
        } else {
            console.log(wage);
            readyToAdd[5] = false;
            document.getElementById('payCheck').style.display = 'block';
            console.log(readyToAdd[5]);
        }

        //부서코드 검사
        if ($setDept.value === 'none') {
            document.getElementById('noDept').style.display = 'block';
            readyToAdd[6] = false;
            console.log(readyToAdd[6]);

        } else {
            readyToAdd[6] = true;
            document.getElementById('noDept').style.display = 'none';
        }


        //직급코드 검사
        if ($setPos.value === 'none') {
            readyToAdd[0] = false;
            document.getElementById('noPos').style.display = 'block';
            console.log(readyToAdd[0]);
        } else {
            readyToAdd[0] = true;
            console.log(readyToAdd[0]);
            document.getElementById('noPos').style.display = 'none';
        }

    }

    //프로필 사진 입력
    $profile.onchange = () => {

        const $file = $profile.files[0];
        const reader = new FileReader();
        reader.readAsDataURL($file);

        reader.onloadend = e => {
            $showPic.removeAttribute('src');
            $showPic.setAttribute('src', reader.result);
        }


    }

    //이름 입력했는지 검사 -> 두글자 이상일때 true

    $empName.onkeyup = () => {
        if ($empName.value.trim().length >= 2) {
            document.getElementById('noName').style.display = 'none';
            readyToAdd[1] = true;
            console.log(readyToAdd[1]);
        } else {
            document.getElementById('noName').style.display = 'block';
            readyToAdd[1] = false;
            console.log(readyToAdd[1]);
        }
    }

    //전화번호 입력 검사 -> 10자 이상일때 통과 조건

    $empPhone.onkeyup = () => {
        if ($empPhone.value.trim().length >= 10) {
            document.getElementById('noPhone').style.display = 'none';
            readyToAdd[2] = true;
            console.log(readyToAdd[2]);
        } else {
            document.getElementById('noPhone').style.display = 'block';
            readyToAdd[2] = false;
            console.log(readyToAdd[2]);
        }
    }

    //생년월일 입력 검사 -> 입력 되었는지 여부 && 20세 이상 여부

    $empBirthDay.onchange = () => {
        const bday = $empBirthDay.value;
        if (bday.trim().length !== 0) {

            const today = new Date();
            const year = today.getFullYear(); // 년도
            console.log(year);
            const empBorn = +bday.substring(0, 4);
            console.log(empBorn);
            const age = year - empBorn + 1;

            if (+age >= 20) {
                readyToAdd[4] = true;
                document.getElementById('isAdult').style.display = 'none';
                console.log(readyToAdd[4]);
            } else {
                readyToAdd[4] = false;
                document.getElementById('isAdult').style.display = 'block';
                console.log(readyToAdd[4]);
            }
        } else {
            readyToAdd[4] = false;
            document.getElementById('isAdult').style.display = 'block';
            console.log(readyToAdd[4]);
        }
    }

    //급여검사 -> 최저임금 이상이어야 통과!
    $salary.onkeyup = () => {
        const wage = +$salary.value;
        if (wage >= 2010580) {
            console.log(wage);
            readyToAdd[5] = true;
            document.getElementById('payCheck').style.display = 'none';
            console.log(readyToAdd[5]);
        } else {
            console.log(wage);
            readyToAdd[5] = false;
            document.getElementById('payCheck').style.display = 'block';
            console.log(readyToAdd[5]);
        }
    }

    //부서, 직급 선택시 마이보스 선택란에 같은 부서 내 윗직급 리스트 불러오기
    $setPos.addEventListener('change', setMyBoss);
    $setDept.addEventListener('change', setMyBoss);

    function setMyBoss() {

        if ($setDept.value === 'none') {
            readyToAdd[6] = false;
            document.getElementById('noDept').style.display = 'block';
            console.log(readyToAdd[6])
        } else {
            readyToAdd[6] = true;
            console.log(readyToAdd[6]);
            document.getElementById('noDept').style.display = 'none';
        }

        if ($setPos.value === 'none') {
            readyToAdd[0] = false;
            document.getElementById('noPos').style.display = 'block';
            console.log(readyToAdd[0])
        } else {
            readyToAdd[0] = true;
            document.getElementById('noPos').style.display = 'none';
            console.log(readyToAdd[0]);
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

        pickMyBoss();
    }


    //이메일 중복 여부 검사
    $emailInput.onkeyup = () => {

        const empEmail = $emailInput.value;
        if (empEmail.trim().length !== 0) {
            document.getElementById('noEmail').style.display = 'none';
            readyToAdd[3] = true;
            console.log(readyToAdd[3]);
        } else {
            readyToAdd[3] = false;
            document.getElementById('noEmail').style.display = 'block';
            console.log(readyToAdd[3]);

        }

        fetch(`\${URL}/add/check?empEmail=` + empEmail)
            .then(res => res.json())
            .then(flag => {
                const dupleMessage = document.getElementById('duplicatedEmail');
                if (flag) {
                    //이메일이 중복되었습니다 메세지 출력
                    dupleMessage.style.display = 'block';
                    readyToAdd[3] = false;
                    console.log(readyToAdd[3]);

                    const empEmail = $emailInput.value;
                    if (empEmail.trim().length !== 0) {
                        document.getElementById('noEmail').style.display = 'none';
                        readyToAdd[3] = true;
                        console.log(readyToAdd[3]);
                    } else {
                        readyToAdd[3] = false;
                        document.getElementById('noEmail').style.display = 'block';
                        console.log(readyToAdd[3]);
                    }

                } else {
                    //이메일이 중복되었습니다 메세지 숨김
                    dupleMessage.style.display = 'none';
                    if (empEmail.trim().length !== 0) {
                        readyToAdd[3] = true;
                        console.log(readyToAdd[3]);
                    } else {
                        readyToAdd[3] = false;
                        console.log(readyToAdd[3]);
                    }
                }
            })

    }

    // 사원 정보 변경하기 버튼 클릭 -> readonly제거
    $submit.addEventListener('click', writeNewInfo);

    function writeNewInfo(){
        $submit.classList.add('change-submit');
        $submit.innerText = '변경 적용';
        document.getElementById('profileImage').removeAttribute('disabled');
        document.getElementById('empName').removeAttribute('readonly');
        document.getElementById('empPhone').removeAttribute('readonly');
        document.getElementById('setEmail').removeAttribute('readonly');
        document.getElementById('setPassword').removeAttribute('readonly');
        document.getElementById('empBirthDay').removeAttribute('readonly');
        document.getElementById('empSalary').removeAttribute('readonly');
        document.getElementById('setDept').removeAttribute('disabled');
        document.getElementById('setPos').removeAttribute('disabled');
        document.getElementById('setRole').removeAttribute('disabled');
        document.getElementById('setBoss').removeAttribute('disabled');
        document.querySelector('.change-submit').addEventListener('click', modiEmployee);
    }


    //정보 체크 후 변경 디비에 반영

    function modiEmployee() {
        readyToAddCheck();

        let flag = true;
        for (const check of readyToAdd) {
            if (check === false) {
                flag = false;
            }
        }
        if (flag) {
            if(!confirm('사원 정보를 수정합니다.')){
                return;
            }
            document.getElementById('modiBtn').click();
        }
    }

    function goBack() {
        window.location.href = '/hrms/employees/list';
    }

    //동호회 불러오기
    function getMyClubList(){
        fetch('/hrms/club/myclubList/${empNo}')
            .then(res => res.json())
            .then(result => {
                clubRendering(result)
            })
    }

    //동호회 렌더링
    function clubRendering(result){
        const clubs = document.getElementById('club-wrapper');
        let tag = '';
        tag += '<ul id = "joined-club-list">';
        for (let club of result) {
            const {ecIndex, empJoinDate, empNo, clubCode, clubName} = club;
            tag += '<li class = "enrolled-club" name="empClub" value = "' + clubCode + '">' + clubName + '</li>';
        }
        tag += '</ul>';
        clubs.innerHTML = tag;
    }

    //메인실행부
    setMyBoss();
    getMyClubList();

</script>

</body>
</html>

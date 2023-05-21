<%@ page import="com.hrms.project4th.mvc.dto.responseDTO.LoginUserResponseDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <%@ include file="../main/include/header.jsp" %>

    <style>
        #body-wrapper {
            overflow: hidden;
        }

        .modify-my-info-wrapper {
            width: 800px;
            margin-top: 100px;
            margin-left: 480px;
            height: 550px;
            padding: 20px 10px 30px 10px;
            position: relative;
            border: 1px solid #000;

        }

        .modify-my-info-wrapper h1 {
            font-size: 2em;
            font-weight: 800;
        }

        .modify-informations {
            width: 100%;
            display: flex;
            flex-direction: row;
            margin-top: 80px;
        }

        #change-pwd, #change-phone {
            margin-top: 10px;
        }

        #change-phone-modal {
            width: 450px;
            height: 250px;
            margin: -50% 19%;
            background: #ffff;
            position: absolute;

            border: 4px solid rgba(190, 193, 194, 0.49);
            border-right: 5px solid rgba(190, 193, 194, 0.89);
            border-bottom: 5px solid rgba(190, 193, 194, 0.49);

        }

        #change-pwd-modal {
            width: 450px;
            height: 380px;
            margin: -50% 19%;
            background: #ffff;
            position: absolute;

            border: 4px solid rgba(190, 193, 194, 0.49);
            border-right: 5px solid rgba(190, 193, 194, 0.89);
            border-bottom: 5px solid rgba(190, 193, 194, 0.49);
        }

        #change-phone-input {
            width: 350px;
            height: 40px;
            margin: 0 auto;
            border: 2px solid #3333;
            font-size: 1.2rem;
        }

        .change-info-box {
            width: 90%;
            margin: 50px auto 50px;
            display: flex;
            flex-direction: column;
        }

        .change-pwd-box {
            width: 90%;
            margin: 50px auto 50px;
            display: flex;
            flex-direction: column;

        }

        .change-pwd-box label h3, .change-info-box label h3 {
            padding: 5px 0;
            margin: 0;
            font-size: 1em;
        }

        .change-info-buttons {
            display: flex;
            justify-content: right;

            flex-direction: row;
        }

        .change-pwd-buttons {
            display: flex;
            justify-content: right;

        }


        #change-pwd-input, #check-pwd-input {
            width: 350px;
            height: 40px;
            margin: 0 auto;
            border: 2px solid #3333;
            font-size: 1.2rem;
        }

        .modify-my-info-Subtitle {
            text-align: center;

        }

        #savePhone-button, #cancelChangePhone-button {
            width: 80px;
            height: 40px;
            margin-right: 20px;

            border: 4px solid rgba(190, 193, 194, 0.49);
            border-radius: 25px;
            background: #cdcdcd;

            cursor: pointer;
        }

        #savePwd-button, #cancelChangePwd-button {
            margin-right: 20px;
            margin-top: 20px;
            width: 100px;
            height: 40px;
            border: 4px solid rgba(190, 193, 194, 0.49);
            border-radius: 25px;
            background: #cdcdcd;

            cursor: pointer;
        }

        .modify-my-info-wrapper #change-phone, #change-pwd {
            width: 40%;
            margin: 0 auto 30px;
            display: flex;
            flex-direction: column;
            border: 2px solid #333333;
        }

        .modify-my-info-wrapper #change-phone label, #change-pwd label {
            font-size: 1.4em;
            font-weight: 700;
            margin: 0 auto;

        }

        #phone-img {
            width: 100px;
            height: 160px;
            margin: 20px auto 0;
        }

        #pwd-img {
            width: 200px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>
    <div class="modify-my-info-wrapper">
        <h1 class="modify-my-info-title">수정할 정보 선택</h1><br>
        <div class="modify-informations">
            <div id="change-phone">
                <label>휴대폰 번호 변경하기</label>
                <img id="phone-img" src="/assets/img/phone-img.png" alt="휴대폰사진">
            </div>
            <div id="change-pwd">
                <label>비밀번호 변경하기</label>
                <img id="pwd-img" src="/assets/img/pwd-img.png" alt="휴대폰사진">
            </div>

        </div>
        <button id="back-button" onclick="history.back()">뒤로가기</button>


        <div id="change-phone-modal" style="display: none;">
            <h2 class="modify-my-info-Subtitle">새로운 휴대폰 번호를 입력해주세요</h2>
            <div class="change-info-box">'{login.empEmail}'
                <label for="change-phone-input"><h3>새로운 휴대폰 번호 : </h3></label>
                <input type="text" id="change-phone-input" placeholder="${login.empPhone}"><br>
                <div class="change-info-buttons">
                    <button id="savePhone-button">저장</button>
                    <button id="cancelChangePhone-button" onclick="history.back()">취소</button>
                </div>
            </div>
        </div>
        <div id="change-pwd-modal" style="display: none;">
            <h2 class="modify-my-info-Subtitle">새로운 비밀번호를 입력해주세요</h2>
            <div class="change-pwd-box">
                <label for="change-pwd-input"><h3>새 비밀번호 : </h3></label>
                <input type="text" id="change-pwd-input" name="empPwd" placeholder="새 비밀번호입력"><br>

                <label for="check-pwd-input"><h3>비밀번호 재확인 : </h3></label>
                <input type="text" id="check-pwd-input" name="empPwd_check" placeholder="새 비밀번호 재확인"><br>
                <div class="change-pwd-buttons">
                    <button id="savePwd-button">저장</button>
                    <button id="cancelChangePwd-button">취소</button>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
<script>

    // "휴대폰 번호 변경하기" 사진 주변 클릭 시 모달 창 열기
    const $updateInfoButton = document.getElementById('change-phone');
    const $changeInfoImage = document.getElementById('phone-img');
    const $cancelInfoChange = document.getElementById('cancelChangePhone-button');

    $updateInfoButton.onclick = e => {
        e.preventDefault();

        $changeInfoImage.click();
        const $modal = document.getElementById('change-phone-modal');
        $modal.style.display = 'block';
    };

    // 취소 버튼 클릭 시 모달창 닫기
    $cancelInfoChange.onclick = e => {
        e.preventDefault();

        const $closeModal = document.getElementById('change-phone-modal');
        $closeModal.style.display = 'none';

    };

    // // 저장 버튼 클릭 시 개인정보 수정 비동기 처리
    function updatePhoneClickEvent() {


        const $saveButton = document.getElementById('savePhone-button');


        $saveButton.onclick = e => {


            // 변경된 휴대폰 번호를 가져오는 코드
            const $phoneInput = document.getElementById('change-phone-input');
            const newPhoneNumber = $phoneInput.value;


            // rest api로 처리하기
            fetch('/hrms/employees/updatePhoneNumber', {
                method: 'PUT',
                headers: {
                    'Content-type': 'application/json'
                },
                body: JSON.stringify({newPhoneNumber})
            })
            .then(response => {
                if (response.ok) {
                    // 처리가 200번대라면
                    alert('휴대폰 번호가 업데이트 되었습니다.');
                } else {
                    alert('업데이트에 실패 했습니다');
                }
            }).catch(error => {
                console.error('Error occurred:', error);
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            });

        };
    }


    // "비밀번호 수정" 사진 주변 클릭 시 모달 창 열기
    const $updatePwdButton = document.getElementById('change-pwd');
    const $changePwdImage = document.getElementById('pwd-img');
    const $cancelPwdChange = document.getElementById('cancelChangePwd-button');


    $updatePwdButton.onclick = e => {
        e.preventDefault();
        $changePwdImage.click();
        const $pwdModal = document.getElementById('change-pwd-modal');
        $pwdModal.style.display = 'block';
        // console.log('check');
    };


    $cancelPwdChange.onclick = e => {
        e.preventDefault();

        const $closePwdModal = document.getElementById('change-pwd-modal');
        $closePwdModal.style.display = 'none';
    };

    (function () {
        updatePhoneClickEvent();
    })();
</script>


</html>

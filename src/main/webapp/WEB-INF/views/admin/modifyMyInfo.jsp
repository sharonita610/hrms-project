<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>

    <style>
        #body-wrapper {
            overflow: hidden;
        }

        .modify-my-info-wrapper {
            width: 40%;
            margin: 100px auto;
            height: 550px;
            padding: 20px 10px 30px 10px;
            position: relative;
            border: 1px solid #000;

        }

        .modify-my-info-wrapper h1 {
            font-size: 1.2em;
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

        #change-phone-modal, #check-currentPwd-modal {
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

        .change-info-box, .check-currentPwd-box {
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


        #change-pwd-input, #check-pwd-input, #change-phone-input, #currentPwd-input {
            width: 350px;
            height: 40px;
            margin: 0 auto;
            border: 2px solid #3333;
            font-size: 1.2rem;
        }

        #check-currentPwd-box label {
            margin-left: 20px;
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

        #savePwd-button, #cancelChangePwd-button, #check-currentPwd-button, #cancel-currentPwd-button {
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
        <form action="/hrms/main-page" method="get">
            <button id="save-changes-button" type="submit">확인</button>
        </form>

        <div id="check-currentPwd-modal" style="display: none;">
            <h2 class="modify-my-info-Subtitle"><br><br>수정을 위해 비밀번호를 입력해주세요</h2>
            <div class="check-currentPwd-box">
                <label for="currentPwd-input"><h3>기존 비밀번호 : </h3></label>
                <input type="password" id="currentPwd-input" placeholder="비밀번호를 입력하세요"><br>
                <div class="change-info-buttons">
                    <button id="check-currentPwd-button">확인</button>
                    <button id="cancel-currentPwd-button">취소</button>
                </div>
            </div>
        </div>


        <div id="change-phone-modal" style="display: none;">
            <h2 class="modify-my-info-Subtitle">새로운 휴대폰 번호를 입력해주세요</h2>
            <div class="change-info-box">
                <c:if test="${login != null}">

                    <label for="change-phone-input"><h3>새로운 휴대폰 번호 : </h3></label>
                    <input type="text" id="change-phone-input" placeholder="${login.empPhone}"><br>
                </c:if>
                <div class="change-info-buttons">
                    <button id="savePhone-button">저장</button>
                    <button id="cancelChangePhone-button" onclick="history.back()">취소</button>
                </div>
            </div>
        </div>




        <div id="change-pwd-modal" style="display: none;">
            <h2 class="modify-my-info-Subtitle"><br><br>새로운 비밀번호를 입력해주세요</h2>
            <div class="change-pwd-box">
                <label for="change-pwd-input"><h3>새 비밀번호 : </h3><br>
                    <input type="text" id="change-pwd-input" name="empPwd" placeholder="새 비밀번호입력"><br><br>
                </label>
                <label for="check-pwd-input"><h3>비밀번호 재확인 : </h3><br>
                    <input type="text" id="check-pwd-input" name="empPwd_check" placeholder="새 비밀번호 재확인"><br>
                </label>
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
    const $updatePhoneModal = document.getElementById('change-phone-modal');
    const $closeUpdatePhoneModal = document.getElementById('change-phone-modal');

    const $currentPwdModal = document.getElementById('check-currentPwd-modal');
    const $checkCurrentPwdButton = document.getElementById('check-currentPwd-button');
    const $cancelCurrentPwdButton = document.getElementById('cancel-currentPwd-button');


    $updateInfoButton.onclick = e => {
        e.preventDefault();

        $changeInfoImage.click();
        // $currentPwdModal.style.display = 'block';
        $updatePhoneModal.style.display = 'block';
    };
    // 취소 버튼 클릭 시 모달창 닫기
    $cancelCurrentPwdButton.onclick = e => {
        e.preventDefault();

        // $currentPwdModal.style.display = 'none';
        $updatePhoneModal.style.display = 'none';
    };
    // function checkCurrentPassword() {
    //
    //     $checkCurrentPwdButton.onclick = e => {
    //         e.preventDefault();
    //
    //
    //         // 현재 비밀번호 입력값 가져오기
    //         const currentPwd = document.getElementById('currentPwd-input').value;
    //
    //         console.log(currentPwd);
    //         // 서버로 currentPwd 값을 전송하여 확인하는 로직
    //         fetch('/hrms/employees/checkCurrentPassword', {
    //             method: 'POST',
    //             headers: {
    //                 'Content-Type': 'application/json'
    //             },
    //             body: JSON.stringify({ currentPwd: currentPwd })
    //         })
    //                 .then(response => {
    //                     if (response.ok) {
    //                         // 비밀번호 확인 성공
    //                         $currentPwdModal.style.display = 'none';
    //                         $updatePhoneModal.style.display = 'block';
    //                     } else {
    //                         // 비밀번호 확인 실패
    //                         alert('비밀번호가 일치하지 않습니다.');
    //                     }
    //                 })
    //                 .catch(error => {
    //                     console.error('Error occurred:', error);
    //                     alert('오류가 발생했습니다. 다시 시도해주세요.');
    //                 });
    //     };
    // }


    // 취소 버튼 클릭 시 모달창 닫기
    $cancelInfoChange.onclick = e => {
        e.preventDefault();

        $closeUpdatePhoneModal.style.display = 'none';


    };

    // 저장 버튼 클릭 시 개인정보 수정 비동기 처리
    function updatePhoneClickEvent() {

        const $saveButton = document.getElementById('savePhone-button');

        $saveButton.onclick = e => {

            // 변경된 휴대폰 번호를 가져오는 코드
            const newPhoneNumber = document.getElementById('change-phone-input').value;

            // rest api로 처리하기
            fetch('/hrms/employees/updatePhoneNumber', {
                method: 'PUT',
                headers: {
                    'Content-type': 'application/json'
                },
                body: JSON.stringify(newPhoneNumber)
            })
                    .then(response => {
                        if (response.ok) {
                            // 처리가 200번대라면
                            alert('휴대폰 번호가 업데이트 되었습니다.');
                            document.getElementById('left-banner-emp-phone').querySelector('span').textContent = newPhoneNumber;
                            // location.reload();
                            $closeUpdatePhoneModal.style.display = 'none';
                        } else {
                            alert('업데이트에 실패 했습니다');
                        }
                    }).catch(error => {
                console.error('Error occurred:', error);
                alert('오류가 발생했습니다. 다시 시도해주세요.');
            });

        };
    }
    //
    // function changePasswordWithCheck() {
    //     // "비밀번호 수정" 사진 주변 클릭 시 모달 창 열기
    //     const $changePwdModal = document.getElementById('change-pwd-modal');
    //     const $savePwdButton = document.getElementById('savePwd-button');
    //     const $cancelChangePwdButton = document.getElementById('cancelChangePwd-button');
    //     const $updatePwdButton = document.getElementById('change-pwd');
    //     const $changePwdImage = document.getElementById('pwd-img');
    //
    //
    //     $updatePwdButton.onclick = e => {
    //         e.preventDefault();
    //
    //         $changePwdImage.click();
    //         $changePwdModal.style.display = 'block';
    //     };
    //     // 취소
    //     // 버튼 클릭 시 모달창 닫기
    //     $cancelChangePwdButton.onclick = e => {
    //         e.preventDefault();
    //
    //         $changePwdModal.style.display = 'none';
    //
    //     };
    //
    //
    //     // 비밀번호 유효성 검사 등 필요한 로직 추가
    //     // 패스워드 검사 정규표현식
    //     // 패스워드 검사 정규표현식
    //     const passwordPattern = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
    //
    //     // 새 비밀번호 입력 필드
    //     const $changePwdInput = document.getElementById('change-pwd-input');
    //
    //     $changePwdInput.onkeyup = () => {
    //         const newPassword = $changePwdInput.value;
    //
    //         if (newPassword.trim() === '') {
    //             $changePwdInput.style.borderColor = 'red';
    //             document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[비밀번호는 필수값입니다!]</b>';
    //         } else if (!passwordPattern.test(newPassword)) {
    //             $changePwdInput.style.borderColor = 'red';
    //             document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[특수문자 포함 8자 이상!]</b>';
    //         } else {
    //             $changePwdInput.style.borderColor = 'skyblue';
    //             document.getElementById('check-pwd-input').textContent = '<b style="color: skyblue;">[사용가능한 비밀번호입니다.]</b>';
    //         }
    //     };
    //
    //
    //
    //     $checkPwdInput.onkeyup = () => {
    //         const checkPassword = $checkPwdInput.value;
    //
    //         if (checkPassword.trim() === '') {
    //             $checkPwdInput.style.borderColor = 'red';
    //             document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[비밀번호 확인란은 필수값입니다!]</b>';
    //         } else if (checkPassword !== $changePwdInput.value) {
    //             $checkPwdInput.style.borderColor = 'red';
    //             document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[위에랑 똑같이 쓰세요!]</b>';
    //         } else {
    //             $checkPwdInput.style.borderColor = 'skyblue';
    //             document.getElementById('check-pwd-input').textContent = '<b style="color: skyblue;">[참 잘했어요~]</b>';
    //         }
    //     };
    //
    // }
    //
    //
    // function updatePassword(newPassword) {
    //     $changePwdModal = document.getElementById('change-pwd-modal');
    //     fetch('/hrms/employees/updatePassword', {
    //         method: 'PUT',
    //         headers: {
    //             'Content-Type': 'application/json'
    //         },
    //         body: JSON.stringify(newPassword)
    //     })
    //             .then(response => {
    //                 if (response.ok) {
    //                     alert('비밀번호가 업데이트되었습니다.');
    //                     $changePwdModal.style.display = 'none';
    //
    //                 } else {
    //                     alert('비밀번호 업데이트에 실패하였습니다.');
    //                 }
    //             })
    //             .catch(error => {
    //                 console.error('Error occurred:', error);
    //                 alert('오류가 발생했습니다. 다시 시도해주세요.');
    //             });
    //
    // }



    const $changePwdModal = document.getElementById('change-pwd-modal');
    const $savePwdButton = document.getElementById('savePwd-button');
    const $cancelChangePwdButton = document.getElementById('cancelChangePwd-button');
    const $updatePwdButton = document.getElementById('change-pwd');
    const $changePwdImage = document.getElementById('pwd-img');

    $updatePwdButton.onclick = e => {
        e.preventDefault();

        $changePwdImage.click();
        // $currentPwdModal.style.display = 'block';
        $changePwdModal.style.display = 'block';
    };
    // 취소 버튼 클릭 시 모달창 닫기
    $cancelChangePwdButton.onclick = e => {
        e.preventDefault();

        // $currentPwdModal.style.display = 'none';
        $changePwdModal.style.display = 'none';
    };


    // $updatePwdButton.onclick = e => {
    //     e.preventDefault();
    //     $changePwdImage.click();
    //     const $pwdModal = document.getElementById('change-pwd-modal');
    //     $pwdModal.style.display = 'block';
    //     // console.log('check');
    // };

    function changePasswordWithCheck() {
        // "비밀번호 수정" 사진 주변 클릭 시 모달 창 열기
        const $changePwdModal = document.getElementById('change-pwd-modal');
        const $savePwdButton = document.getElementById('savePwd-button');
        const $cancelChangePwdButton = document.getElementById('cancelChangePwd-button');
        const $updatePwdButton = document.getElementById('change-pwd');
        const $changePwdImage = document.getElementById('pwd-img');

        $updatePwdButton.onclick = e => {
            e.preventDefault();
            $changePwdImage.click();
            $changePwdModal.style.display = 'block';
        };

        // 취소 버튼 클릭 시 모달창 닫기
        $cancelChangePwdButton.onclick = e => {
            e.preventDefault();
            $changePwdModal.style.display = 'none';
        };

        // 새 비밀번호 입력 필드
        const $changePwdInput = document.getElementById('change-pwd-input');
        const $checkPwdInput = document.getElementById('check-pwd-input');

        $changePwdInput.onkeyup = () => {
            const newPassword = $changePwdInput.value;

            if (newPassword.trim() === '') {
                $changePwdInput.style.borderColor = 'red';
                document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[비밀번호는 필수값입니다!]</b>';
            } else if (!passwordPattern.test(newPassword)) {
                $changePwdInput.style.borderColor = 'red';
                document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[특수문자 포함 8자 이상!]</b>';
            } else {
                $changePwdInput.style.borderColor = 'skyblue';
                document.getElementById('check-pwd-input').textContent = '<b style="color: skyblue;">[사용가능한 비밀번호입니다.]</b>';
            }
        };

        $checkPwdInput.onkeyup = () => {
            const checkPassword = $checkPwdInput.value;

            if (checkPassword.trim() === '') {
                $checkPwdInput.style.borderColor = 'red';
                document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[비밀번호 확인란은 필수값입니다!]</b>';
            } else if (checkPassword !== $changePwdInput.value) {
                $checkPwdInput.style.borderColor = 'red';
                document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[위에랑 똑같이 쓰세요!]</b>';
            } else {
                $checkPwdInput.style.borderColor = 'skyblue';
                document.getElementById('check-pwd-input').textContent = '<b style="color: skyblue;">[참 잘했어요~]</b>';
            }
        };

        // 비밀번호 저장 버튼 클릭 시 업데이트
        $savePwdButton.onclick = e => {
            e.preventDefault();
            const newPassword = $changePwdInput.value;

            // 여기서 newPassword를 서버로 전송하여 비밀번호를 업데이트하는 로직을 수행
            updatePassword(newPassword);
        };
    }

    function updatePassword(newPassword) {
        const $changePwdModal = document.getElementById('change-pwd-modal');
        fetch('/hrms/employees/updatePassword', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newPassword)
        })
                .then(response => {
                    if (response.ok) {
                        alert('비밀번호가 업데이트되었습니다.');
                        $changePwdModal.style.display = 'none';
                    } else {
                        alert('비밀번호 업데이트에 실패하였습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error occurred:', error);
                    alert('오류가 발생했습니다. 다시 시도해주세요.');
                });
    }

    // $cancelPwdChange.onclick = e => {
    //     e.preventDefault();
    //
    //     const $closePwdModal = document.getElementById('change-pwd-modal');
    //     $closePwdModal.style.display = 'none';
    // };

    (function () {
        // checkCurrentPassword();
        updatePhoneClickEvent();
        changePasswordWithCheck();
    })();
</script>


</html>

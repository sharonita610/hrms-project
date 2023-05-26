<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
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





    // $updatePwdButton.onclick = e => {
    //     e.preventDefault();

    //     $changePwdImage.click();
    //     // $currentPwdModal.style.display = 'block';
    //     $changePwdModal.style.display = 'block';
    // };
    // 취소 버튼 클릭 시 모달창 닫기
    // $cancelChangePwdButton.onclick = e => {
    //     e.preventDefault();

    //     // $currentPwdModal.style.display = 'none';
    //     $changePwdModal.style.display = 'none';
    // };


    // $updatePwdButton.onclick = e => {
    //     e.preventDefault();
    //     $changePwdImage.click();
    //     const $pwdModal = document.getElementById('change-pwd-modal');
    //     $pwdModal.style.display = 'block';
    //     // console.log('check');
    // };

          // // "비밀번호 수정" 사진 주변 클릭 시 모달 창 열기
        // const $changePwdModal = document.getElementById('change-pwd-modal');
        // const $savePwdButton = document.getElementById('savePwd-button');
        // const $cancelChangePwdButton = document.getElementById('cancelChangePwd-button');
        // const $updatePwdButton = document.getElementById('change-pwd');
        // const $changePwdImage = document.getElementById('pwd-img');

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
    // else if (!passwordPattern.test(newPassword)) {
            //     $changePwdInput.style.borderColor = 'red';
            //     document.getElementById('check-pwd-input').textContent = '<b style="color: red;">[특수문자 포함 8자 이상!]</b>';
            // } 

    </script>
    
</body>
</html>
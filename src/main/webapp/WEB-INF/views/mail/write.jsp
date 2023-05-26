<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="/assets/css/mail.css">
    <link rel="stylesheet" href="/assets/css/mailwrite.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%@ include file="../main/include/header.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
    </script>
</head>

<body>
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>

        <div id="body-wrapper">
            <section class="section-mail">
                <div id="mail-wrapper">
                    <div class="mail-sort">
                        <div><a href="/hrms/mail-list/?empNo=${login.empNo}&mailType=mailto">받은 메일</a></div>
                        <div><a href="/hrms/mail-list/?empNo=${login.empNo}&mailType=mailfrom">보낸 메일</a></div>
                        <div><a href="/hrms/mail-list-status/?empNo=${login.empNo}&status=Y&mailType=mailto">읽은 메일</a></div>
                        <div><a href="/hrms/mail-list-status/?empNo=${login.empNo}&status=N&mailType=mailto">안읽은 메일</a></div>
                        <div><a href="/hrms/mail-write?empNo=${login.empNo}">메일쓰기</a></div>
                    </div>
                    <form class="mail-detail-box" method="POST" action="/hrms/mail-send">
                        <div class="mail-header-title">
                            <div class="headerbox">
                                <div style="width: 10%; line-height: 28px;">메일 제목 : </div><input style="width: 90%;" type="text" id="title" name="mailTitle" value="">
                            </div>
                        </div>
                        <div class="employeesinfo">
                            <div class="senderinfo">
                                <span>발신자 정보</span>
                                <div class="senderempNo">발신자 사번 : <input  type="number" name="mailFrom" value="${empNo}" readonly></div>
                                <div class="sendername">${info.empName}</div>
                                <div class="senderemail">${info.empEmail}</div>
                                <div class="senderdeptname">${info.deptName}</div>
                                <div class="senderposname">${info.posName}</div>
                            </div>
                            <div class="reciverinfo">
                                <span>수신자 정보</span>
                                <div class="reciverempNo">수신자 사번 : <input class="inputreceiverno" type="number" name="mailTo" value="" readonly></div>
                                <div class="recivername"></div>
                                <div class="reciveremail"></div>
                                <div class="reciverdeptname"></div>
                                <div class="reciverposname"></div>
                                <div class="search">
                                        <input  id="exampleDataList" class="form-control form-control-sm" type="text" placeholder="이름을입력하세요" aria-label=".form-control-sm example" style="width: 30%;">
                                        <button type="button" class="btn btn-primary searchbutton" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem; width: 15%;">검 색</button>
                                        <select name="" id="select" style="width: 55%;"></select>
                                </div>
                            </div>
                        </div>
                        <div class="form-floating">
                            <textarea name="mailContent" id="editor"></textarea>
                        </div>
                        <div class="buttonarea">
                            <button type="submit" class="btn btn-primary nav justify-content-center">메일발송하기</button>
                            <button type="button" class="btn btn-danger nav justify-content-center" id="backtobutton">작성취소</button>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>

    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
    <script>
        // 	function dletemail(){

        // 	const $mailli = document.querySelector('.mail');

        // 	$mailli.addEventListener('click', e=>{
        // 		if(e.target.matches('.delete-button')){
        // 			console.log(e.target.innerText);
        // 				//console.log(e.target.previousElementSibling.firstElementChild.innerText);
        // 				const $mailNo = +e.target.previousElementSibling.firstElementChild.innerText;

        // 				const $confirm =confirm(e.target.previousElementSibling.firstElementChild.innerText + '번 메일을 삭제할까요?');

        // 				if($confirm){
        // 					window.location.href = '/hrms/mail-delete?mailNo='+ $mailNo +'&empNo='+'2';
        // 				}
        // 					return ;
        // 			}
        // 		});
        // 	}

        // (function () {
        // dletemail();
        // })();


        //뒤로가기 버튼 클릭함수
        const sendMailButton = document.querySelector('.btn-danger');

        // Add a click event listener to the button
        sendMailButton.addEventListener('click', function() {
        // Output a message to the console
        //console.log('Send mail button clicked!');
        const $confirm = confirm('메일 작성을 취소하시겠습니까?');
        if($confirm){
            window.location.replace(document.referrer);
        }else{
            return;
        }
        });



        //deditor용 함수
        ClassicEditor.create( document.querySelector( '#editor' ) ,{
            language: "ko"
        });



        //api접근용 url
        const URL = '/api/hrms/search';
        //버튼 dom접근용
        const $searchbutton = document.querySelector('.searchbutton');
        $searchbutton.addEventListener('click',handleClick);
        // 클릭 이벤트 핸들러 함수
        function handleClick() {
            // 버튼이 클릭되었을 때 실행될 코드 작성
            //alert('버튼이 클릭되었습니다!');
            // 원하는 동작을 추가로 작성 가능
            const $empName = document.querySelector('#exampleDataList').value;
            //console.log($empName);
            getempnoList($empName);

        }
        
        //rest fetch 함수
        function getempnoList(name){
            fetch(`\${URL}/empName/\${name}`)
                .then(res => res.json())
                .then(responseResult => {
                    // console.log(responseResult);
                     renderempList(responseResult);
                });
        }

        //랜더링 함수
        function renderempList(responseResult){
            const $select = document.getElementById('select');
            let $tag = ``;
            
            for (let employee of responseResult) {
                //console.log(employee);
                $tag+=`<option value='\${employee.empNo}' class='selectoption'> \${employee.empName}/\${employee.empEmail}/\${employee.deptName}/\${employee.posName}</option>`
                //console.log($tag);
                
            }
            $select.innerHTML = $tag;

            if (select.options.length === 1) {
                //console.log('option이 한개임');

                select.dispatchEvent(new Event('change'));
            }
        }


       


        //select 태그 잡아오기
        const select = document.getElementById('select');

        select.addEventListener('change', ()=> {
        
            // //타겟  option태그 안의 사번 잡아오기
             const selectedValue = select.options[select.selectedIndex].value;
            
            // console.log(selectedValue);

            //타겟 option태그의 일반 텍스트 잡아오기
            const $employeeInfo = select.options[select.selectedIndex].text;
            
            const parts = $employeeInfo.split('/');

             part1 = parts[0]?.trim() || '';
             part2 = parts[1]?.trim() || '';
             part3 = parts[2]?.trim() || '';
             part4 = parts[3]?.trim() || '';
            
             console.log(selectedValue);
            // // 각 부분을 콘솔에 출력합니다.
             console.log('수신자 이름 : ', part1);
             console.log('수신자 이메일 :', part2);
             console.log('수신자 부서 :', part3);
             console.log('수신자 직급 :', part4);
        

            
            //수신자 사번 input태그 잡아오기
            const inputreceiverno = document.querySelector('.inputreceiverno');
            inputreceiverno.value = +selectedValue;


            //수신자 이메일 집어넣을 태그 잡아오기
            const inputreceiveremail = document.querySelector('.reciveremail');
            inputreceiveremail.textContent = part2;

            //수신자 이름 집어넣을 태그 잡아오기
            const inputreceivername = document.querySelector('.recivername');
            inputreceivername.textContent = part1;

            //수신자 직급 집어넣을 태그 잡아오기
            const inputreceivepos = document.querySelector('.reciverposname');
            inputreceivepos.textContent = part4;


            const inputreceivedept = document.querySelector('.reciverdeptname');
            inputreceivedept.textContent = part3;

            //확인용
            //console.log(inputreceiverno);

        });


        // $select.onclick = e =>{
        //     if(e.target.matches('option')){
        //         console.log(e.target.value);
        //     }else{
        //         return
        //     }
            
        // }

           
    </script>

</body>

</html>
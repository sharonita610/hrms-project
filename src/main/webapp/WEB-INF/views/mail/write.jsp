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
                        <div><a href="/hrms/mail-list/?empNo=${2}&mailType=mailto">받은 메일</a></div>
                        <div><a href="/hrms/mail-list/?empNo=${2}&mailType=mailfrom">보낸 메일</a></div>
                        <div><a href="/hrms/mail-list-status/?empNo=${2}&status=Y&mailType=mailto">읽은 메일</a></div>
                        <div><a href="/hrms/mail-list-status/?empNo=${2}&status=N&mailType=mailto">안읽은 메일</a></div>
                        <div><a href="/hrms/mail-write?empNo=${2}">메일쓰기</a></div>
                    </div>
                    <form class="mail-detail-box" method="POST">
                        <div class="mail-header-title">
                            <div class="headerbox">
                                <div>메일 제목 : </div><input type="text" id="title" name="mailTilte" value="">
                            </div>
                        </div>
                        <div class="sender">
                            <div class="senderno">
                                <p>발신자 사번 : </p>
                                <input class="flex-container" type="number" name="mailfrom" id="mailfrom" placeholder="사번" value="${empNo}" readonly>
                            </div>
                            <div>
                                <p class="flex-container">발신자 이메일 : </p>
                            </div>
                            <div>
                                <p class="flex-container">발신자 이름 : </p>
                            </div>
                            <div>
                                <p class="flex-container">발신자 직급 : </p>
                            </div>
                            <div>
                                <p class="flex-container">발신자 부서 : </p>
                            </div>
                        </div>
                        <div class="receiver">
                            <div class="receiverno">
                                <p>수신자 사번 : </p>
                                <input class="flex-container inputreceiverno" type="number" name="mailto" id="mailto" value="" readonly>
                            </div>
                            <div class="receiveremail">
                                <p class="flex-container">수신자 이메일 : </p>
                            </div>
                            <div class="receivername">
                                <p class="flex-container">수신자 이름 : </p>
                            </div>
                            <div class=" receiverpos">
                                <p class="flex-container">수신자 직급 : </p>
                            </div>
                            <div class="receiverdept">
                                <p class="flex-container">수신자 부서 : </p>
                            </div>
                            <div class="search-form">
                                <input class="form-control flex-container" list="datalistOptions" id="exampleDataList" placeholder="찾기">
                                <a class="btn btn-primary searchbutton" href="#" role="button">검색</a>
                                <select name="" id="select" class="optionselect">
                                </select>
                            </div>
                        </div>
                        <div class="form-floating">
                            <textarea name="text" id="editor"></textarea>
                        </div>
                        <button type="button"
                        class="btn btn-primary backtobutton nav justify-content-center">메일발송하기</button>
                    <button type="button" class="btn btn-danger nav justify-content-center">작성취소</button>
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
        const URL = '/api/hrms/search';
        //뒤로가기 버튼
        function clickbackbutton() {
            const $backtobutton = document.querySelector('.backtobutton');

            $backtobutton.addEventListener('click', function () {
                // 메일 확인 후 이전 페이지로 돌아가면서 새로고침
                window.location.replace(document.referrer);
            });
        }
        //deditor용 함수
        ClassicEditor.create( document.querySelector( '#editor' ) ,{
            language: "ko"
        });


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
            let $tag = "";
            
            for (let employee of responseResult) {
                //console.log(employee);
                $tag+=`<option value='\${employee.empNo}' data-empname='\${employee.empName}' class='selectoption'>\${employee.empName}/\${employee.empEmail}/\${employee.deptName}/\${employee.posName}</option>`
                //console.log($tag);
                
            }
            $select.innerHTML = $tag;
        }

        //select 태그 잡아오기
        const select = document.getElementById('select');

        select.addEventListener('change', e=> {
        
        //타겟  option태그 안의 사번 잡아오기
        const selectedValue = e.target.value;

        //확인용
        console.log(selectedValue);
  
  // Get the plain text content of the selected option
            // 타겟 option의 텍스트값 잡아오기
            // option태그 안의 텍스트값 / 문자로 잘라오기
            const parts = selectedText.split('/');
            
            //잘라온 텍스트 값들 토막내기
            
            
           

            //발신자 사번 input태그 잡아오기
            let inputreceiverno = document.querySelector('.inputreceiverno');
            //확인용
            console.log(inputreceiverno);


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
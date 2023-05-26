<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/assets/css/mail.css">
    <link rel="stylesheet" href="/assets/css/maildetail.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
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
				<div class="mail-detail-box">
					<div class="mail-header-main">
                        <div class="headerbox">
                            <p>${md.mailTitle}</p>
                        </div>
                        <div class="headerbox">
                            <p>${md.mailDate}</p>
                        </div>
                    </div>
                    <div class="sender">
                        <p>발신자 사번 : ${md.senderEmpNo}</p>
						<p>a</p>
						<p>a</p>
						<p>a</p>
                       	<p>발신자 이메일 :  ${md.senderEmail}</p>
                    </div>
                    <div class="receiver">
                        <p>수신자 사번 :  ${md.receiverEmpNo}</p>
						<p>수신자 이름 :  ${md.receiverName}</p>
                        <p>수신자 이메일 :  ${md.receiverEmail}</p>
                        <p>수신자 직급 :  ${md.posName}</p>
                        <p>수신자 부서 :  ${md.receiverDeptName}</p>
                    </div>
                    <div class="mail-main">
                        <div class="textarea">
                            ${md.mailContent}
                        </div>
						<button type="button" class="btn btn-primary  text-center backtobutton nav justify-content-center">메일목록돌아가기</button>
                    </div>
				</div>
			</div>
			
		</section>
	</div>
	</div>
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
	function clickbackbutton() {
  const $backtobutton = document.querySelector('.backtobutton');

  $backtobutton.addEventListener('click', function() {
    // 메일 확인 후 이전 페이지로 돌아가면서 새로고침
    window.location.replace(document.referrer);
  });
}


(function () {
	clickbackbutton();
})();
	</script>

</body>
<%@ include file="../main/include/footer.jsp" %>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="/assets/css/mail.css">
    <link rel="stylesheet" href="/assets/css/maildetail.css">
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
					<div><a href="/hrms/mail-list/?empNo=${2}">받은 메일</a></div>
					<div><a href="/hrms/mail-list/?empNo=${2}&mailType=mailfrom">보낸 메일</a></div>
					<div><a href="/hrms/mail-list-status/?empNo=${2}&status=Y&mailType=mailto">읽은 메일</a></div>
					<div><a href="/hrms/mail-list-status/?empNo=${2}&status=N&mailType=mailto">안읽은 메일</a></div>
					<div><a href="#">메일쓰기</a></div>
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
                        <p>${md.mailDate}</p>
                        <p>${md.mailDate}</p>
                        <p>${md.mailDate}</p>
                        <p>${md.mailDate}</p>
                    </div>
                    <div class="receiver">
                        <p>${md.mailDate}</p>
                        <p>${md.mailDate}</p>
                        <p>${md.mailDate}</p>
                        <p>${md.mailDate}</p>
                    </div>
                    <div class="mail-main">
                        <div class="textarea">
                            ${md.mailContent}
                        </div>
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


(function () {
  
})();
	</script>

</body>

</html>
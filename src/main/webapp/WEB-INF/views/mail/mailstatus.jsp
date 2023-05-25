<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>
	<link rel="stylesheet" href="/assets/css/mail.css">
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
				<div class="mail-sort-info">
					<div class="number">no</div>
					<div class="email">email</div>
					<div class="name">이름</div>
					<div class="role">직책</div>
					<div class="dept">부서</div>
					<div class="title">제목</div>
					<div class="status">메일상태</div>
					<div class="sendtime">발송시간</div>
				</div>
				<div id="mail-list-box">
					<ul class="maillist">
						<c:forEach var="m" items="${mList}">
							<li class="mail">
                                <div class="maildetail">
									<p>${m.mailNo}</p>
									<p>${m.senderEmail}</p>
									<p>${m.senderName}</p>
									<p>${m.senderPosition}</p>
									<p>${m.senderDepartment}</p>
									<p>${m.mailTitle}</p>
									<p>${m.mailStatus}</p>
									<p>${m.mailDate}</p>
									<p id="mailtype">${ms.mailType}</p>
								</div>
                                <button type="button" class="btn btn-danger delete-button">삭제</button>
                            </li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					
					<c:if test="${mailPageMaker.prev}">
						<li class="page-item"><a class="page-link"
								href="/hrms/mail-list-status/?mailPageNo=${mailPageMaker.start-1}&empNo=${login.empNo}&mailType=${ms.mailType}&status=${status}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${mailPageMaker.start}" end="${mailPageMaker.end}">
						<li class="page-item"><a class="page-link" href="/hrms/mail-list-status/?mailPageNo=${i}&empNo=${login.empNo}&mailType=${ms.mailType}&status=${status}">${i}</a></li>
					</c:forEach>
					<c:if test="${mailPageMaker.next}">
						<li class="page-item"><a class="page-link"
								href="/hrms/mail-list-status/?mailPageNo=${mailPageMaker.end+1}&empNo=${login.empNo}&mailType=${ms.mailType}&status=${status}">Next</a></li>
					</c:if>
					
				</ul>
			</nav>
		</section>
	</div>
	</div>


<script>
	function deletemail() {
  const $maillist = document.querySelectorAll('.mail');
  $maillist.forEach($mail => {
    const $deleteButton = $mail.querySelector('.delete-button');
    $deleteButton.addEventListener('click', () => {
      const $mailNo = +$mail.querySelector('div > p:first-child').innerText;
      const $confirm = confirm($mail.querySelector('div > p:first-child').innerText + '번 메일을 삭제할까요?');
      if ($confirm) {
		const $mailstatus = $mail.querySelector('div > p:nth-child(7)').innerText;
		if($mailstatus==='N'){
			window.location.href = '/hrms/mail-delete-status?mailNo=' + $mailNo + '&empNo=${login.empNo}' + '&mailPageNo=${ms.mailPageNo}&status=N';
		}else if($mailstatus==='Y'){
			window.location.href = '/hrms/mail-delete-status?mailNo=' + $mailNo + '&empNo=${login.empNo}' + '&mailPageNo=${ms.mailPageNo}&status=Y';
		}
      }else{
		return;
	  }
    });
  });
}

function detailmail() {
  const $maillist = document.querySelectorAll('.mail');
  $maillist.forEach($mail => {
    const $targetmail = $mail.querySelector('.maildetail');
    $targetmail.addEventListener('click', () => {
      const $mailNo = +$mail.querySelector('div > p:first-child').innerText;
	  console.log($mailNo);
    	window.location.href = '/hrms/mail-detail?mailNo=' + $mailNo + '&empNo=${login.empNo}' + '&mailPageNo=${ms.mailPageNo}';
    });
  });
}
window.onload = function() {
  if (!localStorage.getItem('hasReloaded')) {
    localStorage.setItem('hasReloaded', 'true');
    location.reload();
  }
};




(function () {
  deletemail();
  detailmail()
})();
	
	
</script>

</body>

</html>
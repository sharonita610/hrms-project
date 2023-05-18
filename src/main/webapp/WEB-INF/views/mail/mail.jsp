<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>SAMJO SANGSA</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="/assets/css/common.css">
	<link rel="stylesheet" href="/assets/css/header-banner.css">
	<link rel="stylesheet" href="/assets/css/mail.css">
	<link rel="stylesheet" href="/assets/css/mail.css">

</head>

<body>


	<div id="body-wrapper">
		<section class="section-left-body">
			<div id="left-body">
				<div class="left-fix">
					<div class="information-box">
						<ul id="profile">
							<li id="photo"><a href="#">사원사진</a></li>
						</ul>
						<ul id="information">
							<li>사원번호</li>
							<li>이름</li>
							<li>휴대폰번호</li>
							<li>부서</li>
							<li>직책</li>
							<li>
								<button id="change-info" type="submit">수정</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section class="section-mail">
			<div id="mail-wrapper">
				<div class="mail-sort">
					<div><a href="/hrms/mail-list/?empNo=${2}">받은 메일</a></div>
					<div><a href="/hrms/mail-list/?empNo=${2}&mailType=mailfrom">보낸 메일</a></div>
					<div><a href="/hrms/mail-list-status/?empNo=${2}&status=Y">읽은 메일</a></div>
					<div><a href="/hrms/mail-list-status/?empNo=${2}&status=N">안읽은 메일</a></div>
					<div><a href="#">메일쓰기</a></div>
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
								<div>
									<p>${m.mailNo}</p>
									<p>${m.empEmail}</p>
									<p>${m.empName}</p>
									<p>${m.roleCode}</p>
									<p>${m.deptCode}</p>
									<p>${m.mailTitle}</p>
									<p>${m.mailStatus}</p>
									<p>${m.mailDate}</p>
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
								href="/hrms/mail-list/?mailPageNo=${mailPageMaker.start-1}&empNo=${num}&mailType=${ms.mailType}">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${mailPageMaker.start}" end="${mailPageMaker.end}">
						<li class="page-item"><a class="page-link" href="/hrms/mail-list/?mailPageNo=${i}&empNo=${2}&mailType=${ms.mailType}">${i}</a></li>
					</c:forEach>
					<c:if test="${mailPageMaker.next}">
						<li class="page-item"><a class="page-link"
								href="/hrms/mail-list/?mailPageNo=${mailPageMaker.end+1}&empNo=${num}&mailType=${ms.mailType}">Next</a></li>
					</c:if>
					
				</ul>
			</nav>
		</section>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
	</script>

	<script>
		
		function dletemail(){

		const $mailli = document.querySelector('.mail');

		$mailli.addEventListener('click', (e) =>{
			if(e.target.matches('.delete-button')){
				console.log(e.target);
					//console.log(e.target.previousElementSibling.firstElementChild.innerText);
					const $mailNo = +e.target.previousElementSibling.firstElementChild.innerText;

					window.location.href = '/hrms/mail-delete?mailNo='+ $mailNo +'&empNo='+'2';
				}
			});
		}

		


	 (function () {
		dletemail();
        })();

	</script>

</body>

</html>
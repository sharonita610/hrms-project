<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SAMJO SANGSA</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link rel="stylesheet" href="/assets/css/common.css">
	<link rel="stylesheet" href="/assets/css/header-banner.css">
	<link rel="stylesheet" href="/assets/css/mail.css">
	<link rel="stylesheet" href="/assets/css/mail.css">
    
</head>
<body>


<!-- HEADER IMPORT 해야됨 -->
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
				<div><a href="#">받은 메일</a></div>
				<div><a href="#">보낸 메일</a></div>
				<div><a href="#">읽은 메일</a></div>
				<div><a href="#">안읽은 메일</a></div>
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
						<li class="mail"><a href=""><p>${m.mailNo}</p><p>${m.empEmail}</p><p>${m.empName}</p><p>${m.roleCode}</p><p>${m.deptCode}</p><p>${m.mailTitle}</p><p>${m.mailStatus}</p><p>${m.mailDate}</p></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</section>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
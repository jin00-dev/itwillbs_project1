<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/global.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<script src="../js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<section id="top">
		<div class="container">
			<div class="row top_1">
				<div class="col-md-3">
					<div class="top_1l pt-1">
						<h3 class="mb-0">
							<a class="text-white" href="../main.html"><i
								class="fa fa-video-camera col_red me-1"></i>Drive in Cinema</a>
						</h3>
					</div>
				</div>
				<div class="col-md-5">
					<div class="top_1m"></div>
				</div>
				<div class="col-md-4">
					<div class="top_1r text-end">
						<ul class="social-network social-circle mb-0">
							<li><a href="../user/loginForm.jsp">로그인</a></li>
							<li><a href="../user/insertForm.jsp">회원가입</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="header">
		<nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
			<div class="container">
				<a class="navbar-brand text-white fw-bold" href="../main.html"><i
					class="fa fa-video-camera col_red me-1"></i>Drive In Cinema</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="../order/orderMain.jsp">예매안내</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../event/eventMain.jsp">이벤트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="introduceMain.jsp">소개게시판</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								고객문의 </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="noticeMain.bo">공지사항</a></li>
								<li><a class="dropdown-item" href="faqMain.bo">자주묻는질문</a></li>
								<li><a class="dropdown-item border-0" href="rentMain.bo">대관문의</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!-- 여기 대관문의 꾸며아함. -->

	<div class="container">
		<form action="./qnaBoardUpdatePro.bo?pageNum=${pageNum }"
			method="post">
			<input type="hidden" name="qna_bno" value="${dto.qna_bno }">
			<input type="hidden" name="answer" value="${dto.answer }">
			<table id="Update">
				<tr>
					<th class="ttitle" colspan="3">1:1문의 답변쓰기</th>
				</tr>

				<tr>
					<td>제 목 :</td>
					<td colspan="2"><input type="text" id="sInput" name="subject"
						value="${dto.subject }"></td>
				</tr>
				<tr>
					<td>내 용 :</td>
					<td colspan="2"><textarea rows="" cols="" id="wInput"
							name="content">${dto.content }</textarea></td>
				</tr>
			</table>

			<div id="table_search">
				<input type="submit" value="수정하기" class="btn">
			</div>
			<div class="clear"></div>
			<div id="page_control"></div>
		</form>
	</div>

	<!-- footer아래로는 코드 금지 -->

	<section id="footer_b" class="pt-3 pb-3 bg_grey">
		<div class="container">
			<ul class="mb-0">
				<li class="d-inline-block me-2"><a href="#">Home</a></li>
				<li class="d-inline-block me-2"><a href="#">Features</a></li>
				<li class="d-inline-block me-2"><a href="#">Pages</a></li>
				<li class="d-inline-block me-2"><a href="#">Portfolio</a></li>
				<li class="d-inline-block me-2"><a href="#">Blog</a></li>
				<li class="d-inline-block"><a href="#">Contact</a></li>
			</ul>
		</div>
	</section>


	<script>
		window.onscroll = function() {
			myFunction()
		};

		var navbar_sticky = document.getElementById("navbar_sticky");
		var sticky = navbar_sticky.offsetTop;
		var navbar_height = document.querySelector('.navbar').offsetHeight;

		function myFunction() {
			if (window.pageYOffset >= sticky + navbar_height) {
				navbar_sticky.classList.add("sticky")
				document.body.style.paddingTop = navbar_height + 'px';
			} else {
				navbar_sticky.classList.remove("sticky");
				document.body.style.paddingTop = '0'
			}
		}
	</script>

</body>
</html>
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
<link href="../css/event.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/code.jquery.com_jquery-3.7.1.min.js"></script>
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
						<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="introduceMain.jsp">소개게시판</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								고객문의 </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../board/noticeMain.bo">공지사항</a></li>
								<li><a class="dropdown-item" href="../board/faqMain.bo">자주묻는질문</a></li>
								<li><a class="dropdown-item border-0"
									href="../board/rentMain.bo">대관문의</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</section>


	<!-- 여기 이벤트 꾸며아함. -->

	<script type="text/javascript">

	var popupX = (document.body.offsetWidth / 2) - (400 / 2) + 90;
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (300 / 2) - 20;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function eventAdd() {
		window.open("./eventAdd.bo","_black",
				"width=400, height=300, left="+popupX+", top="+popupY);
	}
	function boardList() {
		location.href="./eventMain.bo";
	}

	</script>

	<h1>이벤트 메인페이지</h1>
	<input type="button" value="이벤트추가" onclick="eventAdd();">
	<h2>진행중인 이벤트</h2>
	<section id="eventing">
		<div id="image_container1">
			<figure id=image_figure1>
				<c:forEach var="dto" items="${boardList }">
					<c:if test="${dto.event_type == 0 }">
						<div class="image_panel">
							<a href="enfBoardContent.bo?event_bno=${dto.event_bno}&&category=0">
								<img src="../img/${dto.img }">
							</a>
							<p>${dto.subject }</p>
						</div>
					</c:if>
				</c:forEach>
			</figure>
		</div>
	</section>
	<h2>지난 이벤트</h2>
	<section id="evented">
		<div id="image_container2">
			<figure id=image_figure2>
				<c:forEach var="dto" items="${boardList }">
					<c:if test="${dto.event_type == 1 }">
						<div class="image_panel">
							<a href="enfBoardContent.bo?event_bno=${dto.event_bno}&&category=0">
								<img src="../img/${dto.img }">
							</a>
							<p>${dto.subject }</p>
						</div>
					</c:if>
				</c:forEach>
			</figure>
		</div>
	</section>

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
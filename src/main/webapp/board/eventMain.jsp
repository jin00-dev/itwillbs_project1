<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="./css/event.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트</title>
</head>

<body>
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<!-- 상단 바 고정 -->
	<!-- 여기 이벤트 페이지 꾸며아함. -->

	<script type="text/javascript">

	var popupX = (document.body.offsetWidth / 2) - (400 / 2) + 90;
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (400 / 2) - 20;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function eventAdd() {
		window.open("./eventAdd.bo?user_id=${user_id}","_black",
				"width=400, height=400, left="+popupX+", top="+popupY);
	}
	function boardList() {
		location.href="./eventMain.bo?user_id=${user_id}";
	}

	</script>

	<h1>이벤트 메인페이지</h1>
	<h2 class="eventH2">진행중인 이벤트</h2>
	<section id="eventing" class="eventContainer">
		<div id="image_container1">
			<c:if test="${user_id eq 'admin'}">
				<div class="rightButton">
					<input type="button" class="btn" value="이벤트추가" onclick="eventAdd();">
				</div>
			</c:if>
			<div></div>
			<figure class=image_figure>
				<c:forEach var="dto" items="${boardList }">
					<c:if test="${dto.event_type == 0 }">
						<div class="image_panel">
							<a
								href="enfBoardContent.bo?event_bno=${dto.event_bno}&&category=0&&user_id=${user_id}">
								<img src="./img/${dto.img }">
								<p>${dto.subject }</p>
							</a>
						</div>
					</c:if>

				</c:forEach>
			</figure>
		</div>
	</section>
	<h2 class="eventH2">지난 이벤트</h2>
	<section id="evented" class="eventContainer">
		<div id="image_container2">
			<figure class=image_figure>
				<c:forEach var="dto" items="${boardList }">
					<c:if test="${dto.event_type == 1 }">
						<div class="image_panel">
							<a
								href="enfBoardContent.bo?event_bno=${dto.event_bno}&&category=0&&user_id=${user_id}">
								<img src="./img/${dto.img }">
								<p>${dto.subject }</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</figure>
		</div>
	</section>

	<!-- footer아래로는 코드 금지 -->
	<!-- 하단바 고정  -->
	<footer>
		<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
	</footer>
	<!-- 하단바 고정  -->


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
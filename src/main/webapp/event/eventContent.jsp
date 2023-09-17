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
						<li class="nav-item"><a class="nav-link" href="eventMain.bo">이벤트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="introduceMain.jsp">소개게시판</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								고객문의 </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../board/noticeMain.bo">공지사항</a></li>
								<li><a class="dropdown-item" href="../board/faqMain.bo">자주묻는질문</a></li>
								<li><a class="dropdown-item border-0" href="../board/rentMain.bo">대관문의</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!-- 여기 공지사항 꾸며아함. -->
	<section id="eventContent">
	<div id="left">
		<figure id="leftImage">

		</figure>
	</div>
	<div id="right">
		<div class="container">
			<h1>이벤트 글내용</h1>
			<table id="eventContent">
				<tr>
					<th class="ttitle" colspan="4"></th>
				</tr>
				<tr>
					<td>글번호</td>
					<td>${dto.event_bno }</td>

					<td>작성일</td>
					<td><c:choose>
							<c:when test="${empty dto.updatedate}">
								<fmt:formatDate value="${dto.regdate }" pattern="YY-MM-dd" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${dto.updatedate }" pattern="YY-MM-dd" />
							</c:otherwise>
						</c:choose></td>

				</tr>
				<tr>
					<td>제 목</td>
					<td colspan="3">${dto.subject }</td>
				</tr>
				<tr>
					<td>내 용</td>
					<td colspan="3">${dto.content }</td>
				</tr>
			</table>
			<%-- 	<c:if test="${user_type == 1 }"> --%>
			<div id="table_search">
				<input type="button" value="수정하기"
					onclick="location.href='eventBoardUpdate.bo?event_bno=${dto.event_bno}&&event_type=${dto.event_type }&&category=0';">
				<input type="button" value="삭제하기" onclick="eventDelete();">
			</div>
			<%-- 	</c:if> --%>
			<input type="button" value="목록이동" onclick="boardList();">

		</div>
	</div>
	</section>
	<script type="text/javascript">
		function eventDelete() {
			var popupX = (document.body.offsetWidth / 2) - (400 / 2);
			// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
			
			var popupY= (window.screen.height / 2) - (200 / 2) - 50;
			// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			window.open("./evnetDelete.bo?event_bno=${dto.event_bno }&&category=0",
					"_black","width=400, height=200, left="+popupX+", top="+popupY);
		}
		function boardList() {
			location.href="eventMain.bo";
		}
		window.onload = function () {
		    startLoadFile();
		};

		function startLoadFile(){
		    $.ajax({
		        url: './eventImg.json',
		        type: 'get',
		        dataType : 'json',
		        success : function (data) {
		        	console.log(data);
		            createImages(data);
		        }
		    	
		    });
		}
		function createImages(objImageInfo) {
		    var images = objImageInfo.image;
		    console.log(images);
// 		    var bno = "<c:out value='${dto.event_bno}'/>";
		    var bno = '${dto.event_bno}';
		  
		    console.log(bno);
		    var strDOM = "";
		    for (var i = 0; i < images.length; i++) {
		        // N번째 이미지 정보를 구하기
		        var image = images[i];
		        if(image.event_bno == bno){
			        //  N번째 이미지 패널을 생성
			        strDOM += "<div class='image_panel'>";
			        strDOM += "    <img src='" + image.url + "'>";
			        strDOM += "    <p class='title'>" + image.title + "</p>";
			        strDOM += "</div>";
		        }
		    }
		    // 이미지 컨테이너에 생성한 이미지 패널들을 추가하기
		    var $imageContainer1 = $("#leftImage");
		        $imageContainer1.append(strDOM);
		}
	</script>

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
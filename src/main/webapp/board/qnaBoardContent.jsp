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
						<li class="nav-item"><a class="nav-link" href="eventMain.bo">이벤트</a></li>
						<li class="nav-item"><a class="nav-link" href="introduceMain.jsp">소개게시판</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								고객문의 </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="noticeMain.bo">공지사항</a></li>
								<li><a class="dropdown-item" href="faqMain.bo">자주묻는질문</a></li>
								<li><a class="dropdown-item border-0" href="rentMain.bo">대관문의</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	</section>


	<!-- 여기 문의 꾸며아함. -->

		<table id="qnaContent">
		<tr>
			<th class="ttitle" colspan="4"></th>
		</tr>
		<tr>
			<td>글번호</td>
			<td>${dto.qna_bno }</td>

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
			<td> 질 문</td>
			<td colspan="3">${dto.subject }</td>
		</tr>
		<tr>
			<td> 내 용</td>
			<td colspan="3">${dto.content }</td>
		</tr>
		<tr>
			<td> 답 변 </td>
			<td colspan="3">${dto.answer_context }</td>
		</tr>
		
	</table>
	<script type="text/javascript">
		function deleteQna() {
			var popupX = (document.body.offsetWidth / 2) - (400 / 2);
			// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
			
			var popupY= (window.screen.height / 2) - (200 / 2) - 50;
			// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			console.log(popupX);
			console.log(popupY);
			window.open("./qnaBoardDelete.bo?qna_bno=${dto.qna_bno }&&pageNum=${param.pageNum }&&user_id=${dto.user_id }",
					"_black","height=200, width=400, left="+popupX+", top="+popupY);
		}
		
		function boardList() {
			location.href="qnaBoardList.bo?pageNum=${param.pageNum}";
		}
	</script>
<%-- 	<c:if test="${user_id == dto.user_id }"> --%>
	<div id="table_search">
		<c:if test="${dto.answer == 0 }"> 
		<!-- 답변 못받을 경우만 수정가능하게  -->
		<input type="button" value="수정하기"
			onclick="location.href='qnaBoardUpdate.bo?qna_bno=${dto.qna_bno}&&pageNum=${param.pageNum }';">
		</c:if>
		<input type="button" value="삭제하기"
			onclick="deleteQna();">
		<input type="button" value="목록이동"
			onclick="boardList();">
	</div>
<%-- 	</c:if> --%>
<%-- 		<c:if test="${user_type = 1 }"> --%>
			<!-- 관리자만 가능하게  -->
			<input type="button" value="답변쓰기"
			onclick="location.href='qnaBoardAnswer.bo?qna_bno=${dto.qna_bno}&&pageNum=${param.pageNum }';">
<%-- 		</c:if> --%>
	
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
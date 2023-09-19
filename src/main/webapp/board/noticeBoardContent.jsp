<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트</title>
</head>

<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
<!-- 여기 공지사항 꾸며아함. -->
	<div class="container">
		<h1>공지사항 글내용</h1>
		<table id="noticeContent">
		<tr>
			<th class="ttitle" colspan="4"></th>
		</tr>
		<tr>
			<td>글번호</td>
			<td>${dto.notice_bno }</td>

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
	<script type="text/javascript">
		function noticeDelete() {
			var popupX = (document.body.offsetWidth / 2) - (400 / 2);
			// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
			
			var popupY= (window.screen.height / 2) - (200 / 2) - 50;
			// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			window.open("./noticeBoardDelete.bo?notice_bno=${dto.notice_bno }&&pageNum=${param.pageNum }&&category=1",
					"_black","width=400, height=200, left="+popupX+", top="+popupY);
		}
		function boardList() {
			location.href="noticeMain.bo?pageNum=${param.pageNum}";
		}
	</script>
<%-- 	<c:if test="${user_type == 1 }"> --%>
		<div id="table_search">
		<input type="button" value="수정하기"
			onclick="location.href='noticeBoardUpdate.bo?notice_bno=${dto.notice_bno}&&event_type=${dto.event_type }&&pageNum=${param.pageNum }';">

		<input type="button" value="삭제하기"
			onclick="noticeDelete();">
		</div>
<%-- 	</c:if> --%>
		<input type="button" value="목록이동"
			onclick="boardList();">
	</div>
	
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
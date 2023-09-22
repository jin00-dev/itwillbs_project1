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
<link href="./css/listPage.css" rel="stylesheet">
<title>이벤트</title>
</head>
<body>
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<!-- 여기 대관문의 꾸며아함. -->
	<div class="container">
		<h1> 1:1 문의 내역</h1>
		<table class="BoardList">
			<tr class="thList">
				<th class="bno">No.</th>
				<th class="subject">Title</th>
				<th class="date">Date</th>
				<th class="answer">Answer</th>
			</tr>
			<c:forEach var="dto" items="${boardList }">
				<c:if test="${user_id eq 'admin' }">
					<tr>
						<td>${dto.qna_bno }</td>
						<td><a
							href="qnaBoardContent.bo?qna_bno=${dto.qna_bno }&&pageNum=${pageNum}&&user_id=${dto.user_id }">${dto.subject }</a>
						</td>
						<td><fmt:formatDate value="${dto.updatedate }"
								pattern="YY-MM-dd" /></td>
						<td><c:choose>
								<c:when test="${dto.answer == 0}">
								N							
							</c:when>
								<c:otherwise>
								Y
							</c:otherwise>
							</c:choose></td>
				</c:if>
				<c:if test="${user_id eq dto.user_id}">
					<tr>
						<td>${dto.qna_bno }</td>
						<td><a
							href="qnaBoardContent.bo?qna_bno=${dto.qna_bno }&&pageNum=${pageNum}&&user_id=${dto.user_id }">${dto.subject }</a>
						</td>
						<td><fmt:formatDate value="${dto.updatedate }"
								pattern="YY-MM-dd" /></td>
						<td><c:choose>
								<c:when test="${dto.answer == 0}">
								N							
							</c:when>
								<c:otherwise>
								Y
							</c:otherwise>
							</c:choose></td>
				</c:if>
			</c:forEach>

		</table>
		<div id="page_control">
			<c:if test="${startPage > pageBlock }">
				<a href="./qnaBoardList.bo?pageNum=${startPage-pageBlock }&&user_id=${user_id}">Prev</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
				<a href="./qnaBoardList.bo?pageNum=${i }&&user_id=${user_id}">${i }</a>
			</c:forEach>
			<c:if test="${endPage < pageCount }">
				<a href="./qnaBoardList.bo?pageNum=${startPage+pageBlock }&&user_id=${user_id}">Next</a>
			</c:if>
		</div>

		<div id="table_search">
			<form action="./qrBoardSearch.bo" name="boardSearch" method="post">
				<input type="hidden" name="category"
					value="${boardList[0].category }">
				<table>
					<tr>
						<td><select name="searchField">
								<option value="0">선택</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
						</select></td>

						<td><input type="text" name="searchText" class="input_box">
						</td>
						<td><input type="submit" value="search"></td>
					</tr>
				</table>

			</form>
		</div>
		<div class="before">
			<input type="button" value="이전 게시판" onclick="location.href='./faqMain.bo?user_id=${user_id}';">
		</div>
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
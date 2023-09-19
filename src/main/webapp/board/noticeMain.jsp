<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
		<h1>공지사항</h1>
		<table id="noticeBoardList">
			<tr>
				<th class="bno">No.</th>
				<th class="subject">Title</th>
				<th class="date">Date</th>
				<th class="readCount">ReadCount</th>
			</tr>
			<c:forEach var="dto" items="${boardList }">
				<tr>
					<td>${dto.notice_bno }</td>
					<td><a
						href="noticeBoardContent.bo?notice_bno=${dto.notice_bno }&&pageNum=${pageNum}&&category=${dto.category}">${dto.subject }</a>
					</td>
					<td><c:choose>
							<c:when test="${empty dto.updatedate}">
								<fmt:formatDate value="${dto.regdate }" pattern="YY-MM-dd" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${dto.updatedate }" pattern="YY-MM-dd" />
							</c:otherwise>
						</c:choose></td>
					<td>${dto.read_count }</td>
			</c:forEach>

		</table>
		<div id="table_search">
			<form action="./enfBoardSearch.bo" name="boardSearch" method="post">
				<input type="hidden" name="category" value="${boardList[0].category }">
				<table>
				<tr>
					<td>
						<select name="searchField">
							<option value="0" >선택</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
					</td>
				 
					<td>
						<input type="text" name="searchText" class="input_box">
					</td>
					<td>
						<input type="submit" value="search">
					</td>
				</tr>
				</table>


			</form>
		</div>
		<script type="text/javascript">
				var popupX = (document.body.offsetWidth / 2) - (500 / 2) + 90;
				// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		
				var popupY= (window.screen.height / 2) - (300 / 2) - 20;
				// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
				function noticeBoardAdd() {
					window.open("./noticeBoardAdd.bo","_black",
							"width=500, height=300, left="+popupX+", top="+popupY);
				}
				function boardList() {
					location.href="./noticeMain.bo";
				}
			
			</script>
		<%-- 				<c:if test="${user_type == 1 }"> --%>
		<input type="button" name="noticeAdd" value="공지추가"
			onclick="noticeBoardAdd();">
		<%-- 				</c:if> --%>
		<div class="clear"></div>
		<div id="page_control">
			<c:if test="${startPage > pageBlock }">
				<a href="./noticeMain.bo?pageNum=${startPage-pageBlock }">Prev</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
				<a href="./noticeMain.bo?pageNum=${i }">${i }</a>
			</c:forEach>
			<c:if test="${endPage < pageCount }">
				<a href="./noticeMain.bo?pageNum=${startPage+pageBlock }">Next</a>
			</c:if>
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
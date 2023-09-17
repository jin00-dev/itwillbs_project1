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

	<!-- 여기 대관문의 꾸며아함. -->

	<div class="container">
		<h1>qnaBoardList</h1>
		<table id="qnaBoardList">
				<tr>
					<th class="bno">No.</th>
					<th class="subject">Title</th>
					<th class="date">Date</th>
					<th class="answer">Answer</th>
				</tr>
<%-- 			<c:if test="${user_id==boardList.user_id }"> --%>
			<c:forEach var="dto" items="${boardList }">
				<tr>
					<td>
						${dto.qna_bno }
					</td>
					<td>	
						<a href="qnaBoardContent.bo?qna_bno=${dto.qna_bno }&&pageNum=${pageNum}&&user_id=${dto.user_id }">${dto.subject }</a>
					</td>
					<td>
						<c:choose> 
							<c:when test="${empty dto.updatedate}">
								<fmt:formatDate value="${dto.regdate }" pattern="YY-MM-dd"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${dto.updatedate }" pattern="YY-MM-dd"/>							
							</c:otherwise>
						</c:choose>
					</td>
					<td><c:choose> 
							<c:when test="${dto.answer == 0}">
								N							
							</c:when>
							<c:otherwise>
								Y
							</c:otherwise>
						</c:choose></td>
			</c:forEach>
<%-- 			</c:if> --%>
				
			</table>
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
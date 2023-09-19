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
			var popupX = (document.body.offsetWidth / 2) - (400 / 2) + 110;
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
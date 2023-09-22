<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/listPage.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function boardList() {
		location.href = "qnaBoardList.bo?user_id=${user_id}";
	}
</script>
</head>
<body>
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>

	<h1>faqBoard.jsp</h1>

	<fieldset>
		<form action="qnaBoardAction.bo?user_id=${user_id}" method="post"
			name="fr" id="qnaForm">
			<input type="hidden" name="user_id" value="${param.user_id }">
			<table id="qna">
				<tr>
					<td>제목 :</td>
					<td colspan="2"><input type="text" id="wInput" name="subject">
					</td>
				</tr>
				<tr>
					<td>내용 :</td>
					<td colspan="2"><textarea rows="" cols="" id="wInput"
							name="content"></textarea></td>
				</tr>

			</table>

			<div id="qnaSubmit">
				<input type="submit" value="완료" class="btn"> <input type="button"
					value="취소" class="btn" onclick="window.close();">
			</div>
		</form>
	</fieldset>

	<!-- 하단바 고정  -->
	<footer>
		<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
	</footer>
	<!-- 하단바 고정  -->
</body>
</html>
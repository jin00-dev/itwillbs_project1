<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/faqMain.css" rel="stylesheet">
<title>Off The Lamp</title>
</head>
<body>
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<!-- 상단 바 고정 -->
	<h1>faqBoardAdd.jsp</h1>
	<fieldset>
		<form action="enfBoardAdd.bo?category=2&&user_id=${user_id}"
			method="post">
			<table class="boardContent">
				<tr>
					<td>질문 :</td>
					<td colspan="2"><textarea rows="" cols="" id="qInput"
							name="subject"></textarea></td>
				</tr>
				<tr>
					<td>답변 :</td>
					<td colspan="2"><textarea rows="" cols="" id="aInput"
							name="content"></textarea></td>
				</tr>

			</table>

			<div id="faqAddSubmit">
				<input type="submit" value="완료" class="btn">
				<input type="button" value="취소" class="btn"
					onclick="window.close();">
			</div>
		</form>
	</fieldset>
</body>
</html>
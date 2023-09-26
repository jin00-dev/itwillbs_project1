<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/faqMain.css" rel="stylesheet">
<link href="./css/listPage.css" rel="stylesheet">
<title>Insert title here</title>
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
					<td colspan="2"><input type="text" name="subject" required></td>
				</tr>
				<tr>
					<td>답변 :</td>
					<td colspan="2"><textarea rows="" cols="" class="cntContent"
							name="content" required="required"></textarea></td>
				</tr>

			</table>

			<div class="CRUD">
				<input type="submit" value="완료" class="btn">
				<input type="button" value="취소" class="btn"
					onclick="window.close();">
			</div>
		</form>
	</fieldset>
</body>
</html>
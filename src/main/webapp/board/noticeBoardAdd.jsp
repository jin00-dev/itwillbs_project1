<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/listPage.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<!-- 상단 바 고정 -->
	<h1>noticeBoardAdd.jsp</h1>
	<fieldset>
		<form action="enfBoardAdd.bo?category=1&&user_id=${user_id}"
			method="post">
			<table class="boardContent">
				<tr>
					<td>제목 :</td>
					<td colspan="2"><textarea rows="" cols="" id="sInput"
							name="subject"></textarea></td>
				</tr>
				<tr>
					<td>내용 :</td>
					<td colspan="2"><textarea rows="" cols="" id="cInput"
							name="content"></textarea></td>
				</tr>

			</table>

			<div>
				<input type="submit" value="완료" class="btn"> <input type="button"
					value="취소" class="btn" onclick="window.close();">
			</div>
		</form>
	</fieldset>
</body>
</html>
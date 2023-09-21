<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>noticeBoardAdd.jsp</h1>
	<fieldset>
		<form action="enfBoardAdd.bo?category=1" method="post" name = "fr" id="noticeAddForm">
		<table id="noticeAdd">
					<tr>
						<td>제목 :</td>
						<td colspan="2"><textarea rows="" cols="" id="sInput" name="subject"></textarea>
						</td>
					</tr>
					<tr>
						<td>내용 :</td>
						<td colspan="2">
							<textarea rows="" cols="" id="cInput" name="content"></textarea>
						</td>
					</tr>

				</table>

				<div id="noticeAddSubmit">
					<input type="submit" value="완료" >
					<input type="button" value="취소" onclick="window.close();">
				</div>
		</form>
	</fieldset>
</body>
</html>
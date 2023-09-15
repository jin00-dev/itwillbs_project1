<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>noticeBoardAdd.jsp</h1>
	<fieldset>
		<form action="noticeBoardAddAction.bo" method="post" name = "fr" id="noticeAddForm">
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
					<input type="submit" value="완료" class="btn" id="noticeAddBtn">
				</div>
		</form>
	</fieldset>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>faqBoardAdd.jsp</h1>
	<fieldset>
		<form action="faqBoardAddAction.bo?category=2" method="post" name = "fr" id="faqAddForm">
		<table id="faqAdd">
					<tr>
						<td>질문 :</td>
						<td colspan="2"><textarea rows="" cols="" id="qInput" name="subject"></textarea>
						</td>
					</tr>
					<tr>
						<td>답변 :</td>
						<td colspan="2">
							<textarea rows="" cols="" id="aInput" name="content"></textarea>
						</td>
					</tr>

				</table>

				<div id="faqAddSubmit">
					<input type="submit" value="완료" class="btn" id="faqAddBtn">
				</div>
		</form>
	</fieldset>
</body>
</html>
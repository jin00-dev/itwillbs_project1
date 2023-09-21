<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
</script>
</head>

<body>
	<h2>FAQ 글 삭제 페이지</h2>

	<h3>삭제하시겠습니까?</h3>

	<form action="./enfBoardDelete.bo?category=2&&user_id=${user_id}" method="post">
		<input type="hidden" name="faq_bno" value="${param.faq_bno }">
		
		<input type="submit" value="예" class="btn">
		<input type="button" value="아니요" class="btn" onclick="window.close();">
	</form>


</body>
</html>
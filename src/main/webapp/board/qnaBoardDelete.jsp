<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
	<h2> 게시판 글 삭제 페이지 </h2>
	<form action="./qnaBoardDeleteAction.bo?pageNum=${param.pageNum }"
		method="post">
		<input type="hidden" name="qna_bno" value="${param.qna_bno }">
		<input type="hidden" name="user_id" value="${param.user_id }">
		<table id="delete">
			<tr>
				<th class="ttitle" colspan="3">1:1문의 삭제</th>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="text" id="wInput" name="pass">
				</td>
			</tr>

		</table>

		<div id="table_search">
			<input type="submit" value="글 삭제" class="btn">
		</div>
		<div class="clear"></div>
		<div id="page_control"></div>
	</form>
	
<!-- 하단바 고정  -->
<footer>
	<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
</footer>
<!-- 하단바 고정  -->
</body>
</html>
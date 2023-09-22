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
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<!-- 상단 바 고정 -->
	<div class="container">
		<form action="./enfBoardUpdatePro.bo?&&category=2&&user_id=${user_id}"
			method="post">
			<input type="hidden" name="faq_bno" value="${dto.faq_bno }">
			<table id="faqUpdate">
				<tr>
					<th class="ttitle" colspan="3">FAQ 수정</th>
				</tr>
				<tr>
					<td>제 목 :</td>
					<td colspan="2"><input type="text" id="sInput" name="subject"
						value="${dto.subject }"></td>
				</tr>
				<tr>
					<td>내 용 :</td>
					<td colspan="2"><textarea rows="" cols="" id="wInput"
							name="content">${dto.content }</textarea></td>
				</tr>
			</table>

			<div id="table_search">
				<input type="submit" value="수정하기"> <input type="button"
					value="취소" onclick="window.close();">
			</div>
			<div class="clear"></div>
			<div id="page_control"></div>
		</form>
	</div>



</body>
</html>
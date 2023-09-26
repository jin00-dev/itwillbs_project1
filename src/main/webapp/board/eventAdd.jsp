<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/event.css" rel="stylesheet">
<link href="./css/listPage.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
	 <form action="enfBoardAdd.bo?category=0&&user_id=${user_id}" method="post" enctype="multipart/form-data">
	 	<fieldset>
	 		<table class="boardContent">
				<tr>
					<th class="ttitle" colspan="3">이벤트 추가</th>
				</tr>
				<tr>
					<td class="column">제목</td>
					<td colspan="2"><input type="text" name="subject" class="cntSubject" required></td>
				</tr>
				<tr>
					<td class="column">내용</td>
					<td colspan="2"><textarea rows="" cols="" class="cntContent"
							name="content" required="required"></textarea></td>
				</tr>
				<tr>
					<td class="column">파일</td>
					<td colspan="2"><input type="file" name="file" required></td>
				</tr>
				
			</table>
	 		
<!-- 			<legend class="ttilte">파일 업로드</legend> -->
<!-- 				<label for="subject" class="column"> 타이틀 </label> -->
<!-- 				<input type="text" name="subject" class="cntSubject" required><br> -->
<!-- 				<label for="content" class="column"> 내용 </label> -->
<!-- 				<input type="text" name="content" id="content" required><br> -->
<!-- 				<textarea rows="" cols="" class="cntContent" name="content" required="required"></textarea><br> -->
<!-- 				<label for="file" class="column"> 파일 </label> -->
<!-- 				<input type="file" name="file" required><br> -->
			<div class="CRUD">
				<input type="submit" class="btn" value="추가">
				<input type="button" class="btn" value="취소" onclick="window.close();">
			</div>
				 	
	 	</fieldset>
	 </form>
</body>
</html>
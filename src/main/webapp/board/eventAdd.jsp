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
	<h1>eventAdd.jsp</h1>
	 <form action="enfBoardAdd.bo?category=0&&user_id=${user_id}" method="post" enctype="multipart/form-data">
	 	<fieldset>
			<legend>파일 업로드</legend>
				<label for="subject" > 타이틀 :</label>
				<input type="text" name="subject" required><br>
				<label for="content" > 내용 :</label>
<!-- 				<input type="text" name="content" id="content" required><br> -->
				<textarea rows="" cols="" class="cntContent" name="content" required="required"></textarea><br>
				<label for="file"> 파일 :</label>
				<input type="file" name="file" id="file" required><br>
			<input type="submit" class="btn" value="upload">	 	
	 	</fieldset>
	 </form>
</body>
</html>
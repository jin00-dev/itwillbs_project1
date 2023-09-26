<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/event.css" rel="stylesheet">
<link href="./css/listPage.css" rel="stylesheet">
<title>Off The Lamp</title>
<!-- 상단 바 고정 -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/global.css" rel="stylesheet">
<link href="./css/index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<script src="./js/bootstrap.bundle.min.js"></script>
<!-- 상단 바 고정 -->
<style type="text/css">
.btn{
  padding: 0.5em;
  margin: 0.5em 1em;
  width: 10em;
  border-radius: 0.5em;
}
input{
	padding: 0.5em;
  	margin: 0.5em 0;
	width: 23em;
	border-radius: 0.5em;
}
textarea{
	padding: 0.5em;
  	margin: 0.5em 0;
	width: 23em;
	height: 8em;
	border-radius: 0.5em;
}
fieldset{
padding: 15px ;
margin: 15px auto;
}


</style>
</head>
<body>
	 <form action="enfBoardAdd.bo?category=0&&user_id=${user_id}" method="post" enctype="multipart/form-data">
	 	<fieldset>
			<legend>파일 업로드</legend>
				<label for="subject" > 타이틀</label><br>
				<input type="text" name="subject" required><br>
				<label for="content" > 내용 </label><br>
<!-- 				<input type="text" name="content" id="content" required><br> -->
				<textarea rows="" cols="" class="cntContent" name="content" required="required"></textarea><br>
				<label for="file"> 파일 </label>
				<input type="file" name="file" id="file" required><br>
			<input type="submit" class="btn" value="upload">	 	
	 	</fieldset>
	 </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/listPage.css" rel="stylesheet">
<title>이벤트</title>
</head>
<body>
	<!-- 상단 바 고정 -->
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<!-- 상단 바 고정 -->
</head>
<body>
	<!-- 여기 대관문의 꾸며아함. -->

	<div class="container">
		<form
			action="./qnaBoardUpdatePro.bo?pageNum=${pageNum }&&user_id=${user_id}"
			method="post">
			<input type="hidden" name="qna_bno" value="${dto.qna_bno }">
			<input type="hidden" name="subject" value="${dto.subject }">
			<input type="hidden" name="content" value="${dto.content }">
			<input type="hidden" name="answer" value="1">
			<table id="Update">
				<tr>
					<th class="ttitle" colspan="3">1:1문의 수정</th>
				</tr>

				<tr>
					<td>제 목 :</td>
					<td colspan="2">${dto.subject }</td>
				</tr>
				<tr>
					<td>내 용 :</td>
					<td colspan="2">${dto.content }</td>
				</tr>
				<tr>
					<td>답 변 내 용 :</td>
					<td colspan="2"><textarea rows="" cols="" id="wInput"
							name="answer_context"></textarea></td>
				</tr>
			</table>

			<div id="table_search">
				<input type="submit" value="수정하기" class="btn">
			</div>
			<div class="clear"></div>
			<div id="page_control"></div>
		</form>
	</div>

	<!-- footer아래로는 코드 금지 -->

	<!-- 하단바 고정  -->
	<footer>
		<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
	</footer>
	<!-- 하단바 고정  -->


	<script>
		window.onscroll = function() {
			myFunction()
		};

		var navbar_sticky = document.getElementById("navbar_sticky");
		var sticky = navbar_sticky.offsetTop;
		var navbar_height = document.querySelector('.navbar').offsetHeight;

		function myFunction() {
			if (window.pageYOffset >= sticky + navbar_height) {
				navbar_sticky.classList.add("sticky")
				document.body.style.paddingTop = navbar_height + 'px';
			} else {
				navbar_sticky.classList.remove("sticky");
				document.body.style.paddingTop = '0'
			}
		}
	</script>

</body>
</html>
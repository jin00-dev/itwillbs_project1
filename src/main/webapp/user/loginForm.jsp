<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
</head>

<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
<!-- 여기 로그인 페이지 꾸며아함. -->
<section id="center" class="center_o pt-2 pb-2">
		<fieldset class="id_pw_wrap">
			<legend >로그인</legend>
			<form action="./UserLoginAction.me" method="post">
			
					<input type="text" name="id" placeholder="아이디" class="id_pw"> <br>
					<input type="password" name="pw" placeholder="비밀번호" class="id_pw"> <hr>
				
				<button type="submit" class="btn_login">
					<span>로그인</span>
				</button>
			</form>
		
		<div class="panel_item2">
			<a href="./UserFindId.me">아이디 찾기</a> |
			<a href="./UserFindPw.me">비밀번호 찾기</a> |
			<a href="./UserJoin.me">회원 가입</a> 
			<hr>
			<a href="javascript:kakaoLogin()"><img src="./img/kakao_login_large.png" width="80px"/></a>
		</div>
		</fieldset>
		
		<fieldset class="id_pw_wrap">
			<legend >비회원 예매</legend>
			<form action="./NonMemberLoginAction.me" method="post">
			
					<input type="text" name="id" placeholder="아이디" class="id_pw"> <br>
					<input type="text" name="phone" placeholder="휴대폰 번호" class="id_pw"> <br>
					<input type="password" name="pw" placeholder="비밀번호" class="id_pw"> <br>
					<input type="password" name="pwCheck" placeholder="비밀번호 확인" class="id_pw"> <hr>
				
				<button type="submit" class="btn_login">
					<span>와! 비회원 예매</span>
				</button>
			</form>
		</fieldset>
		<hr>
 </section>

	
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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/global.css" rel="stylesheet">
<link href="./css/index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/joinPage.css">
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/code.jquery.com_jquery-3.7.1.min.js"></script>

</head>
<body>
	<section id="top">
		<div class="container">
			<div class="row top_1">
				<div class="col-md-3">
					<div class="top_1l pt-1">
						<h3 class="mb-0">
							<a class="text-white" href="../main.html"><i
								class="fa fa-video-camera col_red me-1"></i>Drive in Cinema</a>
						</h3>
					</div>
				</div>
				<div class="col-md-5">
					<div class="top_1m"></div>
				</div>
				<div class="col-md-4">
					<div class="top_1r text-end">
						<ul class="social-network social-circle mb-0">
							<li><a href="loginForm.jsp">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="header">
		<nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
			<div class="container">
				<a class="navbar-brand text-white fw-bold" href="../main.html"><i
					class="fa fa-video-camera col_red me-1"></i>Drive In Cinema</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="../order/orderMain.jsp">예매안내</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../event/eventMain.jsp">이벤트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../board/introduceMain.jsp">소개게시판</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								고객문의 </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../board/noticeMain.jsp">공지사항</a></li>
								<li><a class="dropdown-item" href="../board/faqMain.jsp">자주묻는질문</a></li>
								<li><a class="dropdown-item border-0"
									href="../board/rentMain.jsp">대관문의</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!-- 여기 회원가입 페이지 꾸며아함. -->
	<!--center -------------------------------------------------------------  -->
	
	
<section id="center" class="center_o pt-2 pb-2">
	<section id="join_box">
		<h1>회원가입</h1>
		<fieldset id="authenfication">
			<button>간편인증</button>
			<button>휴대폰인증</button>
		</fieldset>
	
		<form action="./UserJoinAction.me" method="post" >
			<fieldset id="join_wrap">
					<label>이름 </label> <br><input type="text" name="user_name" placeholder="이름입력"> <br>
					<label>전화번호 </label><br> <input type="text" name="user_phone" placeholder="-없이 휴대폰 번호 입력"> <br>
					<label>아이디 </label><br><input type="text"  name="user_id" placeholder="아이디 입력"> 
					<input type="button" id="double_check" value="중복확인" onclick="location.href='./UserIdCheckAction.me';"><br>
					<label>비밀번호 </label><br> <input type="password" name="user_pass" placeholder="비밀번호 입력"> <br>
					<label>비밀번호 확인 </label><br> <input type="password" name="user_chpw" placeholder="비밀번호 입력 확인"> <br>
					<input type="submit" value="회원가입" onclick="return check()">
			</fieldset>
		</form>
	</section>

	<hr>
 </section>

<!--center end-------------------------------------------------------------  -->
	<!-- footer아래로는 코드 금지 -->

	<section id="footer_b" class="pt-3 pb-3 bg_grey">
		<div class="container">
			<ul class="mb-0">
				<li class="d-inline-block me-2"><a href="#">Home</a></li>
				<li class="d-inline-block me-2"><a href="#">Features</a></li>
				<li class="d-inline-block me-2"><a href="#">Pages</a></li>
				<li class="d-inline-block me-2"><a href="#">Portfolio</a></li>
				<li class="d-inline-block me-2"><a href="#">Blog</a></li>
				<li class="d-inline-block"><a href="#">Contact</a></li>
			</ul>
		</div>
	</section>


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
		
		function check(){
			var str = "";
			
			/* 이름 유효성 검사 */
			if($('input[name="user_name"]').val().length == 0){
				alert('이름을 입력하세요');
				$('input[name="user_name"]').focus();
				return false;
			}
			
			/* 휴대폰번호 유효성 검사 */
			if($('input[name="user_phone"]').val().length == 0){
				alert('전화번호를 입력하세요');
				$('input[name="user_phone"]').focus();
				return false;
			}
			
			/* 아이디 유효성 검사 */
			if($('input[name="user_id"]').val().length == 0){ // if( $('#id').val() == "" ) 도 가능
				alert('아이디를 입력하세요');
				$('input[name="user_id"]').focus(); // 이건 그냥 마우스 커서가 여기로 오게 하는것
				return false;
			}
			/* 비밀번호 및 비밀번호 확인 유효성 검사 */
			if($('input[name="user_pass"]').val().length == 0){
				alert('비밀번호를 입력하세요');
				$('input[name="user_pass"]').focus();
				return false;
			}
			
			if($('input[name="user_chpw"]').val().length == 0){
				alert("비밀번호 확인을 입력하세요.");
				$('input[name="user_chpw"]').focus();
				return false;
			}
			
			if($('input[name="user_pass"]').val() != $('input[name="user_chpw"]').val()){
				alert("비밀번호가 일치하지 않습니다.");
				$('input[name="user_pass"]').select(); // 마우스 커서도 오고, 텍스트가 블록 씌워진 상태로 됨
				return false;
			}
			
			
	}
	</script>

</body>
</html>
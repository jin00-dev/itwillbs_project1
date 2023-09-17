<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Jquery 라이브러리 추가 -->
<script src="../js/code.jquery.com_jquery-3.7.1.min.js"></script>
<script type="text/javascript">

</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>

</head>
<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
<!-- 여기 회원가입 페이지 꾸며아함. -->
<section id="center" class="center_o pt-2 pb-2">
	<form action="./loginForm.jsp" method="post"></form>
		
<fieldset>
 <div class="container">
        <nav class="navi">
            <ul>
                  
                   <li><a href="./findIdForm.jsp">아이디찾기</a></li> 
                   <li><a href="./findPwForm.jsp">비밀번호찾기</a></li> 
            </ul>   
        </nav>
        </div>
 </fieldset>
 
	
	
	
	 <div id="box3">
	 <fieldset>
            <h4 id="a">아이디</h4>
               <input id="box" type="text"> <br>
             <h4 id="a">휴대폰 번호</h4>
              <input id="box" type="text" > 
              <input type="button" value="인증"> <br>
             
               <input id="b" type="button" value="비밀번호 찾기"> 
            </fieldset>
		</div>
 </section>
<!--center end-------------------------------------------------------------  -->
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
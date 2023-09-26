<%@ page language="java" contentType="text/html; charset=UTF-8" ageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Off The Lamp</title>
</head>
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
	<!--center -------------------------------------------------------------  -->
<section id="center" class="center_o pt-2 pb-2">
	<form action="./UserLoing" method="post">
	
			
			<script type="text/javascript">
			alert("고객님의 비밀번호는 "+${user_pass}+" 입니다");
			location.href="./UserLogin.me";
			</script>
		
	</form>

	<hr>
 </section>
<!--center end-------------------------------------------------------------  -->
	<!-- footer아래로는 코드 금지 -->

<footer>
	<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
</footer>



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
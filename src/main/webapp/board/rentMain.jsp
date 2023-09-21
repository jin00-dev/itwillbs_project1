<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트</title>
</head>
<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
<!-- 여기 대관문의 꾸며아함. -->

	<div class="container">
		<h1>
			대관 문의 게시판 
		</h1>
		<h2> 대관 절차 </h2>
		<ul>
			<li>
				대관 절차 적는 곳 			
			</li>
		</ul>
		<h2> 승인 부결 통보 </h2>
		<ul>
			<li>
				심의에서 승인 또는 부결된 결과는 개별적으로 통보해 드립니다. 			
			</li>
			<li>
				심의에서 승인된 신청 건에 대해서는 기본대관료 내역 및 계약금과 승인일이 명시된 대관승인서를 메일로 보내드립니다. 			
			</li>
		</ul>
		<h2> 대관 계약</h2>
		<ul>
			<li>
				계약금을 납부함으로써 대관계약이 성립됩니다.	
			</li>
			<li>
				계약금은 기본대관료의 10%이며, 납부기한은 청구일로부터 10일 이내입니다.	
			</li>
			<li>
				계약금을 납부 기한 내 납부하지 않을 시 자동으로 대관승인이 취소됩니다.
			</li>
		</ul>
		
		<div>
			<input type="button" value="대관문의작성" onclick="location.href = './rentWrite.bo'">		
		</div>

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
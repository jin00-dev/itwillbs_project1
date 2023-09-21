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
<title>이벤트</title>
<link href="./css/faqMain.css" rel="stylesheet">
</head>
<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
	<div class="container">
		<!-- 		<h1> -->
		<!-- 			여기 faq게시판 꾸미는자리<br> 밑에 footer 알아서 내려감 -->
		<!-- 		</h1> -->
		<script type="text/javascript">
			var popupX = (document.body.offsetWidth / 2) - (500 / 2) + 90;
			// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		
			var popupY= (window.screen.height / 2) - (300 / 2) - 20;
			// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			console.log(popupX);
			console.log(popupY);
			function qnaBoard() {
				if(${user_id == null}){
					alert("로그인 후 이용해주세요");
				}else{
					window.open("./qnaBoard.bo?user_id=${user_id}","_black","width=500, height=300, left="+popupX+", top="+popupY);
				}
			}
			function qnaBoardList() {
// 				console.log(${user_id})
				if(${user_id == null}){
					alert("로그인 후 이용해주세요");
				}else{
					window.open("./qnaBoardList.bo?user_id=${user_id}", "_self");
				}
			}
			function faqBoardAdd() {
				window.open("./faqBoardAdd.bo&&user_id=${user_id}","_black","width=500, height=300, left="+popupX+", top="+popupY);
			}
			function faqBoardUpdate(bno) {
				window.open("./faqBoardUpdate.bo?faq_bno="+bno+"&&category=2&&user_id=${user_id}","_black","width=500, height=300, left="+popupX+", top="+popupY);
			}
			function faqBoardDelete(bno) {
				window.open("./faqBoardDelete.bo?faq_bno="+bno+"&&category=2&&user_id=${user_id}","_black","width=500, height=300, left="+popupX+", top="+popupY);
			}
			function boardList() {
				location.href="./faqMain.bo?user_id=${user_id}";
			}
			

		</script>
		<div>
			<input type="button" onclick="qnaBoard();" value="1:1 문의" /> 
			<input type="button" onclick="qnaBoardList();" value="1:1 문의내역" />
		</div>
		<h1>자주 묻는 질문</h1>
		<div class="faq-container">
			<c:forEach var="dto" items="${boardList }">
				<div class="faq">
					<c:if test="${user_id eq 'admin'}">
						<input type="button" name="btn" id="updateFaq" value="faq수정"
							onclick="faqBoardUpdate(${dto.faq_bno});">
						<input type="button" name="btn" id="deleteFaq" value="faq삭제"
							onclick="faqBoardDelete(${dto.faq_bno});">
					</c:if>
					<h3 class="faq-title">${dto.subject }</h3>

					<p class="faq-text">${dto.content }</p>

					<button class="faq-toggle">
						<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
					</button>
				</div>
			</c:forEach>
			
		</div>
		<c:if test="${user_id eq 'admin'}">
			<div>
				<input type="button" name="btn" id="insertFaq" value="faq추가"
					onclick="faqBoardAdd();">
			</div>
		</c:if>

	</div>
	<script type="text/javascript">
		const toggles = document.querySelectorAll(".faq-toggle");

		toggles.forEach((toggle) => {
	  	toggle.addEventListener("click", () => {
	   		 toggle.parentNode.classList.toggle("active");
	  		});
		});
	</script>
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
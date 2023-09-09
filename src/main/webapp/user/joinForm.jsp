<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/joinPage.css">
</head>

<header>
	<jsp:include page="/inc/topBar.jsp" ></jsp:include>
</header>
	<!-- 여기 회원가입 페이지 꾸며아함. -->
	<!--center -------------------------------------------------------------  -->
	
	
<section id="center" class="center_o pt-2 pb-2">
	<section id="join_box">
		<h1>회원가입</h1>
		<fieldset id="certification">
			<button onclick="certification()">간편인증</button>
			<button>휴대폰인증</button>
		</fieldset>
	
		<form action="./UserJoinAction.me" method="post" >
			<fieldset id="join_wrap">
					<label>이름 </label> <br><input type="text" name="user_name" placeholder="이름입력"> <br>
					<label>전화번호 </label><br> <input type="text" name="user_phone" placeholder="-없이 휴대폰 번호 입력"> <br>
					<label>아이디 </label><br><input type="text"  name="user_id" placeholder="아이디 입력"> 
					<input type="button" id="double_check" value="중복확인" onclick="checkUserId()"><br>
					<p id='chId'></p>
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

<footer>
	<jsp:include page="/inc/bottomBar.jsp" ></jsp:include>
</footer>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

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
		
		
		
		
		
		//아이디 중복체크
		function checkUserId() {
            var userId = $("input[name='user_id']").val();
            $.ajax({
                url: './UserIdCheckAction.me',
                type: 'POST',
                data: {userId: userId},
                success: function(response) {
                    if(response.trim() === "true") {
                    	$("#chId").text("사용 가능한 아이디입니다.");
            			$("#chId").css('color','green');
                    } else {
                        $("#chId").text("이미 존재하는 아이디입니다.");
                        $("#chId").css('color','red');
                    }
                }
            });
        }
		
		//입력값 공백 및 비밀번호 일치확인
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
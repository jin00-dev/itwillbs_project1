<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/joinPage.css">
</head>

<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 여기 회원가입 페이지 꾸며아함. -->
<!--center -------------------------------------------------------------  -->


<section id="center" class="center_o pt-2 pb-2">
	<section id="join_box">
		<h1>회원가입</h1>
		<fieldset id="certification">
			<button onclick="certification()">간편인증</button>
			<button onclick="requestPay()">휴대폰인증</button>
		</fieldset>

		<form action="./UserJoinAction.me" method="post">
			<fieldset id="join_wrap">
				<label>이름 </label> <br><input type="text" name="user_name" placeholder="이름입력"> <br>
				<p id='hiddenMsgName'></p>
				<label>전화번호 </label><br> <input type="text" name="user_phone"placeholder="-없이 휴대폰 번호 입력"> <br> 
				<p id='hiddenMsgPhone'></p>
				<label>아이디 </label><br><input type="text" name="user_id" placeholder="아이디 입력"> 
				<input type="button" id="double_check" value="중복확인"onclick="checkUserId()"><br>
				<p id='chId'></p>
				<input type="hidden" id="isCheckId" value="false">
				<label>비밀번호 </label><br> <input type="password" name="user_pass" placeholder="비밀번호 입력"> <br>
				<p id='hiddenMsgPw'></p>
				 <label>비밀번호 확인 </label><br> <input type="password" name="user_chpw" placeholder="비밀번호 입력 확인"> <br> 
				<p id='hiddenMsgPwCheck'></p>
				
				 <input type="hidden"name="isCertification"> 
				 <input type="submit" value="회원가입"	onclick="return check()">
			</fieldset>
		</form>
	</section>

	<hr>
</section>

<!--center end-------------------------------------------------------------  -->
<!-- footer아래로는 코드 금지 -->

<footer>
	<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
</footer>

<!-- iamport.payment.js -->
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script> -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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

	//통합인증 - 미완성
	function certification() {
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp29272276");
		// IMP.certification(param, callback) 호출
		IMP.certification({ // param
			pg : 'inicis_unified.MIIiasTest',//본인인증 설정이 2개이상 되어 있는 경우 필수 
			// 			    merchant_uid: "ORD20180131-0000011", // 주문 번호
			// 			    min_age: 15, //본인인증 최소 나이
			//  			    m_redirect_url : "./UserJoinAction.me", // 모바일환경에서 popup:false(기본값) 인 경우 필수, 예: https://www.myservice.com/payments/complete/mobile
			popup : false
		// PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
		}, function(rsp) { // callback
			if (rsp.success) { // 인증 성공 시 jQuery로 HTTP 요청
				$("input[name='isCertification']").val(rsp.success);
				alert("인증에 성공하였습니다.");
			} else {
				$("input[name='isCertification']").val(rsp.success);
				alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});

	}

	//아이디 중복체크 
	function checkUserId() {
		var userId = $("input[name='user_id']").val();

		if (userId.length == 0) {
			alert('아이디를 입력하세요');
			$('input[name="user_id"]').focus();
		} else {
			$.ajax({
				url : './UserIdCheckAction.me',
				type : 'POST',
				data : {userId : userId},
				success : function(response) {
					if (response.trim() === "true") {
						$("#chId").text("사용 가능한 아이디입니다.");
						$("#chId").css('color', 'green');
						$("#isCheckId").val("true");
// 						console.log($("#isCheckId").val());
					} else {
						$("#chId").text("이미 존재하는 아이디입니다.");
						$("#chId").css('color', 'red');
						$("#isCheckId").val("false");
// 						console.log($("#isCheckId").val());
					}
				}
			});
		}
	}

	//입력값 공백 및 비밀번호 일치확인 및 인증체크
	function check() {
// 		var str = "";

		/* 인증여부 체크 */
// 		if ($("input[name='isCertification']").val() != 'true') {
// 			alert('본인인증을 해주세요');
// 			return false;
// 		}
		/* 이름 유효성 검사 */
		if ($('input[name="user_name"]').val().length == 0) {
			$("#hiddenMsgName").text("이름을 입력하세요.");
			$("#hiddenMsgName").css('color', 'red');
			$('input[name="user_name"]').focus();
			return false;
		}else{
			$("#hiddenMsgName").text("");
		}

		/* 휴대폰번호 유효성 검사 */
		if ($('input[name="user_phone"]').val().length == 0) {
			$("#hiddenMsgPhone").text("전화번호를 입력하세요.");
			$("#hiddenMsgPhone").css('color', 'red');
			$('input[name="user_phone"]').focus();
			return false;
		}else{
			$("#hiddenMsgPhone").text("");
		}

		/* 아이디 유효성 검사 */
		if ($('input[name="user_id"]').val().length == 0) {
			$("#chId").text("아이디를 입력하세요.");
			$("#chId").css('color', 'red');
			$('input[name="user_id"]').focus(); 
			return false;
		}else{
			$("#chId").text("");
		}
		
		/* 아이디 중복 검사 실패시 */
		if ($("#isCheckId").val() != "true") {
			$("#chId").text("아이디 중복 확인을 해주세요.");
			$("#chId").css('color', 'red');
// 			alert($("#chId").text());
			$('input[name="user_id"]').focus(); 
			return false;
		}else{
			$("#chId").text("");
		}

		/* 비밀번호 및 비밀번호 확인 유효성 검사 */
		if ($('input[name="user_pass"]').val().length == 0) {
			$("#hiddenMsgPw").text("비밀번호를 입력해 주세요.");
			$("#hiddenMsgPw").css('color', 'red');
			$('input[name="user_pass"]').focus();
			return false;
		}else{
			$("#hiddenMsgPw").text("");
		}

		if ($('input[name="user_chpw"]').val().length == 0) {
			$("#hiddenMsgPwCheck").text("비밀번호 확인을 입력해주세요.");
			$("#hiddenMsgPwCheck").css('color', 'red');
			$('input[name="user_chpw"]').focus();
			return false;
		}else{
			$("#hiddenMsgPwCheck").text("");
		}

		if ($('input[name="user_pass"]').val() != $('input[name="user_chpw"]').val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$('input[name="user_pass"]').select(); 
			return false;
		}

	}
</script>

</body>
</html>
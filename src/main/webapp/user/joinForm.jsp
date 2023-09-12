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
<!-- ���� ȸ������ ������ �ٸ����. -->
<!--center -------------------------------------------------------------  -->


<section id="center" class="center_o pt-2 pb-2">
	<section id="join_box">
		<h1>ȸ������</h1>
		<fieldset id="certification">
			<button onclick="certification()">��������</button>
			<button onclick="requestPay()">�޴�������</button>
		</fieldset>

		<form action="./UserJoinAction.me" method="post">
			<fieldset id="join_wrap">
				<label>�̸� </label> <br><input type="text" name="user_name" placeholder="�̸��Է�"> <br>
				<p id='hiddenMsgName'></p>
				<label>��ȭ��ȣ </label><br> <input type="text" name="user_phone"placeholder="-���� �޴��� ��ȣ �Է�"> <br> 
				<p id='hiddenMsgPhone'></p>
				<label>���̵� </label><br><input type="text" name="user_id" placeholder="���̵� �Է�"> 
				<input type="button" id="double_check" value="�ߺ�Ȯ��"onclick="checkUserId()"><br>
				<p id='chId'></p>
				<input type="hidden" id="isCheckId" value="false">
				<label>��й�ȣ </label><br> <input type="password" name="user_pass" placeholder="��й�ȣ �Է�"> <br>
				<p id='hiddenMsgPw'></p>
				 <label>��й�ȣ Ȯ�� </label><br> <input type="password" name="user_chpw" placeholder="��й�ȣ �Է� Ȯ��"> <br> 
				<p id='hiddenMsgPwCheck'></p>
				
				 <input type="hidden"name="isCertification"> 
				 <input type="submit" value="ȸ������"	onclick="return check()">
			</fieldset>
		</form>
	</section>

	<hr>
</section>

<!--center end-------------------------------------------------------------  -->
<!-- footer�Ʒ��δ� �ڵ� ���� -->

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

	//�������� - �̿ϼ�
	function certification() {
		var IMP = window.IMP; // ���� ����
		IMP.init("imp29272276");
		// IMP.certification(param, callback) ȣ��
		IMP.certification({ // param
			pg : 'inicis_unified.MIIiasTest',//�������� ������ 2���̻� �Ǿ� �ִ� ��� �ʼ� 
			// 			    merchant_uid: "ORD20180131-0000011", // �ֹ� ��ȣ
			// 			    min_age: 15, //�������� �ּ� ����
			//  			    m_redirect_url : "./UserJoinAction.me", // �����ȯ�濡�� popup:false(�⺻��) �� ��� �ʼ�, ��: https://www.myservice.com/payments/complete/mobile
			popup : false
		// PCȯ�濡���� popup �Ķ���Ͱ� ���õǰ� �׻� true �� �����
		}, function(rsp) { // callback
			if (rsp.success) { // ���� ���� �� jQuery�� HTTP ��û
				$("input[name='isCertification']").val(rsp.success);
				alert("������ �����Ͽ����ϴ�.");
			} else {
				$("input[name='isCertification']").val(rsp.success);
				alert("������ �����Ͽ����ϴ�. ���� ����: " + rsp.error_msg);
			}
		});

	}

	//���̵� �ߺ�üũ 
	function checkUserId() {
		var userId = $("input[name='user_id']").val();

		if (userId.length == 0) {
			alert('���̵� �Է��ϼ���');
			$('input[name="user_id"]').focus();
		} else {
			$.ajax({
				url : './UserIdCheckAction.me',
				type : 'POST',
				data : {userId : userId},
				success : function(response) {
					if (response.trim() === "true") {
						$("#chId").text("��� ������ ���̵��Դϴ�.");
						$("#chId").css('color', 'green');
						$("#isCheckId").val("true");
// 						console.log($("#isCheckId").val());
					} else {
						$("#chId").text("�̹� �����ϴ� ���̵��Դϴ�.");
						$("#chId").css('color', 'red');
						$("#isCheckId").val("false");
// 						console.log($("#isCheckId").val());
					}
				}
			});
		}
	}

	//�Է°� ���� �� ��й�ȣ ��ġȮ�� �� ����üũ
	function check() {
// 		var str = "";

		/* �������� üũ */
// 		if ($("input[name='isCertification']").val() != 'true') {
// 			alert('���������� ���ּ���');
// 			return false;
// 		}
		/* �̸� ��ȿ�� �˻� */
		if ($('input[name="user_name"]').val().length == 0) {
			$("#hiddenMsgName").text("�̸��� �Է��ϼ���.");
			$("#hiddenMsgName").css('color', 'red');
			$('input[name="user_name"]').focus();
			return false;
		}else{
			$("#hiddenMsgName").text("");
		}

		/* �޴�����ȣ ��ȿ�� �˻� */
		if ($('input[name="user_phone"]').val().length == 0) {
			$("#hiddenMsgPhone").text("��ȭ��ȣ�� �Է��ϼ���.");
			$("#hiddenMsgPhone").css('color', 'red');
			$('input[name="user_phone"]').focus();
			return false;
		}else{
			$("#hiddenMsgPhone").text("");
		}

		/* ���̵� ��ȿ�� �˻� */
		if ($('input[name="user_id"]').val().length == 0) {
			$("#chId").text("���̵� �Է��ϼ���.");
			$("#chId").css('color', 'red');
			$('input[name="user_id"]').focus(); 
			return false;
		}else{
			$("#chId").text("");
		}
		
		/* ���̵� �ߺ� �˻� ���н� */
		if ($("#isCheckId").val() != "true") {
			$("#chId").text("���̵� �ߺ� Ȯ���� ���ּ���.");
			$("#chId").css('color', 'red');
// 			alert($("#chId").text());
			$('input[name="user_id"]').focus(); 
			return false;
		}else{
			$("#chId").text("");
		}

		/* ��й�ȣ �� ��й�ȣ Ȯ�� ��ȿ�� �˻� */
		if ($('input[name="user_pass"]').val().length == 0) {
			$("#hiddenMsgPw").text("��й�ȣ�� �Է��� �ּ���.");
			$("#hiddenMsgPw").css('color', 'red');
			$('input[name="user_pass"]').focus();
			return false;
		}else{
			$("#hiddenMsgPw").text("");
		}

		if ($('input[name="user_chpw"]').val().length == 0) {
			$("#hiddenMsgPwCheck").text("��й�ȣ Ȯ���� �Է����ּ���.");
			$("#hiddenMsgPwCheck").css('color', 'red');
			$('input[name="user_chpw"]').focus();
			return false;
		}else{
			$("#hiddenMsgPwCheck").text("");
		}

		if ($('input[name="user_pass"]').val() != $('input[name="user_chpw"]').val()) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			$('input[name="user_pass"]').select(); 
			return false;
		}

	}
</script>

</body>
</html>
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
	<!-- ���� ȸ������ ������ �ٸ����. -->
	<!--center -------------------------------------------------------------  -->
	
	
<section id="center" class="center_o pt-2 pb-2">
	<section id="join_box">
		<h1>ȸ������</h1>
		<fieldset id="certification">
			<button onclick="certification()">��������</button>
			<button>�޴�������</button>
		</fieldset>
	
		<form action="./UserJoinAction.me" method="post" >
			<fieldset id="join_wrap">
					<label>�̸� </label> <br><input type="text" name="user_name" placeholder="�̸��Է�"> <br>
					<label>��ȭ��ȣ </label><br> <input type="text" name="user_phone" placeholder="-���� �޴��� ��ȣ �Է�"> <br>
					<label>���̵� </label><br><input type="text"  name="user_id" placeholder="���̵� �Է�"> 
					<input type="button" id="double_check" value="�ߺ�Ȯ��" onclick="checkUserId()"><br>
					<p id='chId'></p>
					<label>��й�ȣ </label><br> <input type="password" name="user_pass" placeholder="��й�ȣ �Է�"> <br>
					<label>��й�ȣ Ȯ�� </label><br> <input type="password" name="user_chpw" placeholder="��й�ȣ �Է� Ȯ��"> <br>
					<input type="submit" value="ȸ������" onclick="return check()">
			</fieldset>
		</form>
	</section>

	<hr>
 </section>

<!--center end-------------------------------------------------------------  -->
	<!-- footer�Ʒ��δ� �ڵ� ���� -->

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
		
		
		
		
		
		//���̵� �ߺ�üũ
		function checkUserId() {
            var userId = $("input[name='user_id']").val();
            $.ajax({
                url: './UserIdCheckAction.me',
                type: 'POST',
                data: {userId: userId},
                success: function(response) {
                    if(response.trim() === "true") {
                    	$("#chId").text("��� ������ ���̵��Դϴ�.");
            			$("#chId").css('color','green');
                    } else {
                        $("#chId").text("�̹� �����ϴ� ���̵��Դϴ�.");
                        $("#chId").css('color','red');
                    }
                }
            });
        }
		
		//�Է°� ���� �� ��й�ȣ ��ġȮ��
		function check(){
			var str = "";
			
			/* �̸� ��ȿ�� �˻� */
			if($('input[name="user_name"]').val().length == 0){
				alert('�̸��� �Է��ϼ���');
				$('input[name="user_name"]').focus();
				return false;
			}
			
			/* �޴�����ȣ ��ȿ�� �˻� */
			if($('input[name="user_phone"]').val().length == 0){
				alert('��ȭ��ȣ�� �Է��ϼ���');
				$('input[name="user_phone"]').focus();
				return false;
			}
			
			/* ���̵� ��ȿ�� �˻� */
			if($('input[name="user_id"]').val().length == 0){ // if( $('#id').val() == "" ) �� ����
				alert('���̵� �Է��ϼ���');
				$('input[name="user_id"]').focus(); // �̰� �׳� ���콺 Ŀ���� ����� ���� �ϴ°�
				return false;
			}
			/* ��й�ȣ �� ��й�ȣ Ȯ�� ��ȿ�� �˻� */
			if($('input[name="user_pass"]').val().length == 0){
				alert('��й�ȣ�� �Է��ϼ���');
				$('input[name="user_pass"]').focus();
				return false;
			}
			
			if($('input[name="user_chpw"]').val().length == 0){
				alert("��й�ȣ Ȯ���� �Է��ϼ���.");
				$('input[name="user_chpw"]').focus();
				return false;
			}
			
			if($('input[name="user_pass"]').val() != $('input[name="user_chpw"]').val()){
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				$('input[name="user_pass"]').select(); // ���콺 Ŀ���� ����, �ؽ�Ʈ�� ��� ������ ���·� ��
				return false;
			}
			
			
		}
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ȸ������</title>
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
							<li><a href="loginForm.jsp">�α���</a></li>
							<li><a href="#">ȸ������</a></li>
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
							aria-current="page" href="../order/orderMain.jsp">���žȳ�</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../event/eventMain.jsp">�̺�Ʈ</a></li>
						<li class="nav-item"><a class="nav-link"
							href="../board/introduceMain.jsp">�Ұ��Խ���</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								������ </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../board/noticeMain.jsp">��������</a></li>
								<li><a class="dropdown-item" href="../board/faqMain.jsp">���ֹ�������</a></li>
								<li><a class="dropdown-item border-0"
									href="../board/rentMain.jsp">�������</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!-- ���� ȸ������ ������ �ٸ����. -->
	<!--center -------------------------------------------------------------  -->
	
	
<section id="center" class="center_o pt-2 pb-2">
	<section id="join_box">
		<h1>ȸ������</h1>
		<fieldset id="authenfication">
			<button>��������</button>
			<button>�޴�������</button>
		</fieldset>
	
		<form action="./UserJoinAction.me" method="post" >
			<fieldset id="join_wrap">
					<label>�̸� </label> <br><input type="text" name="user_name" placeholder="�̸��Է�"> <br>
					<label>��ȭ��ȣ </label><br> <input type="text" name="user_phone" placeholder="-���� �޴��� ��ȣ �Է�"> <br>
					<label>���̵� </label><br><input type="text"  name="user_id" placeholder="���̵� �Է�"> 
					<input type="button" id="double_check" value="�ߺ�Ȯ��" onclick="location.href='./UserIdCheckAction.me';"><br>
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
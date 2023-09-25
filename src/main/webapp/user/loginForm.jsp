<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�α���</title>
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/global.css" rel="stylesheet">
<link href="./css/index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<script src="./js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/loginPage.css" />
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="./js/code.jquery.com_jquery-3.7.1.min.js"></script>
<script type="text/javascript">

    Kakao.init('de2279459191574f31f380ed2e0961df');
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                    	var resp = response.kakao_account;
//                     	console.log(resp);
                    	if(resp.is_email_verified == true){
                    	   $.ajax({
	                    	   type: "POST",
	                    	   url: "./KakaoLoginAction.me",
	                    	   data: {kakaoEmail:resp.email,
	                    		   		kakaoNickname:resp.profile.nickname,
	                    		   		kakaoLogin:true
	                    	   			},
	                       	   success:function(result){
	                       		   console.log(result);
	                       		   if(result.trim() == "true"){
	                       			   location.href="./Main.me";
	                       		   }else{
	                       			   alert('����');
	                       		   }
	                       	   },
	                       	   error: function(){
	                       		   console.log("ajax ����");
	                       	   }
                       	   });//ajax
                       }else{
                    	   
                       }//if
                    },//success
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
    }
</script>
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
							<li><a href="#">�α���</a></li>
							<li><a href="insertForm.jsp">ȸ������</a></li>
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
						<li class="nav-item"><a class="nav-link" href="../board/introduceMain.jsp">�Ұ��Խ���</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								������ </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../board/noticeMain.jsp">��������</a></li>
								<li><a class="dropdown-item" href="../board/faqMain.jsp">���ֹ�������</a></li>
								<li><a class="dropdown-item border-0" href="../board/rentMain.jsp">�������</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!--center -------------------------------------------------------------  -->
<section id="center" class="center_o pt-2 pb-2">
		<fieldset class="id_pw_wrap">
			<legend >�α���</legend>
			<form action="./UserLoginAction.me" method="post">
			
					<input type="text" name="id" placeholder="���̵�" class="id_pw"> <br>
					<input type="password" name="pw" placeholder="��й�ȣ" class="id_pw"> <hr>
				
				<button type="submit" class="btn_login">
					<span>�α���</span>
				</button>
			</form>
		
		<div class="panel_item2">
			<a href="./UserFindId.me">���̵� ã��</a> |
			<a href="./UserFindPw.me">��й�ȣ ã��</a> |
			<a href="./UserJoin.me">ȸ�� ����</a> 
			<hr>
			<a href="javascript:kakaoLogin()"><img src="./img/kakao_login_large.png" width="80px"/></a>
		</div>
		</fieldset>
		
		<fieldset class="id_pw_wrap">
			<legend >��ȸ�� ����</legend>
			<form action="./NonMemberLoginAction.me" method="post">
			
					<input type="text" name="id" placeholder="���̵�" class="id_pw"> <br>
					<input type="text" name="phone" placeholder="�޴��� ��ȣ" class="id_pw"> <br>
					<input type="password" name="pw" placeholder="��й�ȣ" class="id_pw"> <br>
					<input type="password" name="pwCheck" placeholder="��й�ȣ Ȯ��" class="id_pw"> <hr>
				
				<button type="submit" class="btn_login">
					<span>��! ��ȸ�� ����</span>
				</button>
			</form>
		</fieldset>
		<hr>
 </section>

<!--center end-------------------------------------------------------------  -->

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
	</script>

</body>
</html>
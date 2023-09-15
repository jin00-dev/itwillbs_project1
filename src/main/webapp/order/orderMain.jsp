<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>���žȳ�</title>
<link href="./css/cinema.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/global.css" rel="stylesheet">
<link href="./css/main.css" rel="stylesheet">
<link href="./css/index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/code.jquery.com_jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {

		$('.region').click(function() {
			var region = $(this).text();

			var region1 = region.substr(0, 2);
			var region2 = region.substr(3, 2);
			
			$('.region').not(this).css('color','white');
			$(this).css('color','red');
			
			$.ajax({
				url : "./cinemaInfo.or",
				data : {
					"region1" : region1,
					"region2" : region2
				},
					success : function(data) {
						console.log(data);
						$('#theater_list').empty();
						$.each(data,function(idx,item){
							// cinema_name : ���������� ������̸�
							var cinema_name = item.cinema_name;
							$('#theater_list').append("<a class='showMovie'>"+cinema_name+"</a> <br>")
						});
						   $('.showMovie').click(function(){
								var theater = $(this).text();
								
								
								$('.showMovie').not(this).css('color','white');
								$(this).css('color','red')
		
								$.ajax({
									url : "./theaterInfo.or",
									data : {"theater":theater},
									success : function(data){
										console.log(data);
										$('#movieName').empty();
										$.each(data,function(idx,item){
											// movie_name : ���忡�� ������ ��ȭ��
											var movie_name = item.movie_name;
											$('#movieName').append("<a class='showTime'>"+movie_name+"</a> <br>")
										});
					
										$('.showTime').click(function(){
											var movie = $(this).text();
											
											$('.showTime').not(this).css('color','white');
											$(this).css('color','red')
						
 											$.ajax({
												url : "./movieInfo.or",
												data : {"movie":movie,"theater":theater},
												success : function(data){
													console.log(data);
													$('#movieTime').empty();
													$.each(data,function(idx,item){
														// ������ ��ȭ�� �󿵽ð�
														var dateTime = item.movieTime;
														alert(dateTime)
														$('#movieTime').append("<a class='time'>"+item.movieTime.substr(11,5)+"</a> <br>")
													});	
													
													$('.time').click(function(){
														var time = $(this).text();
														$('.time').not(this).css('color','white');
														$(this).css('color','red');												
														
														$('#btn1').click(function(){
															var car_num = $('#text1').val();
															var car_type = $('#option').val();																	
															console.log(theater+movie+time);															
															$.ajax({
																url : "./seatPayment.or",
																data : {"theater":theater,"movie":movie,"time":time,"car_num":car_num,"car_type":car_type},
																success : function(){
																	alert("��������");
																	
																},
																error : function(){
																	alert("��������");
																}
															});
															
														});
														
													});															
												},
												error : function(){
													alert("����!");
												}									
											});	// movie click
 							
										});
										
									},
									error : function(){
										alert("����!");
									}
								});
							}); // cinema click
	
					},
					error : function() {
						alert("����!");
					}
				});

			}); // region click
			
			$('.noCinema').click(function(){
				alert("������ �������ּ���");
			});
			
			$('.noMovie').click(function(){
				alert("������ �������ּ���");
			});
			
			$('#btn1').click(function(){
				if($('#text1').val() == "" ){
					alert("������ȣ�� �����ϼ���");
					$('#text1').focus();
				}
			});
			
		
		
		}); // jquery��


	
	

</script>
</head>
<body>
	<section id="top">
		<div class="con">
			<div class="row top_1">
				<div class="col-md-3">
					<div class="top_1l pt-1">
						<h3 class="mb-0">
							<a class="text-white" href="./main.html"><i
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
							<li><a href="./user/loginForm.jsp">�α���</a></li>
							<li><a href="./user/insertForm.jsp">ȸ������</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="header">
		<nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
			<div class="container">
				<a class="navbar-brand text-white fw-bold" href="./main.html"><i
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
							aria-current="page" href="#">���žȳ�</a></li>
						<li class="nav-item"><a class="nav-link"
							href="./event/eventMain.jsp">�̺�Ʈ</a></li>
						<li class="nav-item"><a class="nav-link"
							href="./board/introduceMain.jsp">�Ұ��Խ���</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								������ </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="./board/noticeMain.jsp">��������</a></li>
								<li><a class="dropdown-item" href="./board/faqMain.jsp">���ֹ�������</a></li>
								<li><a class="dropdown-item border-0"
									href="./board/rentMain.jsp">�������</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!-- ���� ���� ������ �ٸ����. -->
	<main>
		<section id="section">


	<div class="container">
		<h1>
			���� ���������� �ٹ̴��ڸ�<br> �ؿ� footer �˾Ƽ� ������
		</h1>
	</div>

			<div id="movie_res" class="cdiv">��ȭ����</div>

			<div id="theater" class="cdiv">��ȭ��</div>
			<div id="theater" class="cdiv">��ȭ/�󿵽ð�</div>
			<div id="car_number" class="cdiv">�������</div>

			<div id="text" class="cdiv">

				<a class="region">����/���</a><br> <a class="region">�λ�/���</a><br> <a class="region">�뱸/���</a><br>
				<a class="region">����/��û</a><br> <a class="region">����/����</a><br>
				<a class="region">����/����</a><br>

			</div>

			<div class="cdiv" id="theater_list">
			<a class="noCinema">�������ڵ�������</a><br>
			<a class="noCinema">�����ڵ�������</a><br>
			<a class="noCinema">�����ڵ�������</a><br>
			<a class="noCinema">�۽�Ʈ�����ڵ�������</a><br>
			<a class="noCinema">����ȣ�ڵ�������</a><br>
			<a class="noCinema">��õ�ڵ�������</a><br>
			<a class="noCinema">�ѱ��μ����ڵ�������</a><br>
			</div>
			
			

			<div id="movieName" class="cdiv">
			<a class="noMovie">��</a><br>
			<a class="noMovie">�������̸�</a><br>
			<a class="noMovie">��ũ��Ʈ �����Ǿ�</a><br>
			<a class="noMovie">��¦������: 7510</a><br>
			<a class="noMovie">7�����Ǽ���</a><br>
			<a class="noMovie">�Ǹ��� ���Ҵ�</a><br>
			<a class="noMovie">�ܿ�ձ�2</a><br>
			</div>



			<div id="movieTime" class="cdiv"></div>


			<div class="cdiv" id="otc">
				<div>
					������ȣ<input type="text" id="text1"><br> <br>
					<!-- �ɼ� ���� -->
				</div>
				<div id="carnum">
					�������� <select id="option">
						<option class="text" value="������">������</option>
						<option class="text" value="������">������</option>
						<option class="text" value="������">������</option>
				</div>
				</select> <input type="button" id="btn1" value="�������">
			</div>

		</section>
	</main>
>>>>>>> payment
	

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
	</script>

</body>
</html>
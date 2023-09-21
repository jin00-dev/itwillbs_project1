<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예매안내</title>
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
							// cinema_name : 지역에따른 극장들이름
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
											// movie_name : 극장에서 상영중인 영화들
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
														// 상영중인 영화의 상영시간
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
																	alert("ㅈㄷㅅㄱ");
																	
																},
																error : function(){
																	alert("ㅈㄷㅅㄱ");
																}
															});
															
														});
														
													});															
												},
												error : function(){
													alert("오류!");
												}									
											});	// movie click
 							
										});
										
									},
									error : function(){
										alert("오류!");
									}
								});
							}); // cinema click
	
					},
					error : function() {
						alert("오류!");
					}
				});

			}); // region click
			
			$('.noCinema').click(function(){
				alert("지역을 선택해주세요");
			});
			
			$('.noMovie').click(function(){
				alert("극장을 선택해주세요");
			});
			
			$('#btn1').click(function(){
				if($('#text1').val() == "" ){
					alert("차량번호를 기입하세요");
					$('#text1').focus();
				}
			});
			
		
		
		}); // jquery끝


	
	

</script>
</head>

<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
<!-- 여기 예매 페이지 꾸며아함. -->
	<main>
		<section id="section">


	<div class="container">
		<h1>
			여기 예매페이지 꾸미는자리<br> 밑에 footer 알아서 내려감
		</h1>
	</div>

			<div id="movie_res" class="cdiv">영화예매</div>

			<div id="theater" class="cdiv">영화관</div>
			<div id="theater" class="cdiv">영화/상영시간</div>
			<div id="car_number" class="cdiv">차량등록</div>

			<div id="text" class="cdiv">

				<a class="region">서울/경기</a><br> <a class="region">부산/경상</a><br> <a class="region">대구/울산</a><br>
				<a class="region">대전/충청</a><br> <a class="region">광주/전라</a><br>
				<a class="region">강원/제주</a><br>

			</div>

			<div class="cdiv" id="theater_list">
			<a class="noCinema">자유로자동차극장</a><br>
			<a class="noCinema">장흥자동차극장</a><br>
			<a class="noCinema">초이자동차극장</a><br>
			<a class="noCinema">퍼스트가든자동차극장</a><br>
			<a class="noCinema">평택호자동차극장</a><br>
			<a class="noCinema">포천자동차극장</a><br>
			<a class="noCinema">한국민속촌자동차극장</a><br>
			</div>
			
			

			<div id="movieName" class="cdiv">
			<a class="noMovie">잠</a><br>
			<a class="noMovie">오펜하이머</a><br>
			<a class="noMovie">콘크리트 유토피아</a><br>
			<a class="noMovie">달짝지근해: 7510</a><br>
			<a class="noMovie">7번방의선물</a><br>
			<a class="noMovie">악마를 보았다</a><br>
			<a class="noMovie">겨울왕국2</a><br>
			</div>



			<div id="movieTime" class="cdiv"></div>


			<div class="cdiv" id="otc">
				<div>
					차량번호<input type="text" id="text1"><br> <br>
					<!-- 옵션 차종 -->
				</div>
				<div id="carnum">
					차량종류 <select id="option">
						<option class="text" value="소형차">소형차</option>
						<option class="text" value="중형차">중형차</option>
						<option class="text" value="대형차">대형차</option>
				</div>
				</select> <input type="button" id="btn1" value="차량등록">
			</div>

		</section>
	</main>
>>>>>>> payment
	

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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ur2rm9e363"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Off The Lamp</title>
<script src="./js/code.jquery.com_jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			$.ajax({
				url : "./CinemaSelectAction.bo",
				dataType : "json",
				success : function(data){
						// 첫 화면 서울/경기 극장 출력 
						$.each(data,function(idx,item){
							if(item.region == "경기"){
								var list = item.cinema_list.split(",");
								for(var i=0 ; i < list.length ; i++){
									$('.cinema').append("<h2 class='h1"+i+"'>"+list[i]+"</h2><hr>");
								}//for
							}//if
						});//each
						// 서울/경기 버튼 클릭시 해당 극장 출력
						$("#s").click(data,function(){
							$(".cinema").empty();
							$.each(data,function(idx,item){
								if(item.region == "경기"){
									var list = item.cinema_list.split(",");
									for(var i=0 ; i < list.length ; i++){
										$('.cinema').append("<h2 class='h1"+i+"'>"+list[i]+"</h2><hr>");
									}//for
								}//if
							});//each
						});//click
						// 부산/대구 버튼 클릭시 해당 극장 출력 
						$("#b").click(data,function(){
							$(".cinema").empty();
							$.each(data,function(idx,item){
								if(item.region == "부산"| item.region == "대구"| item.region == "경상"){
									var list = item.cinema_list.split(",");
									for(var i=0 ; i < list.length ; i++){
										$('.cinema').append("<h2 class='h2"+i+"'>"+list[i]+"</h2><hr>");
									}//for
								}//if
							});//each
						});//click
						//대전/충청 버튼 클릭시 해당 극장 출력
						$("#d").click(data,function(){
							$(".cinema").empty();
							$.each(data,function(idx,item){
								if(item.region == "대전"| item.region == "충청"){
									var list = item.cinema_list.split(",");
									for(var i=0 ; i < list.length ; i++){
										$('.cinema').append("<h2 class='h3"+i+"'>"+list[i]+"</h2><hr>");
									}//for
								}//if
							});//each
						});//click
						//광주/전라 버튼 클릭시 해당 극장 출력 
						$("#g").click(data,function(){
							$(".cinema").empty();
							$.each(data,function(idx,item){
								if(item.region == "광주"| item.region == "전라"){
									var list = item.cinema_list.split(",");
									for(var i=0 ; i < list.length ; i++){
										$('.cinema').append("<h2 class='h4"+i+"'>"+list[i]+"</h2><hr>");
									}//for
								}//if
							});//each
						});//click
						//강원도/제주 버튼 클릭시 해당 극장 출력 
						$("#j").click(data,function(){
							$(".cinema").empty();
							$.each(data,function(idx,item){
								if(item.region == "강원"| item.region == "제주"){
									var list = item.cinema_list.split(",");
									for(var i=0 ; i < list.length ; i++){
										$('.cinema').append("<h2 class='h5"+i+"'>"+list[i]+"</h2><hr>");
									}//for
								}//if
							});//each
						});//click
						
						$(".h10").one("click",function(){
						    $(".h10").append("<p>주소 : 경기 용인시 기흥구 보라동 389-6</p>");
						    
						  });
				}//success
			});//ajax 끝
		}); //JQuery 끝
	</script>

</head>
<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->

	<!-- 여기 소개 게시판 꾸며아함. -->

	<div class="container">
		<h1>소개게시판</h1>
		<hr>
		<div class = "region_list">
		<input type="button" value = "서울/경기" id="s">
		<input type="button" value = "부산/대구/경상" id="b">
		<input type="button" value = "대전/충청" id="d">
		<input type="button" value = "광주/전라" id="g">
		<input type="button" value = "강원도/제주" id="j">
		<hr>
		</div>
		
		<div id='map' style='width:100%; height:400px;'></div>
		<hr>
		<div class="cinema">
		</div>
		<p id = "intro"></p>
		
		
		

	</div>
	<!-- footer아래로는 코드 금지 -->

	<!-- 하단바 고정  -->
	<footer>
		<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
	</footer>
	<!-- 하단바 고정  -->

<script type="text/javascript">
	selectMapList(); // 지도 그려주는 함수 실행

// 지도 그려주는 함수
function selectMapList() {
	
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	});
}//function

//지도를 이동하게 해주는 함수
function moveMap(len, lat) {
	var mapOptions = {
		    center: new naver.maps.LatLng(len, lat),
		    zoom: 15,
		    mapTypeControl: true
		};
    var map = new naver.maps.Map('map', mapOptions);
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(len, lat),
        map: map
    });
}

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(37.5112, 127.0981),
    map: map
});
</script>

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
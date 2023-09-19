<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>이벤트</title>
</head>

<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!-- 상단 바 고정 -->
<!-- 여기 이벤트 페이지 꾸며아함. -->

	<div class="container">
		<h1>
			여기 이벤트페이지 꾸미는자리<br> 밑에 footer 알아서 내려감
		</h1>
	</div>
	
	<script type="text/javascript">
	window.onload = function () {
	    startLoadFile();
	};

	function startLoadFile(){
	    $.ajax({
	        url: './eventImg.json',
	        type: 'get',
	        dataType : 'json',
	        success : function (data) {
	        	console.log(data);
	            createImages(data);
	        }
	    	
	    });
	}

	// JSON 포멧 데이터 처리
	function createImages(objImageInfo) {
	    var images = objImageInfo.image;
	    console.log(images);
	    var str1DOM = "";
	    var str2DOM = "";
	    for (var i = 0; i < images.length; i++) {
	        // N번째 이미지 정보를 구하기
	        var image = images[i];
			if(image.eventType==0){
		        // 이벤트중인 N번째 이미지 패널을 생성
		        str1DOM += "<div class='image_panel'>";
		        str1DOM += "	<a href='eventContent.bo?category=0&&event_bno="+image.event_bno+"'>";
		        str1DOM += "    <img src='" + image.url + "'> </a>";
		        str1DOM += "    <p class='title'>" + image.title + "</p>";
		        str1DOM += "</div>";
			}else{
		        // 이벤트끝난 N번째 이미지 패널을 생성
		        str2DOM += "<div class='image_panel'>";
		        str2DOM += "	<a href='eventContent.bo?&&category=0&&event_bno="+image.event_bno+"'>";
		        str2DOM += "    <img src='" + image.url + "'> </a>";
		        str2DOM += "    <p class='title'>" + image.title + "</p>";
		        str2DOM += "</div>";				
			}
	    }
	    // 이미지 컨테이너에 생성한 이미지 패널들을 추가하기
	    var $imageContainer1 = $("#image_figure1");
	    var $imageContainer2 = $("#image_figure2");
	        $imageContainer1.append(str1DOM);
	        $imageContainer2.append(str2DOM);
	}
	</script>
	
	
	
	
	<h1>이벤트 메인페이지</h1>
	<input type="button" value="이벤트추가" onclick="eventAdd.bo">
 	<h2>진행중인 이벤트</h2>
	<section id="eventing">
		<div id="image_container1">
			<figure id=image_figure1>
			</figure>
		</div>
	</section>
	<h2>지난 이벤트</h2>
	<section id="evented">
		<div id="image_container2">
			<figure id=image_figure2>
			
			</figure>
		</div>
	</section>
	
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
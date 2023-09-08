<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

div{
	border: 1px solid;
	width: 200px;
	height: 400px;
	float: left;
	text-align : center;
}

section{
	width: 1009px;
	height: 500px;
	clear: left;
}
#movie_res{
	width: 1009px;
	height: 30px;
	border: 1px solid;
}

#theater{
	border: 1px solid;
	width: 400px;
	height: 25px;
}

#car_number{
	border: 1px solid;
	width: 203px;
	height: 25px;
}

#btn1{
	position: relative;
	top: 270px;
	right: 10px;
}

section{
	margin-left: 200px;
	margin-top: 100px;
}

.text{
  text-align : center;
  line-height : 50px;

}


</style>
</head>
<body>

		<main>
		<section>
		
		<div id="movie_res">영화예매</div>
		
		<div id="theater">영화관</div>
		<div id="theater">영화/상영시간</div>
		<div id="car_number">차량등록</div>
		
		<div class="text">

		서울/경기<br>
		부산/대구/경상<br>
		대전/충청<br>
		광주/전라<br>
		강원/제주<br>

		</div>
		
		<div>
		..
		</div>
		
		<div class="text">
		db..영화...
		</div>
		
		<div class="text">
		시간
		</div>
		
		
		<div>
		차량번호<input type="text" ><br>
		<!-- 셀렉트 옵션 차종.. -->
		차량종류<br>
		<select class="text">
				<option class="text" value=".">소형차</option>
			    <option class="text" value=".">중형차</option>
			    <option class="text" value=".">대형차</option>
			</select >
		<input type="button" id="btn1" value="차량등록">
		</div>
		
		</section>
		</main>
		
		

</body>
</html>
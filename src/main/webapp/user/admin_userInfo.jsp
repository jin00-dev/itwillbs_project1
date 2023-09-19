<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/userInfo.css">
</head>
<body>
<c:if test="${empty sessionScope.user_id}">
	<script>
		alert('로그인 해주세요.');
		location.href='./UserLogin.me';
	</script>
</c:if>
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>
<!--center -------------------------------------------------------------  -->
<main>
	<h1>${sessionScope.user_id } 님 환영합니다</h1>
	<div id="container">
		<input id="btn1" type="button" value="예매관리"	onclick="location.href='./UserOrderBoardAction.me'">
		<input id="btn2" type="button" style="background: gray;" value="회원정보수정"	onclick="location.href='./UserInfoCheck.me'">
		<input id="btn2" type="button" value="고객지원 관리"	onclick="location.href='./UserInfoCheck.me'">
		<input id="btn2" type="button" value="컨텐츠 관리"	onclick="location.href='./UserInfoCheck.me'">
	</div>
	<div id="userInfo_box">
		<div id="table_search">
			<form action="AdminUserInfoBoardAction.me" method="post">
				<input type="text" name="search" class="input_box" placeholder="회원 아이디를 입력해주세요.">
				<input type="submit" value="검색" >
			</form>
		</div>
		<c:set var="bno" value="${startRow-1 }"/>
		<c:set var="bno1" value="-1"/>
		<table id="table">
			<tr>
				<td>No.</td>
				<td>성명</td>
				<td>아이디</td>
				<td>휴대폰 번호</td>
				<td>가입날짜</td>
				<td>예매내역</td>
				<td>관리</td>
			</tr>
			<c:choose>
				<c:when test="${!empty list }">
				<c:forEach items="${list }" var="list">
				<tr>
					<td>${bno=bno+1 } </td>
					<td >${list.user_name }</td>
					<td >${list.user_id }</td>
					<td>${fn:substring(list.user_phone,0,3)}-${fn:substring(list.user_phone,3,7)}-${fn:substring(list.user_phone,7,11)} </td>
					<td><fmt:formatDate value="${list.user_regdate }"/> </td>
					<td>${list.user_orderCount }건</td>
					<td id="openModalBtn${bno1=bno1+1}" class="openModalBtn">관리</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise><tr><td>일치하는 정보 없음</td></tr></c:otherwise>
			</c:choose>
		</table>
	
		<div class="clear"></div>
		<div id="page_control">
			<c:if test="${startPage > pageBlock }">
				<div>
					<a href="./AdminUserInfoBoardAction.me?pageNum=${startPage-pageBlock }">Prev</a>
				</div>
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
				<div>
					<a href="./AdminUserInfoBoardAction.me?pageNum=${i }">${i}</a>
				</div>
			</c:forEach>
			<c:if test="${endPage < pageCount }">
				<div>
					<a href="./AdminUserInfoBoardAction.me?pageNum=${startPage+pageBlock }">Next</a>
				</div>
			</c:if>
		</div>
	</div>

</main>
<!--center end-------------------------------------------------------------  -->
<footer>
	<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
</footer>

	<!-- 모달 출력필드 -->
	<div id="MyModal" class="modal">
	    <div class="modal-contents">
	      <h2 id="p0"></h2>
	      <p id="p1">
	      <p id="p2"></p>
     	  <p id="p3"></p>
	      <input id="user_typeChange" type="button" value="등급변경">
	      <p id="p4"></p>
	      <p id="p6"></p>
	      <p id="p5"></p>
	      <p id="p7"></p>
	      <p id="p8"></p>
	      <input type="button" value="닫기" class="close">
	    </div>
	 </div>
  <script>
  	var choice =0;
  	$('#openModalBtn0').click(function(){
  		choice =0;
		$('#p0').text('${list.get(0).user_id}님의 회원정보입니다.');
		$('#p1').text('성명 : ${list.get(0).user_name}');
		$('#p2').text('아이디 : ${list.get(0).user_id}');
		if(${list.get(0).user_type}==0)
			$('#p3').text('회원등급 : 일반회원');
		if(${list.get(0).user_type}==1)
			$('#p3').text('회원등급 : 사이트관리자');
		if(${list.get(0).user_type}==2)
			$('#p3').text('회원등급 : 극장관리자');
		$('#p4').text('휴대폰번호 :${fn:substring(list.get(0).user_phone,0,3)}-${fn:substring(list.get(0).user_phone,3,7)}-${fn:substring(list.get(0).user_phone,7,11)}');
		$('#p5').text('차 번호 : ${list.get(0).user_car_num}');
		$('#p6').text('가입 날짜 : ${list.get(0).user_regdate}');
		$('#p7').text('접속시간 : ${list.get(0).last_access}');
		$('#p8').text('예매내역 : ${list.get(0).user_orderCount}건');
  	});
  	$('#openModalBtn1').click(function(){
  		choice =1;
		$('#p0').text('${list.get(1).user_id}님의 회원정보입니다.');
		$('#p1').text('성명 : ${list.get(1).user_name}');
		$('#p2').text('아이디 : ${list.get(1).user_id}');
		if(${list.get(1).user_type}==0)
			$('#p3').text('회원등급 : 일반회원');
		if(${list.get(1).user_type}==1)
			$('#p3').text('회원등급 : 사이트관리자');
		if(${list.get(1).user_type}==2)
			$('#p3').text('회원등급 : 극장관리자');		
		$('#p4').text('휴대폰번호 :${fn:substring(list.get(1).user_phone,0,3)}-${fn:substring(list.get(1).user_phone,3,7)}-${fn:substring(list.get(1).user_phone,7,11)}');
		$('#p5').text('차 번호 : ${list.get(1).user_car_num}');
		$('#p6').text('가입 날짜 : ${list.get(1).user_regdate}');
		$('#p7').text('접속시간 : ${list.get(1).last_access}');
		$('#p8').text('예매내역 : ${list.get(1).user_orderCount}건');
  	});
  	$('#openModalBtn2').click(function(){
  		choice =2;
		$('#p0').text('${list.get(2).user_id}님의 회원정보입니다.');
		$('#p1').text('성명 : ${list.get(2).user_name}');
		$('#p2').text('아이디 : ${list.get(2).user_id}');
		if(${list.get(2).user_type}==0)
			$('#p3').text('회원등급 : 일반회원');
		if(${list.get(2).user_type}==1)
			$('#p3').text('회원등급 : 사이트관리자');
		if(${list.get(2).user_type}==2)
			$('#p3').text('회원등급 : 극장관리자');
		$('#p4').text('휴대폰번호 :${fn:substring(list.get(2).user_phone,0,3)}-${fn:substring(list.get(2).user_phone,3,7)}-${fn:substring(list.get(2).user_phone,7,11)}');
		$('#p5').text('차 번호 : ${list.get(2).user_car_num}');
		$('#p6').text('가입 날짜 : ${list.get(2).user_regdate}');
		$('#p7').text('접속시간 : ${list.get(2).last_access}');
		$('#p8').text('예매내역 : ${list.get(2).user_orderCount}건');
  	});
  	$('#openModalBtn3').click(function(){
  		choice =3;
		$('#p0').text('${list.get(3).user_id}님의 회원정보입니다.');
		$('#p1').text('성명 : ${list.get(3).user_name}');
		$('#p2').text('아이디 : ${list.get(3).user_id}');
		if(${list.get(3).user_type}==0)
			$('#p3').text('회원등급 : 일반회원');
		if(${list.get(3).user_type}==1)
			$('#p3').text('회원등급 : 사이트관리자');
		if(${list.get(3).user_type}==2)
			$('#p3').text('회원등급 : 극장관리자');
		$('#p4').text('휴대폰번호 :${fn:substring(list.get(3).user_phone,0,3)}-${fn:substring(list.get(3).user_phone,3,7)}-${fn:substring(list.get(3).user_phone,7,11)}');
		$('#p5').text('차 번호 : ${list.get(3).user_car_num}');
		$('#p6').text('가입 날짜 : ${list.get(3).user_regdate}');
		$('#p7').text('접속시간 : ${list.get(3).last_access}');
		$('#p8').text('예매내역 : ${list.get(3).user_orderCount}건');
  	});
  	$('#openModalBtn4').click(function(){
  		choice =4;
  		
		$('#p0').text('${list.get(4).user_id}님의 회원정보입니다.');
		$('#p1').text('성명 : ${list.get(4).user_name}');
		$('#p2').text('아이디 : ${list.get(4).user_id}');
		if(${list.get(4).user_type}==0)
			$('#p3').text('회원등급 : 일반회원');
		if(${list.get(4).user_type}==1)
			$('#p3').text('회원등급 : 사이트관리자');
		if(${list.get(4).user_type}==2)
			$('#p3').text('회원등급 : 극장관리자');
		$('#p4').text('휴대폰번호 :${fn:substring(list.get(4).user_phone,0,3)}-${fn:substring(list.get(4).user_phone,3,7)}-${fn:substring(list.get(4).user_phone,7,11)}');
		$('#p5').text('차 번호 : ${list.get(4).user_car_num}');
		$('#p6').text('가입 날짜 : ${list.get(4).user_regdate}');
		$('#p7').text('접속시간 : ${list.get(4).last_access}');
		$('#p8').text('예매내역 : ${list.get(4).user_orderCount}건');
  	});
  	
  	//유저 등급변경 버튼
  	$("input[value='등급변경']").click(function(){
  		
  		var tNum = prompt('변경할 등급을 선택해주세요."\n 0 - 일반회원\n 1 - 사이트관리자\n 2 - 극장관리자"');
  		if(tNum==0 || tNum==1 || tNum==2){
	  		$.ajax({
				url : './UserTypeChangeAction.me',
				type : 'POST',
				data : {"choice" : choice,
						"startRow" : ${startRow},
						"pageSize" : ${pageSize},
						"user_type" :tNum
						},
				success : function(response) {
					if (response.trim() != "-1") {
						alert('등급변경 성공');
						location.reload();
					} else {
						alert('등급변경 실패');
					}
				}
			});
  		}else{
  			alert('등급을 다시 입력해주세요.');
  		}
  	})
  	
  
    $(document).ready(function(){
      // 모달과 닫기 버튼의 객체를 가져옵니다.
      var modal = $("#MyModal");
      var closeBtn = $(".close");

      // 'Open Modal' 버튼을 클릭하면 모달을 표시합니다.
      $(".openModalBtn").click(function(){
        modal.css("display", "block");
      });

      // 닫기 버튼을 클릭하면 모달을 숨깁니다.
      closeBtn.click(function(){
        modal.css("display", "none");
      });

      // 모달 외부를 클릭하면 모달을 숨깁니다.
      $(window).click(function(event){
        if (event.target === modal[0]) {
          modal.css("display", "none");
        }
      });
    });
  </script>


</body>
</html>
<%@page
	import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.team2.payment.db.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Off The Lamp</title>
<link href="./css/orderList.css" rel="stylesheet">
<link href="./css/footer.css" rel=stylesheet>
<script src="./js/code.jquery.com_jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "${sessionScope.user_id}";
		
		if(id != "admin"){
			alert("관리자 접근페이지입니다")
			location.href='./Main.or';
		};
		
		$('.openModalBtn').click(function(){
			var state = $('#idNum9').text();
			console.log(state);
			if(state == "결제상태 : 취소완료"){
				$('#cancelbtn').hide();
			}else{
				$('#cancelbtn').show();
			}
		});
						
		
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="/inc/topBar.jsp"></jsp:include>
	</header>
	<main>
		<h1>${sessionScope.user_id } 님 환영합니다</h1>
	<div id="container">
		<input id="btn1" type="button" style="background: gray;" value="예매관리"	onclick="location.href='./managerList.or'">
		<input id="btn2" type="button" value="회원정보수정"	onclick="location.href='./AdminUserInfoBoardAction.me'">
		<input id="btn2" type="button" value="대관문의"	onclick="location.href='./AdminRentInfoBoardAction.me'">
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
				<table class="table">
					<tr>
						<td>NO.</td>
						<td>예매번호</td>	
						<td>아이디</td>	
						<td>성명</td>	
						<td>영화이름</td>	
						<td>예매날짜</td>	
						<td>결제상태</td>	
						<td>상세내역</td>				
					</tr>
			
			<c:set var ="listNum" value="-1" />
			<c:set var ="bno" value="${startRow -1 }" />
			<c:forEach var="i" begin="1" end="${olist.size() }" step="1">
				<tr>
					<td>${bno=bno+1 }</td>
					<td>${olist.get(i-1).order_id }</td>
					<td>${ulist.get(i-1).user_id }</td>
					<td>${ulist.get(i-1).user_name }</td>
					<td>${olist.get(i-1).movie_name }</td>
					<td>${olist.get(i-1).order_date }</td>
					<c:choose>
						<c:when test="${olist.get(i-1).order_state eq 0 }">
							<td class="state">결제완료</td>
						</c:when>
						<c:otherwise>
							<td class="state">취소완료</td>
						</c:otherwise>
					</c:choose>
					<td id="openModalBtn${listNum=listNum+1 }" class="openModalBtn">상세내역</td>
				</tr>
			</c:forEach>
		</table>
		
					<div id="page_control">
							<c:if test="${startPage > pageBlock }">
								<a href="./managerList.or?pageNum=${startPage-pageBlock }&idcheck=${idcheck}">Prev</a>
							</c:if>
							
							<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
								<a href="./managerList.or?pageNum=${i}&idcheck=${idcheck}">${i }</a>
							</c:forEach>
							
							<c:if test="${endPage < pageCount }">
								<a href="./managerList.or?pageNum=${startPage+pageBlock }&idcheck=${idcheck}">Next</a>
							</c:if>
						</div>
					</div>
				</section>
				</div>
			</main>
		<style>
			
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	position: relative;
	margin: 10% auto;
	padding: 40px;
	background-color: #202020;
	width: 400px;
	text-align: center;
	font-weight: bolder;
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

#cancelbtn{
	background-color: #202020;
    border: none;
    font-weight: bolder;
    font-size: x-large;
}

#cancelbtn:hover{
	color: red;
}

.openModalBtn:hover{
	text-shadow: 3px 3px 3px grey;
}
			
		</style>
</head>
<body>
  <div id="myModal" class="modal">
    <div class="modal-content">
       <p id="idNum1"></p>
       <p id="idNum2"></p>
       <p id="idNum3"></p>
       <p id="idNum4"></p>
       <p id="idNum5"></p>
       <p id="idNum6"></p>
       <p id="idNum7"></p>
       <p id="idNum8"></p>
       <p id="idNum9"></p>
      <input type="button" value="X" class="close">
      <input type="button" id="cancelbtn"  value="결제취소" >
    </div>
  </div>
  <script>
  var choice =0;
  var ojlist = JSON.parse('${requestScope.ojlist}');
  var ujlist = JSON.parse('${requestScope.ujlist}');
  var pjlist = JSON.parse('${requestScope.pjlist}');
  
  $('#openModalBtn0').click(function(){
     choice=0
  });
  $('#openModalBtn1').click(function(){
     choice=1
  });
  $('#openModalBtn2').click(function(){
     choice=2
  });
  $('#openModalBtn3').click(function(){
     choice=3
  });
  $('#openModalBtn4').click(function(){
     choice=4
  });
  
  $('td[id^="openModalBtn"]').click(function(){
		var order_state;
		if(ojlist[choice].order_state == 0){
			order_state = "결제완료";
		}
		if(ojlist[choice].order_state == 1){
			order_state = "취소완료";
		}
	  
   $('#idNum1').text("예매번호 : "+ojlist[choice].order_id);
   $('#idNum2').text("예매날짜 : "+ojlist[choice].order_date);
   $('#idNum3').text("성명 : "+ujlist[choice].user_name);
   $('#idNum4').text("영화이름 : "+ojlist[choice].movie_name);
   $('#idNum5').text("휴대폰번호 : "+ujlist[choice].user_phone);
   $('#idNum6').text("차번호 : "+ojlist[choice].car_num);
   $('#idNum7').text("상영일 : "+ojlist[choice].screening_time);
   $('#idNum8').text("결제금액 : "+pjlist[choice].price);
   $('#idNum9').text("결제상태 : "+order_state);
  });
  

    $(document).ready(function(){
      // 모달과 닫기 버튼의 객체를 가져옵니다.
      var modal = $("#myModal");
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
      
		$('#cancelbtn').click(function(){
			if(confirm("정말 취소하시겠습니까??") == true){
//					document.removefrm.submit();
				modal.css("display","none");
				alert("취소완료");
				
				$.ajax({
					url:"./cancelOrder.or",
					data:{
						"order_id":ojlist[choice].order_id
						},
					success:function(){
						alert("갓다옴");
					},error:function(){
						alert("에러");
					}
				});
				
			}else{
				return false;
			}
		});
      
      
    });

    
  </script>
  	<footer>
  		<jsp:include page="/inc/bottomBarPix.jsp"></jsp:include>
  	</footer>

</body>
</html>
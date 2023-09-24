<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
</head>
<body>



	<%
		session.setAttribute("user_id", "admin");
	%>

		<table>
			<tr>
				<td>NO.</td>
				<td>예매번호</td>	
				<td>아이디</td>	
				<td>성명</td>	
				<td>영화이름</td>	
				<td>예매날짜</td>	
				<td>상세보기</td>				
			</tr>
			
			
	<c:set var ="bno" value="${startRow -1 }" />
	<c:forEach var="i" begin="0" end="${olist.size()-1 }" step="1">
		<tr>
			<td>${bno=bno+1 }</td>
			<td>${olist.get(i).order_id }</td>
			<td>${ulist.get(i).user_id }</td>
			<td>${ulist.get(i).user_name }</td>
			<td>${olist.get(i).movie_name }</td>
			<td>${olist.get(i).order_date }</td>
			<td id="openModalBtn${listNum=listNum+1 }" class="openModalBtn">상세내역</td>
		</tr>
	</c:forEach>
		</table>
		
		<div id="page_control">
	
	<c:if test="${startPage > pageBlock }">
		<a href="./managerList.or?pageNum=${startPage-pageBlock }">Prev</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		<a href="./managerList.or?pageNum=${i}">${i }</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="./managerList.or?pageNum=${startPage+pageBlock }">Next</a>
	</c:if>
	
</div>

<style>
    .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.7);
    }

    .modal-content {
      position: relative;
      margin: 10% auto;
      padding: 20px;
      background-color: #fff;
      width: 600px;
      height: 300px;
      text-align: center;
    }


  </style>
</head>
<body>


  <div id="myModal" class="modal">
    <div class="modal-content">
      예매번호:<input type="text" id="idNum1" value="">
       예매날짜:<input type="text" id="idNum2" value=""><br>
       성명:<input type="text"  value=""id="idNum3">
       영화이름:<input type="text" value=""id="idNum4"><br>
       휴대폰번호:<input type="text" value=""id="idNum5">
       차번호:<input type="text" value=""id="idNum6"><br>
       상영일:<input type="text" value=""id="idNum7"><br>
       결제금액:<input type="text" value="" id="idNum8"><br>
      <input type="button" value="확인" onclick="cancelPay()">
      <input type="button"  class="close" value="취소" >
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
   $('#idNum1').val(ojlist[choice].order_id);
   $('#idNum2').val(ojlist[choice].order_date);
   $('#idNum3').val(ujlist[choice].user_name);
   $('#idNum4').val(ojlist[choice].movie_name);
   $('#idNum5').val(ujlist[choice].user_phone);
   $('#idNum6').val(ojlist[choice].car_num);
   $('#idNum7').val(ojlist[choice].screening_time);
   $('#idNum8').val(pjlist[choice].price);

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
    });
    
    // 취소 api
    function cancelPay() {
        $.ajax({
          "url": "./MyPageMain.or", 
          "type": "POST",
          "contentType": "application/json",
          "data": JSON.stringify({
            "merchant_uid": "test_lmnlxoyg",
            "cancel_request_amount": 100,
            "reason": "테스트 결제 환불",
            "refund_holder": "홍길동", 
            "refund_bank": "88",
            "refund_account": "56211105948400"
          }),
          "dataType": "json"
        });
      }

    
  </script>

</body>
</html>
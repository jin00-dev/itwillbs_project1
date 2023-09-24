<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.team2.payment.db.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="./js/code.jquery.com_jquery-3.7.1.min.js"></script> -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert('성공!');
	});
	</script>
</head>
<body>
	<%
		session.setAttribute("user_id", "12");
	%>
	
		<table>
			<tr>
				<td>NO.</td>
				<td>예매번호</td>	
				<td>예매날짜</td>	
				<td>영화제목</td>	
				<td>차 번호</td>	
				<td>예매상태</td>	
				<td>상세내역</td>				
			</tr>
			
	<c:set var ="bno" value="${startRow -1 }" />
	<c:set var="listNum" value="-1" />
	<c:forEach var="i"  items="${requestScope.list}">
		<tr>
			<td>${bno=bno+1 }</td>
			<td>${i.order_id }</td>
			<td>${i.order_date }</td>
			<td>${i.movie_name }</td>
			<td>${i.car_num }</td>
			<c:choose >
			<c:when test="${i.order_state eq 0 }"><td>결제완료</td></c:when>
			<c:otherwise><td>취소완료</td></c:otherwise>
			</c:choose>
			<td id="openModalBtn${listNum=listNum+1 }" class="openModalBtn">상세내역</td>
		</tr>
	</c:forEach>
	
		</table>
		
		<div id="page_control">
	<c:if test="${startPage > pageBlock }">
		<a href="./MyPageMain.or?pageNum=${startPage-pageBlock }">Prev</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
		<a href="./MyPageMain.or?pageNum=${i}">${i }</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="./MyPageMain.or?pageNum=${startPage+pageBlock }">Next</a>
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

    .close {
      position: absolute;
      top: 10px;
      right: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      예매번호:<input type="text"  id="idNum1" value=""  onclick=""><br>
      예매날짜:<input type="text"  id="idNum2" value="" onclick=""><br>
      성명:<input type="text"  id="idNum3" value="" onclick=""><br>
      영화이름:<input type="text"  id="idNum4" value="" onclick=""><br>
      차량번호:<input type="text"  id="idNum5" value="" onclick=""><br>
      결제금액:<input type="text" id="idNum7" value="" onclick=""><br>
      결제상태:<input type="text" id="idNum6" value="" onclick=""><br>
      <input type="button"  class="close" value="닫기" ><br><br>
      <input type="button" value="예매취소" onclick="cancelPay()">
    </div>
  </div>
  <script>
  

  	
     
      var choice =0;
      var jlist = JSON.parse('${requestScope.jlist}');
      var jplist = JSON.parse('${requestScope.jplist}');
      
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
       $('#idNum1').val(jlist[choice].order_id);
       $('#idNum2').val(jlist[choice].order_date);
       $('#idNum3').val(jplist[choice].name);
       $('#idNum4').val(jlist[choice].movie_name);
       $('#idNum5').val(jlist[choice].car_num);
       $('#idNum7').val(jplist[choice].price);
       $('#idNum6').val(jlist[choice].order_state);
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

    
  </script>
		

</body>
</html>
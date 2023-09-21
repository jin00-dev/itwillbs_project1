<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/code.jquery.com_jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			$.ajax({
				url : "./CinemaSelectAction.bo",
				dataType : "json",
				success : function(data){
					$.each(data,function(idx,item){
						$("#region_name").append("<option value="+item.region+">"+item.region+"</option>");
						
						$("#region_name").change(function(){
						var re = $("select#region_name option:checked").val();
						if(item.region == re){
							$("#cinema_name").empty();
// 						console.log(re+" / "+item.region);
							var list = item.cinema_list.split(",");
							for(var i=0; i<list.length; i++){
// 							alert(list[i]);
								$("#cinema_name").append("<option value="+list[i]+">"+list[i]+"</option>");
							}//for
						}//if
						
						});//change
						 
					});//each
					
				}//success
			});//ajax 끝
		}); //JQuery 끝
	</script>
	<script type="text/javascript">
		function cancel(){
			// 대관문의 작성 취소 
			if(confirm("대관문의 작성을 취소하시겠습니까?")){
				location.href = "./rentMain.bo";
			}//if
		}//cancel
		function checkForm(){
			var form = document.rentForm;
			if(form.ruser_id.value == ""){
				alert("아이디를 입력해주세요");
				form.ruser_id.focus();
				return false;
			}else if(form.rname.value == ""){
				alert("이름 또는 기업명을 입력해주세요");
				form.rname.focus();
				return false;
			}else if(form.region.value == "start" || form.cinema.value == "start"){
				alert("지역 및 극장을 선택해주세요");
				return false;
			}else if(form.rphone.value == ""){
				alert("휴대폰 번호를 입력해주세요");
				form.rphone.focus();
				return false;
			}else if(form.remail.value == ""){
				alert("이메일 주소를 입력해주세요");
				from.remail.focus();
				return false;
			}else if(form.rsubject.value == ""){
				alert("제목을 입력해주세요");
				form.rsubject.focus();
				return false;
			}else if(form.rcontent.value == ""){
				alert("내용을 입력해주세요");
				form.rcontent.focus();
				return false;
			}else{
				alert("작성이 완료되었습니다.");
				form.submit();
				
			}
			}//checkForm
		</script>
	
</head>
<body>
<!-- 상단 바 고정 -->
<header>
	<jsp:include page="/inc/topBar.jsp"></jsp:include>
</header>

	<h1>대관문의 작성 test</h1>
	
	<form action="./rentWriteAction.bo" method="post" name ="rentForm">
<table id="notice">
	<tr>
		<td > 아이디 : </td> 
	    <td colspan="2">
	    	<input type="text" id="wInput" name="ruser_id">
	    </td>
    </tr>
	<tr>
		<td > 이름(기업명) : </td> 
	    <td colspan="2">
	    	<input type="text" id="wInput" name="rname">
	    </td>
    </tr>
	<tr>
		<td > 극장선택 : </td> 
	    <td colspan="2">
	    	<select name = "region" id ="region_name">
	    	<option value="start" class ="start">선택하세요</option>
	    	</select>
	    	<select name = "cinema" id ="cinema_name">
	    	<option value="start" class ="start1">선택하세요</option>
	    
	    	</select>
	    </td>
    </tr>
	<tr>
		<td > 휴대폰 번호 : </td> 
	    <td colspan="2">
	    	<input type="text" id="wInput" name="rphone">
	    </td>
    </tr>
	<tr>
		<td > 이메일 : </td> 
	    <td colspan="2">
	    	<input type="text" id="wInput" name="remail">
	    </td>
    </tr>
    <tr>
		<td> 제 목 : </td>
	    <td colspan="2">
	   		<input type="text" id="wInput" name="rsubject">
	    </td>
    </tr>
    <tr>
		<td> 내 용 : </td>
	    <td colspan="2">
	    	<textarea rows="" cols="" id="wInput" name="rcontent"
		    	></textarea>
	    </td>
    </tr>
</table>

	<div id="table_search">
		<input type="button" value="글쓰기" class="btn1" onclick = "checkForm();">
	</div>
	
	<div id="table_search">
		<input type="button" value="닫기" class="btn1" onclick ="cancel();" >
	</div>
	
		<div class="clear"></div>
	<div id="page_control">
	
	</div>
</form>
	
<!-- 하단바 고정  -->
<footer>
	<jsp:include page="/inc/bottomBar.jsp"></jsp:include>
</footer>
<!-- 하단바 고정  -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1:1 문의 작성 페이지 test</h1>
	
	<form action="./BoardWriteAction.bo" method="post">
<table id="notice">
	<tr>
		<td > 작성자 : </td> 
	    <td colspan="2">
	    	<input type="text" id="wInput" name="name">
	    </td>
    </tr>
    <tr>
		<td> 비밀번호 : </td>
	    <td colspan="2">
	    	<input type="password" id="wInput" name="pass">
	    </td>
    </tr>
    <tr>
		<td> 제 목 : </td>
	    <td colspan="2">
	   		<input type="text" id="wInput" name="subject">
	    </td>
    </tr>
    <tr>
		<td> 내 용 : </td>
	    <td colspan="2">
	    	<textarea rows="" cols="" id="wInput" name="content"
		    	></textarea>
	    </td>
    </tr>
</table>

	<div id="table_search">
		<input type="submit" value="글쓰기" class="btn">
	</div>
		<div class="clear"></div>
	<div id="page_control">
	
	</div>
</form>
	
		

</body>
</html>
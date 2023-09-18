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
					<td>${list.user_orderCount }</td>
					<td>관리</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise><tr></tr></c:otherwise>
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

<script type="text/javascript">

</script>


</body>
</html>
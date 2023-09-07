<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<header> -->
<%-- 		<jsp:include page="/inc/top.jsp"></jsp:include> --%>
<!-- 	</header> -->
	<main>
		<h1>메인</h1>

		<c:choose>
			<c:when test="${ empty sessionScope.id }">
				<a href="./UserLogin.me">로그인</a>
				<a href="./UserJoin.me">회원가입</a>
			</c:when>
			<c:otherwise>
				${sessionScope.id } 님 환영합니다. <br>
				<a href="./UserLogoutAction.me">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</main>
<!-- 	<footer> -->
<%-- 		<jsp:include page="/inc/bottom.jsp"></jsp:include> --%>
<!-- 	</footer> -->

</body>
</html>
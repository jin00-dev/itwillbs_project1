<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="noticeContent">
		<tr>
			<th class="ttitle" colspan="4"></th>
		</tr>
		<tr>
			<td>글번호</td>
			<td>${dto.qna_bno }</td>

			<td>작성일</td>
			<td><c:choose>
					<c:when test="${empty dto.updatedate}">
						<fmt:formatDate value="${dto.regdate }" pattern="YY-MM-dd" />
					</c:when>
					<c:otherwise>
						<fmt:formatDate value="${dto.updatedate }" pattern="YY-MM-dd" />
					</c:otherwise>
				</c:choose></td>

		</tr>
		<tr>
			<td>제 목</td>
			<td colspan="3">${dto.subject }</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td colspan="3">${dto.content }</td>
		</tr>
		
	</table>
	

	<div id="table_search">
		<input type="button" value="수정하기" class="btn"
			onclick="location.href='';">
		<input type="button" value="삭제하기" class="btn"
			onclick="location.href='';">
		<input type="button" value="답글쓰기" class="btn"
			onclick="location.href='';">
		<input type="button" value="목록이동" class="btn"
			onclick="location.href='';">
	</div>
</body>
</html>
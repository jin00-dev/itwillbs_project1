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
			<td> 질 문</td>
			<td colspan="3">${dto.subject }</td>
		</tr>
		<tr>
			<td> 내 용</td>
			<td colspan="3">${dto.content }</td>
		</tr>
		<tr>
			<td> 답 변 </td>
			<td colspan="3">${dto.answer_context }</td>
		</tr>
		
	</table>
	<script type="text/javascript">
		function deleteQna() {
			window.open("./qnaBoardDelete.bo?qna_bno=${dto.qna_bno }&&pageNum=${param.pageNum }&&user_id=${dto.user_id }",
					"_black","width=400, height=200");
		}
	</script>
<%-- 	<c:if test="${user_id == dto.user_id }"> --%>
	<div id="table_search">
		<c:if test="${dto.answer == 0 }"> 
		<!-- 답변 못받을 경우만 수정가능하게  -->
		<input type="button" value="수정하기" class="btn"
			onclick="location.href='qnaBoardUpdate.bo?qna_bno=${dto.qna_bno}&pageNum=${param.pageNum }';">
		</c:if>
		<input type="button" value="삭제하기" class="btn"
			onclick="deleteQna();">
		<input type="button" value="목록이동" class="btn"
			onclick="location.href='qnaBoardList.bo?pageNum=${param.pageNum}';">
	</div>
<%-- 	</c:if> --%>
<%-- 		<c:if test="${user_type = 1 }"> --%>
			<!-- 관리자만 가능하게  -->
			<input type="button" value="답글쓰기" class="btn"
			onclick="location.href='';">
<%-- 		</c:if> --%>
</body>
</html>
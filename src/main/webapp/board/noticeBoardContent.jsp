<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�̺�Ʈ</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/global.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet">
<script src="../js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<section id="top">
		<div class="container">
			<div class="row top_1">
				<div class="col-md-3">
					<div class="top_1l pt-1">
						<h3 class="mb-0">
							<a class="text-white" href="../main.html"><i
								class="fa fa-video-camera col_red me-1"></i>Drive in Cinema</a>
						</h3>
					</div>
				</div>
				<div class="col-md-5">
					<div class="top_1m"></div>
				</div>
				<div class="col-md-4">
					<div class="top_1r text-end">
						<ul class="social-network social-circle mb-0">
							<li><a href="../user/loginForm.jsp">�α���</a></li>
							<li><a href="../user/insertForm.jsp">ȸ������</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="header">
		<nav class="navbar navbar-expand-md navbar-light" id="navbar_sticky">
			<div class="container">
				<a class="navbar-brand text-white fw-bold" href="../main.html"><i
					class="fa fa-video-camera col_red me-1"></i>Drive In Cinema</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mb-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="../order/orderMain.jsp">���žȳ�</a></li>
						<li class="nav-item"><a class="nav-link" href="../event/eventMain.jsp">�̺�Ʈ</a></li>
						<li class="nav-item"><a class="nav-link" href="introduceMain.jsp">�Ұ��Խ���</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								�������� </a>
							<ul class="dropdown-menu drop_1" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">��������</a></li>
								<li><a class="dropdown-item" href="faqMain.bo">���ֹ�������</a></li>
								<li><a class="dropdown-item border-0" href="rentMain.bo">�������</a></li>
							</ul></li>
				</div>
			</div>
		</nav>
	</section>


	<!-- ���� �������� �ٸ����. -->
	<div class="container">
		<h1>�������� �۳���</h1>
		<table id="noticeContent">
		<tr>
			<th class="ttitle" colspan="4"></th>
		</tr>
		<tr>
			<td>�۹�ȣ</td>
			<td>${dto.notice_bno }</td>

			<td>�ۼ���</td>
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
			<td>�� ��</td>
			<td colspan="3">${dto.subject }</td>
		</tr>
		<tr>
			<td>�� ��</td>
			<td colspan="3">${dto.content }</td>
		</tr>
		
	</table>
	<script type="text/javascript">
		function noticeDelete() {
			window.open("./noticeBoardDelete.bo?notice_bno=${dto.notice_bno }&&pageNum=${param.pageNum }",
					"_black","width=400, height=200");
		}
		function boardList() {
			location.href="noticeMain.bo?pageNum=${param.pageNum}";
		}
	</script>
<%-- 	<c:if test="${user_type == 1 }"> --%>
		<div id="table_search">
		<input type="button" value="�����ϱ�" class="btn"
			onclick="location.href='noticeBoardUpdate.bo?notice_bno=${dto.notice_bno}&&event_type=${dto.event_type }&&pageNum=${param.pageNum }';">
		<input type="button" value="�����ϱ�" class="btn"
			onclick="noticeDelete();">
		</div>
<%-- 	</c:if> --%>
		<input type="button" value="����̵�" class="btn"
			onclick="boardList();">
	</div>
	
	<!-- footer�Ʒ��δ� �ڵ� ���� -->
	
	<section id="footer_b" class="pt-3 pb-3 bg_grey">
		<div class="container">
			<ul class="mb-0">
				<li class="d-inline-block me-2"><a href="#">Home</a></li>
				<li class="d-inline-block me-2"><a href="#">Features</a></li>
				<li class="d-inline-block me-2"><a href="#">Pages</a></li>
				<li class="d-inline-block me-2"><a href="#">Portfolio</a></li>
				<li class="d-inline-block me-2"><a href="#">Blog</a></li>
				<li class="d-inline-block"><a href="#">Contact</a></li>
			</ul>
		</div>
	</section>


	<script>
		window.onscroll = function() {
			myFunction()
		};

		var navbar_sticky = document.getElementById("navbar_sticky");
		var sticky = navbar_sticky.offsetTop;
		var navbar_height = document.querySelector('.navbar').offsetHeight;

		function myFunction() {
			if (window.pageYOffset >= sticky + navbar_height) {
				navbar_sticky.classList.add("sticky")
				document.body.style.paddingTop = navbar_height + 'px';
			} else {
				navbar_sticky.classList.remove("sticky");
				document.body.style.paddingTop = '0'
			}
		}
	</script>

</body>
</html>
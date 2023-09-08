<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pp{
		border-bottom:  1px solid;
	}
	.dd{
		border: 1px solid;
		float: left;
		width: 600px;
		height: 500px;
		}	
		
	.btn1 {
   position: absolute;
   left : 1100px;
   top: 80%;
		}
		
	main{
	margin-left: 200px;
	margin-top: 100px;
	}
</style>
</head>
<body>

	<main>
		<div class="dd">
		<section>
		<table>
		<div class="pp">관람존 안내</div>
		<tr>
			<td>차량번호 </td>
			<td>차량종류</td>
		</tr>
		<tr>
			<td><input type="text" value="222"></td>
			<td><input type="text" value="suv"></td>
		</tr>
		</table>
		
		 
		</section>
		</div>
		
		
		<div class="dd">
			<section>
			<table>
			<div class="pp">결제</div>
				<input class="btn1" type="button" id="re2"  value="결제" onclick="">
				</table>
			</section>
		</div>
		
	</main>

</body>
</html>
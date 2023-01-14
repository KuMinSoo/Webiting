<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/환불 신청</title>
</head>
<body>
<h1 class="text-center">취소/환불 신청</h1>
<form class="rf" id="rf" action="refunded" method="post">
<input type="text" id="ordered_no" name="ordered_no" value="${ordered_no}">
<div class="container mt-3">
	<select name="rfType" style="padding:6px;width:35%;height:35px;">
		<option value="">::취소/환불 사유::</option>
		<option value="1">오배송</option>
		<option value="2">제품 하자</option>
		<option value="3">단순 변심</option>
	</select>
	<br>
	<textarea class="rftxt" id="rftxt" cols="40" rows="20" placeholder="문의 내용을 적어주세요."></textarea>
	<br>
	<button id="rf_btn" class="rf_btn">신청하기</button>
</div>
<input type="text" id="rfType" name="rfType" value="rfType">
<input type="text" id="rftxt" name="rftxt" value="rftxt">

</form>

<script>
	$(".rf_btn").on("click", function(e){
		e.preventDefault();
		
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/dtop"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<link rel="stylesheet" href="../resources/css/detail.css" type="text/css">
<title>상세 페이지</title>
</head>
			<!--  --------------- 상품 정보 JS-------------------- --> 
<script>
 var pnum = $("#pnum").val();

$.getJSON("/admin/prodDetail/{pnum}" + pnum, function(result) {
	
	var str = '';
	
	$(result).each(function() {
		var data = this;
		
		str += makeHtmlcode_read(data);
			
	});
	
	$(".about_product").append(str);
			
});
				/* 상품 리뷰,Q&A JS */
$("#review").click(function() {
	
	var scrollPosition = $(".reviews").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#qna").click(function() {

	var scrollPosition = $(".qnas").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#about").click(function() {
	
	var scrollPosition = $(".about_product").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$(function(){

$("#pqty").on('change', function() { /* count */
	var pqty = $(this).val();
	var price = $("#price").val();
	var opt = $(".opt_select").val();
	
	
	if (pqty*price >= 30000) {
		var shipping = '무료배송';
		var finalPrice = pqty*price;
	} else {
		var shipping = 2500;
		var finalPrice = (pqty*price) + shipping;
	}
	
	var str = '';
	
	str += '<p><label>수량 : </label><span>&nbsp;' + pqty + '</span>&nbsp;&nbsp;&nbsp;';	
	
	if (opt != 'S' && opt != 'M' && opt != 'L') {
		str += '<lable></lable>';
	} else {
		str += '<label>옵션 : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
	}
	
	str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
	str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
	str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
	str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
	
	$(".selected_option").html(str);
	}); 

})
			/* --------------- 상품 이미지 JS-------------------- */


$.getJSON("/admin/prodDetail/{pimage1}/" + pimage1, function(result) {
			/* 썸네일이 여러개인 경우 가져와서 하나씩 썸네일 영역에 넣어줌 */
			var str = '';
			$(result).each(function() {
				var data = this; 
				str += makeHtmlcode(data);
			});
			$(".uploadedList").html(str);

		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
            /* 드래그인, 드래그 오버로 실행되는 어떠한 기능들을 막는 코드 */
		});
		
		$(".fileDrop").on("drop", function(event) {
            /* 파일 드롭 영역에 파일을 가져다 놓으면 업로드 후, 썸네일로 띄우게 하는 코드 */
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file",file);

			$.ajax({
				
				type : 'post',
				url : '/ajaxtest', 
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				success : function (data) {
					var str = makeHtmlcode(data);
					
					$(".uploadedList").append(str);
				}
			});
		});

</script>
<body>
						<!-- 상품 정보 페이지  -->
	<div class="container" style="width: 120%">
		<div class="row"><h1 class="page-header" style="text-align: center; margin-bottom: 50px;">${pcontents.pname}</h1>
			<input type="hidden" value="${pcontents.pnum}" id="pnum">
		</div>
		<div class="row" style="float: left; text-align: center; width:35%;">
			<img alt="pimage1" src="../resources/images/MTest5.jpg" width="100%"> 
		</div>
		
		<div class="row pcontents" style="width:55%; float:right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${pcontents.pname}</span><br><small>${pcontents.pcontents}</small></h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${pcontents.price}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" value="${pcontents.price}" id="price"> 
			</div>
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;2500원</span>
				<p>도서산간지역 배송비 5000원 / 3만원 이상 결제시 무료배송</p>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>적립금 : </label><span><fmt:parseNumber var="test" value="${pcontents.price / 100}" integerOnly="true"/> ${test}&nbsp;원</span>
			</div>
		
					<div class="form-horizontal" style="text-align: left;">
						<label>옵션 : </label> 
						<select class="form-control opt_select" name="selectedOpt">
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</div>
				
			<div class="form-horizontal" style="text-align: left;">
				<label>구매수량 : </label> 
				<select class="form-control" id="pqty"> 
				<c:forEach begin="1" end="5" var="pqty"> 
					<option value="${pqty}">${pqty}</option></c:forEach> 
				</select>
			</div>	
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;"> 
				</div>
				<div style="text-align: center;">
					<button class="btn btn-default">주문하기</button>
					<button class="btn btn-default">장바구니</button>
				</div>
			</div>
			<hr>	
		</div>
	</div>
		<!-- 상품 상세 페이지 및 Q&A-->
	 <div class="container">
		<!-- <div class="row nav">
			 <nav id="middle_nav">
				<ul class="nav nav-tabs nav-justified">
					<li id="about">상품상세</li>
					<li id="review">리뷰</li>
					<li id="qna">상품문의</li>
				</ul>
			</nav> 
		</div> -->
		
	<!-- <table>	
		<div class="col about_product" style= "text-align: center;">  
			<th>상품 상세</th><h1 class="page-header"></h1>
			<th>리뷰</th><h1 class="page-header">리뷰</h1>
			<th>문의</th><h1 class="page-header">문의</h1>
		 </div>
	</table> -->
			<!-- <div class="col" style="margin: 10px;">
			<h1 class="jumbotron">
				<div class="container">
					<h1>Hello world</h1>
					<small>This is product page.</small>
				</div>
			</h1>
			</div> -->
		
		<div class="row reviews" style="text-align: center; margin: 80px;">
			<!-- <h1 class="page-header" style="margin-bottom: 50px;">Review</h1> -->
			
			<%-- <c:forEach begin="1" end="5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Panel title</h3>
				</div>
				<div class="panel-body">Panel content</div>
			</div>
			</c:forEach> --%>
		</div>

		<div class="row qnas" style="text-align: center; height: 700px;">
            		<!-- QnA 테이블 --> 				
    		<table class="table table-hover" style="width: 110%; margin: auto;">
				<thead>
					<!-- <h1 class="page-header">상품 QnA</h1> -->
					<tr>
						<th>회원ID</th>
						<th>이름</th>
						<th>Email</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>생일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.userid}</td>
							<td>${vo.username}</td>
							<td>${vo.email}</td>
							<td>${vo.tel}</td>
							<td>${vo.useraddress}</td>
							<td>${vo.birthDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
			<%-- <h1 class="jumbotron" style="text-align: center; margin: 50px 0;">${productInfo.productId}</h1>
			<div class="form-group hidden-xs" id="fileDrop">
				<label>추가로 업로드 할 파일을 드랍하세요.</label>	
					<div class="fileDrop"></div>
					<ul class="clearfix uploadedList col-xs-12"></ul>
			</div> --%>
		
</body>
</html>
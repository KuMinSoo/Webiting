<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head> 
<c:import url="/dtop"/> 
<c:set var="myctx" value="${pageContext.request.contextPath}" />


<!-- <meta http-equiv="Content-Type" content="text/html; charset = UTF-8"> -->
<%-- <link rel="stylesheet" href="${myctx}/resources/css/detail.css"
	type="text/css"> --%>
<!-- <script type="text/javascript" -->
<!-- 	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script >

$(document).ready(function () {
	$('#heart').prop("src","/resources/images/heart-fill.svg");
	var likeval = ${like};//좋아요 눌렀는지 여부
	if(likeval>0){
		$('#heart').prop("src","/resources/images/heart-fill.svg");
	}else{
		$('#heart').prop("src","/resources/images/heart.svg");
	}
	let pnum = ${pcontents.pnum};
	if(${idx}==-1){
		return;
	}
	let idx=${idx};
	//alert(likeval+"/"+pnum+"/"+idx);
	
	$('#heart').click(function() {
		let data=JSON.stringify({
			pnum : pnum,
			idx  : idx,
			likeval:likeval
	  	});
		$.ajax({
			type :'post',
			url : 'likeUpDown',
			contentType: 'application/json',
			data :data,
			cache:false, 
			dataType:'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				if(data.likevalue>0){
					$('#heart').prop("src","");
					$('#heart').prop("src","/resources/images/heart-fill.svg");
					$('#heartCnt').html("");
					$('#heartCnt').html(data.likeCnt);
					likeval=data.likevalue;
				}
				else{
					$('#heart').prop("src","");
					$('#heart').prop("src","/resources/images/heart.svg");
					$('#heartCnt').html("");
					$('#heartCnt').html(data.likeCnt);
					likeval=data.likevalue;
				}
				sendLikeProd(likeval);
			},
			error: function(err){
				alert(err.status);
			}
		})// 아작스 끝
	})
});//document end----


function sendCart(){
	$(function(){
		let oqty=$("#pqty").val();
		let pnumInt=${pcontents.pnum};
		let pnum=pnumInt.toString()+",";
		let idx=${loginUser.idx};
		//alert(pnum+'/'+idx);
		if(idx<=0){
			alert('로그인해야합니다.')
			return;
		}
		//$(".move_cart_pnum").val(str);
		$('.move_cart_pnum').val(pnum);
		$(".move_cart_idx").val(idx);
		$('.move_cart_form').submit();
	})
}

function sendLikeProd(likeval){

	let pqty=$("#pqty").val();
	let pnum = ${pcontents.pnum};
	let idx=${loginUser.idx};
	let pname=$(".likeprodpname").val();
	let pimage1=$(".likeprodpimage1").val();
	let lprice=$(".likeprodlprice").val();
	let pcompany=$(".likeprodpcompany").val();
	
	$(function(){
		let data=JSON.stringify({
			pnum : pnum,
			idx  : idx,
			pqty:pqty,
			pname:pname,
			pimage1:pimage1,
			lprice:lprice,
			pcompany:pcompany,
			lindate:"",
			likeval:likeval
	  	});
		//alert(data);
		$.ajax({
			type :'post',
			url : 'mypage/addLikePorductFromDetail',
			contentType: 'application/json',
			data :data,
			cache:false, 
			dataType:'json',
			success : function(data) {
				console.log('성공');
			},
			error:function(err){
				err.status;
			}
		})
		
	})// 
	
	
	
}
function delLikeProd(){
	let pnum = ${pcontents.pnum};
	let idx=${loginUser.idx};
	//alert(pnum+"/"+idx);
	$('.move_likeprodDel_pnum').val(pnum);
	$(".move_likeprodDel_idx").val(idx);
	$('.move_likeprodDel_form').submit();
}

function sendOrder(){
	let oqty=$("#pqty").val();
	let pnumInt=${pcontents.pnum};
	let pnum=pnumInt.toString();
	let idx=${loginUser.idx};
	if(idx<=0){
		alert('로그인해야합니다.')
		return;
	}
	$('.move_sendOrder_pnum').val(pnum);
	$(".move_sendOrder_idx").val(idx);
	$(".move_sendOrder_oqty").val(oqty);
	$('.move_likeprodDel_form').submit();
}

$(function(){

	$("#pqty").on('change', function() { /* count */
		var pqty = $(this).val();
		var price = $("#saleprice").val();
		var opt = $(".opt_select").val();
		var finalPrice=pqty*price;
		//alert(finalPrice);
		if (finalPrice >= 200000) {
			var shipping = '무료배송';
		} else {
			var shipping = 2500;
			var finalPrice=finalPrice+ shipping;
		}
		
		var str = '';
		
		str += '<p><label>수량 : </label><span class="qty">&nbsp;' + pqty + '</span>&nbsp;&nbsp;&nbsp;';	
		str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
		str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
		str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
		
		$(".totalPrice").html(str);
		}); 

	})

</script>
<title>상세 페이지</title>
</head>
<body>
	<!-- 상품 정보 페이지  -->
	<div class="container" role="main" style="width: 100%">
	<br>
		<hr>
		<div class="header-row">
			<h2 class="page-header"
				style="text-align: center; margin-bottom: 30px;">${pcontents.pname}</h2>
			<input type="hidden" value="${pcontents.pnum}" id="pnum">
		</div>
		<hr>
		<div class="row" style="float: left; text-align: center; width: 35%;">
			<img alt="pimage1"
				src="${myctx}/resources/product_images/${pcontents.pimage1}"
				width="110%">
		</div>

		<div class="row-pcontents" style="width: 55%; float: right;">
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header">
					<span>${pcontents.pname}</span><br>
					<%-- <small>${pcontents.pcontents}</small> --%>
				</h3>
			</div>
			<hr>
			<div class="price-group" style="text-align: center;">
				<label>가격 : <span> &nbsp; <fmt:formatNumber
							value="${pcontents.saleprice}" type="number" /></span><span>&nbsp;원</span></label>
				<input type="hidden" value="${pcontents.saleprice}" id="saleprice">
			</div>

			<div class="form-group" style="text-align: center;">
			</div>

			<div class="form-group" style="tesxt-align: center;">
				<label>
					<!-- 적립금 : -->
				</label><span><fmt:parseNumber var="test" value="${pcontents.point}"
						integerOnly="true" />
					<%--  ${test}&nbsp;원 --%></span>
			</div>
			<div class="heart-wrapper" style="text-align: right; width: 30%;">

				<button type="button">
					<img class="heart" id="heart">
				</button>

				<span id="heartCnt" class="text-dark heart-rating"
					style="text-decoration-line: none;"> ${totalCnt} </span>
				<form class="move_likeprod_form" action="/mypage/addLikeProd"
					method="post">
					<input type="hidden" name="pnum" class="move_likeprod_pnum">
					<input type="hidden" name="idx" class="move_likeprod_idx">
					<input type="hidden" class="likeprodpname" name="pname"
						value="${pcontents.pname}"> <input type="hidden"
						class="likeprodpimage1" name="pimage1"
						value="${pcontents.pimage1}"> <input type="hidden"
						class="likeprodlprice" name="lprice" value="${pcontents.price}">
					<input type="hidden" class="likeprodpcompany" name="pcompany"
						value="${pcontents.pcompany}">
					<%-- <input type="hidden"  name="lindate" value="${pcontents.pindate}"> --%>
					<input type="hidden" name="pqty" class="move_likeprod_pqty">
				</form>
				<form class="move_likeprodDel_form" action="/mypage/like_delheart"
					method="post">
					<input type="hidden" name="pnum" class="move_likeprodDel_pnum">
					<input type="hidden" name="idx" class="move_likeprodDel_idx">
				</form>
			</div>
			<div class="form-horizontal" style="text-align: center;">
				<label>구매수량</label> <select class="form-control" id="pqty">
					<c:forEach begin="1" end="5" var="pqty">
						<option value="${pqty}">${pqty}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div class="row">
				<div class="totalPrice"></div>
				<div class="selected_option" style="text-align: center;">
					<form class="sendOrder_form" action="/mypage/order" method="post">
						<input type="hidden" name="pnum" class="move_sendOrder_pnum">
						<input type="hidden" name="idx" class="move_sendOrder_idx">
						<input type="hidden" name="oqty" class="move_sendOrder_oqty">
						<button class="btn btn-order" onclick="sendOrder()">주문하기</button>
					</form>

					<form class="move_cart_form" action="/mypage/move_cart"
						method="post">
						<input type="hidden" id="pnum" name="pnum" class="move_cart_pnum">
						<input type="hidden" id="idx" name="idx" class="move_cart_idx">
						<button class="btn btn-cart" onclick="sendCart()">장바구니</button>
					</form>

				</div>


				<br>

			</div>
		</div>

		<div class="row" style="float: left; text-align: center; width: 65%;">
			<img alt="coupon" src="${myctx}/resources/images/coupon.png"
				width="110%">
		</div>
		<br>
		<br>

		<div class="addressInfo_div">
			<div class="addressInfo_button_div">
				<button class="address_btn address_btn_1">제품 상세</button>
				<button class="address_btn address_btn_2">리뷰</button>
			</div>

			<div class="addressInfo_input_div_wrap text-center">
				<div class="addressInfo_input_div addressInfo_input_div_1"
					style="display: inline-block;"><!-- style="display: inline-block;width:40%;" -->
						<img alt="pimage1"
						src="${myctx}/resources/product_images/${pcontents.pimage1}"
						width="500px;" height="500px;"><br> 
						<img alt="pimage1"
						src="${myctx}/resources/product_images/${pcontents.pimage2}"
						width="500px;" height="500px;"><br> 
						<img alt="pimage1"
						src="${myctx}/resources/product_images/${pcontents.pimage3}"
						width="500px;" height="1500px"><br> 
				</div>
				<div class="product-info_table text-center">
					<hr>
					<p class="table-title">필수 표기 정보</p> 
					<hr>
					<table class="product-info" style="display: inline-block;">
						
							<tr>
							<td style="font-weight:bold;width:25%;"> 품   명 </td>
							<td>${pcontents.pname}</td>
							</tr>
							<tr>
							<td style="font-weight:bold;width:25%;"> 제 조 사 </td>
							<td>${pcontents.pcompany}</td>
							</tr>
							<tr>
							<td style="font-weight:bold;width:25%;">인증 정보</td>
							<td>해당 없음</td>
							</tr>
							<tr>
							<td style="font-weight:bold;width:25%;">제품 설명</td>
							<td>${pcontents.pcontents}</td>
							</tr>
							
					</table>
				</div>
				<!-- <div class="addressInfo_input_div addressInfo_input_div_2"></div> -->

				<hr color='red'>
				<c:import url="/prodRelated">
					<c:param name="downCg_code" value="${pcontents.downCg_code}" />
					<c:param name="pnum" value="${pcontents.pnum}" />
				</c:import>
				<hr color='red'>
				 <!-- 리뷰 글쓰기 폼---------------------------------------- -->
      <div class="row mt-4">
      	<div class="col-md-10 offset-md-1">
      		 <%@ include file="/WEB-INF/views/review/reviewForm.jsp" %>
      	</div>
      </div>
      <div class="row">
      	<div class="col-md-12" id="reviewTitle">
      		<h4>Review List <span class="badge badge-success" id="review_cnt"></span></h4>
      	</div>
      </div>
      <!-- 리뷰목록 ------------------------------------------- -->
      <div class="row">
      	<div class="col-md-12" id="reviewList">
      		
      	</div>
      </div>
      <!-- --------------------------------------------------- -->
      <div class="row">
      	<div class="col-md-10 offset-md-1">
      		<%@ include file="/WEB-INF/views/review/reviewEdit.jsp" %>
      	</div>
      </div>
			</div>
		</div>
	</div>
</body>
</html>
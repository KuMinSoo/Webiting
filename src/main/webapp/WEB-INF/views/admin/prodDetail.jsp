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
<body>
						<!-- 상품 정보 페이지  -->
	<div class="container" role = "main" style="width: 100%">
		<hr>
		<div class="header-row"><h2 class="page-header" style="text-align: center; margin-bottom: 30px;">${pcontents.pname}</h2>
			<input type="hidden" value="${pcontents.pnum}" id="pnum">
		</div>
		<hr>
		<div class="row" style="float: left; text-align: center; width:35%;">
			<img alt="pimage1" src="../resources/images/bed01.jpg" width="110%"> 
		</div>
		
		<div class="row-pcontents" style="width:55%; float:right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${pcontents.pname}</span><br><small>${pcontents.pcontents}</small></h3>
			</div>
			<hr>
			<div class="price-group" style="text-align: center;">
				<label>가격 : <span> &nbsp; <fmt:formatNumber value="${pcontents.price}" type="number"/></span><span>&nbsp;원</span></label>
				<input type="hidden" value="${pcontents.price}" id="price"> 
			</div>

			<div class="form-group" style="text-align: center;">
				<label>배송비 : </label><span>&nbsp;2500원</span>
				<p>도서산간지역 배송비 5000원 / 20만원 이상 결제시 무료배송</p>
			</div>
			
			<div class="form-group" style="tesxt-align: center;">
				<label><!-- 적립금 : --> </label><span><fmt:parseNumber var="test" value="${pcontents.price / 100}" integerOnly="true"/><%--  ${test}&nbsp;원 --%></span>
			</div>
					<div class="form-horizontal" style="text-align: center;">
						<label> 옵션 </label> 
						<select class="form-control opt_select" name="selectedOpt">
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</div>
				
			<div class="form-horizontal" style="text-align: center;">
				<label>구매수량</label> 
				<select class="form-control" id="pqty"> 
				<c:forEach begin="1" end="5" var="pqty"> 
					<option value="${pqty}">${pqty}</option></c:forEach> 
				</select>
			</div>	
			<div class="row">
				<div class="selected_option" style="text-align: right;"> 
				</div>
				<div style="text-align: center;">
					<button class="btn btn-default">주문하기</button>
					<button class="btn btn-default">장바구니</button>
				</div>
			</div>
			<br>
			</div>
			
			<div class="row" style="float: left; text-align: center; width:65%;">
				<img alt="pimage1" src="../resources/images/coupon.png" width="110%"> 
			</div>
		<br>
		
			<div class="addressInfo_div">
		<div class="addressInfo_button_div">
			<button class="address_btn address_btn_1">제품 상세</button>
			<button class="address_btn address_btn_2">리뷰</button>
		</div>

		<div class="addressInfo_input_div_wrap">
			<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block"></div>
				<img alt="pimage1" src = "../resources/images/bed02.jpg" width = "350px;" height = "320px;">
				
				<div class = "product-info_table" style="width:55%; float:right;">
					<p class = "table-title">필수 표기 정보</p>
					<hr>
						<table class = "product-info" width = "400px;">
							<tbody>
								<th>품명</th>
								<td>우드 침대</td>
								<th>인증 정보</th>
								<td>해당 없음</td>
							</tbody>					
						</table>
				</div>
					<!-- <div class="addressInfo_input_div addressInfo_input_div_2"></div> -->
					
	<hr color='red'>
	<c:import url="/admin/prodRelated">
		<c:param name="pnum" value="${pcontents.pnum}" />
	</c:import>		
	<hr color='red'>
						<!-- 후기 게시판 페이지 -->
		<div class="row reviews" style="margin-top: 100px;">
			<h4 class="page-header">Review&nbsp;&nbsp;<small>상품을 사용해보신 분들의 실제 후기입니다.</small></h4>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Num</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.boardId}</td>
							<td><a href="/board/read/${vo.boardId}">${vo.title}</a></td>
							<td>${vo.userid}</td>
							<td><fmt:formatDate value="${vo.regDate}" type="date"
									pattern="yyyy-MM-dd"/></td>
							<td>${vo.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>		
		</div>	
	</div>
			</div>
</body>
</html>
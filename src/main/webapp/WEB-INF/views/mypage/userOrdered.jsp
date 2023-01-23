<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<link rel="stylesheet" href="../resources/css/mypage.css">

<c:import url="/mypageNavi"/>
<style>
.orderListbtn{
    letter-spacing: 0px;
    padding: 12px 0;
    background-color: white;
    font-size: 20px;
    text-align: center;
    width: 49%;
	display :inline-block;
}
</style>

<script>
function showOrder(){
	$(".refundEnd").css('display', 'none');
	$(".orderList").css('display', 'block');
}
function showRefund(){
	$(".orderList").css('display', 'none');
	$(".refundEnd").css('display', 'block');
}
</script>

<%
   String ctx = request.getContextPath();
%>
<div class="container mt-3 text-center" style="width:70%;height: 1200px; overflow: auto;">
<button class="orderListbtn" onclick="showOrder()">내 주문 내역(<c:out value="${orderedList.size()}"/>)</button>
<button class="orderListbtn" onclick="showRefund()">취소/환불 내역(<c:out value="${refundList.size()}"/>)</button>
<div class="orderList">
<h2 class="text-center">내 주문 내역</h2>
		<table class="table text-center">
			<tr>
				<th width="15%" class="m1 text-left">주문 번호</th>
				<th width="20%" class="m1 text-left">주문 상품</th>
				<th width="10%" class="m2 text-left">주문 날짜</th>
				<th width="10%">결제 상태</th>
				<!-- <th width="15%">주문 상태</th> -->
				<th width="20%"></th>
			</tr>
			<c:if test="${orderedList eq null or empty orderedList}">
			<tr><td colspan="5">결제 정보가 없습니다.</td></tr>
			</c:if>
			
			<c:if test="${orderedList ne null and not empty orderedList}">
				<c:forEach var="order" items="${orderedList}">
				<tr>
					<td width="15%" class="m1 text-left"><c:out value="${order.ordered_no}"/></td>
					<td width="20%" class="m1 text-left"><c:out value="${order.title}"/></td>
					<td width="10%" class="m2 text-left"><c:out value="${order.ordered_date}"/></td>
					<td width="10%"><c:out value="${order.ordered_state}"/></td>
					<%-- <td width="15%"><c:out value="${order.ordered_status}"/></td> --%>
					<td width="20%"><button type="button" onclick="goDetail('${order.ordered_no}')">상세 주문 내역 보기</button></td> <!-- userOrderedDetail로 이동 -->
				</tr>
				</c:forEach>	
			</c:if>		
		</table>		
</div>
<div class="refundEnd" style="display: none">
	<h2 class="text-center">취소/환불 내역</h2>
	<table class="table text-center">
		<tr>
			<th>주문 번호</th>
			<th>상품이미지</th>
			<th>주문 상품</th>
			<th>주문 수량</th>
			<th>주문상품금액</th>
			<th>주문 날짜</th>
			<th>주문 상태</th>
		</tr>
		<c:if test="${refundList eq null or empty refundList}">
			<tr><td colspan="7">취소/환불 정보가 없습니다.</td></tr>
		</c:if>
		
		<c:if test="${refundList ne null and not empty refundList}">
			<c:forEach var="r" items="${refundList}">
				<tr>
					<td><c:out value="${r.ordered_no}"/></td>
					<td><c:out value="${r.pimage}"/></td>
					<td><c:out value="${r.pname}"/></td>
					<td><c:out value="${r.oqty}"/></td>
					<td><c:out value="${r.saleprice}"/></td>
					<td><c:out value="${r.ordered_date}"/></td>
					<td><c:out value="${r.ordered_status}"/></td>
				</tr>
			</c:forEach>	
		</c:if>	
	</table>
</div>
</div>

<form name="detail" action="userOrderedDetail" method="post">
	<input type="hidden" name="ordered_no">
</form>

<script>

function goDetail(ono){
	detail.ordered_no.value=ono;
	//alert(detail.ordered_no.value);
	detail.submit();
}

</script>


<c:import url="/foot" />
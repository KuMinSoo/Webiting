<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<link rel="stylesheet" href="../resources/css/mypage.css">

<c:import url="/mypageNavi"/>

<%
   String ctx = request.getContextPath();
%>

<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center">내 주문 내역</h1>

		<table class="table text-center">
			<tr>
				<th width="20%" class="m1 text-left">주문 번호</th>
				<th width="20%" class="m1 text-left">주문 상품</th>
				<th width="20%" class="m2 text-left">주문 날짜</th>
				<th width="10%">결제 상태</th>
				<th width="20%"></th>
			</tr>
			<c:if test="${orderedList eq null or empty orderedList}">
			<tr><td>결제 정보가 없습니다.</td></tr>
			</c:if>
			
			<c:if test="${orderedList ne null and not empty orderedList}">
				<c:forEach var="order" items="${orderedList}">
				<tr>
					<td width="20%" class="m1 text-left"><c:out value="${order.ordered_no}"/></td>
					<td width="20%" class="m1 text-left"><c:out value="${order.title}"/></td>
					<td width="20%" class="m2 text-left"><c:out value="${order.ordered_date}"/></td>
					<td width="10%"><c:out value="${order.ordered_state}"/></td>
					<td width="20%"><button type="button" onclick="goDetail('${order.ordered_no}')">상세 주문 내역 보기</button></td> <!-- userOrderedDetail로 이동 -->
				</tr>
				</c:forEach>	
			</c:if>		
		</table>
		
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
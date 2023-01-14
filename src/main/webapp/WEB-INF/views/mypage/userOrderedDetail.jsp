<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<link rel="stylesheet" href="../resources/css/mypage.css">
<%
   String ctx = request.getContextPath();
%>
<c:import url="/mypageNavi"/>
<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center">상세 주문 내역</h1>
	<hr>
	<h3>주문 번호 : ${orderedList[0].ordered_no}</h3>
	<hr>
	<b>주문 날짜</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${orderedList[0].ordered_date}</span><br>
	<b>주문 번호</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${orderedList[0].ordered_no}</span><br>
	<b>최종 결제금액</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${orderedList[0].ordered_orderprice}</span><br>
	<b>총 적립 포인트</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${detailList[0].totalPoint}</span><br>
	
	<hr>
	<h3>배송 정보</h3>
	<hr>
	<b>성함</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${orderedList[0].ordered_to_name}</span><br>
	<b>연락처</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${orderedList[0].ordered_to_tel}</span><br>
	<b>배송지</b>&nbsp;&nbsp;&nbsp;&nbsp;
	<span>[${orderedList[0].ordered_to_post}] ${orderedList[0].ordered_to_adr}</span><br>
	<hr>	
	<div>
		<h2>구매 제품</h2>
		<div>			
			<table class="table text-center">
				<tr>
					<th width="20%"></th>
					<th width="30%">제품 정보</th>
					<th width="10%">배송 상태</th>
					<th width="30%">주문 상태</th>
					<th width="10%">판매 회사</th>
				</tr>
				<c:forEach var="d" items="${detailList}">
				<tr>
					<td>
						<a class="goods_thumb" href=""> <!-- 해당 상품 상세페이지로 이동 -->
							<img src="../resources/product_images/${d.pimage}" width="90" height="90"> <!-- 상품 이미지 출력 -->
						</a>
					</td>
					<td>
						<a class="goods" href="<%=ctx%>/prodDetail?pnum=${d.pnum_fk}"> <!-- 해당 상품 상세페이지로 이동 -->
							<p class="pname">${d.pname}</p>
							<ul class="info"> 
								<li>${d.saleprice}원</li>  
								<li>구매수량 : ${d.oqty}개</li>
								<li>${d.totalPoint}p 적립</li>
							</ul>
						</a>
					</td>
					<td>
						<span class="deliv">${d.ordered_delivstate}</span>
					</td>
					<td>
						<span class="order_state">${d.ordered_status}</span><br><br>
						<c:if test="${d.ordered_statusNum_fk eq 0}">
							<button class="refundReq">주문 취소/환불하기</button>
						</c:if>
						<c:if test="${d.ordered_statusNum_fk ne 0}">
							<button class="refundEnd">반품 정보</button>
						</c:if>
					</td>
					<td>
						<span class="company">${d.pcompany}</span>
					</td>
				</tr>
				</c:forEach>
			</table>							
		</div>
	</div>	
</div>

<form>

</form>


<c:import url="/foot" />
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
<script>
function check(){
	var len=document.getElementsByClassName("subchk").length;
	count=0;
	for(i=0; i<len; i++){
		if(document.getElementsByClassName("subchk")[i].checked){
			count++;
		}
	}
	if(count==0){
		alert('취소할 상품을 선택하세요.');
		return false;
	}
	
	if(!refundReq.rfType.value){
		alert('취소 유형을 선택하세요.');
		refundReq.rfType.focus();
		return false;
	}
	if(!refundReq.rtxt.value){
		alert('취소 내용을 입력하세요.');
		refundReq.rtxt.focus();
		return false;
	}
	var chTF=confirm("취소/환불 신청을 하시겠습니까?");
	if(chTF){
		return true;
	}
	return false;
}
function showrefund(){
	$('#refundDiv').show(function(){
		location.href='#refundDiv';	
	});			
}

</script>
<style>
#oDetail{
	height:600px;
	overflow-y:scroll;
	-ms-overflow-style: none; /* 인터넷 익스플로러 */
    scrollbar-width: none; /* 파이어폭스 */	
}
#oDetail::-webkit-scrollbar{
   display:none;
}
</style>
<div id="oDetail" class="container mt-3" style="width:70%;height: 600px; overflow: auto;">
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
					<th width="30%">상품정보</th>
					<th width="10%">배송상태</th>
					<th width="30%">주문상태</th>
					<th width="10%">판매회사</th>
				</tr>
				<c:forEach var="d" items="${detailList}">
				<tr>
					<td>
						<a class="goods_thumb" href=""> <!-- 해당 상품 상세페이지로 이동 -->
							<img src="../resources/product_images/${d.pimage}" width="90" height="90"> <!-- 상품 이미지 출력 -->
						</a>
					</td>
					<td>
						<a class="goods" href="<%=ctx%>/prodDetail?pnum=${d.pnum_fk}" style="text-decoration: none"> <!-- 해당 상품 상세페이지로 이동 -->
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
							<button class="refundReq" onclick="showrefund()">주문 취소/환불하기</button>
						</c:if>
					</td>
					<td>
						<span class="company">${d.pcompany}</span>
					</td>
				</tr>
				</c:forEach>
			</table>							
		</div>
		<form action="/mypage/refundReq" method="post" class="refundReq" name="refundReq" onsubmit="return check()">
		<div class="mt-5 mb-5" id="refundDiv" style="display: none">
			<h2>주문 취소/환불 신청</h2>
			<b>상품정보</b><br><br>
			<table  class="table text-center">
				<tr>
					<th width="20%">주문일자[주문번호]</th>
					<th width="5%"></th>
					<th width="10%">이미지</th>
					<th width="20%">상품정보</th>
					<th width="10%">수량</th>
					<th width="15%">상품구매금액</th>
					<th width="10%">판매회사</th>
					<th width="10%">배송상태</th>
				</tr>
				
				<c:forEach var="y" items="${yetrefundList}" varStatus="status">
				<tr>
					<td rowspan="${status.end}" width="20%"><c:out value="${y.ordered_date}"/><br>
						[<c:out value="${y.ordered_no}"/>]</td>
					<td width="5%"><input type="checkbox" class="subchk" name="orderedNum" value="${y.orderedNum}"></td>
					<td width="10%"><img src="../resources/product_images/${y.pimage}" width="50" height="50"></td>
					<td width="20%"><c:out value="${y.pname}"/></td>
					<td width="10%"><c:out value="${y.oqty}"/></td>
					<td width="15%"><c:out value="${y.saleprice}"/>원</td>
					<td width="10%"><c:out value="${y.pcompany}"/></td>
					<td width="10%"><c:out value="${y.ordered_delivstate}"/></td>
				</tr>
				</c:forEach>
			</table>
			<br><br>
			<b>취소사유</b>
			<div class="container mt-3">
				<select name="rfType" style="padding:6px;width:35%;height:35px;">
					<option value="">::취소/환불 사유::</option>
					<option value="0">오배송</option>
					<option value="1">제품 하자</option>
					<option value="2">단순 변심</option>
				</select>
				<br>
				<textarea class="rtxt" id="rtxt" name="rtxt" cols="90" rows="5" placeholder="문의 내용을 적어주세요."></textarea>
				<br>
				<button id="rf_btn" class="rf_btn">신청하기</button>
			</div>
		</div>
		</form>
	</div>	
</div>

<c:import url="/foot" />
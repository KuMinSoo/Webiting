<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.title{
		text-align: center;
		vertical-align:middle;
	}
	.userInfo{
		 text-align:left;
		 font-size:15px;
	}

</style>
<script>
	function checkDelivNum(){
		if(ordered_delivnum.val=='' && ordered_delivnum.length<12){
			alert('송장번호 12자리를 입력하세요');
			return false;
		}
		alert('송장번호가 입력되었습니다');
		return true;
		
	}
	
	function completed(){
		if(comfirm("배송이 완료됬습니까?")){
			rmf.action="delivCompleted";
			rmf.method="POST";
			rmf.submit();
		}	
		
	}



</script>
<c:import url="/top"/>
<div>
<main>
	<section>
		<div class="container" >
		  <table class="table table-striped table-hover align-middle" style="text-align:center;">
		  	<thead>
		  		<tr>
		  			<th class="font-alt title" style="width:10%">주문일</th>
		  			<th class="font-alt title" style="width:15%">주문번호</th>
		  			<th class="font-alt title" style="width:30%">상품정보</th>
		  			<th class="font-alt title" style="width:15%">상품금액</th>
		  			<th class="font-alt title" style="width:10%">수량</th> 			
		  			<th class="font-alt title" style="width:20%">배송현황</th>
		  		</tr>
		  	</thead>
		  	<tbody class="table-group-divider">
		  <%-- 	<c:if test="${orderDetailList eq null}">
		  	<tr><td colspan="6" text-align:center>입력된 데이터가 없습니다.</td></tr>		  	
		  	</c:if>
		  	<c:if test="${orderDetailList ne null}"> --%>
		  	<c:forEach items="${orderDetailList}" var="orderDetailList">
		  		<tr>
		  			<td>
		  				<fmt:formatDate pattern="yy-MM-dd" value="${orderList.ordered_date}"/>
		  			</td>
		  			<!-- 주문번호(상품상세번호) 클릭시 상세페이지로 이동 -->
		  			<td>
		  				<c:out value="${orderList.onum}"/>
		  			</td>
		  			
		  			<!-- 상품정보-------------------------- -->
		  			<td>
		  				상품이름:<c:out value="${orderList.pname}"/>
		  				판매자:<c:out value="${orderList.pcompany}"/><br>
		  				전화번호:<c:out value="${orderList.orderedDetail_from_tel}"/><br>
		  				주소:<c:out value="${orderList.ordered_from_adr}"/><br>
		  				우편번호:<c:out value="${orderList.ordered_from_post}"/><br>
		  			</td>
		  			<!-- 가격정보------------------------- -->
		  			<td>
	  					정가:<del>
                        <fmt:formatNumber value="${orderList.price}" pattern="###,###" />
                       	</del>원<br> 
                       	판매가:<span style="color: red; font-weight: bold">
                        <fmt:formatNumber value="${orderList.saleprice}" pattern="###,###" />
                 			</span>원<br> 
                  	    할인율:<span style="color: red">${orderList.percent} %</span><br>

                       POINT:<b style="color: green">[${orderList.point}]</b>POINT<br>
		  			</td>
		  			<!--수량---------------------------------- -->
		  			<td>
		  				<c:out value="${orderList.oqty}"/>
		  			</td>
		  			<!-- 배송상태 ---------------------------------->
		  			<td>
		  				<c:if test="${orderList.ordered_delivnum eq null}">
			  				<form id="frm" name="frm" method="POST" action="orderedDelivnum">
			  				<c:out value="${orderList.ordered_delivnum}"/>
				  				<input type="number" name="ordered_delivnum" id="ordered_delivnum" 
				  				maxlength="12" placeholder="송장번호를 입력하세요"/>
				  				<input type="hidden" name="orderedDetail_no" id="orderedDetail_no" value="${orderList.orderedDetail_no}"/>
			  				<button type="submit" class="btn btn-danger" onclick="checkDelivNum()">입력</button>
			  				</form>
		  				</c:if>
		  				<c:if test="${orderList.ordered_delivnum eq 1}">
		  					<button type="button" class="btn btn-warning" onclick="completed()">배송중</button>
		  					<form id="rmf" name="rmf">
								<input type="hidden" name="orderedDetail_no" id="orderedDetail_no"
								 value="${orderList.orderedDetail_no}"/>

		  					</form>
		  				</c:if>
		  				
		  				
		  				<c:if test="${orderList.ordered_delivnum eq 2}">
		  			  		<button type="button" class="btn btn-success">배송완료</button>
		  				</c:if>
		  				
		  			</td>			
		  		</tr>	
		  	</c:forEach>
		  <%-- 	</c:if> --%>
		  	</tbody>
		  	<tfoot>
		  		<%-- <c:if test="${orderDetailList ne null}"> --%>
		  		<tr style="text-align:left;font-weight:bolder"><td colspan="6" >※받는분 기본정보</td></tr>
		  		<tr class="userInfo">
		  			<td colspan="6">주문자: <c:out value="${orderList.name}"/></td>
		  		</tr>
		  		<tr class="userInfo">
		  			<td colspan="6">아이디: <c:out value="${orderList.userid}"/></td>
		  		</tr>
		  		<tr class="userInfo">
		  			<td colspan="6">전화번호: <c:out value="${orderList.ordered_to_tel}"/></td>
		  		</tr>
		  		<tr class="userInfo">
		  		 <td colspan="6">이메일: <c:out value="${orderList.ordered_to_email}"/></td>
		  		</tr>
		  		<tr class="userInfo">
		  			<td colspan="6">배송지<br>		  			
		  			<span style="font-size:12px">우편번호:<c:out value="${orderList.ordered_to_post}"/><br></span>
		  			<span style="font-size:12px">주소: <c:out value="${orderList.ordered_to_adr}"/><br></span></td>		  			
		  		</tr>
		  		<tr class="userInfo">
		  			<td colspan="6">총 결제금액:<fmt:formatNumber value="${orderList.ordered_orderprice}" pattern="###,###"/> 원</td>
		  		</tr>	  	  	
		  	<%-- </c:if> --%>
		  	</tfoot>
		  					
		  </table>	
		</div>
	</section>
</main>
</div>



<c:import url="/foot" />

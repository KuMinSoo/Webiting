<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.title{
		text-align: center;
		vertical-align:middle;
	}

</style>

<c:import url="/top"/>
<div>
<main>
	<section>
		<div class="container" >
		  <table class="table table-striped table-hover align-middle" style="text-align:center;">
		  	<thead>
		  		<tr style="text-align:center;">
		  			<th class="font-alt title" style="width:10%">주문일</th>
		  			<th class="font-alt title" style="width:15%">결제번호</th>
		  			<th class="font-alt title" style="width:15%">결제건(제목)</th>
		  			<th class="font-alt title" style="width:20%">총결제금액</th>
		  			<th class="font-alt title" style="width:10%">결제유형</th>
		  			<th class="font-alt title" style="width:10%">결제처리</th>
		  			<th class="font-alt title" style="width:10%">주문자</th>		  			
		  			<th class="font-alt title" style="width:10%">배송처리</th>
		  		</tr>
		  	</thead>
		  	<tbody class="table-group-divider">
		  	<c:forEach items="${orderList}" var="orderList">
		  		<tr>
		  			<td>
		  				<fmt:formatDate pattern="yy-MM-dd" value="${orderList.ordered_date}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.ordered_no}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.order_to_name}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.ordered_orderprice}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.ordered_payhow}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.ordered_paystate}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.userid}"/>
		  			</td>
		  			<td>
		  				<c:out value="${orderList.ordered_state}"/>
		  			</td>			
		  		</tr>	
		  	</c:forEach>
		  	</tbody>	
		  </table>	
		</div>
	</section>
</main>
</div>



<c:import url="/foot" />

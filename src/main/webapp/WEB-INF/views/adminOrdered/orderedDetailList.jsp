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
	
	
	function completed(){
		if(confirm("배송이 완료됬습니까?")){
			
			let orderedNum=$('#orderedNum').val();	
			alert(orderedNum);
			let jsonData={
					orderedNum:orderedNum		
				}
			let data=JSON.stringify(orderedNum);
			$.ajax({
				type:'post',
				url:"delivCompleted",
				data: orderedNum,
				contentType:'application/json; charset=utf-8',
				success:function(res){
					alert('배송성공');
				},error:function(res){
					alert('배송실패');
				}
				
			})
			
		}	
		
	}



</script>
<c:import url="/top"/>
<div>
<main>
	<section>
		<div class="container" >
		  <table class="table table-striped table-hover title">
		  	<thead>
		  		<tr>
		  			<th class="font-alt title" style="width:5%"></th>	
		  			<th class="font-alt title" style="width:10%">주문일</th>
		  			<th class="font-alt title" style="width:10%">주문번호</th>
		  			<th class="font-alt title" style="width:10%">사진</th>
		  			<th class="font-alt title" style="width:25%">상품명</th>
		  			<th class="font-alt title" style="width:10%">수량</th>		
		  			<th class="font-alt title" style="width:10%">주문자</th> 			
		  			<th class="font-alt title" style="width:15%">배송처리</th>
		  			<th class="font-alt title" style="width:10%">주문상태</th>
		  		</tr>
		  	</thead>

		  <%-- 	<c:if test="${orderDetailList eq null}">
		  	<tr><td colspan="6" text-align:center>입력된 데이터가 없습니다.</td></tr>		  	
		  	</c:if>
		  	<c:if test="${orderDetailList ne null}"> --%>
		  	<c:forEach items="${orderList}" var="orderList">
		  		<tr>
		  			<td>
		  				<input type="checkbox" name="delivGroup">
		  			</td>
		  			
		  			<td>
		  				<fmt:formatDate pattern="yy-MM-dd" value="${orderList.ordered_date}"/>
		  			</td>
		  			<!-- 주문번호(상품상세번호) 클릭시 상세페이지로 이동 -->
		  			<td>
		  				<c:out value="${orderList.ordered_no}"/>
		  			</td>
		  			<td>
		  				<img class="img-fluid img-thumbnail" style="width:50px" src="/resources/product_images/${orderList.pimage}">
		  			</td>
		  			
		  			<!-- 상품정보-------------------------- -->
		  			<td>
		  				<a href="#"><c:out value="${orderList.pname}"/></a>
		  			</td>
		  			<!-- 가격정보------------------------- -->
		  			<td>
		  				<c:out value="${orderList.oqty}"/>
		  			</td>
		  			
		  			<!----------------------------------- -->
		  		
		  			<td>
 						<a href="#"><c:out value="${orderList.name}"/></a>
 		  			</td>
		  			<!-- 주문자 정보  -->
		  						  			
		  			<!-- 배송상태 ---------------------------------->
		  			<td>
		  				<c:if test="${orderList.ordered_delivstateNum_fk eq 0}">
		  					<button type="button" class="btn btn-secondary" onclick="completed()"><c:out value="${orderList.ordered_delivstate}"/></button>		  					
		  					<input type="hidden" name="orderedNum" id="orderedNum" value="${orderList.orderedNum}">
		  				</c:if>
		  				<c:if test="${orderList.ordered_delivstateNum_fk eq 1}">
		  					<button type="button" class="btn btn-warning" ><c:out value="${orderList.ordered_delivstate}"/></button>
		  				</c:if>
		  				<c:if test="${orderList.ordered_delivstateNum_fk eq 2}">
		  					<button type="button" class="btn btn-success"  ><c:out value="${orderList.ordered_delivstate}"/></button>
		  				</c:if>		  				
		  			</td>
		  			<td>
		  				<c:if test="${orderList.ordered_statusNum_fk eq 1}">
		  					<c:out value="${orderList.ordered_status}"/>
		  				</c:if>
		  				<c:if test="${orderList.ordered_statusNum_fk eq 0}">
		  					<c:out value="${orderList.ordered_status}"/>
		  				</c:if>
		  			</td>		  					
		  		</tr>	
		  </c:forEach>					
		  </table>	
		</div>
	</section>
</main>
</div>
<script>


</script>


<c:import url="/foot" />

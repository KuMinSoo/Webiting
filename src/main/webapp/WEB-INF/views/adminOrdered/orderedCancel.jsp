<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top"/>
<style>
	.title{
		text-align: center;
		vertical-align:middle;
	}
	.userInfo{
		 text-align:left;
		 font-size:15px;
	}
	.content_main{
		background-color:#787878;
		color:white;
		text-align:center;
		font-size:40px;
		margin:10px 0px;
		padding:10px;
		width:100%;
	}
	.btn-list{
		 	width: 100%;
            height: 5%;
            background-color: gray;
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
			margin:10px 0px;
	}
	.btn-list button{
			margin:10px;
	}
	
	

</style>
<script>
	function check() {//검색시 유효성 체크(검색유형, 검색어) 함수
		
	
		if(!$('input[name="orderStatusMode"]:checked').val()){
			alert('주문상태를 체크하세요');
			return false;
		}
				
		if($('#findKeyword').val()){
			if($('#findType').val()=='') {
				alert('검색 유형을 선택하세요');
				return false;
			}
		}
		let dateStart=$('#dateStart').val()
		let dateEnd=$('#dateEnd').val()
		if(dateStart > dateEnd){	
			alert('시작일이 끝기간보다 날짜가 많습니다. 다시 설정해주세요')
			return false;
		}
		
		
 		return true;
	}
	
	
	
	function delivStart(flag,ds){
		if(ds==3){
			if(confirm("취소/환불 처리하십니까?")){
				$('#frm').prop("action","delivStart");
				$('#orderedNum').val(flag);
				$('#mode').val(ds);
				$('#frm').prop("method","post");
				$('#frm').submit();

			}	
		}
	}//---------------
	

/* 
	function listDate(flag){
		let date=new Date();
		$('#dateEnd').val(date);
		if(flag==1){
			date=date.getDate()-1;
			$('#dateStart').val(date);
		}
		if(flag==2){
			date=date.getDate()-7;
			$('#dateStart').val(date);
		}
		if(flag==3){
			date=date.getMonth()-1;
			$('#dateStart').val(date);
		}
	} */
			
	function orderStatusMode(flag){
		$('#orderF').prop("action","orderedCancel");
		$('#orderF').prop("method","get");
		$('#orderStatusMode').val(flag);
		$('#orderF').submit();		
	}
</script>
<style>
	.search div{
			maring:10px;			
	}
</style>


<%
	String ctx=request.getContextPath();

%> 

<main>
	<section>
		<div class="container mt-3 mb-3" >
			<div class="content_main">주문목록 페이지</div>
				<div class="btn-list">
					<button type="button" class="btn btn-light" onclick="location.href='<%=ctx%>/orderedCancel'">전체목록</button>
					<button type="button" class="btn btn-light" onclick="orderStatusMode(1)">취소/환불 </button>
					<button type="button" class="btn btn-danger" onclick="orderStatusMode(2)">취소/환불 처리</button>
				  	<form name="orderF" id="orderF">
						<input type="hidden" name="orderStatusMode" id="orderStatusMode">
						<input type="hidden" name="cpage" value="1">
						<input type="hidden" name="pageSize" value="${paging.pageSize}">
					</form>
				</div>
	<div>
		<form id="dtf" name="dtf" action="orderedCancel" method="get">			
			<div>
				주문상태:
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="" 
							<c:if test="${paging.orderStatusMode==1}"> checked </c:if>>
					<label class="form-check-label" for="orderMode">전체</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="1"
					   <c:if test="${paging.orderStatusMode==2}"> checked </c:if>>
		  			<label class="form-check-label" for="orderMoorderStatusModede">취소/환불대기</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="2"
						  <c:if test="${paging.orderStatusMode==3}"> checked </c:if>>
		  			<label class="form-check-label" for="orderStatusMode">취소/환불완료</label>
				</div>
			</div>
			
			<div>	
				기간설정:
			<!-- 	<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		 			 <input class="form-check-input" type="radio" name="date" id="date1"  onclick="listDate(1)">
		  			 <label class="form-check-label" for="date1">지난 1일</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="date" id="date2"  onclick="listDate(2)">
		  			<label class="form-check-label" for="date2">지난 1주</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="date" id="date3"  onclick="listDate(3)" checked="checked">
		  			<label class="form-check-label" for="date3">지난 1달</label>
				</div> -->
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<label class="form-check-label" for="dateStart">시작기간</label>
		  			<input type="date" id="dateStart" name="dateStart" <c:if test="${paging.dateStart ne null}"> value="${paging.dateStart}"</c:if>>
		  			<label class="form-check-label" for="dateEnd" >끝기간</label>
		  			<input type="date" id="dateEnd" name="dateEnd" <c:if test="${paging.dateEnd ne null}"> value="${paging.dateEnd}"</c:if>>
				</div>	
			</div>	
		
		<!-- 검색기능 -->
		
			<div style="display:inline-block;float:left;width:50%;">				
					<select id="findType" name="findType" style="padding: 6px;">
						<option value="">::검색유형::</option>
						<option value="1"
							<c:if test="${paging.findType eq 1}">selected</c:if>>주문번호</option>
						<option value="2"
							<c:if test="${paging.findType eq 2}">selected</c:if>>상품명</option>
						<option value="3"
							<c:if test="${paging.findType eq 3}">selected</c:if>>주문자</option>
					</select> 
					<input type="text" id="findKeyword" name="findKeyword" placeholder="검색어를 입력하세요"
						autofocus="autofocus" style='width: 50%'>	
			</div>
			
			
			<div style="clear:both;">
			<button style="width:30%" class="btn btn-outline-primary btn-list contain-main" onclick="return check()">조  회</button>		
			</div>	
		</form>
	</div>		
		<div style="display:inline-block;width:15%;float:right">
			<form id="pageSizeF" action="AorderedList">
				<input type="hidden" name="findType" value="${paging.findType}">
				<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
		    	<input type="hidden" name="cpage" value="${paging.cpage}">
		    	<input type="hidden" id="dateStart" name="dateStart" value="${paging.dateStart}">
				<input type="hidden" id="dateEnd" name="dateEnd" value="${paging.dateEnd}" >
				<input type="hidden" id="orderMode" name="orderMode" value="${paging.orderMode}">
				<select class="form-select" aria-label="Default select example"  name="pageSize" style="padding:6px;width:100%" onchange="submit()">
					<c:forEach var="ps" begin="10" end="100" step="20" >
						<option value="${ps}" 
							<c:if test="${pageSize eq ps}">selected</c:if>>페이지 사이즈${ps}</option>
					</c:forEach>
				</select>
			</form>
		</div>
	
		
		
		  <table class="table table-striped table-hover title">
		  	<thead>
		  		<tr>
		  			<th class="font-alt title" style="width:5%"></th>	
		  			<th class="font-alt title" style="width:10%">주문일</th>
		  			<th class="font-alt title" style="width:10%">주문번호</th>
		  			<th class="font-alt title" style="width:10%">사진</th>
		  			<th class="font-alt title" style="width:15%">상품명</th>
		  			<th class="font-alt title" style="width:10%">수량</th>		
		  			<th class="font-alt title" style="width:10%">주문자</th> 			
		  			<th class="font-alt title" style="width:20%">취소사유</th>
		  			<th class="font-alt title" style="width:15%">취소상태</th>
		  		</tr>
		  	</thead>

 			<c:if test="${orderList eq null}">
		  	<tr><td colspan="8" style="text-align:center">입력된 데이터가 없습니다.</td></tr>		  	
		  	</c:if>
		  	<c:if test="${orderList ne null}">
		  	<c:forEach items="${orderList}" var="orderList" varStatus="state">
		  		<tr>
		  			<td><%-- ${state.index } / ${state.count } --%>
		  			 	<c:if test="${paging.orderMode eq 1 || paging.orderMode eq 2 || paging.orderMode eq 5 }">
		  					<input type="checkbox" name="delivGroup">
		  				</c:if>
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
		  				<a href="<%=ctx%>/prodDetail?pnum=${orderList.pnum_fk}"><c:out value="${orderList.pname}"/></a>
		  			</td>
		  			<!-- 가격정보------------------------- -->
		  			<td>
		  				<c:out value="${orderList.oqty}"/>
		  			</td>
		  			
		  			<!----------------------------------- -->
		  		
		  			<td>
 						<a href="#"><c:out value="${orderList.userid}"/></a>
 		  			</td>
		  			<!-- 주문자 정보  -->
		  						  			
		  			<!-- 배송상태 ---------------------------------->
		  			<td>
		  				<p>
						  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample${state.index}" aria-expanded="false" aria-controls="collapseWidthExample">
						     <c:out value="${orderList.refund_type}"/>
						  </button>
						</p>
						<div style="min-height: 120px;">
						  <div class="collapse collapse-horizontal" id="collapseWidthExample${state.index}">
						    <div class="card card-body" style="width: 300px;">
						      <c:out value="${orderList.rtxt}"/>
						    </div>
						  </div>
						</div> 				
		  			</td>
		  			<td>
		  				<c:if test="${orderList.ordered_statusNum_fk eq 1}">
		  					<button type="button" class="btn btn-danger" onclick="delivStart('${orderList.orderedNum}', 3)"><c:out value="${orderList.ordered_status}"/></button>
		  				</c:if>
		  				
		  				<c:if test="${orderList.ordered_statusNum_fk eq 2}">
		  					<button type="button" class="btn btn-primary"><c:out value="${orderList.ordered_status}"/></button>
		  				</c:if>	
		  			
		  				
		  			</td>		  					
		  		</tr>	
		  </c:forEach>
		  <form id="frm" name="frm">
			  <input type="hidden" name="orderedNum" id="orderedNum">
			  <input type="hidden" name="mode" id="mode">
			  <input type="hidden" name="orderMode" id="orderMode" value="${paging.orderMode}">
		  </form>

		  </c:if>					
		  </table>
		  <div>${pageNavi}</div>	
		</div>
		
	</section>
</main>

<script>


</script>


<c:import url="/foot" />

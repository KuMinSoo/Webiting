<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<c:import url="/top" />
<c:import url="/adminNavi" />




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
	
	.search div{
		maring:10px;			
	}
	#searchFilter{
		border: 1px solid gray;
		padding:20px;
		border-radius:5px;
	
	}


</style>
<script>
	function ccheck() {//검색시 유효성 체크(검색유형, 검색어) 함수
//		$('#test').append("<h1>flag val:"+flag+"</h1>")
	if($('input[name="orderMode"]:checked').val()==null){
		alert('배송상태를 체크하세요');
		return false;
	}

	if($('input[name="orderStatusMode"]:checked').val()==null){
		alert('주문상태를 체크하세요');
		return false;
	}
	if($('#findKeyword').val()!=''){
		if($('#findType').val()==''){
			alert('검색유형을 선택하세요');
			return false;
		}				
	}
	if($('#dateCheck').val()==null || $('#dateCheck').val()=='Y'){
		$('#dateCheck').val('Y')			
	}else{
		$('#dateCheck').val('N')
	}
	let dateStart2=$('#dateStart').val()
	let dateEnd2=$('#dateEnd2').val()
	if($('#dateStart1').is(":disabled")){
		if(dateStart2 > dateEnd2){
			alert('dateStart2 값: '+dateStart)
			alert('dateEnd2 값: '+dateEnd2)
			
			alert('시작일이 끝기간보다 날짜가 많습니다. 다시 설정해주세요')
			return false;
		}
	}

		return true;
}
 
	function listDate(flag){
		if(flag!=0){	
			defaultFlag = flag;
			//alert(flag)
			let date=new Date();
			let m=date.getMonth()+1;
			let mm=((date.getMonth()+1)<10)?"0"+m:""+m;
			let d=date.getDate();
			let dd=(d<10)?"0"+d:""+d;
			$('#dateEnd').val(date.getFullYear()+"-"+(mm)+"-"+(dd));
			
			if(flag==1){
				date.setDate(date.getDate()-1);
				m=date.getMonth()+1;
				mm=((date.getMonth()+1)<10)?"0"+m:""+m;
				d=date.getDate();
				dd=(d<10)?"0"+d:""+d;
				$('#flag').val(flag);
				$('#dateStart'+flag).val(date.getFullYear()+"-"+(mm)+"-"+(dd));
				$('#dateStart'+flag).prop("checked",true);
			}
			if(flag==2){
				date.setDate(date.getDate()-7);
				m=date.getMonth()+1;
				mm=((date.getMonth()+1)<10)?"0"+m:""+m;
				d=date.getDate();
				dd=(d<10)?"0"+d:""+d;
				$('#flag').val(flag);
				$('#dateStart'+flag).val(date.getFullYear()+"-"+(mm)+"-"+(dd));
				$('#dateStart'+flag).prop("checked",true);
			}
			if(flag==3){
				date.setMonth(date.getMonth()-1);
				m=date.getMonth()+1;
				mm=((date.getMonth()+1)<10)?"0"+m:""+m;
				d=date.getDate();
				dd=(d<10)?"0"+d:""+d;
				$('#dateStart'+flag).val(date.getFullYear()+"-"+(mm)+"-"+(dd));
				$('#dateStart'+flag).prop("checked",true);
				$('#flag').val(flag);
			}
			if(flag==4){
				date.setFullYear(date.getFullYear()-1);
				m=date.getMonth()+1;
				mm=((date.getMonth()+1)<10)?"0"+m:""+m;
				d=date.getDate();
				dd=(d<10)?"0"+d:""+d;
				$('#flag').val(flag);
				$('#dateStart'+flag).val(date.getFullYear()+"-"+(mm)+"-"+(dd));
				$('#dateStart'+flag).prop("checked",true);
			}
			$('#dateCheck').val('Y');
			$('input[name="dateStart"]').val(date.getFullYear()+"-"+(mm)+"-"+(dd))
		}else{
			$('input[name="dateCheck"]').val('Y');
			
		}
		
	}
		
	
	function dateShow(){
		$('.dateCal').hide();
		if($(event.currentTarget).text()=='상세기간 설정'){
			$('.dateCal').show();
			$('.date').prop("disabled",true);
			$('.long-date').prop("disabled",false);	
			$('#longDateStart').prop('name',"dateStart");
			$('#longDateEnd').prop('name',"dateEnd");
			$('#longDateStart').val();
			$('#longDateEnd').val();
			$(event.currentTarget).text('접기');
			$('#dateCheck').val('N');
		}else{
			$('.dateCal').hide();
			$('.date').prop("disabled",false);
			$('.long-date').prop("disabled",true);	
			$('#longDateStart').prop('name',"disable");
			$('#longDateEnd').prop('name',"disable");
			$(event.currentTarget).text('상세기간 설정')
			$('#dateCheck').val('Y');
		}
	}
	

	$(function(){
		
		var defaultFlag = 0;
		defaultFlag =$('#flag').val();
		if(defaultFlag==null || defaultFlag==0){
			$('#flag').val(defaultFlag);
			$('.date').prop("disabled",true);
			$('.long-date').prop("disabled",false);
			$('.dateCal').show();
		}	
		listDate(defaultFlag);
		
		
		let dateCheck = '<%=(String)session.getAttribute("dateCheck")%>';
		if(dateCheck == 'null' || dateCheck=="Y"){
		
			$('#dateCheck').val("Y");
				
		}else{
			$('#dateCheck').val(dateCheck);
			$('#longDateStart').prop('name',"dateStart");	
			$('#longDateEnd').prop('name',"dateEnd");			
		} 
		
		
		if($('#dateCheck').val()=='Y'){
			$('.date').prop("disabled",false)
			$('.long-date').prop("disabled",true);
			$('.dateCal').hide();
		}		
		if($('#dateCheck').val()=='N'){
			$('.date').prop("disabled",true);
			$('.long-date').prop("disabled",false);
			$('#dateShowButton').text('접기');
			$('.dateCal').show();
		}
	})
		function memberInfo(num){	
		window.name="parentForm";		
		window.open("memberInfo/"+num,"_blank","width=530,height=360,top=300,left=200");
	
	}
	
	
</script>



<%
	String ctx=request.getContextPath();
%> 
<main>
	<section>
<div class="container mt-3" style="overflow: auto ;position:relative">
			<div class="content_main">주 문 목 록</div>
	<div id="searchFilter">
		<form id="dtf" name="dtf" action="orderedList" method="get">
			<div>
				배송상태: 
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderMode" id="orderMode"  value="" 
							<c:if test="${paging.orderMode==null or paging.orderMode ==''}"> checked </c:if>>
					<label class="form-check-label" for="orderMode">배송전체</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		 			 <input class="form-check-input" type="radio" name="orderMode" id="orderMode" value="0"
		 			 	<c:if test="${paging.orderMode=='0'}"> checked </c:if>>
		  			 <label class="form-check-label" for="orderMode">배송대기</label> 
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderMode" id="orderMode" value="1"
		  				<c:if test="${paging.orderMode=='1'}"> checked</c:if>>
		  			<label class="form-check-label" for="orderMode">배송중</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderMode" id="orderMode" value="2"
		  				<c:if test="${paging.orderMode=='2'}"> checked </c:if>>
		  			<label class="form-check-label" for="orderMode">배송완료</label>
				</div>
			</div>
			
			<div>
				주문상태:
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="" 
							<c:if test="${empty paging.orderStatusMode}"> checked </c:if>>
					<label class="form-check-label" for="orderMode">주문전체</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		 			 <input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="0"
		 			  <c:if test="${paging.orderStatusMode=='0'}"> checked </c:if>>
		  			<label class="form-check-label" for="orderStatusMode">주문완료</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="1"
					   <c:if test="${paging.orderStatusMode=='1'}"> checked </c:if>>
		  			<label class="form-check-label" for="orderMoorderStatusModede">취소/환불대기</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input" type="radio" name="orderStatusMode" id="orderStatusMode" value="2"
						  <c:if test="${paging.orderStatusMode=='2'}"> checked </c:if>>
		  			<label class="form-check-label" for="orderStatusMode">취소/환불완료</label>
				</div>
			</div>
			
			<div>	
				기간설정:
				<input class="date" type="hidden" name="dateEnd" id="dateEnd">
			<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		 			 <input class="form-check-input date" type="radio" name="dateStart" id="dateStart1" 
		 			 <c:if test="${dateMap.day==paging.dateStart and dateMap.today==paging.dateEnd}"> checked</c:if>
		 			  onclick="listDate(1)">
		  			 <label class="form-check-label" for="dateStart1">지난 1일</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input date" type="radio" name="dateStart" id="dateStart2"  
		  			<c:if test="${dateMap.week==paging.dateStart and dateMap.today==paging.dateEnd}"> checked</c:if>
		  			onclick="listDate(2)">
		  			<label class="form-check-label" for="dateStart2">지난 1주</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input date" type="radio" name="dateStart" id="dateStart3"  
		  			<c:if test="${dateMap.month==paging.dateStart and dateMap.today==paging.dateEnd}"> checked</c:if>
		  			onclick="listDate(3)">
		  			<label class="form-check-label" for="dateStart3">지난 1달</label>
				</div>
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">
		  			<input class="form-check-input date" type="radio" name="dateStart" id="dateStart4"  
		  			<c:if test="${dateMap.year==paging.dateStart and dateMap.today==paging.dateEnd}"> checked</c:if>
		  			onclick="listDate(4)">
		  			<label class="form-check-label" for="dateStart4">지난 1년</label>
				</div>
				<button type="button" onclick="dateShow()" id="dateShowButton">상세기간 설정</button>	
			</div>
			<div class="dateCal">
				상세기간 설정:
				<div class="form-check form-check-inline" style="margin:10px 30px 10px;">					
		  			<label class="form-check-label" for="dateStart">시작기간</label>
		  			<input class="long-date" type="date" id="longDateStart" <c:if test="${paging.dateStart ne null }"> value="${paging.dateStart}"</c:if>>
		  			<label class="form-check-label" for="dateEnd" >끝기간</label>
		  			<input class="long-date" type="date" id="longDateEnd" <c:if test="${paging.dateEnd ne null}"> value="${paging.dateEnd}"</c:if>>
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
			<input type="hidden" name="flag" id="flag" value="${paging.flag}">
			<input type="hidden" name="dateCheck" id="dateCheck" value="${paging.dateCheck}">
			<input type="hidden" name="cpage" value="${paging.cpage}">
			<input type="hidden" name="pageSize" value="${paging.pageSize}">
			<div style="clear:both;text-align:center">
			<button style="width:20%;display:inline-block;" class="btn btn-outline-primary btn-list contain-main" onclick="return ccheck()">조  회</button>		
			</div>	
		</form>
	</div>		
		<div style="display:inline-block;width:15%;float:right">
			<form id="pageSizeF" action="orderedList">
				<input type="hidden" name="findType" value="${paging.findType}">
				<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
		    	<input type="hidden" name="cpage" value="${paging.cpage}">
		    	<input type="hidden" id="dateStart" name="dateStart" value="${paging.dateStart}">
				<input type="hidden" id="dateEnd" name="dateEnd" value="${paging.dateEnd}" >
				<input type="hidden" id="orderMode" name="orderMode" value="${paging.orderMode}">
				<input type="hidden" id="orderStatusMode" name="orderStatusMode" value="${paging.orderStatusMode}">
				<input type="hidden" name="dateCheck" id="dateCheck" value="${paging.dateCheck}">
				<input type="hidden" name="flag" id="flag" value="${paging.flag}">
				<select class="form-select" aria-label="Default select example"  name="pageSize" style="padding:6px;width:100%" onchange="submit()">
					<c:forEach var="ps" begin="10" end="100" step="20">
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
		  			<th class="font-alt title" style="width:20%">상품명</th>
		  			<th class="font-alt title" style="width:10%">수량</th>		
		  			<th class="font-alt title" style="width:10%">주문자</th> 			
		  			<th class="font-alt title" style="width:15%">배송처리</th>
		  			<th class="font-alt title" style="width:15%">주문상태</th>
		  		</tr>
		  	</thead>

 			<c:if test="${orderList eq null}">
		  	<tr><td colspan="8" style="text-align:center">입력된 데이터가 없습니다.</td></tr>		  	
		  	</c:if>
		  	<c:if test="${orderList ne null}">
		  	<c:forEach items="${orderList}" var="orderList" begin="1" step="1" varStatus="state">
		  		<tr>
		  			<td>
		  			 
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
 						<a href="#" onclick="memberInfo('${orderList.orderedNum}')"><c:out value="${orderList.userid}"/></a>
 		  			</td>
		  			<!-- 주문자 정보  -->
		  						  			
		  			<!-- 배송상태 ---------------------------------->
		  			<td>
		  				
		  				<c:if test="${orderList.ordered_delivstateNum_fk eq 0}">  					
		  					<c:out value="${orderList.ordered_delivstate}"/>	  					
		  				</c:if>
		  				<c:if test="${orderList.ordered_delivstateNum_fk eq 1}">
		  					<span style="color:red;"><c:out value="${orderList.ordered_delivstate}"/></span>
		  				</c:if>
		  				
		  				<c:if test="${orderList.ordered_delivstateNum_fk eq 2}">
		  					<span style="color:blue;"><c:out value="${orderList.ordered_delivstate}"/></span>
		  				</c:if>		  				
		  			</td>
		  			<td>
		  				<c:if test="${orderList.ordered_statusNum_fk eq 0}">		  					
		  					<c:out value="${orderList.ordered_status}"/>
		  				</c:if>
		  				<c:if test="${orderList.ordered_statusNum_fk eq 1}">
		  					<c:out value="${orderList.ordered_status}"/>
		  				</c:if>
		  				<c:if test="${orderList.ordered_statusNum_fk eq 2}">		  					
		  					<c:out value="${orderList.ordered_status}"/>
		  				</c:if>	  				
		  			</td>		  					
		  		</tr>	
		  </c:forEach>

		  </c:if>					
		  </table>
		  <div>${pageNavi}</div>	
		<!-- </div> -->
		</div>

	</section>
</main>		


	

<c:import url="/foot" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
.myform fieldset legend{
    text-align: right;
}
.myform input[type=radio]{
    display: none;
}
.myform label{
    font-size: 1.2em;
    /* color: transparent;
    text-shadow: 0 0 0 #f0f0f0; */
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color:rgba(250, 208, 0, 0.99);
}
.myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

</style>
<script type="text/javascript">
$(function(){
	$('input[name="sortT"]').click(function() {
        var sortType = $(this).val(); // value
        //alert(sortType);
        let url='/prodListForm/'+sortType;
        //var form = $("#pageInfo")[0];
    	//var page = new FormData(form);
    	var pageInfo = $("form[name=pageInfo]").serialize() ;
    	//alert(pageInfo)
        //let page=$('#findType').val;
        //alert(page);
        // data={
        //		page:${paging},
        //		downCg_code:${downCg_code}
        //} 
        //alert(url);
        	$.ajax({
        		type:'get',
        		url:url,
        		//data:pageInfo,
        		dataType:'json',
        		cache:false,
	        	success:function(res){
	        		showList(res);
	        	},
	        	error:function(request, status, error){
	        		alert("status : " + request.status+ "\n" + "error:" + error + "\n" + "message:" 
	        				+ request.responseText );
	        	}
        	}); 
        	
	});
})

function showList(res){
	$('#prodBox').html('');
	let pageStr=res.pageNavi;
	//alert(JSON.stringify(pageStr));
	$.each(res.prodArr,function(i, prod){
	let str=`
		<div class="col mb-5">
		<div class="card h-100">
			<!-- Product image-->
			<img class="card-img-top"
				src="../resources/product_images/\${prod.pimage1}" />
			<!-- Product details-->
			<div class="card-body p-4">
				<div class="text-center myform">
					<!-- Product name-->
					<h5 class="fw-bolder" id="test1">\${prod.pname}</h5>
					<!-- Product price-->
					\${prod.saleprice}원
					
					<br>
			  <fieldset>
              <input type="radio" name="reviewStar" value="5" id="rate1">
              <label for="rate1">★</label> 
              <input type="radio" name="reviewStar"value="4" id="rate2">
              <label for="rate2">★</label> 
              <input type="radio" name="reviewStar" value="3" id="rate3">
              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                 value="2" id="rate4"><label for="rate4">★</label> <input
                 type="radio" name="reviewStar" value="1" id="rate5"><label
                 for="rate5">★</label>
           </fieldset>
				</div>
			</div>
			
			<!-- Product actions-->
			<div  class="text-center">
			<img src="../resources/images/heart-fill.svg">
			(\${prod.likeCnt})
			
			</div>
			<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
				<div class="text-center">
					<a class="btn btn-outline-dark mt-auto"
						href="/prodDetail?pnum=\${prod.pnum}">prodDetail</a>
				</div>
			</div>
		</div>
	</div>
	`;
	$('#prodBox').append(str);
	})
	let navi=`<div style="text-align:center;">\${pageStr} 총 상품수 : 
		<b>\${res.paging.totalCount}</b><br>
		</div>`;
		//alert(navi)
	$('#navi').html(navi);
}
</script>

<div id="product_order_list" class="text-center">
			<br><br>
			<form name="sortData" action="prodListForm">
				<label for="sortDate">
					<input type="radio" id="sortDate" name="sortT" value=1 <c:if test="${param.sortType eq 1 or param.sortType eq null}">checked</c:if>   >최신순
				</label>
				<label for="sortPrice">
    				<input type="radio" id="sortPrice" name="sortT" value=2 <c:if test="${param.sortType eq 2}">checked</c:if>>가격순
    			</label>
			</form>
			
</div>
 <c:if test="${paging.findKeyword ne null and not empty paging.findKeyword}">
	<div class="text-center"><h1>"${paging.findKeyword}"에 대한 검색결과</h1></div>
</c:if> 
<c:if test="${downCg_name ne null and not empty downCg_name}">
	<div class="text-center"><h1>"${downCg_name}" 카테고리 상품 목록</h1></div>
</c:if>
		 <div class="col-md-3 text-right">
			<form name="pageInfo" id="pageInfo">
				<input type="hidden" name="findType" value="${paging.findType}">
				<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
				<input type="hidden" name="cpage" value="${paging.cpage}">
				<input type="hidden" name="downCg_code" value="${downCg_code}">
				<input type="hidden" name="downCg_name" value="${downCg_name}">
			</form>
		</div> 
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			<c:if test="${prodArr ne null and not empty prodArr}">
 				<c:forEach var="prod" items="${prodArr}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${prod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${prod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${prod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${prod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${prod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${prod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${prod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
			</c:if>
		</div>
	</div>
</section>
<div id="navi" style="text-align:center;">
	${pageNavi} 총 상품수 : <b><c:out value="${paging.totalCount}"/></b><br>
</div>

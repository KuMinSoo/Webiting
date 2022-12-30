<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <c:import url="/top" />  --%>
<link href="../resources/css/star.css" rel="stylesheet"/>
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
<c:if test="${paging.findKeyword ne null and not empty paging.findKeyword}">
	<div class="text-center"><h1>"${paging.findKeyword}"에 대한 검색결과</h1></div>
</c:if>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
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
									<h5 class="fw-bolder">${prod.pname}</h5>
									<!-- Product price-->
									${prod.price}
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
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/admin/prodDetail?pnum=${prod.pnum}">prodDetail</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</c:if>
		</div>
	</div>
</section>
<div style="text-align:center;">${pageNavi} 총 상품수 : <b><c:out value="${paging.totalCount}"/></b><br>
						<div class="text-danger"><c:out value="${paging.cpage}"/></div> 
						/ <c:out value="${paging.pageCount}"/></div>
<%-- <c:import url="/foot" /> --%>
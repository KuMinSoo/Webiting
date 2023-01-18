<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<c:if test="${loginUser ne null and not empty loginUser}">
<c:if test="${personalProdArr ne null and not empty personalProdArr}">
<hr>
<h2>${loginUser.userid}님을 위한 추천상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="prod" items="${personalProdArr}">
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
			
		</div>
	</div>
</section>
</c:if>
</c:if>

<c:if test="${echo ne null and not empty echo}">
<hr>
<h2>친환경 카테고리 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${echo}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<hr>
<c:if test="${topProdBed ne null and not empty topProdBed}">
<h2>침대 카테고리 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			<c:if test="${topProdBed ne null and not empty topProdBed}">
 				<c:forEach var="topprod" items="${topProdBed}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
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
</c:if>

<c:if test="${topProdChair ne null and not empty topProdChair}">
<hr>
<h2>의자 카테고리 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdChair}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdShelf ne null and not empty topProdShelf}">
<hr>
<h2>선반 카테고리 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdShelf}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdSofa ne null and not empty topProdSofa}">
<hr>
<h2>쇼파 카테고리 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdSofa}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdStorage ne null and not empty topProdStorage}">
<hr>
<h2>수납장 카테고리 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdStorage}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdTable ne null and not empty topProdTable}">
<hr>
<h2>테이블 카테고리 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdTable}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
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
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
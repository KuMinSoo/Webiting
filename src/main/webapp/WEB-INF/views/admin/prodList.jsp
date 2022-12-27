<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<section>
	<h2>
		<em>인기상품</em>
	</h2>
	<br>
	<h4>금주에 가장 많이 팔린 상품!!</h4>
</section>
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
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${prod.pname}</h5>
									<!-- Product price-->
									${prod.price}
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
<c:import url="/foot" />
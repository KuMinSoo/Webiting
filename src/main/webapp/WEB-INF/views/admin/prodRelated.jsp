<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="../resources/css/detail.css"
	type="text/css">

<!-- 연관 상품 페이지  -->
<div class="Related" style="text-align: left;">
	<h3>다른 고객님들이 살펴본 상품</h3>
	<br>
	<br>

	<c:forEach var="Relitem" items="${prelated}" begin="1" end="4">

		<div class="related text-center" id="viewRelated" style="width: 25%;display: inline-block;">
			<div>${Relitem.pname}</div>
			<a href="/prodDetail?pnum=${Relitem.pnum}"> 
				<img src="${myctx}/resources/product_images/${Relitem.pimage1}" style="width: 75%">
			</a>
			<h4>푹신한 침대</h4>
			<strong class="price">${Relitem.saleprice}원</strong>
		</div>
	</c:forEach>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="../resources/css/detail.css" type="text/css">

			<!-- 연관 상품 페이지  -->
	<div class="Related" style="text-align: left;">
		<h3>다른 고객님들이 살펴본 상품 <a href="#"><span class="blind">더보기</span></a></h3>
			<br><br>
		
		<c:forEach var="Relitem" items="${prelated}" begin="1" end="4">${Relitem.pname}
			<br>
			<span class = "related" id = "viewRelated">
			<a href="${myctx}/resources/product_images/${Relitem.pimage1}">
				<img src="${myctx}/resources/product_images/${Relitem.pimage1}" width = "25%">
			</a>
				<p class = "rp">푹신한 침대</p>
				<strong class = "price">100,0000</strong>
				<span class = "unit">원</span>
			</span>	
		</c:forEach>	
	</div>
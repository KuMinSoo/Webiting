<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<c:import url="/top" />

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
tr>td>a{
	color: black;
	text-decoration: none;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="../resources/css/mypage.css">

<%@ include file="/WEB-INF/views/mypage/checkScript.jsp" %>

<%
   String ctx = request.getContextPath();
%>

<c:import url="/mypageNavi"/>

<div class="container mt-3" style="height: 800px; overflow: auto; scrollbar-width:none;"> 
	<h1 class="text-center">내 관심 상품 목록</h1> 
	<hr>
	<table width="900" align="center">
	<tr>
		<td> <input type="checkbox" onclick="maincheck(this.checked)" style="width:20px;height:20px;" id="mainchk"> </td>
		<td> 상품이미지 </td>
		<td> 상품명 </td>
		<td> 상품가격 </td>
		<td> 날짜 </td>
		<td> 삭제하기 </td>
	</tr>

	<c:if test="${likeArr eq null or empty likeArr}">
		<tr>
			<td>좋아요를 누르면 관심 상품 목록에 추가됩니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${likeArr ne null and not empty likeArr}">	
		<c:forEach var="like" items="${likeArr}">
		<tr>
         <td> <input type="checkbox" class="subchk" onclick="subcheck()" value="${like.pnum}"> </td>
         <td> <a href="<%=ctx%>/prodDetail?pnum=${like.pnum}"><img src="../resources/product_images/${like.pimage1}" width="100"></a> </td>
         <td> <a href="<%=ctx%>/prodDetail?pnum=${like.pnum}">${like.pname}</a> </td>
         <td> <fmt:formatNumber value="${like.lprice}"/>원 </td>
         <td> ${like.lindate} </td>
         <td> <button class="likedel_btn" data-pnum="${like.pnum}">삭제</button></td>
       </tr>
			
		</c:forEach>
		
	</c:if>
	<tr height="80">
       <td colspan="6">
       	<button class="checkdel_btn">선택삭제</button>
       	<button class="move_cart">장바구니이동</button>
       </td>
     </tr>
	<tfoot>
		<tr>
			<td colspan="6" class="text-center">
				${pageNavi}
			</td>
		</tr>
	</tfoot>
	</table>
</div>


<form action="/mypage/like_del" method="post" class="like_delete_form">
	<input type="hidden" id="pnum" name="pnum" class="likedel_pnum">
	<input type="hidden" id="idx" name="idx" value="${loginUser.idx}"
>
</form>

<form action="/mypage/select_del" method="post" class="select_delete_form">
	<input type="hidden" id="pnum" name="pnum" class="selectdel_pnum">
	<input type="hidden" id="idx" name="idx" value="${loginUser.idx}"
>
</form>

<form action="/mypage/move_cart" method="post" class="move_cart_form">
	<input type="hidden" id="pnum" name="pnum" class="move_cart_pnum">
	<input type="hidden" id="idx" name="idx" value="${loginUser.idx}"
>
</form>

<script>
$(".likedel_btn").on("click", function(e){
	e.preventDefault();
	const pnum=$(this).data("pnum");
	$(".likedel_pnum").val(pnum);
	$(".like_delete_form").submit();
});

$(".checkdel_btn").on("click", function(e){
	e.preventDefault();
	var len=document.getElementsByClassName("subchk").length;
	var str="";
	for(i=0; i<len; i++){
		if(document.getElementsByClassName("subchk")[i].checked){
			str+=document.getElementsByClassName("subchk")[i].value+",";
		}
	}
	//alert(str);
	$(".selectdel_pnum").val(str);
	$('.select_delete_form').submit();
});

$(".move_cart").on("click", function(e){
	e.preventDefault();
	var len=document.getElementsByClassName("subchk").length;
	var str="";
	for(i=0; i<len; i++){
		if(document.getElementsByClassName("subchk")[i].checked){
			str+=document.getElementsByClassName("subchk")[i].value+",";
		}
	}
	alert(str);
	$(".move_cart_pnum").val(str);
	$('.move_cart_form').submit();	
});

</script>

<c:import url="/foot" />
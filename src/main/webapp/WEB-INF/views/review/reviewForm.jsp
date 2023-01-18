<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<!-- <head> -->
<!-- <link rel="stylesheet" href="/resources/css/reviewForm.css"> -->
<!-- <script src="js/reviewAjax.js"></script>--><!-- 
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->
<c:set var="myctx" value="${rpageContext.request.contextPath}"/>
 <%@ include file="/WEB-INF/views/review/reviewScript.jsp"%> 
<!-- <title>리뷰페이지</title> -->
<!-- </head> -->


<%-- <h1>${starList.get(0) }</h1> --%>
<div id = "fn-Container" class = "fn-Review_brand" style = "padding-top:10px;">
<!-- ----------------------------------- -->
<form method="post" enctype="multipart/form-data" name="rf" id="rf">
	<!-- hidden data------------------------------------ -->
		<input type="hidden" name="pnum_fk" id="pnum_fk" value="${pnum}">
		<input type="hidden" name="userid" id="userid" value="${loginUser.userid}">
	<!-- ---------------------------------------------- -->
	<table class="table">
	<tr>
		<th colspan="4" class="text-center">
		<h3>::상품 후기 쓰기::</h3>
		</th>
	</tr>
	<tr>
		<th>평가점수</th>
		<td>
		<!-- <input type="hidden" name="score" id="score"> -->
		<label for="score1"><input type="radio" name="score" id="score1" value="1">1점</label>
		<label for="score2"><input type="radio" name="score" id="score2" value="2">2점</label>
		<label for="score3"><input type="radio" name="score" id="score3" value="3">3점</label>
		<label for="score4"><input type="radio" name="score" id="score4" value="4">4점</label>
		<label for="score5"><input type="radio" name="score" id="score5" value="5">5점</label>
		
		
		</td>
		<th>작성자</th>
		<td>${loginUser.name}[${loginUser.userid}]</td>
	</tr>	
	<tr>
		<th>상품평</th>
		<td colspan="3">
		<textarea name="content" id="content"
		 rows="2" class="form-control"></textarea>	
		</td>
	</tr>
	<tr>
		<th>이미지업로드</th>
		<td colspan="2">
		<input type="file" name="mfilename" id="mfilename"
		 accept="image/*" class="form-control">
		</td>
		<td>
		<!-- 파일업로드강벗는 일반적인 폼데이터를 전송할때 =>send()함수를 통해 ajax요청 -->
		<!--  <a type="button" class="btn btn-success"
				onclick="send()">글쓰기</a>  -->
		 <button class="btn btn-outline-success">글쓰기</button> 
		</td>
	</tr>
</table>
</form>					
				

</div>
	

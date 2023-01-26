<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:import url="/top" />
<script src= "../js/pcategory.js"></script> <!-- 참조 할 부분 -->
<div class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">상품 수정[Admin Page]</h1>
				<form name="prodF" id="prodF" method="Post"                    
					enctype="multipart/form-data" action="prodEditEnd"
					onsubmit="return check2()">
					<!-- 파일업로드시: enctype="multipart/form-data"-->
					<table class="table table-condensed table-bordered mt-4">
						<thead>
							<tr>
								<th colspan="2" class="text-center">
									<h3>:::Product Edit:::</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="20%"><b>카테고리</b></td>
								<td width="80%">
									${Product.upCg_code}-${Product.downCg_code}
									<input type="hidden" name="upCg_code" id="upCg_code" value="${Product.upCg_code}">
									<input type="hidden" name="downCg_code" id="downCg_code" value="${Product.downCg_code}">
									<input type="hidden" name="pavg" id="pavg" value="${Product.pavg}">
									<input type="hidden" name="pnum" id="pnum" value="${Product.pnum}">
									
								</td>
							</tr>

							<tr>
								<td width="20%"><b>상품명</b></td>
								<td width="80%"><input type="text" name="pname" id="pname" value="${Product.pname}">
									<span style="color: red" > </span></td>
							</tr>
							<tr>
								<td width="20%"><b>제조사</b></td>
								<td width="80%"><input type="text" name="pcompany" value="${Product.pcompany}"
									id="pcompany"></td>
							</tr>
							<tr>
								<td width="20%"><b>상품스펙</b></td>
								<td width="80%"><select name="pspec" id="pspec" >
										<option value="NEW" selected>NEW</option>
										<option value="HIT">HIT</option>
										<option value="BEST">BEST</option>
								</select></td>
							</tr>
							<tr>
								<td>상품이미지</td>
								<td>
								<c:out value="${Product.pimage1}"/>
								<input type="file" name="pimage" disabled><br> 
								<c:out value="${Product.pimage2}"/>
								<input type="file" name="pimage" disabled><br>
								<c:out value="${Product.pimage3}"/> 
								<input type="file" name="pimage" disabled><br>
								</td>
							</tr>

							<tr>
								<td width="20%"><b>상품수량</b></td>
								<td width="80%"><input type="number" name="pqty" id="pqty" value="${Product.pqty}">
									개 <span style="color: red"> </span></td>

							</tr>
							<tr>
								<td width="20%"><b>상품공급가</b></td>
								<td width="80%"><input type="text" name="price" id="price" value="${Product.price}">
									
									원 <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품판매가</b></td>
								<td width="80%"><input type="text" name="saleprice" value="${Product.saleprice}"
									id="saleprice"> 원 <span style="color: red"> </span></td>
							</tr>
							<tr>
								<td width="20%"><b>상품설명</b></td>
								<td width="80%"><textarea name="pcontents" id="pcontents" 
										rows="5" cols="60">${Product.pcontents}</textarea></td>
							</tr>
							<tr>
								<td width="20%"><b>포인트</b></td>
								<td width="80%"><input type="number" name="point" value="${Product.point}"
									id="point"> POINT</td>
							</tr>
							<tr>
								<td width="20%"><b>태그 검색어</b></td>
								<td width="80%">
								<input type="text" name="tag1" id="tag1" value="${Product.tag1}">
								<input type="text" name="tag2" id="tag2" value="${Product.tag2}">
								<input type="text" name="tag3" id="tag3" value="${Product.tag3}"> 
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center">
									<button class="btn btn-outline-success">상품수정</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>
		</div>
	</div>
</div>



<c:import url="/foot" />
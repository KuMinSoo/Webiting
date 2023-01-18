<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/top" />
<script>
$(function() {
	$('#bf').submit(function() {
		if ($('#userid').val() == '') {
			alert("이름을 입력하세요");
			$('#userid').focus();
			return false;
		}
		
		if ($('#rtitle').val() == '') {
			alert('리뷰 제목을 입력하세요');
			$('#rtitle').focus();
			return false;
		}
		
		if ($('#content').val() == '') {
			alert('글내용을 입력하세요').$('#content').focus();
			return false;
		}
		
	})

})//$()end-----------------
function go(flag){
	if(flag==1){
		frm.mode.value='edit';
		$('#btn').text('글수정');
		frm.action='../edit';
		frm.method='post';
	} 
}
</script>
<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<input type="hidden" name="mode" value="write">
		<table class="table">
					<td style="width: 50%">
					<select name="findType" style="padding: 6px">
						<option value="">::문의유형(전체)::</option>
						<option value="1" <c:if test="${paging.findType eq 1}">selected</c:if>>상품</option>
					</select>
					</td>
				<tr>
					<td colspan="3">제목:
						<input type="text" id="" name="">
					</td>
				</tr>
				<%-- <tr>
					<td colspan="3">ID 2023-01-01
					<small>
						<input type="text" id="" name="">&emsp;
					<fmt:formatDate value="${review.wdate}" pattern="yyyy-MM-dd hh:mm"/>
					&emsp;
					</small>
					</td>
				</tr> --%>
				
				<tr>
					<td colspan="3"> 내용 : <c:out value="${review.content}"/>
				
				</tr>
				
				<tr>
				<!-- 편집 또는 삭제 -->
					<td colspan="2">			
						<button type="button" onclick="location.href='/admin/prodDetail?pnum=${review.pnum_fk}'" >글목록</button>
						<button type="button" onclick="location.href='../reviewForm/write?pnum_fk=${review.pnum_fk}&revnum=${review.revnum}&mode=edit'">수정하기</button>
					</td>
				</tr>
		</table>
</div>
<c:import url="/foot" />
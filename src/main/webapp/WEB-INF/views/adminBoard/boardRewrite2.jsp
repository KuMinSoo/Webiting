<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<script>
	$(function() {// 답변글 유효성 체크
		$('#bf').submit(function() {
			if ($('#subject').val() == '') {
				alert('제목을 입력하세요');
				$('#subject').focus();
				return false;
			}
			if ($('#content').val() == '') {
				alert('글내용을 입력하세요');
				$('#content').focus();
				return false;
			}
			if($("input[name=secret]:radio:checked").length < 1){
				alert("공개글 여부를 체크하세요");	
				return false;
			} 
			$(".select_code option").not(":selected").attr("disabled", "");
			return true;
			
		})

	})//$()end-----------------
</script>

<style>
	#bpwd, #name, #filename{
		width:200px;
	}

</style>

<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<br><h1 class='text-center' style="color:red;">답변 작성하기</h1><br>
	<form name="bf" id="bf" role="form" action="write" method="post" enctype="multipart/form-data">
		<input type="hidden" name="mode" value="rewrite">
		<input type="hidden" name="num" value="<c:out value='${num}'/>">
		<!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->
		<table class="table">
			<tr>
				<td>
					<c:if test="${bcg_code ne null or not empty bcg_code}">
						<select class="select_code" disabled name="bcg_code"
							style="padding: 6px;">
							<option value="">:::문의 유형:::</option>
							<option value="1"
								<c:if test="${bcg_code==1}">selected</c:if>>회원정보
								문의</option>
							<option value="2"
								<c:if test="${bcg_code==2}">selected</c:if>>주문/결제
								문의</option>
							<option value="3"
								<c:if test="${bcg_code==3}">selected</c:if>>취소/환불
								문의</option>
							<option value="4"
								<c:if test="${bcg_code==4}">selected</c:if>>배송관련
								문의</option>
							<option value="5"
								<c:if test="${bcg_code==5}">selected</c:if>>시스템
								오류 제보</option>
							<option value="6"
								<c:if test="${bcg_code==6}">selected</c:if>>기타문의</option>
						</select>
					</c:if>
				</td>
			</tr>
			<!-- 작성자------------------------------- -->
			<tr>
				<td>
					<input type="text" name="name" id="name" maxlength="10" class="form-control" value="관리자" readonly>
				</td>
			</tr>
			
			<!-- 제목: 답변완료 ------------- -->
			<tr>
				<td>
					<input type="text" name="subject" id="subject" maxlength="30" placeholder="제목" class="form-control" value="[답변완료]">
				</td>
			</tr>
			
			<!-- 글내용-------------------- -->
			<tr>
				<td>
					<textarea name="content" id="content" placeholder="문의내용" maxlength="600" rows="10" cols="50" class="form-control"></textarea>
				</td>
			</tr>
			
			<!-- 파일첨부---------------------->
			<tr>
				<td>
					<input type="file" name="mfilename" placeholder="첨부파일" id="filename" class="form-control">
				</td>
			</tr>
			
			<!-- 비밀글 설정 유무------------------- -->
			<tr>
	    	   <td>
    				<c:if test="${secret=='N'}">
			 			<input type="radio" name="secret" id="secret" value="N" class="radio" readonly checked/><span for="secret">비공개</span>&nbsp;	
    				</c:if>
    				
    				<c:if test="${secret=='Y'}">
    					<input type="radio" name="secret" id="secret" value="Y" class="radio"/><span for="secret">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
			 			<input type="radio" name="secret" id="secret" value="N" class="radio"/><span for="secret">비공개</span>&nbsp;	
    				</c:if>
				</td>	
		    </tr>
			
			<tr>
				<td>
					<button type="submit" id="btnWrite" class="btn btn-success">글쓰기</button>
					<button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<c:import url="/foot" />

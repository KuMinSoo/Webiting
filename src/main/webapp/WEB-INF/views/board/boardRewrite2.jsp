<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<script>
	$(function() {
		$('#bf').submit(function() {
			if ($('#name').val() == '') {
				alert("이름을 입력하세요");
				$('#name').focus();
				return false;
			}
			if ($('#subject').val() == '') {
				alert('제목을 입력하세요');
				$('#subject').focus();
				return false;
			}
			if ($('#content').val() == '') {
				alert('글내용을 입력하세요').$('#content').focus();
				return false;
			}
			if ($('#bpwd').val() == '') {
				alert('비밀번호를 입력하세요').$('#bpwd').focus();
				return false;
			}
			if($("input[name=secret]:radio:checked").length < 1){
				alert("공개글 여부를 체크하세요");	
				return false;
			} 
			
			
			return true;
			$(".select_code option").not(":selected").attr("disabled", "")
		})

	})//$()end-----------------
</script>
<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<h1 class='text-center'>답변 작성하기</h1>
	<form name="bf" id="bf" role="form" action="write" method="POST"
		enctype="multipart/form-data">
		<input type="hidden" name="mode" value="rewrite">
		<input type="hidden" name="num" value="<c:out value='${num}'/>">
		<!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->
		<table class="table">
				<tr>
					<td style="width: 50%"> <c:if
							test="${bcg_code ne null or not empty bcg_code}">
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
						</c:if></td>
					<td style="width: 50%"></td>
				</tr>
				<tr>
					<td style="width: 50%"><input type="text" name="name"
						id="name" placeholder="이름" class="form-control"></td>
					<td style="width: 50%"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="subject" id="subject"
						placeholder="제목" class="form-control" value="${subject}"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="content" id="content"
							placeholder="문의내용" rows="10" cols="50" class="form-control"></textarea>

					</td>


				</tr>

				<tr>
					<td style="width: 50%"><input type="password" name="passwd"
						id="bpwd" placeholder="비밀번호" class="form-control"></td>
					<td style="width: 50%"></td>
				</tr>
				<tr>
					<td style="width: 50%"><input type="file" name="mfilename"
						placeholder="첨부파일" id="filename" class="form-control"></td>
					<td style="width: 50%"></td>
				</tr>
				 <tr>
      				<td colspan="2">
    					<input type="radio" name="secret" id="secret" value="Y" class="radio" /><span for="secret">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
  			 			 <input type="radio" name="secret" id="secret" value="N" class="radio" /><span for="secret">비공개</span>&nbsp;
					</td>	
  			    </tr>
				
				<tr>
					<td colspan="2">
						<button type="submit" id="btnWrite" class="btn btn-success">글쓰기</button>
						<button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
					</td>
				</tr>
		</table>

	</form>
</div>
<c:import url="/foot" />

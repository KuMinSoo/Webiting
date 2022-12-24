<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			return true;
			$(".select_code option").not(":selected").attr("disabled", "")

		})

	})//$()end-----------------
</script>
<style>
	

</style>
<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<input type="hidden" name="mode" value="write">
		<!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->
		<table class="table">
			<c:if test="${board eq null}">
				<div class="alert alert-danger my-5 text-center">
					<h4>존재 하지 않는 글입니다.</h4>
				</div>
			</c:if>
			<c:if test="${board ne null}">
				<tr>
					<td style="width: 50%"><c:if
							test="${board.bcg_code eq null or empty board.bcg_code}">
							<select class="select_code" name="bcg_code" style="padding: 6px;" disabled>
								<option value=""  selected>:::문의 유형:::</option>
							</select>
						</c:if> <c:if
							test="${board.bcg_code ne null or not empty board.bcg_code}">
							<select class="select_code" disabled name="bcg_code"
								style="padding: 6px;">
								<option value="">:::문의 유형:::</option>
								<option value="1"
									<c:if test="${board.bcg_code==1}">selected</c:if>>회원정보
									문의</option>
								<option value="2"
									<c:if test="${board.bcg_code==2}">selected</c:if>>주문/결제
									문의</option>
								<option value="3"
									<c:if test="${board.bcg_code==3}">selected</c:if>>취소/환불
									문의</option>
								<option value="4"
									<c:if test="${board.bcg_code==4}">selected</c:if>>배송관련
									문의</option>
								<option value="5"
									<c:if test="${board.bcg_code==5}">selected</c:if>>시스템
									오류 제보</option>
								<option value="6"
									<c:if test="${board.bcg_code==6}">selected</c:if>>기타문의</option>
							</select>
						</c:if></td>
					<td style="width: 50%"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3">
						<c:out value="${board.subject}"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<small>
					<c:out value="${board.name}"/>&emsp;
					<c:out value="${board.wdate}"/>&emsp;
					조회수:&nbsp;<c:out value="${board.readnum}"/>&emsp;
					</small>
					</td>
				</tr>
				<tr>
					<td colspan="3"><c:out value="${board.content}"/>
				
				</tr>
				<tr>
					<td width="20%">첨부파일</td>
					<td colspan="2">
					<c:if test="${board.filename ne null}">
						<a href="#" onclick="down()">${board.originFilename}</a>
						<small>[<c:out value="${board.filesize}"/>bytes]</small>	
					</c:if>	
					</td>
				</tr>
				<tr>
				<!-- 편집 또는 삭제 -->
					<td colspan="2">			
						<button type="button" onclick="location.href='../list'">글목록</button>
						<button type="button" onclick="location.href='../write'">글쓰기</button>
						<button type="button" onclick="go(1)">수정</button>
						<button type="button" onclick="go(2)">삭제</button>
						<button type="button" onclick="go(3)">답변</button>
						
					</td>
				</tr>
			</c:if>
		</table>
	<form name="frm" id="frm">
		<input type="hidden" name="num" value="<c:out value="${board.num}"/>">
		<input type="hidden" name="mode">
		<div class="row mt-4" id="divPasswd" style="display:none">
			<div class="col-md-3 offset-md-1 text-right mr-2">
				<label for="passwd">글 비밀번호</label>
			</div>
			<div class="col-md-4">
				<input type="password" name="passwd" id="passwd"
				 class="form-control" placeholder="Password" required>
			</div>
			<div class="col-md-3">
				<button id="btn" class="btn btn-outline-primary"></button>
			</div>
		</div>	
	</form>
		<!-- 파일 다운로드를 위한 form------------------------------------ -->
	<form name="fileF" id="fileF" method="POST" action="../../fileDown">
		<input type="hidden" name="fname" value="<c:out value="${board.filename}"/>">
		<input type="hidden" name="origin_fname" value="<c:out value="${board.originFilename}"/>">
	</form>	
	<!-- ---답변달기 form시작------------------------------------------------ -->
	<form name="reF" id="reF" action="../rewrite" method="post">
		<!-- hidden으로 부모글의 글번호(num)와 제목(subject)를 넘기자 -->
		<input type="hidden" name="num" value="<c:out value="${board.num}"/>">
		<input type="hidden" name="subject" value="<c:out value="${board.subject}"/>">
	</form>
</div>
<script>
//답변글쓰기로 가기
function goRe(){
	reF.submit();
}

//파일 다운로드 처리
function down(){
	fileF.submit();		
}
function go(flag){
	if(flag==1){
		frm.mode.value='edit';
		$('#btn').text('글수정');
		$('#passwd').focus();
		frm.action='../edit';
		frm.method='post';
	}else if(flag==2){
		frm.mode.value='delete';
		$('#btn').text('글삭제');
		$('#passwd').focus();
		frm.action='../delete';
		frm.method='post';
	} 
	$('#divPasswd').show(1000);
	if(flag==3){
		reF.submit();
	}
}
	
</script>
<c:import url="/foot" />

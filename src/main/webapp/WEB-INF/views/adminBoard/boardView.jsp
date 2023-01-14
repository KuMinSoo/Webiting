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

			return true;
			$(".select_code option").not(":selected").attr("disabled", "")

		})

	})//$()end-----------------
</script>
<style>
	table{
		table-layout:fixed;
		word-break:break-all;
	}
	#content{
		height:300px;
		overflow:auto;
	}
	#notice{
		width:30px;
		height:17px;
	}
	.btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }

    .btn:hover {
        text-decoration: underline;
    }
</style>
<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<input type="hidden" name="mode" value="write">
		<!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->
		<br>
		<h1 style="color:red;">게시글보기</h1>
		<br>
		<table class="table">
			<c:if test="${board eq null}">
				<div class="alert alert-danger my-5 text-center">
					<h4>존재 하지 않는 글입니다.</h4>
				</div>
			</c:if>
			<c:if test="${board ne null}">
				<tr>
					<td>
					  <c:if test="${board.bcg_code eq null or empty board.bcg_code}">
						<select class="select_code" name="bcg_code" style="padding: 6px;" disabled>
							<option value=""  selected>:::문의 유형:::</option>
						</select>
					  </c:if> 
					  <c:if test="${board.bcg_code ne null or not empty board.bcg_code}">
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
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
							<c:if test="${board.adminSunbun > 0}"><img id="notice" src="../../resources/images/notice.jpg"></c:if>
						<c:out value="${board.subject}"/>
					</td>
				</tr>
				<tr>
					<td>
						<small>
								<c:out value="${board.name}"/>&emsp;
								<c:out value="${board.wdate}"/>&emsp;
								조회수:&nbsp;<c:out value="${board.readnum}"/>
						</small>
					</td>
				</tr>
				<tr id="content">
					<td>
						<c:out value="${board.content}"/>
					</td>	
				</tr>
				
				<c:if test="${board.filename ne null}">
					<tr>
					   <td>첨부파일:&nbsp;
						  <a href="#" onclick="down()">${board.originFilename}</a>
						  <small>[<c:out value="${board.filesize}"/>bytes]</small>					
						</td>
					</tr>
				</c:if>	
				
				<tr>
					<td>
				<!-- 편집, 삭제, 답변, 글쓰기, 글목록 버튼------- -->
						<button class="btn" type="button" onclick="location.href='../list'">글목록</button>
						<button class="btn" type="button" onclick="location.href='../write'">글쓰기</button>
						<button class="btn" type="button" onclick="admin('reply')">답변</button>
						<button class="btn" type="button" onclick="admin('delete')">삭제</button>	
						<%-- 관리자 로그인 될 경우만.... <c:if test="${loginUser.status eq '9' and (board.lev > 0 or board.adminSunbun > 0)}"> --%>
						<!-- 관리자 로그인 아직 완료 안될 경우는 아래의 조건으로... -->
						<c:if test="${board.lev > 0 or board.adminSunbun > 0}">	
							<button type="button" onclick="admin('edit')">수정</button>			
						</c:if>	
					</td>
				</tr>
			</c:if>
		</table>
		<!-- 파일 다운로드를 위한 form------------------------------------ -->
	<form name="fileF" id="fileF" method="POST" action="../../fileDown">
		<input type="hidden" name="fname" value="<c:out value="${board.filename}"/>">
		<input type="hidden" name="origin_fname" value="<c:out value="${board.originFilename}"/>">
	</form>	
	<!-- 수정, 삭제 ----------------------------------------------------- -->
	<form name="frm" id="frm">
		<input type="hidden" name="num" value="<c:out value="${board.num}"/>">
		<input type="hidden" name="mode">
	</form>
	
	<!-- ---답변달기 form시작------------------------------------------------ -->
	<form name="reF" id="reF" action="../rewrite" method="post">
		<!-- hidden으로 부모글의 글번호(num)와 제목(subject)를 넘기자 -->
		<input type="hidden" name="num" value="<c:out value="${board.num}"/>">
		<input type="hidden" name="subject" value="<c:out value="${board.subject}"/>">
		<input type="hidden" name="bcg_code" value="<c:out value="${board.bcg_code}"/>">
		<input type="hidden" name="secret" value="<c:out value="${board.secret}"/>">
	</form>
</div>
<script>

//관리자 삭제 수정 함수
function admin(admin){
		if(admin=='delete'){
			let result=confirm("해당 글을 삭제하시겠습니다?")
			if(result==true){
				frm.mode.value='delete';
				frm.action='../delete';
				frm.method='post';
				frm.submit();
			}else{
				alert("취소를 눌렀습니다")
			}	
		}else if(admin=='reply'){
			reF.submit();
		}else if(admin=='edit'){
			frm.mode.value='edit';
			frm.action='../boardEdit';
			frm.method='post';
			frm.submit();
		}
	}

//파일 다운로드 처리 함수
function down(){
		fileF.submit();		
	}
	
</script>
<c:import url="/foot" />

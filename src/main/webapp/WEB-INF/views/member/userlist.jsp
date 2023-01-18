<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<style>
	.txt0{
		color:gray;
	}
	.txt-1{
		color:blue;
	}
	.txt-2{
		color:tomato;
	}
</style>

<script>
	function check(){
		if(!searchF.findType.value){
			alert('검색 유형을 선택하세요');
			return false;
		}
		if(!searchF.findKeyword.value){
			alert('검색어를 입력하세요');
			searchF.findKeyword.focus();
			return false;
		}
		return true;
	}
	
	function userDel(vidx, vuserid){
		$('#idx').val(vidx);
		$('#userid').val(vuserid);
		var delTF = confirm($('#userid').val()+"님을 삭제하시겠습니까?");
		if(delTF){
			$('#frm').prop('action','userDel');
			$('#frm').submit();
		}
		return false;
	}
	function userEdit(vidx){
		$('#idx').val(vidx);
		$('#frm').prop('action','userEdit');
		$('#frm').submit();
	}
</script>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>
<div> 
	<p>
	<button class="btn btn-outline-danger" onclick="location.href='${myctx}/admin/prodForm'">
	상품 등록</button>
	<button class="btn btn-outline-danger" onclick="location.href='${myctx}/admin/list'">
	관리자 게시판</button>
	<button class="btn btn-outline-danger" onclick="location.href='${myctx}/admin/ditchList'">
	폐가구 신청 현황</button>
	<button class="btn btn-outline-danger" onclick="location.href='${myctx}/AorderedList'">
	배송관리</button>
	<button class="btn btn-outline-danger" onclick="location.href='${myctx}/orderedCancel'">
	결제취소 관리</button>
	</p>
</div> 

<div class="container mt-3" style="height: 1100px; overflow: auto;">
	<h1 class="text-center">Users [Admin Page]</h1>
	<c:if test="${paging.findType ne null and paging.findType ne ''}">
		<h3 class="text-center text-secondary">[<c:out value="${paging.findKeyword }"/>] 검색 결과</h3>
	</c:if>
	<!-- 검색 폼 시작 ----------------------------------- -->
	
	<div class="row py-3">
		<div class="col-md-9 text-center">
			<form name="searchF" action="userList" onsubmit="return check()">
				<!-- hidden data ----------------------------------------- -->
				<input type="hidden" name="pageSize" value="${pageSize }">
				<input type="hidden" name="cpage" value="${paging.cpage }">
				<!-- ----------------------------------------------------- -->
				<select name="findType" style="padding:6px;">
					<option value="">:::검색 유형:::</option>
					<option value="1" <c:if test="${paging.findType eq 1 }">selected</c:if> >아이디</option>
					<option value="2" <c:if test="${paging.findType eq 2 }">selected</c:if> >이름</option>
				</select>
				<input type="text" name="findKeyword" placeholder="검색어를 입력하세요" 
				autofocus="autofocus" style="width:50%; padding:5px;">
				<button class="btn btn-outline-primary">검  색</button>
			</form>
		</div>
		<div class="col-md-3 text-right">
			<form name="pageSizeF" action="list">
				<input type="hidden" name="findType" value="${paging.findType }">
				<input type="hidden" name="findKeyword" value="${paging.findKeyword }">
				<input type="hidden" name="cpage" value="${paging.cpage }">
			</form>
		</div>
	</div>
	<!-- --------------------------------------------- -->
	<div>
		<%-- ${userArr} --%>
		<table class="table table-bordered mt-3">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>연령대</th>
					<th>성별</th>
					<th>회원상태</th>
					<th>수정 | 삭제</th>
				</tr>
			</thead>
			<c:if test="${userArr eq null or empty userArr}">
				<tr>
					<td colspan="3"><b>데이터가 없습니다.</b></td>
				</tr>
			</c:if>
			<c:if test="${userArr ne null and not empty userArr}">
				<c:forEach var="user" items="${userArr}">
					<tr>
						<td>${user.idx}</td>
						<td>${user.name}</td>
						<td>${user.userid}</td>
						<td>${user.allHp}</td>
						<td>${user.email}</td>
						<td>${user.age}</td>
						<td>${user.gender}</td>
						<td>${user.status}</td>
						<%-- <td class="txt${user.status}">${user.statusStr}</td> --%>
						<td>
							<a href="javascript:userEdit('${user.idx}')">수정</a> | 
							<a href="#" onclick="userDel('${user.idx}', '${user.userid}')">삭제</a>
						</td>
					</tr>
			</c:forEach>
			</c:if>
			<!-- ============================= -->
			<tfoot>
				<tr>
					<td colspan="6" class="text-center">
						${pageNavi}
					</td>
					<td colspan="3">
						총 회원 수 : <b><c:out value="${paging.totalCount}"/></b><br>
						<span class="text-danger"><c:out value="${paging.cpage}"/></span> 
						/ <c:out value="${paging.pageCount}"/>
					</td>
				</tr>
		</tfoot>
		</table>
	</div>
</div>

<form name="frm" id="frm" method="post">
	<input type="hidden" name="idx" id="idx">
	<input type="hidden" name="userid" id="userid">
</form>

<c:import url="/foot" />
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

<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center">Users [Admin Page]</h1>
	<div>
		<%-- ${userArr} --%>
		<table class="table table-bordered mt-3">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>연락처</th>
				<th>회원상태</th>
				<th>수정 | 삭제</th>
			</tr>
			<!-- ============================= -->
			<c:forEach var="user" items="${userArr}">
				<tr>
					<td>${user.idx}</td>
					<td>${user.name}</td>
					<td>${user.userid}</td>
					<td>${user.allHp}</td>
					<td class="txt${user.status}">${user.statusStr}</td>
					<td>
						<a href="javascript:userEdit('${user.idx}')">수정</a> | 
						<a href="#" onclick="userDel('${user.idx}', '${user.userid}')">삭제</a>
					</td>
				</tr>
			</c:forEach>
			<!-- ============================= -->
			<tfoot>
				<tr>
					<td colspan="4" class="text-center">
						${pageNavi}
					</td>
					<td colspan="2">
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
<script>
	function userDel(vidx, vuserid){
		$('#idx').val(vidx);
		$('#userid').val(vuserid);
		var delTF = confirm($('#userid').val()+"님을 삭제하시겠습니까?");
		if(delTF){
			$('#frm').prop('action','userDel');
			$('#frm').submit();
			alert("삭제되었습니다.");
		}
		return false;
	}
	function userEdit(vidx){
		$('#idx').val(vidx);
		$('#frm').prop('action','userEdit');
		$('#frm').submit();
	}
</script>

<c:import url="/foot" />
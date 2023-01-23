<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/top"/>
<c:import url="/adminNavi"/>

<script type="text/javascript" src="../../js/userCheck.js"></script>

<div class="container mt-4" style="overflow: auto ;position:relative;height:1100px">
	<br>
	<h1 class="text-center mt-1">Member Edit</h1>
	<form name="mf" action="edit" method="post">
	<!-- hidden data -------------------------------------- -->
	<input type="hidden" name="id_flag" id="id_flag" value="Y">
	<input type="hidden" name="idx" id="idx" value="${user.idx}">
	<!-- -------------------------------------------------- -->
		<table class="table">
			<tr>
				<td width="20%" class="m1"><b>이름</b></td>
				<td width="80%" class="m2">
					<input type="text" name="name" id="name" placeholder="Name"
					value="<c:out value="${user.name}"/>">
					<br><span class="ck1">*이름은 한글만 가능해요</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>아이디</b></td>
				<td width="80%" class="m2">
					<input type="text" name="userid" id="userid" 
					onkeyup="ajax_idcheck(this.value)" placeholder="User ID"
					value="<c:out value="${user.userid}"/>">
					<button type="button" onclick="ajax_idcheck()" class="btn btn-success">아이디 중복 체크</button>
					<br><span class="ck1" id="id_result">*아이디는 영문자, 숫자, _, ! 만 사용 가능해요</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>비밀번호</b></td>
				<td width="80%" class="m2">
					<input type="password" name="pwd" id="pwd" placeholder="Password"
					value="<c:out value="${user.pwd}"/>">
					<br><span class="ck1">*비밀번호는 문자, 숫자, !, ., 를 포함해서 4~8자리 이내</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>비밀번호 확인</b></td>
				<td width="80%" class="m2">
					<input type="password" name="pwd2" id="pwd2" placeholder="Re Password"
					value="<c:out value="${user.pwd}"/>">
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>연락처</b></td>
				<td width="80%" class="m2">
					<input type="text" name="hp1" id="hp1" placeholder="HP1" maxlength="3" value="<c:out value="${user.hp1}"/>">-
					<input type="text" name="hp2" id="hp2" placeholder="HP2" maxlength="4" value="<c:out value="${user.hp2}"/>">-
					<input type="text" name="hp3" id="hp3" placeholder="HP3" maxlength="4" value="<c:out value="${user.hp3}"/>">
					<br><span class="ck1">*앞자리(010|011)중에 하나-(숫자3~4자리)-(숫자4자리) 가능해요</span>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>우편번호</b></td>
				<td width="80%" class="m2">
					<input type="text" name="post" id="post" placeholder="Post" maxlength="5"
					value="<c:out value="${user.post}"/>">
					<button type="button" class="btn btn-success">우편번호 찾기</button>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>주소</b></td>
				<td width="80%" class="m2">
					<input type="text" name="addr1" id="addr1" placeholder="Address1"
					value="<c:out value="${user.addr1}"/>"><br>
					<input type="text" name="addr2" id="addr2" placeholder="Address2"
					value="<c:out value="${user.addr2}"/>">
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>이메일</b></td>
				<td width="80%" class="m2"><input type="text" name="email" value="<c:out value="${user.email}"/>"
					id="email" placeholder="Email"><br> <span class='ck1'>카카오계정과
						동일하게 입력해주세요</span></td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>성별</b></td>
				<td width="80%" class="m2">
					<input type="radio" name="gender" id="gender" value="male" <c:if test="${user.gender=='male'}">checked</c:if> >남자
					<input type="radio" name="gender" id="gender" value="female" <c:if test="${user.gender=='female'}">checked</c:if>>여자
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>연령대</b></td>
				<td width="80%" class="m2">
					<select id="age" name="age">
						<option value="10" <c:if test="${user.age>9 && user.age<20}">selected</c:if>>10대</option>
						<option value="20" <c:if test="${user.age>19 && user.age<30}">selected</c:if>>20대</option>
						<option value="30" <c:if test="${user.age>29 && user.age<40}">selected</c:if>>30대</option>
						<option value="40" <c:if test="${user.age>39 && user.age<50}">selected</c:if>>40대</option>
						<option value="50" <c:if test="${user.age>49 && user.age<60}">selected</c:if>>50대</option>
						<option value="60" <c:if test="${user.age>59 && user.age<70}">selected</c:if>>60대</option>
						<option value="70" <c:if test="${user.age>69 && user.age<80}">selected</c:if>>70대</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>마일리지</b></td>
				<td width="80%" class="m2">
					<input type="text" name="mileage" id="mileage" placeholder="Mileage"
					value="<c:out value="${user.mileage}"/>">
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>회원상태</b></td>
				<td width="80%" class="m2">
					<input type="text" name="status" id="status" placeholder="Status"
					value="<c:out value="${user.status}"/>">
					<br><span class="ck1">*0:일반회원, -1:정지회원, -2:탈퇴회원</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="button" onclick="edit_check()">회원수정</button>
					<button class="btn btn-danger" type="reset">다시쓰기</button>
				</td>
			</tr>			
		</table>
	</form>
</div>
<c:import url="/foot"/>
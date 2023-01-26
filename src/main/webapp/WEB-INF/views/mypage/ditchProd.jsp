<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/top"/>
<c:import url="/mypageNavi"/>
<script type="text/javascript" src="../../js/userCheck.js"></script>

<script>
function selectMid(topCode){
	//alert(upCode);
	if(topCode=='대형'){
		let str='<select name="mid_code" id="mid_code" onchange="selectBottom(this.value)">';
			str+='<option value="">::중분류::</option>';
			str+='<option value="장롱">장롱</option>';
			str+='<option value="식탁">식탁</option>';
			str+='<option value="책장">책장</option>';
			str+='<option value="침대">침대</option>';
			str+='<option value="기타">기타</option>';
		str+='</select>';
		$('.mid').html(str);
	}
	else if(topCode=='중형'){
		let str='<select name="mid_code" id="mid_code" onchange="selectBottom(this.value)">';
			str+='<option value="">::중분류::</option>';
			str+='<option value="의자">의자</option>';
			str+='<option value="테이블">중형 테이블</option>';
			str+='<option value="선반">선반</option>';
			str+='<option value="수납장">수납장</option>';
			str+='<option value="기타">기타</option>';
		str+='</select>';
		$('.mid').html(str);
	}
}//---------------------------------------------------------------
function selectBottom(value){
	if(value=='기타'){
		let str='<input type="text" id="etc" name="etc" placeholder="사이즈를 입력하세요">';
		$('.bottom').html(str);
	}
	else{
		let str='<select name="bottom_code" id="bottom_code" >';
			str+='<option value="">::소분류::</option>';
			str+='<option value="1">가로 1m, 세로 1m, 높이 2m이상</option>';
			str+='<option value="2">가로 1m, 세로 1m, 높이 1.5m이상</option>';
			str+='<option value="3">가로 0.5m, 세로 0.5m, 높이 1.5m이상</option>';
			str+='<option value="4">0.5m, 세로 0.5m, 높이 1.5m이하</option>';
		str+='</select>';
		$('.bottom').html(str);
	}
}
function check(){
	if(!$('#top_code').val()){
		alert('대분류를 선택하세요');
		$('#upCg_code').focus();
		return false;
	}
	if(!$('#mid_code').val()){
		alert('중분류를 선택하세요');
		$('#downCg_code').focus();
		return false;
	}
	mf.submit();
}//-----------------------------------------------
	
</script>
 

<div class="container" style="width:70%;height:750px;overflow:auto;">
<br><br><br>
	<h1 class="text-center mt-1">폐가구 수거 신청</h1>
	<form name="mf" action="ditchEnd" method="post">
	<!-- hidden data -------------------------------------- -->
	<input type="hidden" name="idx" id="idx" value="${loginUser.idx}">
	<!-- -------------------------------------------------- -->
		<table class="table">
			<tr>
				<td width="20%" class="m1"><b>대분류</b></td>
				<td width="80%" class="m2">
					<select name="top_code" id="top_code"
                        onchange="selectMid(this.value)">
                           <option value="">::대분류::</option>
                              <option value="대형">대형가구</option>
                              <option value="중형">중형가구</option>
                              
                     </select>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>중분류</b></td>
				<td width="80%" class="m2">
					<div class="mid"></div>
				</td>
			</tr>
			<tr>
				<td width="20%" class="m1"><b>소분류</b></td>
				<td width="80%" class="m2">
					<div class="bottom"></div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" class="m3 text-center">
					<button class="btn btn-primary" type="button" onclick="check()">신청 접수</button>
					<button class="btn btn-danger" type="reset">다시쓰기</button>
				</td>
			</tr>			
		</table>
	</form>
</div>

<c:import url="/foot"/>
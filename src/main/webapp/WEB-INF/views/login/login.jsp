<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="./js/userCheck.js"></script>
<script type="text/javascript">
function kakaoLogin() {

    $.ajax({
        url: '/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
        	//alert(res);
            location.href =res;
        }
    });

  }
function login_check(){
 	if(!lmf.userid.value){
		alert('아이디를 입력해야해요');
		lmf.userid.focus();
		return;
	}
	if(!lmf.pwd.value){
		alert('비밀번호를 입력해야해요');
		lmf.pwd.focus();
		return;
	}
		lmf.submit();
 }
 

</script>
<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center mt-5">Login Page</h1>

	<form name="lmf" action="login" method="post">
		<table class="table text-center">
			<tr>
				<td width="40%" class="m1 text-right"><b>아이디</b></td>
				<td width="60%" class="m2 text-left"><input type="text" name="userid"
					id="userid"  placeholder="Userid">
				</td>
			</tr>
			<tr>
				<td width="40%" class="m1 text-right"><b>비밀번호</b></td>
				<td width="60%" class="m2 text-left"><input type="password" name="pwd"
					id="pwd" placeholder="Password">
			</tr>
			<tr>
				<td colspan="2"><a href="#" onclick="kakaoLogin()">
					<img src="./resources/images/kakao_login_medium_narrow.png">
				</a></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-primary" type="button"
				onclick="login_check()">로그인</button></td>
			</tr>
		</table>
	</form>
		<button class="btn btn-primary" style="display: block; margin:auto;width:fit-content;" onclick="location.href='/join'">회원가입</button>
		
</div>

<c:import url="/foot" />
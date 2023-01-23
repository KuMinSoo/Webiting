<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />
<c:import url="/adminNavi" />



<script>
	$(function(){//글쓰기 유효성 검사
		$('#bf').submit(function(){
			if($('#name').val()==''){
				alert("이름을 입력하세요");
				$('#name').focus();
				return false;
			}
			if($('#subject').val()==''){
				alert('제목을 입력하세요');
				$('#subject').focus();
				return false;
			}
			if($('#content').val()==''){
				alert('글내용을 입력하세요');
				$('#content').focus();
				return false;
			}
			if($("input[name=secret]:radio:checked").length < 1){
				alert("공개글 여부를 체크하세요");	
				return false;
			} 
			return true;
			//diabled ----> disable 해제 후 form으로 해당 정보 이동할 수 있게 도와줌. 
			$(".select_code option").not(":selected").attr("disabled", "")
		
		})
	
		
	
	})//$()end-----------------
</script>

<style>
	#bpwd, #name, #filename{
		width:200px;
	}

</style>
<main>
	<section>
<div class="container mt-4" style="overflow: auto ;position:relative">

			<div class="content_main">관리자 공지사항 작성하기</div>
<div align="center" id="bbs">

	 <form name="bf" id="bf" role="form" action="write" method="POST" enctype="multipart/form-data">  
	   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
	  <input type="hidden" name="mode" value="write">
	    <table class="table"> 
	       <!-- 문의유형 선택------- -->
	       <tr>
	          <td>
	           <select name="bcg_code" style="padding:6px;">
					<option value="">:::문의 유형:::</option>
					<option value="1">회원정보 문의</option>
					<option value="2">주문/결제 문의</option>
					<option value="3">취소/환불 문의</option>
					<option value="4">배송관련 문의</option>
					<option value="5">시스템 오류 제보</option>
					<option value="6">기타문의</option>
				</select>
	          </td>
	       </tr>
	       
	       <!-- 로그인 유저가 글 작성시 해당 아이디 자동 입력 / 비회원 유저는 직접 이름 작성함-->
	       <tr>
	     	  <td>
	          	<input type="text" name="name" id="name" value="관리자" readonly class="form-control">
	          </td>
	       </tr>
	      
	      <!-- 제목--------- -->
	       <tr>
	          <td>
	          <input type="text" name="subject" id="subject" maxlength="60" placeholder="제목" class="form-control">
	          </td>
	       </tr>
	       <!-- 글내용---------------- -->       
	       <tr>
	          <td>
	          	<textarea name="content" id="content" maxlength="600" placeholder="문의내용" rows="10" cols="50" class="form-control"></textarea>
	          </td>
	       </tr>
	  
	  	 <!-- 첨부파일------------------ -->	
	      <tr>
	         <td>
	        	 <input type="file" name="mfilename" placeholder="첨부파일" id="filename" class="form-control">
	         </td>
	      </tr>
	      
	      <!-- 비밀글 설정--------------  -->
	      <tr>
	      	<td>
	    		<input type="radio" name="secret" id="secret" value="Y" class="radio" /><span for="secret">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
	  			  <input type="radio" name="secret" id="secret" value="N" class="radio" /><span for="secret">비공개</span>&nbsp;
			</td>
	      </tr>
	   	    <tr>
	         <td>
	            <button type="submit" id="btnWrite" class="btn btn-success" >글쓰기</button>
	            <button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
	         </td>
	      </tr>
	    </table>
	</form>   
	</div>    
</div>	
	</section>
</main>

<c:import url="/foot" />
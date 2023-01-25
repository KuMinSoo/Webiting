<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>
<script>
	$(function(){
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
				alert('글내용을 입력하세요').
				$('#content').focus();
				return false;
			}
			if($('#bpwd').val()==''){
				alert('비밀번호를 입력하세요').
				$('#bpwd').focus();
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
<style>
	#bpwd, #name, #filename{
		width:200px;
	}

</style>

<div align="center" id="bbs" class="col-md-8 offset-md-2">
	<br><h1 class='text-center mt-5'>게시판 작성하기</h1><br>
		 <form name="bf" id="bf" role="form" action="write" method="POST" enctype="multipart/form-data">
	   <input type="hidden" name="mode" value="write">
	   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
	    <table class="table">  
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
	       <tr>
	     	  <c:if test="${loginUser.name ne null}">
	     	  	 <td>
	          		 <input type="text" name="name" id="name" value="${loginUser.name}" class="form-control" readonly>	
	        	  </td>
	     	  </c:if>
	     	  <c:if test="${loginUser.name eq null}">
	     	  	   <td>
	          			<input type="text" name="name" id="name" maxlength="10" placeholder="이름" class="form-control">
	        	  </td>
	     	  </c:if>
	       </tr>
	       <tr>
	          <td>
	          	<input type="text" name="subject" id="subject" maxlength="60" placeholder="제목" class="form-control">
	          </td>
	       </tr>       
	       <tr>
	          <td>
	          	<textarea name="content" id="content" placeholder="문의내용" maxlength="600" rows="10" cols="50"
	                  class="form-control"></textarea>
	          </td>
	       </tr>
	      
	       <tr>
	          <td>
	         	 <input type="password" name="passwd" id="bpwd" maxlength="10" placeholder="비밀번호" width="30" class="form-control">
	          </td>
	      </tr>
	     <tr><span></span></tr>
	      <tr>
	         <td>
	         	<input type="file" name="mfilename" placeholder="첨부파일" id="filename" class="form-control">
	         </td>

	      </tr>
	      <tr>
	      	<td>
	    		<input type="radio" name="secret" id="secret" value="Y" class="radio" /><span for="secret">공개</span>&nbsp;&nbsp;&nbsp;&nbsp;
	  			  <input type="radio" name="secret" id="secret" value="N" class="radio" /><span for="secret">비공개</span>&nbsp;
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
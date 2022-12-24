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
			return true;
		
		
		})
	
		
	
	})//$()end-----------------
</script>
<div align="center" id="bbs" class="col-md-8 offset-md-2">
<h1 class='text-center'>게시판 작성하기</h1>
	 <form name="bf" id="bf" role="form" action="write" method="POST" enctype="multipart/form-data">
   <input type="hidden" name="mode" value="write">
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
      
       <tr>
          <td style="width:50%">
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
          <td style="width:50%"></td>
       </tr>
       <tr>
          <td style="width:50%">
          <input type="text" name="name" id="name" placeholder="이름" class="form-control">
          </td>
          <td style="width:50%"></td>
       </tr>
       <tr>
          <td colspan="2">
          <input type="text" name="subject" id="subject" placeholder="제목" class="form-control">
          </td>
       </tr>       
       <tr>
          <td colspan="2">
          <textarea name="content" id="content" placeholder="문의내용" rows="10" cols="50"
                  class="form-control"></textarea>
       
          </td>
         	
          
       </tr>
      
       <tr>
          <td style="width:50%">
          <input type="password" name="passwd" id="bpwd" placeholder="비밀번호" class="form-control">
          </td>
          <td style="width:50%"></td>
      </tr>
     <tr><span></span></tr>
      <tr>
         <td style="width: 50%">
         <input type="file" name="mfilename" placeholder="첨부파일"
            id="filename" class="form-control"></td>
          <td style="width:50%"></td>
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

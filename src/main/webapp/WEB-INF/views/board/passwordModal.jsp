<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- The Modal 비밀글 비밀번호 입력창 -->

<div class="modal" id="pwdModal">
  <div class="modal-dialog">
    <div class="modal-content">
	   <form name="frm">
	    <input type="hidden" name="num">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글 비밀번호</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
		
      <!-- Modal body -->
      <div class="modal-body">
      	
      	<div class="form-group">
      		<label for="pwd">비밀번호:</label>
      		<input type="password" name="passwd" id="passwd" placeholder="Password" required class="form-control">
      	</div>
       
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button class="btn btn-info">확인</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
		</form>
    </div>
  </div>
</div>
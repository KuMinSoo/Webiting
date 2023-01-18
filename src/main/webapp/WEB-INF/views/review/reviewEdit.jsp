<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/top"/>
<script>
	$(function(){
		$('#bf').submit(function(){
			if($('#revwriter').val()==''){
				alert("이름을 입력하세요");
				$('#revwriter').focus();
				return false;
			}
			if($('#rtitle').val()==''){
				alert('제목을 입력하세요');
				$('#rtitle').focus();
				return false;
			}
			if($('#content').val()==''){
				alert('글내용을 입력하세요').
				$('#content').focus();
				return false;
			}
			return true;
		})
	})
</script>
<style>
.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}
</style>
<div align="center" id="reviewWrite" class="col-md-8 offset-md-2">
<h1 class='text-center'>리뷰 수정 하기</h1>
	 <form name="bf" id="bf" role="form" action="write" method="POST" enctype="multipart/form-data">
   <input type="hidden" name="mode" value="edit">
  <input type="hidden" name="pnum_fk" value="${review.pnum_fk}">
  <input type="hidden" name="revnum" value="${review.revnum}">
   <!-- 원본글쓰기mode는 write, 답변글쓰기 mode는 rewrite로 감  -->       
    <table class="table">
      
       <tr>
          <td style="width:50%">
           <!-- <select name="bcg_code" style="padding:6px;">
			<option value="">:::문의 유형:::</option>
			<option value="1">상품</option>
			<option value="2">배송</option>
			<option value="3">반품/취소</option>
			<option value="4">교환/변경</option>
		</select> -->
		
		<select name="pavg" style="padding: 6px">
						<option value="">::평점::</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
		
          </td>
          <td style="width:50%"></td>
       </tr>
       <tr>
          <td style="width:50%">
          <input type="text" name="revwriter" value="${review.revwriter}" id="revwriter" placeholder="작성자" class="form-control">
          </td>
          <td style="width:50%"></td>
       </tr>
       <tr>
          <td colspan="2">
          <input type="text" name="rtitle" id="rtitle" placeholder="제목"  value="${review.rtitle}"  class="form-control">
          </td>
       </tr>       
       <tr>
          <td colspan="2">
          <textarea name="content" id="content" placeholder="문의내용" rows="10" cols="50" class="form-control">${review.content}
          </textarea>
       
          </td>
         	
          
       </tr>
     
      <tr>
         <td style="width: 50%">
         <input type="file" name="mfilename" placeholder="첨부파일"
            id="filename" class="form-control">
           <!--  	<div class = "star-text">평점을 선택해 주세요</div>
          		<div class="star-rating">
					<input type="radio" id="5-stars" name="star" value="5" /> <label
						for="5-stars" class="star">&#9733;</label> <input type="radio"
						id="4-stars" name="star" value="4" /> <label for="4-stars"
						class="star">&#9733;</label> <input type="radio" id="3-stars"
						name="star" value="3" /> <label for="3-stars" class="star">&#9733;</label>
					<input type="radio" id="2-stars" name="star" value="2" /> <label
						for="2-stars" class="star">&#9733;</label> <input type="radio"
						id="1-star" name="star" value="1" /> <label for="1-star"
						class="star">&#9733;</label>
					</div> -->
		</td>
				</div>
				
      </tr>
      
   	    <tr>
         <td colspan="2">
            <button type="submit" id="btnEdit" class="btn btn-success">수정하기</button>
            <button type="reset" id="btnReset" class="btn btn-warning">다시쓰기</button>
         </td>
      </tr>
      </table>
   
</form>       
</div>
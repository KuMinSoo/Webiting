<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


	<!-- admin nav ------------------------------------------- -->   
 	
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

	.title{
		text-align: center;
		vertical-align:middle;
		
	}
	.userInfo{
		 text-align:left;
		 font-size:15px;
	}
	.content_main{
		background-color:#787878;
		color:white;
		text-align:center;
		font-size:40px;
		margin:10px 0px;
		padding:10px;
		width:100%;
		border-radius:5px;
	}
	.btn-list{
		 	width: 100%;
            height: 5%;
            background-color: gray;
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
			margin:10px 0px;
	}
	.btn-list button{
			margin:10px;
	}
	
	.search div{
		maring:10px;			
	}
	#searchFilter{
		border: 1px solid gray;
		padding:20px;
		border-radius:5px;
	}
	.list-group{
		font-size:12px;	
	}
	.card-header{
		font-size:12px;
		font-weight:700;
	}

</style> 	
 	
 

<c:set var="myctx" value="${pageContext.request.contextPath}"/>

<div style="position:fixed;display:inline-block;width:9%;margin-top:7%;margin-left:2%;margin-right:5%;">
          <div class="card">
              <!--card-header : 카드 제목 부분 설정-->
              <div class="card-header">회원 및 상품</div>
              <!--list-group : 수직 목록 생성-->
              <!--list-group-flush : 카드 영역에 목록 생성-->
              <div class="list-group list-group-flush">
                  <a href="${myctx}/admin/userList" class="list-group-item list-group-item-action">회원관리</a>
                  <a href="${myctx}/admin/prodForm" class="list-group-item list-group-item-action">상품등록</a>
              </div>
          </div>
          <br>
          <div class="card bg-info">
              <div class="card-header">결제관련</div>
              <div class="list-group">
                  <a href="${myctx}/orderedList" class="list-group-item list-group-item-action">주문목록</a>
                  <a href="${myctx}/AorderedList" class="list-group-item list-group-item-action">배송관리</a>
                  <a href="${myctx}/orderedCancel" class="list-group-item list-group-item-action">취소/환불관리</a>
              </div>
          </div>
          <br>
          <div class="card bg-secondary">
              <div class="card-header">기  타</div>
              <div class="list-group">
                  <a href="${myctx}/admin/list" class="list-group-item list-group-item-action">관리자 게시판</a>
                  <a href="${myctx}/admin/ditchList" class="list-group-item list-group-item-action">폐가구 신청 현황</a>
                  <a href="#" class="list-group-item list-group-item-action">Help</a>
            </div>
        </div>
 </div>
 	    
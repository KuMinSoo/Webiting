<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script type="text/javascript" src="./resources/js/scripts.js"></script>

  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  			<!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
   		<!-- Core theme CSS (includes Bootstrap)-->
  <link href="./resources/css/styles.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script type="text/javascript" src="./resources/js/scripts.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
#Category {
    float: left;
    font-weight: bold;
    position: relative;
    
}
.menu_pan {
    width: 100%;
    background: #fff;
    position: absolute;
    left: 0;
    top:100%;
    z-index: 999;
    padding-left: 180px;
    font-size: 15px;
}
.navbar{
	position:fixed;
	z-index:1;
	width:100%;

}
</style>
<script type="text/javascript">
$(function(){
	$('#Category').mouseenter(function(){
		//alert('test');
           $('.upcate').css({ 
               display:'block'
           })
    });
	$('.upcate').mouseenter(function(){
	    $('.upcate').css({
	        display:'block'
    	});
    	$('.selectDcg').css({
	        display:'block'
    	});
	});
	$('.upcate').mouseleave(function(){
	    $('.upcate').css({
	        display:'none'
	    });
	    $('.selectDcg').css({
	        display:'none'
    	});
	});
	$('.selectDcg').mouseenter(function(){
	    $('.selectDcg').css({
	        display:'block'
    	});
    	$('.upcate').css({
	        display:'block'
    	});
	});
	$('.selectDcg').mouseleave(function(){
	    $('.selectDcg').css({
	        display:'none'
	    });
	    $('.upcate').css({
	        display:'block'
    	});
	});
	
})
function check(){
		if(!searchF.findType.value){
			alert('검색 유형을 선택하세요');
			return false;
		}
		if(!searchF.findKeyword.value){
			alert('검색어를 입력하세요');
			searchF.findKeyword.focus();
			return false;
		}
		return true;
	}


function selectDownCategoryHome(upCode){
		//alert(upCode);
		//ajax로 요청보내기. get방식으로 upCg_code를 파라미터값으로 전달하면, json으로 받아보자
		//url: getDownCategory
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
  		var context =location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

		$.ajax({
			type:'get',
			url:'../test/getDownCategoryHome?upCg_code='+upCode,
			dataType:'json',
			cache:false
		})
		.done(function(res){
			//alert(JSON.stringify(res));
			//응답 결과를 받아서 select 태그 만들어서 id가 selectDcg인 곳에 응답 html데이터를 넣기
			let str="";
			$.each(res, function(i, item){
				str+='<li class="dropdown-item-right"><a href="/prodList?downCg_code='
						+item.downCg_code+'">'+item.downCg_name+'</a></li>';
			});
			//alert(str);	
			$('.selectDcg').html(str);
			
		})
		.fail(function(err){
			alert('err');
		})
		
	}//----------------------------

</script>
    </head>


    <body>
    <c:set var="myctx" value="${pageContext.request.contextPath}"/>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/index">Webiting</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="${myctx}/admin/userList">Admin</a></li>

                        <c:if test="${loginUser eq null }">
                        <li class="nav-item">
                          <a class="nav-link" href="${myctx}/login">Login</a>
                        </li>
                     </c:if>
      
                     <c:if test="${loginUser ne null }">
                        <li class="nav-item bg-primary">
                           <a class="nav-link text-white" href="#">${loginUser.userid}님 로그인 중..</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="#" onclick="Logout()">Logout</a>
                        </li>
                     </c:if>
                     
                     <li class="nav-item"><a class="nav-link" href="${myctx}/admin/prodForm">상품등록</a></li>
                     <li class="nav-item"><a class="nav-link" href="${myctx}/prodList">상품목록</a></li>
                     <li class="nav-item"><a class="nav-link" href="${myctx}/board/list">Board List</a></li>

                     <!-- 유저만 들어오게 설정 -------------------------------------------------------------------- -->
				 	<%-- <c:if test="${loginUser ne null }">
                     	<li class="nav-item"><a class="nav-link" href="${myctx}/user/mypage">MyPage</a></li>
					</c:if> --%>
					<!-- test용 ------------------------------------------------------------------------------ -->

                     <li class="nav-item"><a class="nav-link" href="${myctx}/user/mypage/likeList">MyPage</a></li>
					 <li id="shop" class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                            		 aria-expanded="false">Shop</a>
                            	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                	<li><a class="dropdown-item" href="/prodList">All Products</a></li>
                                	<li><hr class="dropdown-divider" /></li>
									<li class="nav-item" id="Category"><a class="dropdown-item" href="#" >카테고리</a>
                     				<div class="menu_pan" > 
                     					<!-- <li><hr class="dropdown-divider" /></li> -->
	                            		<c:forEach var="up" items="${upCgList}">
                               			<li class="upcate dropdown-item"  style="display:none;"><a href="#" 
                               			onmouseover ="selectDownCategoryHome(${up.upCg_code})">
                               			${up.upCg_name}</a> </li>
										</c:forEach>
										<div class="selectDcg"></div>
                     				</div>
                     			</li>	
                            </ul>
                        </li>

                        
                        

                    </ul>
                    <!-- 검색폼 시작------------------------- -->
	
		<div class="row py-3">
			<div class="col-md-9 text-center">
				<form name="searchF" action="prodList" onsubmit="return check()">
					<input type="hidden" name="pageSize" value="${pageSize}">
					<input type="hidden" name="cpage" value="1">
					<%-- <select name="findType" style="padding:6px;">
						<option value="">:::검색유형:::</option>
						<option value="1" <c:if test="${paging.findType eq 1}">selected</c:if>>글제목</option>
						<option value="2" <c:if test="${paging.findType eq 2}">selected</c:if>>작성자</option>
						<option value="3" <c:if test="${paging.findType eq 3}">selected</c:if>>글내용</option>
					</select> --%>
					<input type="text" name="findKeyword" placeholder="검색" 
							 style="width:50%;padding:5px;">
					<button class="btn btn-outline-primary">검  색</button>
				</form>
			</div>
			<div class="col-md-3 text-right">
				<form name="pageSizeF" action="list">
					<%-- <input type="hidden" name="findType" value="${paging.findType}"> --%>
					<input type="hidden" name="findKeyword" value="${paging.findKeyword}">
					<input type="hidden" name="cpage" value="${paging.cpage}">
				</form>
			</div>
		</div>
	
	<!-- -------------------------------- -->
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
       <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Webiting</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Furniture Shopping Mall</p>
                </div>
            </div>
        </header>
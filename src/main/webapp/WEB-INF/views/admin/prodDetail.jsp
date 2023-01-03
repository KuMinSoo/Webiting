<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/dtop"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<link rel="stylesheet" href="../resources/css/detail.css" type="text/css">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
var pnum = $("#pnum").val();

$.getJSON("/admin/prodDetail/{pnum}" + pnum, function(result) {
	
	var str = '';
	
	$(result).each(function() {
		var data = this;
		
		str += makeHtmlcode_read(data);
			
	});
	
	$(".about_product").append(str);
			
});
				/* 상품 리뷰,Q&A JS */
$("#review").click(function() {
	
	var scrollPosition = $(".reviews").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#qna").click(function() {

	var scrollPosition = $(".qnas").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$("#about").click(function() {
	
	var scrollPosition = $(".about_product").offset().top;
	$("html").animate({scrollTop: scrollPosition}, 500); 
});

$(function(){

$("#pqty").on('change', function() { /* count */
	var pqty = $(this).val();
	var price = $("#price").val();
	var opt = $(".opt_select").val();
	
	
	if (pqty*price >= 30000) {
		var shipping = '무료배송';
		var finalPrice = pqty*price;
	} else {
		var shipping = 2500;
		var finalPrice = (pqty*price) + shipping;
	}
	
	var str = '';
	
	str += '<p><label>수량 : </label><span>&nbsp;' + pqty + '</span>&nbsp;&nbsp;&nbsp;';	
	
	if (opt != 'S' && opt != 'M' && opt != 'L') {
		str += '<lable></lable>';
	} else {
		str += '<label>옵션 : </label><span>&nbsp;' + opt + '</span>&nbsp;&nbsp;&nbsp;';	
	}
	
	str += '<label>배송비 : </label><span>&nbsp;' + shipping + '</span>&nbsp;&nbsp;&nbsp;';
	str	+= '<label>가격 : </label><span>&nbsp;' + price + ' 원</span></p>';
	str += '<h4><label>결제금액 : </label><span>&nbsp;' + finalPrice + ' 원</span></h4>'; 
	str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
	
	$(".selected_option").html(str);
	}); 

})
			/* --------------- 상품 이미지 JS-------------------- */


$.getJSON("/admin/prodDetail/{pimage1}/" + pimage1, function(result) {
			/* 썸네일이 여러개인 경우 가져와서 하나씩 썸네일 영역에 넣어줌 */
			var str = '';
			$(result).each(function() {
				var data = this; 
				str += makeHtmlcode(data);
			});
			$(".uploadedList").html(str);

		});
		
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
            /* 드래그인, 드래그 오버로 실행되는 어떠한 기능들을 막는 코드 */
		});
		
		$(".fileDrop").on("drop", function(event) {
            /* 파일 드롭 영역에 파일을 가져다 놓으면 업로드 후, 썸네일로 띄우게 하는 코드 */
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			var formData = new FormData();
			formData.append("file",file);

			$.ajax({
				
				type : 'post',
				url : '/ajaxtest', 
				data : formData,
				processData : false,
				contentType : false,
				dataType : 'text',
				success : function (data) {
					var str = makeHtmlcode(data);
					
					$(".uploadedList").append(str);
				}
			});
		});

		 /* 주소입력란 버튼 동작(숨김, 등장) */
		 function showAdress(className){
		 	/* 컨텐츠 동작 */
		 	/* 모두 숨기기 */
		 		$(".addressInfo_input_div").css('display', 'none');
		 	/* 컨텐츠 보이기 */
		 		$(".addressInfo_input_div_" + className).css('display', 'block');		
		 }
		
		 /* 버튼 색상 변경 */
			/* 모든 색상 동일 */
				$(".address_btn").css('backgroundColor', '#555');
			/* 지정 색상 변경 */
				$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
</script>
<title>상세 페이지</title>
</head>
<body>
                  <!-- 상품 정보 페이지  -->
   <div class="container" role = "main" style="width: 100%">
      <hr>
      <div class="header-row"><h2 class="page-header" style="text-align: center; margin-bottom: 30px;">${pcontents.pname}</h2>
         <input type="hidden" value="${pcontents.pnum}" id="pnum">
      </div>
      <hr>
      <div class="row" style="float: left; text-align: center; width:35%;">
         <img alt="pimage1" src="${myctx}/resources/product_images/${pcontents.pimage1}" width="110%"> 
      </div>
      
      <div class="row-pcontents" style="width:55%; float:right;" >
         <div class="form-group" style="text-align: center;">
            <h3 class="page-header"><span>${pcontents.pname}</span><br><small>${pcontents.pcontents}</small></h3>
         </div>
         <hr>
         <div class="price-group" style="text-align: center;">
            <label>가격 : <span> &nbsp; <fmt:formatNumber value="${pcontents.price}" type="number"/></span><span>&nbsp;원</span></label>
            <input type="hidden" value="${pcontents.price}" id="price"> 
         </div>

         <div class="form-group" style="text-align: center;">
            <label>배송비 : </label><span>&nbsp;2500원</span>
            <p>도서산간지역 배송비 5000원 / 20만원 이상 결제시 무료배송</p>
         </div>
         
         <div class="form-group" style="tesxt-align: center;">
            <label><!-- 적립금 : --> </label><span><fmt:parseNumber var="test" value="${pcontents.price / 100}" integerOnly="true"/><%--  ${test}&nbsp;원 --%></span>
         </div>
               <div class="form-horizontal" style="text-align: center;">
                  <label> 옵션 </label> 
                  <select class="form-control opt_select" name="selectedOpt">
                     <option value="S">S</option>
                     <option value="M">M</option>
                     <option value="L">L</option>
                  </select>
               </div>
            
         <div class="form-horizontal" style="text-align: center;">
            <label>구매수량</label> 
            <select class="form-control" id="pqty"> 
            <c:forEach begin="1" end="5" var="pqty"> 
               <option value="${pqty}">${pqty}</option></c:forEach> 
            </select>
         </div>   
         <div class="row">
            <div class="selected_option" style="text-align: right;"> 
            </div>
            <div style="text-align: center;">
               <button class="btn btn-default">주문하기</button>
               <button class="btn btn-default">장바구니</button>
            </div>
         </div>
         <br>
         </div>
         
         <div class="row" style="float: left; text-align: center; width:65%;">
            <img alt="pimage1" src="../resources/images/coupon.png" width="110%"> 
         </div>
      <br>
      
         <div class="addressInfo_div">
      <div class="addressInfo_button_div">
         <button class="address_btn address_btn_1">제품 상세</button>
         <button class="address_btn address_btn_2">리뷰</button>
      </div>

      <div class="addressInfo_input_div_wrap">
         <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block"></div>
            <img alt="pimage1" src = "${myctx}/resources/product_images/${pcontents.pimage2}" width = "350px;" height = "320px;">
            
            <div class = "product-info_table" style="width:55%; float:right;">
               <p class = "table-title">필수 표기 정보</p>
               <hr>
                  <table class = "product-info" width = "400px;">
                     <tbody>
                        <th>품명</th>
                        <td>우드 침대</td>
                        <th>인증 정보</th>
                        <td>해당 없음</td>
                     </tbody>               
                  </table>
            </div>
               <!-- <div class="addressInfo_input_div addressInfo_input_div_2"></div> -->
               
   <hr color='red'>
   <c:import url="/admin/prodRelated">
      <c:param name="pnum" value="${pcontents.pnum}" />
   </c:import>      
   <hr color='red'>
   
   
   
                  <!-- 후기 게시판 페이지 -->
      <div class="row reviews" style="margin-top: 100px;">
         <h4 class="page-header">Review&nbsp;&nbsp;<small>상품을 사용해보신 분들의 실제 후기입니다.</small></h4>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th>Num</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${list}" var="vo">
                  <tr>
                     <td>${vo.boardId}</td>
                     <td><a href="/board/read/${vo.boardId}">${vo.title}</a></td>
                     <td>${vo.userid}</td>
                     <td><fmt:formatDate value="${vo.regDate}" type="date"
                           pattern="yyyy-MM-dd"/></td>
                     <td>${vo.viewCnt}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>      
      </div>   
   </div>
         </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="/dtop"/>
<!DOCTYPE html>
<html>
<head>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>
<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<link rel="stylesheet" href="${myctx}/resources/css/detail.css" type="text/css">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
   /* 좋아요 버튼 클릭 실행 */
 $(document).ready(function () {   
   $(".heart").on("click", function () {
    var that = $(".heart");
   $.ajax({
   url :'heart',
    type :'POST',
    data : {'pnum':"${pcontents.pnum}"},
    dataType:'json',
    success : function(data){
       alert(data.result)
      /* that.prop('name',data); */
       if(data.result>0) {
                $('.heart').prop("src","/resources/images/heart-fill.svg");
                $('#heartCnt').html("("+data.result+")")
       } else {
                    $('.heart').prop("src","/resources/images/heart.svg");
          }
        },
    error:function(err){
       alert('error: '+err.status)
    }
      });//$.ajax()
   });//click
});//document.ready()
   


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
            <label>가격 : <span> &nbsp; <fmt:formatNumber value="${pcontents.saleprice}" type="number"/></span><span>&nbsp;원</span></label>
            <input type="hidden" value="${pcontents.saleprice}" id="saleprice"> 
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
            <br>
         <div class="row">
            <div class="selected_option" style="text-align: center;">
               <button class="btn btn-order">주문하기</button>
               <button class="btn btn-cart">장바구니</button> 
            </div>
      
         <div class = "heart-wrapper" style = "text-align: right; width:30%;">
            <button type = "button" ><img class = "heart"  id="heart" src="/resources/images/heart.svg"></button>
               <span id="heartCnt" class = "text-dark heart-rating" style = "text-decoration-line: none;">
               (${pcontents.heart})
               </span>
         </div>
            <br>
            
         </div>
            </div>
         
         <div class="row" style="float: left; text-align: center; width:65%;">
            <img alt="coupon" src="${myctx}/resources/images/coupon.png" width="110%"> 
         </div>
         <br><br>
      
         <div class="addressInfo_div">
      <div class="addressInfo_button_div">
         <button class="address_btn address_btn_1">제품 상세</button>
         <button class="address_btn address_btn_2">리뷰</button>
      </div>

      <div class="addressInfo_input_div_wrap">
         <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block"></div>
            <img alt="pimage1" src = "${myctx}/resources/product_images/${pcontents.pimage1}" width = "350px;" height = "320px;">
            
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
      <c:import url="/prodRelated">
         <c:param name="pnum" value="${pcontents.pnum}" />
      </c:import>      
   <hr color='red'>   
	 <%-- <c:import url="/reviewForm"/> --%>
      </div>   
   </div>
         </div>
</body>
</html>
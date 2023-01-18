<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<c:import url="/top"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
	$(function(){
		$('.post-wrapper').slick({
			  slidesToShow: 1,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 5000,
			  nextArrow:$('.next'),
			  prevArrow:$('.prev'),
			});
  		})
</script>
<c:if test="${toplikeprod ne null and not empty toplikeprod}">
			<!-- Home 화면 슬라이더  -->
 <div class="page-wrapper" style= "position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">Top Like Products</h1>
        <i class="fas fa-chevron-left prev"></i>  
        <i class="fas fa-chevron-right next"></i>   
        <div class="post-wrapper">
        <c:forEach var="prod" items="${toplikeprod}">
          <div class="post">
            <a href="/prodDetail?pnum=${prod.pnum}"><img src="../resources/product_images/${prod.pimage1}" class="slider-image"></a>
            <div class="post-info">
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
        </c:forEach>
          <!--  -->
        </div>
      </div>
      <!--post slider-->
    </div>
</c:if>
<c:import url="/prodRecoForm" />
    
<c:import url="/foot"/>
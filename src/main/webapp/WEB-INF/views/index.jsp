<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<c:import url="/top"/>
<div>
	<h1>테스트용</h1>
</div>
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
			<!-- Home 화면 슬라이더  -->
 <div class="page-wrapper" style= "position:relative;">
      <!--page slider -->
      <div class="post-slider">
        <h1 class="silder-title">Trending Posts</h1>
        <i class="fas fa-chevron-left prev"></i>  
        <i class="fas fa-chevron-right next"></i>   
        <div class="post-wrapper">
        
          <div class="post">
            <img src="../resources/images/MTest.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#" class="post-subject">1</a></h4>
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
          
          <div class="post">
            <img src="../resources/images/MTest2.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#">2</a></h4>
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
          
          <div class="post">
            <img src="../resources/images/MTest3.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#">3</a></h4>
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
          
          <div class="post">
            <img src="../resources/images/MTest4.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#">4</a></h4>
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
          
          <div class="post">
            <img src="../resources/images/MTest5.jpg" class="slider-image">
            <div class="post-info">
              <h4><a href="#">5</a></h4>
              <i class="far fa-user" style="height:10%;"></i>
            </div>
          </div>
        </div>
      </div>
      <!--post slider-->
    </div>
<c:import url="/foot"/>
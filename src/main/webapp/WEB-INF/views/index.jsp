<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<c:import url="/top"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<script>
   $(function(){
      $('.post-wrapper').slick({
           slidesToShow: 1,
           slidesToScroll: 1,
           autoplay: true,
           autoplaySpeed: 5000,
           nextArrow:$('.next'),
           prevArrow:$('.prev') 
           
         });
        })
</script>
<script>

   $(function(){
      
      $('.slider-2 .page-nav > div').click(function() {
          
          var $this = $(this);
          var $pagenav = $this.parent()
          var $current = $pagenav.find('.active');
          
          $current.removeClass('active');
          $this.addClass('active');
      
          var index = $this.index();
          var $슬라이더 = $this.closest('.slider-2');
          
          $슬라이더.find('.slides > div.active').removeClass('active');
          $슬라이더.find('.slides > div').eq(index).addClass('active');
          
          
      });
      
      $('.slider-2 > .side-btns > div:first-child').click(function() {
          var $this = $(this);
          var $slider = $this.closest('.slider-2');
          
          var $current = $slider.find('.page-nav > div.active');
          var $post = $current.prev();
          
          if ( $post.length == 0 ) {
              $post = $slider.find('.page-nav > div:last-child');
          }
          
          $post.click();
      });
      
      $('.slider-2 > .side-btns > div:last-child').click(function() {
          var $this = $(this);
          var $slider = $this.closest('.slider-2');
          
          var $current = $slider.find('.page-nav > div.active');
          var $post = $current.next();
          
          if ( $post.length == 0 ) {
              $post = $slider.find('.page-nav > div:first-child');
          }
          
          $post.click();
      });
      
   })
      
      </script>
<style>
body, ul, li {
    margin:0;
    padding:0;
    list-style:none;
}

.slider-2 {
    height:400px;
    position:relative;
}

.slider-2 .slides > div {
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background-position:center;
    /* 이미지를 최대한 안짤리게 한다. */
    background-size:cover;
    /* 배경 반복 금지 */
    background-repeat:no-repeat;
    opacity:0;
    transition: opacity 0.5s;
}

.slider-2 .slides > div.active {
    opacity:1;
}

@media ( max-width:700px ) {
    .slider-2 {
        height:300px;
    }
}

.slider-2 .page-nav {
    position:absolute;
    width:100%;
    text-align:center;
    bottom:0;
    left:0;
}

.slider-2 .page-nav > div {
    display:inline-block;
    width:15px;
    height:15px;
    background-color:rgba(255,255,255,0.5);
    border-radius:2px;
    cursor:pointer;
}

.slider-2 .page-nav > div.active {
    background-color:rgba(255,255,255,1);
}

.slider-2>.side-btns>div{
    position:absolute;
    top:0;
    left:0;
    width:30%;
    height:100%;
    cursor:pointer;
    z-index:10;

}

.slider-2>.side-btns>div>span:active{
    transform:translatey(-40%);
}
.slider-2>.side-btns>div:last-child{
    left:auto;
    right:0;
}

.slider-2>.side-btns>div>span{
    position:absolute;
    top:50%;
    transform:translatey(-50%);
    left:inherit;
    right:inherit;
    width:70px;
    height:70px;
    background-color:rgba(255,255,255,0.4);
    border-radius:100%;
    margin:0 10px;
}
.slider-2>.side-btns>div>span > i{
    position:absolute;
    top:50%;
    left:50%;
    font-size:3rem;
    color:rgba(0,0,0,0.4);
    transform:translateX(-70%) translateY(-50%);
}

.slider-2>.side-btns>div:last-child>span > i {
    transform:translateX(-20%) translateY(-50%);
}

</style>






<div class="slider-2" style="margin-top:100px;margin-left:100px;margin-right:100px;height:40%">
    
     <div class="side-btns">
        <div><span><i class="fas fa-caret-left"></i></span></div>
        <div><span><i class="fas fa-caret-right"></i></span></div>
    </div>
    
    <div class="slides">
        <div class="active" style="background-image:url(https://gi.esmplus.com/aesu5988/jefferson/mainban_2202.jpg);">
        <a href=""></a>
        </div>
        <div style="background-image:url(https://gi.esmplus.com/aesu5988/jefferson/mainban13.jpg);"></div>
        <div style="background-image:url(https://gi.esmplus.com/aesu5988/jefferson/mainban_2204.jpg);"></div>
        <div style="background-image:url(https://gi.esmplus.com/aesu5988/jefferson/mainban_2203.jpg);"></div>
    </div>
    
    <div class="page-nav">
        <div class="active"></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

 



<c:import url="/prodRecoForm" />

<c:import url="/foot"/>
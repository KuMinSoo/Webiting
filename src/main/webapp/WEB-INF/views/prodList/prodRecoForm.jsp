<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <head>	
  <title>title</title>	
  Bootstrap cdn 설정	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
</head>	 -->
<style>
.myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
.myform fieldset legend{
    text-align: right;
}
.myform input[type=radio]{
    display: none;
}
.myform label{
    font-size: 1.2em;
    /* color: transparent;
    text-shadow: 0 0 0 #f0f0f0; */
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    color:rgba(250, 208, 0, 0.99);
}
.myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

</style>

<!-- <!--   carousel를 구성할 영역 설정
  <div style="width:95%;height:20%">
    carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다.
    carousel는 특이하게 id를 설정해야 한다.
    <div id="carousel-example-generic" class="carousel slide" >
      carousel의 지시자
      지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다.
      <ol class="carousel-indicators">
        li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다.
        data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다.
        딱히 이 부분은 옵션별로 설정하게 없다.
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      </ol>
      실제 이미지 아이템
      class는 carousel-inner로 설정하고 role은 listbox에서 설정한다.
      <div class="carousel-inner" role="listbox">
        이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다.
        <div class="item active">
          아미지 설정-
          <img src="https://tistory2.daumcdn.net/tistory/1041549/skin/images/nowonbuntistory.png" style="width:100%">
          캡션 설정 (생략 가능)
          글자 색은 검은색
          <div class="carousel-caption" style="color:black;">
           명월 일지입니다.
          </div>
        </div>
        <div class="item">
          <img src="https://www.nowonbun.com/img/nowonbuntistory1.png" style="width:100%">
          <div class="carousel-caption" style="color:black;">
          明月開発ストーリ
          </div>
        </div>
      </div>
      왼쪽 화살표 버튼
      href는 carousel의 id를 가르킨다.
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        왼쪽 화살표
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      </a>
      오른쪽 화살표 버튼
      href는 carousel의 id를 가르킨다.
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        오른쪽 화살표
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      </a>
    </div>
  </div>
 -->
<!--   <script>
    $(function(){
      // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
      $('#carousel-example-generic').carousel({
        // 슬리아딩 자동 순환 지연 시간
        // false면 자동 순환하지 않는다.
        interval: 1000,
        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
        pause: "hover",
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: true,
        // 키보드 이벤트 설정 여부(?)
        keyboard : true
	  });
	});
  </script> -->


 



<div class="container">
<c:if test="${toplikeprod ne null and not empty toplikeprod}">
<br><br><br><br>

<hr>
<h2>TopLike</h2>
<section>
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${toplikeprod}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${loginUser ne null and not empty loginUser}">
<c:if test="${personalProdArr ne null and not empty personalProdArr}">
<hr>
<h2>${loginUser.userid}님을 위한 추천상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="prod" items="${personalProdArr}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${prod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${prod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${prod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${prod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${prod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${prod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${prod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
</c:if>

<c:if test="${echo ne null and not empty echo}">
<hr>
<h2>친환경 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${echo}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<hr>
<c:if test="${topProdBed ne null and not empty topProdBed}">
<h2>침대 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			<c:if test="${topProdBed ne null and not empty topProdBed}">
 				<c:forEach var="topprod" items="${topProdBed}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</section>
</c:if>

<c:if test="${topProdChair ne null and not empty topProdChair}">
<hr>
<h2>의자 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdChair}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdShelf ne null and not empty topProdShelf}">
<hr>
<h2>선반 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdShelf}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdSofa ne null and not empty topProdSofa}">
<hr>
<h2>쇼파 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdSofa}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdStorage ne null and not empty topProdStorage}">
<hr>
<h2>수납장 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdStorage}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
<c:if test="${topProdTable ne null and not empty topProdTable}">
<hr>
<h2>테이블 인기 추천 상품</h2>
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="prodBox">
			
 				<c:forEach var="topprod" items="${topProdTable}">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top"
								src="../resources/product_images/${topprod.pimage1}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center myform">
									<!-- Product name-->
									<h5 class="fw-bolder" id="test1">${topprod.pname}</h5>
									<!-- Product price-->
									<fmt:formatNumber value="${topprod.saleprice}" pattern="#,###원" />
									
									<br>
							  <fieldset>
                              <input type="radio" name="reviewStar" value="5" id="rate1">
                              <label for="rate1">★</label> 
                              <input type="radio" name="reviewStar"value="4" id="rate2">
                              <label for="rate2">★</label> 
                              <input type="radio" name="reviewStar" value="3" id="rate3">
                              <label for="rate3">★</label> <input type="radio" name="reviewStar"
                                 value="2" id="rate4"><label for="rate4">★</label> <input
                                 type="radio" name="reviewStar" value="1" id="rate5"><label
                                 for="rate5">★</label>
                           </fieldset>
							</div>
							</div>
							<!-- Product actions-->
							<div  class="text-center">
								<img src="../resources/images/heart-fill.svg">
								(${topprod.likeCnt})
								
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto"
										href="/prodDetail?pnum=${topprod.pnum}">prodDetail</a>
									<c:if test="${loginUser.status eq 9}">
										<a href="/admin/prodEdit?pnum=${topprod.pnum}">수정</a>|
										<a href="/admin/prodDel?pnum=${topprod.pnum}">삭제</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
</section>
</c:if>
</div>
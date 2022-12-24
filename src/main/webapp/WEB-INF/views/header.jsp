<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	
</style>
<script>
const updateCategory=function(){
	//alert(req.readyState+"/ "+req.status);
	if(req.readyState==4 && req.status==200){
		//성공적인 응답이 왔다면 ==> 응답 데이터를 받아보자
		let res=req.responseText;
		//응답유형이 text형식이면 responseText로 받고
		//		  xml 형식이면 responseXML로 받는다.
		//'#' 구분자를 기준으로 쪼개어 배열에 할당
		let tokens=res.split('#');
		let num=tokens[0];//회원번호
		if(parseInt(num)==0){//비회원인 경우
			//배달할 주소 입력 폼을 보여주자.
			$('#nonUser').show(1000);
			$('#userInfo').html("").hide(1000)
			$('#addr').val("").focus();
		}else{
			//회원인 경우 => 회원정보 보여주기
			let str=`<ul class='list-group'>
						<li class='list-group-item'>`+num+`</li>
						<li class='list-group-item'>`+tokens[1]+`</li>
						<li class='list-group-item'>`+tokens[2]+`</li>
					 </ul>
					`
			$('#userInfo').html(str).show(1000);
			$('#nonUser').hide(1000);
			$('#addr').val("")
			
			
		}
		//$('#userInfo').html("<h3 class='text-primary'>"+res+"</h3>")
	}		
	
	const cate=function(){
		$('#nonUser').hide(1000);
		$('#nonUser').hide(1000);
		$('#nonUser').hide(1000);
	} 
	
}//-----------------------
</script>
<div id="container" class="renewal home srp-sync srp-sync-brand">
	<div class="renewal-header">
		<header id="header">
			<!-- <section>
				<div class="clearFix">
					<h1>
						<a href="/" title="Coupang - 내가 잘사는 이유"
							data-log-props='{ "id": "coupang_logo" }'><img
							src="//image7.coupangcdn.com/image/coupang/common/logo_coupang_w350.png"
							width="174" height="41" alt="쿠팡로고"></a>
					</h1>
					<div class="search-form product-search clearFix">
						<form id="headerSearchForm" method="get" action="/np/search"
							data-actionurl="/np/search">
							<fieldset>
								<legend>상품검색</legend>
								<div class="header-searchForm">
									<div class="select--category">
										<a href="#" class="select--category--button"></a> <a href="#"
											class="select--category__current" id="currentCategoryText"
											data-linkcode="">All</a>
									</div>
									<select id="searchCategories" class="search_category_filter"
										data-name=""><option value="-1">전체</option>
										<option value="/np/categories/186764"
											data-category-id="186664">여성패션</option>
										<option value="/np/categories/187069"
											data-category-id="186969">남성패션</option></select> <input type="hidden"
										name="component" id="searchSelectedCategory" value="">
									<label for="headerSearchKeyword"> <input type="text"
										id="headerSearchKeyword" class="coupang-search" name="q"
										title="쿠팡 상품 검색" value=""
										data-searchad='{"channel":"", "copy":"찾고 싶은 상품을 검색해보세요!", "linkType":"", "linkContent":"", "newWindow":""}'
										placeholder="찾고 싶은 상품을 검색해보세요!" autocomplete="off"></label>
								</div>
								<input type="hidden" name="channel" value="user"> <a
									href="javascript:;" id="headerSearchBtn" class="search"
									title="검색">검색</a>
							</fieldset>
						</form>

						<ul class="icon-menus">
							<li class="my-coupang more"><a
								href="https://mc.coupang.com/ssr/desktop/order/list"
								data-log-props='{ "id": "mycoupang" }'><span
									class="my-coupang-icon">&nbsp;</span> <span
									class="my-coupang-title">마이쿠팡</span></a>
								<p class="my-coupang-menu">
									<span class="wrapper"><i class="speech-icon"></i> <a
										href="https://mc.coupang.com/ssr/desktop/order/list"
										data-log-props='{ "id": "mycoupang_1" }'>주문목록</a> <a
										href="https://mc.coupang.com/ssr/desktop/cancel-return-exchange/list"
										data-log-props='{ "id": "mycoupang_2" }'>취소/반품</a> <a
										href="//wish-web.coupang.com/wishInitView.pang"
										data-log-props='{ "id": "mycoupang_4" }'>찜 리스트</a> <a
										href="https://subscribe-order.coupang.com/manage/subs.pang"
										class="subscription-menu-a"
										data-log-props='{ "id": "mycoupang_5" }'><span
											class="subscription-menu-label">정기배송</span><span
											class="subscription-menu-warning-icon"></span></a></span>
								</p></li>
							<li class="cart more"><a
								href="//cart.coupang.com/cartView.pang"
								class="clearFix mycart-preview-module"
								data-log-props='{ "id": "cart" }'><span class="cart-icon">&nbsp;</span>
									<span class="cart-title">장바구니</span> <em id="headerCartCount"></em></a>
								<div id="mycart-preview">
									<span class="wrapper"><i class="speech-icon"></i>
										<ul class="mycart-preview-products"></ul></span>
								</div></li>
						</ul>
					</div>
				</div>
			</section> -->
			<div id="category1">
				<span><a href="javascript:;">카테고리</a></span>
					
					<ul>
						<li>
						
						</li>
					</ul>
								
					
			</div>
		</header>
	</div>
</div>
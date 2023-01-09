<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<link rel="stylesheet" href="../resources/css/mypage.css">

<c:import url="/mypageNavi"/>
<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center">상세 주문 내역</h1>
	<h3>주문 번호 : </h3>
	<hr>
	<b>주문 날짜</b> <br>
	<span>11</span><br>
	<b>주문 번호</b> <br>
	<span>11</span><br>
	<b>최종 결제금액</b> <br>
	<span>11</span><br>
	<hr>	
	<div>
		<h2>구매 제품</h2>
		<div class="goods_pay_section">
			<!-- 반복문 돌면서 출력 -->
			<div class="goods_group">
				<ul class="goods_group_list">
					<li class="goods_pay_item">
						<div class="goods_item">
							<a class="goods_thumb" href=""> <!-- 해당 상품 상세페이지로 이동 -->
								<img src="" alt="" width="90" height="90"> <!-- 상품 이미지 출력 -->
							</a>
							<div class="goods_info">
								<a class="goods" href=""> <!-- 해당 상품 상세페이지로 이동 -->
									<p class="pname">상품이름</p>
									<ul class="info"> 
										<li><span class="blind">상품금액</span> 원 | </li>  
										<li class="date"><span class="blind">상품구매날짜</span> date</li>
									</ul>
								</a>
								<br>
								<span class="state">결제상태</span>
								<p class="guide">
									상품 배송 상태나 결제 상태 설명
								</p>
							</div>
						</div>
						<!-- 판매처 정보 -->
						<div class="seller_item">
							<div>
								<span class="company">회사 이름</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- 반복문 끝 -->
		</div>
	</div>
	
</div>



<c:import url="/foot" />
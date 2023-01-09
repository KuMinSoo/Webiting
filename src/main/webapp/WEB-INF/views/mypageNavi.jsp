<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* 관리자페이지 네비 영역 */
.admin_navi_wrap{
    width: 20%;
    height: 300px;
    float:left;
    height: 100%;
}
.admin_navi_wrap li{
    display: block;
    height: 80px;
    line-height: 80px;
    text-align: center;
}
.admin_navi_wrap li a{
    display: block;
    height: 100%;
    width: 95%;
    margin: 0 auto;
    cursor: pointer;
    font-size: 30px;
    font-weight: bolder;
}
</style>
<%
   String ctx = request.getContextPath();
%>

<!-- 마이페이지 네비 -->
<div class="mypage_wrap">
	<div class="mypage_navi_wrap">
	
		<ul>
			<li>
				<a class="mypage_list_01" href="<%=ctx%>/mypage/likeList">관심 상품 목록</a>
			</li>
			<li>
				<a class="mypage_list_02" href="<%=ctx%>/mypage/userOrdered">주문 내역</a>
			</li>
		</ul>
	</div>
</div>
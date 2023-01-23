<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<%
   String ctx = request.getContextPath();
%>

<%-- <!-- 마이페이지 네비 -->
<div class="mypage_wrap">
	<div class="mypage_navi_wrap">
	
		<ul>
			<li>
				<a class="mypage_list_01" href="<%=ctx%>/mypage/likeList">관심 상품 목록</a>
			</li>
			<li>
				<a class="mypage_list_02" href="<%=ctx%>/mypage/userOrdered">주문 내역</a>
			</li>
			<li>
				<a  href="<%=ctx%>/admin/userEdit/${loginUser.idx}">회원정보수정</a>
			</li>
			<li>
				<a class="mypage_list_02" href="<%=ctx%>/mypage/ditchProdList">폐가구 수거 신청 목록</a>
			</li>
		</ul>
	</div>
</div> --%>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>

<div style="position:fixed;display:inline-block;width:13%;margin-top:7%;margin-left:2%;margin-right:5%;">
          <div class="card bg-success">
              <!--card-header : 카드 제목 부분 설정-->
              <div class="card-header">마이페이지</div>
              <!--list-group : 수직 목록 생성-->
              <!--list-group-flush : 카드 영역에 목록 생성-->
              <div class="list-group list-group-flush">
                  <a href="${myctx}/mypage/likeList" class="list-group-item list-group-item-action">관심 상품 목록</a>
                  <a href="${myctx}/mypage/userOrdered" class="list-group-item list-group-item-action">주문 내역</a>
                  <a href="${myctx}/admin/userEdit/${loginUser.idx}" class="list-group-item list-group-item-action">회원정보수정</a>
                  <a href="${myctx}/mypage/ditchProdList/mypage/ditchProdList" class="list-group-item list-group-item-action">폐가구 수거 신청 목록</a>
              </div>
          </div>
 
 </div>
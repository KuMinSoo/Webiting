<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<link rel="stylesheet" href="../resources/css/mypage.css">

<c:import url="/mypageNavi"/>

<%
   String ctx = request.getContextPath();
%>

<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center">내 주문 내역</h1>

		<table class="table text-center">
			<tr>
				<th width="30%" class="m1 text-left">주문 번호</th>
				<th width="30%" class="m2 text-left">주문 날짜</th>
				<th width="10%">현황</th>
				<th width="20%"></th>
			</tr>
			<!-- 반복문 돌면서 출력 -->
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="<%=ctx%>/mypage/userOrderedDetail">상세 주문 내역 보기</a></td> <!-- userOrderedDetail로 이동 -->
			</tr>			
		</table>
		
</div>



<c:import url="/foot" />
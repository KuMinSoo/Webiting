<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>

<%
   String ctx = request.getContextPath();
%>
<div class="container mt-5" style="height:600px;overflow: auto;">
<div id="boardHome">
	<div>
		고객센터 09:00 ~ 18:00
		<ul>
			<li>평일 : 전체 문의 상담 가능</li>
			<li>주말/공휴일 : 오늘의집 직접배송 및 이사/시공/수리 문의에 한해 전화 상담 가능</li>
		</ul>
		
		
	</div>
	<div>
		<a href="<%=ctx%>/board/write"><button id="btn1">게시판 등록</button></a>
		<a href="<%=ctx%>/board/list"><button id="btn2">게시판 리스트</button></a>
	</div>

</div>
</div>
<c:import url="/foot"/>
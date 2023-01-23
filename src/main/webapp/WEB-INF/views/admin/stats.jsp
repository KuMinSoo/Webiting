<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/top" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 통계</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<!-- 구글 차트 CDN -------------------------------------------------------------------- -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/WEB-INF/views/admin/statsScript.jsp" %>
</head>
<style>

#userList{
	display:inline-flex;
	margin-right:10px;
	width: 49%;
}

#userAge{
	display:inline-flex;
	float: right;
	width: 49%;
}

#bestList, #salesList{
	margin-left:100px;
}

h2 {
	margin:50px;
}

span {
 border-left:7.5px solid #112255;
 margin-right: 10px;
 font-size: 12px;
}




</style>
<body>

<div class="userWrap">
	<h2><span></span>회원 통계</h2>
	<div id="userList">
	<!-- 회원 성별 통계 -->
	</div>
	<div id="userAge">
	<!-- 회원 나이대 통계 -->
	</div>
</div>
<hr>
<h2><span></span>매출 통계</h2>
<div id="bestList">
<!-- 어떤 가구를 많이 팔았는지 - bar -->
</div>

<div id="salesList" style="width: 800px; height: 500px;">
<!-- 매출 통계 -->
</div>

<div id="monthList" style="width: 800px; height: 500px;">
<!-- 월별 통계 -->
</div>

</body>
</html>
<c:import url="/foot" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/top"/>


<div class="container mt-3" style="height: 600px; overflow: auto;">
	<h1 class="text-center">폐가구 수거 신청 목록</h1>
	<hr>
	
	<table width="900" align="center">
	<tr>
		<td> 회원번호</td>
		<td> 대분류 </td>
		<td> 중분류 </td>
		<td> 소분류 </td>
		<td> 신청일 </td>
		<td></td>
	</tr>
	<c:if test="${ditchList ne null and not empty ditchList}">	
		<c:forEach var="ditch" items="${ditchList}">
			<tr>
				<td>${ditch.idx}</td>
				<td>${ditch.top_code}</td>
				<td>${ditch.mid_code}</td>
				<td>
					<c:if test="${ditch.bottom_code eq 1}">
						가로 1m, 세로 1m, 높이 2m이상
					</c:if>
					<c:if test="${ditch.bottom_code eq 2}">
						가로 1m, 세로 1m, 높이 1.5m이상
					</c:if>
					<c:if test="${ditch.bottom_code eq 3}">
						가로 0.5m, 세로 0.5m, 높이 1.5m이상
					</c:if>
					<c:if test="${ditch.bottom_code eq 4}">
						0.5m, 세로 0.5m, 높이 1.5m이하
					</c:if>
				</td>
				<td>${ditch.indate}</td> 
				<td><a href="/admin/ditchDel/${ditch.dnum}">삭제</a></td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
</div>

<c:import url="/foot"/>
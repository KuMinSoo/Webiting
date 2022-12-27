<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/top" />

<script>
	$(function(){
		$('#likedelButton').submit(function(){
			
			alert('버튼 작동 중');
			return false;
		})
		return false;
	})
</script>

<link href="../../resources/css/likelist.css" type="text/css" rel="stylesheet"/>
<!-- 회원번호 hidden필드로 전달 -->
<input type="hidden" id="idx" name="idx" value="258">
<%-- <input type="hidden" id="idx" name="idx" value="${like.idx}"> --%>

<div>
	<c:if test="${likeArr eq null or empty likeArr}">
		<tr>
			<td>좋아요를 누르면 관심 상품 목록에 추가됩니다.</td>
		</tr>
	</c:if>
	<form name="ll" id="ll" action="delete" method="post">
		<ul>
			<c:if test="${likeArr ne null and not empty likeArr}">
				<c:forEach var="like" items="${likeArr}">
					<li class="likeProdli">
						<label> 
							<input type="checkbox" id="C_${like.pnum}">
						</label>
						<div class="div1">
							<a href="#" target="_blank" class="likeThumbnail">
								<img style="height:100px" src="../../resources/images/sofa.jpg" alt="">
							</a>
						</div>
						<div class="likeProdDetail">
							<div class="lindate"><c:out value="${like.lindate}"/></div>
							<a class="likeprodlink" href="#" target="_blank">${like.pname}</a>
							<div>
								<span ><strong class="lprice">${like.lprice}</strong>원</span><span></span>
							</div>
							<button class="likedelButton">
								<span class="blind">찜한상품 삭제</span>
							</button>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</form>
</div>

<c:import url="/foot" />
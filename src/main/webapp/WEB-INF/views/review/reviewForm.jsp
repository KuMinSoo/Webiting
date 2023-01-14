<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/reviewForm.css">
<!-- <script src="js/reviewAjax.js"></script>-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<c:set var="myctx" value="${rpageContext.request.contextPath}" />
<title>리뷰페이지</title>
</head>
<style>
.fn-Review_frame {
	background-color: #28a745;
	position: relative;
	bottom: 60%;
	width: 20%;
	font-size: 14px;
	line-height: 1.5;
	font-family: "Noto Sans KR", "Helvetica Neue", sans-serif;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: block;
	float: left;
	width: 60px;
	height: 60px;
	background-image: url(/resources/images/starrate.png);
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
}

.rating .ratefill {
	background-color: #ff8;
	height: 60px;
	position: absolute;
}

#fn-input {
	position: relative;
	bottom: 30px;
}

#article {
	width: 100%;
	table-layout: fixed;
	height: 50px;
	padding: 11px 12px 10px 18px;
	box-sizing: border-box;
	background-color: #555;
}

#starBtn {
	position: relative;
	right: 200px;
}

.graph {
	width: 150px;
	height: 30px;
	background-color: blue;
	border-radius: 10%;
	position: relative;
	left: 40px;
	bottom: 60px;
}

.graphContainer {
	width: 15%;
	position: relative;
	left: 40%;
	top: 70px;
}
</style>
<body>
	<%-- <h1>${starList.get(0) }</h1> --%>
	<div id="fn-Container" class="fn-Review_brand"
		style="padding-top: 10px;">
		<!-- <div id="fnTab" class="tab tab-dock">
			<ul class="tab-contents">
				<div class=fn-review>
					<div class="fn-review_article" id="article"
						style="text-align: center;">
						<section class="fn-RevContainer">
							<div class="fn-review_sort" style="text-align: left">
								<div class="fn-review_search" style="text-align: right">
									<div class="fn-review_starBtn" id="starBtn" tabindex="-1">
										<button class="fn-review_best" data-order="order-score_asc">베스트순</button>
										<button class="fn-review_newest" data-order="order-score_desc">최신순</button>
									</div>
									<input id="fn-input" type="text" placeholder="상품평을 검색 해보세요"
										maxlength="50">
								</div>
							</div>
						</section>
					</div>
				</div>
			</ul>
		</div> -->
		<!-- 별점란 -->
		<div class="fn-review_frame" id="fnReview">
			<%-- <div class="review-summary"
				style="text-align: center; position: absolute; top: 130px;">
				<div class="fn-review_title">
					<h3 class="fn-title">상품 리뷰</h3>
				</div>
				<div class="fn-review_rate1">
					<div style="text-align: center">
						<strong class="guide">별점</strong>
					</div>
					<strong style="font-size: 40px">4.6</strong>
					<div class="evalue">
						<span class="skip"><i>${review.reviewList}</i>건</span>
					</div>
					<div class="rating">
						<div class="ratefill" style="width: 300px;"></div>
						<input type="checkbox" name="rating" value="1" id="rate1"
							class="rate_radio" title="1"> <label for="rating1"></label>
						<input type="checkbox" name="rating" value="2" id="rate2"
							class="rate_radio" title="2"> <label for="rating2"></label>
						<input type="checkbox" name="rating" value="3" id="rate3"
							class="rate_radio" title="3"> <label for="rating3"></label>
						<input type="checkbox" name="rating" value="4" id="rate4"
							class="rate_radio" title="4"> <label for="rating4"></label>
						<input type="checkbox" name="rating" value="5" id="rate5"
							class="rate_radio" title="5"> <label for="rating5"></label>
					</div>
				</div>
			</div> --%>

			<!-- 별점 통계1 -->
			<div id="fn-review_rate2" class="graphContainer">
				<div class="rate5">
					<dt class="rate5">5점</dt>
					<dd>
						<span class="percent">${starList.get(4)}%</span>
					</dd>
					<div id="graph5" class="graph"></div>
				</div>
				<div class="rate4">
					<dt class="rate5">4점</dt>
					<dd>
						<span class="percent">${starList.get(3)}%</span>
					</dd>
					<div id="graph4" class="graph"></div>
				</div>

				<div class="rate3">
					<dt class="rate5">3점</dt>
					<dd>
						<span class="percent">${starList.get(2)}%</span>
					</dd>
					<div id="graph3" class="graph"></div>
				</div>

				<div class="rate2">
					<dt class="rate5">2점</dt>
					<dd>
						<span class="percent">${starList.get(1)}%</span>
					</dd>
					<div id="graph2" class="graph"></div>
				</div>

				<div class="rate1">
					<dt class="rate5">1점</dt>
					<dd>
						<span class="percent">${starList.get(0)}%</span>
					</dd>
					<div id="graph1" class="graph"></div>
				</div>
			</div>
			<!-- 별점 통계2 -->
			<div id="chart" style="width: 20%; height: 20%;">
				<!--차트가 그려질 부분-->
				<canvas class="pieChart" id="myChart">
									<div>테스트용</div>
									</canvas>
			</div>
		</div>


		<div class="container mt-3" style="height: 600px; overflow: auto;">
			<h1 class='text-center'>리뷰게시판</h1>
				<c:if test="${loginUser ne null}">
				<button type="button" id="customWrite"
				onclick="location.href='../reviewForm/write?pnum=${pcontents.pnum}'">글쓰기</button>
				</c:if>
			<div class="row py-3">
				<div>
					<form name="pageSizeF" action="list">
						<!-- hidden data -->
						<input type="hidden" name="findType" value="${paging.findType}">
						<input type="hidden" name="findType2" value="${paging.findType2}">
						<input type="hidden" name="findKeyword"
							value="${paging.findKeyword}"> <input type="hidden"
							name="rcpage" value="${paging.rcpage}">
						<!--  ------------------->
						<%-- <select name="pageSize" style="padding: 6px;" onchange="submit()">
							<option>::페이지 사이즈::</option>
							<c:forEach var="ps" begin="5" end="20" step="5">
								<option value="${ps}"
									<c:if test="${pageSize eq ps}">selected</c:if>>페이지 사이즈
									${ps}</option>
							</c:forEach>
						</select> --%>
					</form>
				</div>
			</div>

			<table class="table">
				<thead class='text-center'>
					<th style="width: 5%">번호</th>
					<th style="width: 30%">상품평</th>
					<th style="width: 10%"></th>
					<th style="width: 10%">작성자</th>
					<th style="width: 15%">작성일</th>
					<th style="width: 10%">조회수</th>
					<th style="width: 10%">평점</th>
				</thead>

				<tbody>
					<c:if test="${reviewList eq null or empty reviewList}">
						<tr>
							<td colspan="6"><b>조회된 데이터가 없습니다</b></td>
						</tr>
					</c:if>
					<c:if test="${reviewList ne null and not empty reviewList}">
						<c:forEach var="review" items="${reviewList}">
							<tr>
								<td class='text-revnum'><c:out value="${review.revnum}" />
								</td>
								<td class='text-rtitle' style="font-size: 1em"><c:out
										value="${review.rtitle}" /></td>
								<td class='text-content'>
								<c:if test="${loginUser.idx eq review.revwriter or loginUser.status eq 9}">
									<a id="customDel"
										href="../reviewForm/delete?${review.pnum_fk}">삭제</a>||
									<a id="customDel"
										href="../reviewForm/edit?${review.pnum_fk}">수정</a>
								</c:if></td>
								<td class='text-revwriter'><c:out
										value="${review.revwriter}" />현재는 회원번호</td>
								<td class='text-wdate'><c:out value="${review.wdate}" /></td>
								<td class='text-revread'><c:out value="${review.revread}" />
								</td>
								<td>
									<c:out value="${review.star}" />
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>

				<%-- <tfoot>
					<tr>
						<td colspan="6">
							<div class="col-md-10 text-left">
								<form name="searchF" action="list" onsubmit="return check()">
									<input type="hidden" name="findType2"
										value="${paging.findType2}"> <input type="hidden"
										name="cpage" value="${paging.rcpage}"> <select
										name="findType" style="padding: 6px">
										<option value="">::문의유형(전체)::</option>
										<option value="1"
											<c:if test="${paging.findType eq 1}">selected</c:if>>상품</option>
										<option value="2"
											<c:if test="${paging.findType eq 2}">selected</c:if>>배송</option>
										<option value="3"
											<c:if test="${paging.findType eq 3}">selected</c:if>>반품/취소</option>
										<option value="4"
											<c:if test="${paging.findType eq 3}">selected</c:if>>교환/변경</option>
									</select> <input type="text" name="findKeyword" placeholder="검색어를 입력하세요"
										autofocus="autofocus" style='width: 30%'>
									<button class="btn btn-outline-primary" type="button"
										onclick="location.href='../reviewForm/search'">검 색</button> 
									
									<div class="paging_c">
										<span> <a href="#this" id="paging_c1"
											data-pageType="page">${bno}</a> <a href="#this"
											id="paging_c2" data-pageType="page">${bno}</a> <a
											href="#this" id="paging_c3" data-pageType="page">${bno}</a>
										</span>

										<div class="nextBtn" style="text-align: right;">
											<tr>
												<td colspan="6" class="text-center">
													<ul class="pagination justify-content-center">
														<button class="page-item  active">
															<a class="page-link" href="">1</a>
														</button>
														<button class="page-item ">
															<a class="page-link" href="">2</a>
														</button>
														<button class="page-item ">
															<a class="page-link" href="">3</a>
														</button>
													</ul>
												</td>
											</tr>
										</div>
									</div>

								</form>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6" class="text-center">${pageNavi}</td>
					</tr>
				</tfoot> --%>

			</table>
		</div>


	</div>
</body>
</html>

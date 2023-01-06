<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top" />

<%
String ctx = request.getContextPath();
%>
<script>
//자주 질문하는 게시판 함수 설정

function hideAll(){//모든 질문 감추기
	$('.c1').hide();//주문결제
	$('.c2').hide();//배송관련
	$('.c3').hide();//취소환불
	$('.c4').hide();//반품교환
	$('.c5').hide();//로그인 회원정보
	$('.c6').hide();//기타문의	
}
function showAll(){//모든글 보여주기
	$('.c1').show();
	$('.c2').show();
	$('.c3').show();
	$('.c4').show();
	$('.c5').show();
	$('.c6').show();	
}//------------------	
function collapseHide(){//모든 질문의 답이 오픈된 경우 hide!!
	for(let i=1;i<31;i++){
		$("#collapse"+i).collapse('hide');//총 질문 30개 
	}
}

	$(function(){//버튼 클릭시 해당 관련 질문 보여줌
		
		$('#b0').click(function(){//전체 질문
			showAll();
			collapseHide()
		})//------------------	 
		
		$('#b1').click(function(){//주문결제 관련 질문	
			hideAll();
			collapseHide();
			$('.c1').show();
		})//------------------	
		
		$('#b2').click(function(){//배송관련 질문
			hideAll();			
			collapseHide();
			$('.c2').show();	
		})//------------------	
		
		$('#b3').click(function(){//취소환불 질문
			hideAll();
			collapseHide();
			$('.c3').show();
		})//------------------	
		
		$('#b4').click(function(){//반품교환 질문
			hideAll();
			collapseHide();
			$('.c4').show();
		})//------------------	
		
		$('#b5').click(function(){//로그인 회원정보 
			hideAll();
			collapseHide();
			$('.c5').show();	
		})//------------------	
		
		$('#b6').click(function(){//기타문의 질문
			hideAll();
			collapseHide();
			$('.c6').show();	
		})//------------------	
 
		
	})//------------------
	
</script>

<style>
		.panel-heading ~div{
			font-family:"Glyphicons Halflings";
			border-bottom: 2px solid #b3b3b3;
			margin-top:15px;
			padding:3px;
				
		}
		
		.panel-heading{
			margin-top:30px;
		}
	
		.panel-body{
			background-color:#ebebeb;
			margin-bottom:5px;
			padding:10px;
			border-radius:10px;
			font-size:15px;
		}	
		
		h4{ font-size:16px;}
</style>
			
<div class="container mt-5" style="height: 600px; overflow: auto;">
		<div class="container">
			고객센터 09:00 ~ 18:00
			<ul>
				<li>평일 : 전체 문의 상담 가능</li>
				<li>주말/공휴일 :직접배송 및 이사/시공/수리 문의에 한해 전화 상담 가능</li>
			</ul>
			<div>
				<button class="btn btn-outline-primary" onclick="location.href='<%=ctx%>/board/write'">게시판 등록</button>
				<button class="btn btn-outline-info" onclick="location.href='<%=ctx%>/board/list'">고객문의 게시판</button>
				<!-- 관리자 페이지로 이동 예정 -->
				
			</div>
		</div>	
			<div class="container mt-5 mb-5">
				<h5 align="center">자주 묻는 질문</h5>
					<button type="button" id="b0" class="btn btn-outline-secondary">전체</button>
					<button type="button" id="b1" class="btn btn-outline-secondary">주문결제</button>
					<button type="button" id="b2" class="btn btn-outline-secondary">배송관련</button>
					<button type="button" id="b3" class="btn btn-outline-secondary">취소/환불</button>
					<button type="button" id="b4" class="btn btn-outline-secondary">반품/교환</button>
					<button type="button" id="b5" class="btn btn-outline-secondary">로그인/회원정보</button>
					<button type="button" id="b6" class="btn btn-outline-secondary">기타문의</button>
				
				<!-- 고객문의 테마별 목록(주문결제, 배송관련, 취소/환불, 반품/교환, 로그인/회원정보, 서비스/기타 -->
				<div class="panel-group panel-info" id="accordion">	
					<!-- 주문결제------------------------------------------- -->	
					<div class="c1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse1"><img src="../resources/images/question.jpg">주문 내역은 어떻게 확인할 수 있나요?</a>
								</h4>
							</div>
							<div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body">우측 상단 프로필 사진을 클릭 후 [나의쇼핑]을 통해 확인 가능합니다</div>
							</div>
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse2"><img src="../resources/images/question.jpg">결제 방법은 어떤 것이 있나요?</a>
								</h4>
							</div>
							<div id="collapse2" class="panel-collapse collapse">
								<div class="panel-body">신용카드 및 체크카드, 무통장 입금, 휴대폰 소액결제, 네이버페이를 이용해 결제 가능합니다.</div>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse3"><img src="../resources/images/question.jpg">비회원주문 및 전화주문이 가능한가요?</a>
								</h4>
							</div>
							<div id="collapse3" class="panel-collapse collapse">
								<div class="panel-body">전화주문은 준비중에 있습니다.<br>비회원 주문은 가능하지만 일부 상품에 한해 제한되어있습니다.</div>
							</div>
						</div>
				
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse4"><img src="../resources/images/question.jpg">신용카드 무이자 할부가 되나요?</a>
								</h4>
							</div>
							<div id="collapse4" class="panel-collapse collapse">
								<div class="panel-body">각 카드사 별로 상이하며, 카드사를 통해 확인 가능합니다.</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse5"><img src="../resources/images/question.jpg">가상계좌 은행을 변경할 수 있나요?</a>
								</h4>
							</div>
							<div id="collapse5" class="panel-collapse collapse">
								<div class="panel-body">한번 발급 받은 계좌번호는 변경이 불가능합니다.<br>재주문을 통해 새로운 계좌를 발급 받으신 후 입금 부탁드립니다.</div>
							</div>
						</div>
					</div>
						
						
					<!-- 배송관련------------------------------------------------------------- -->	
					<div class="c2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse6"><img src="../resources/images/question.jpg">배송비는 얼마인가요?</a>
								</h4>
							</div>
							<div id="collapse6" class="panel-collapse collapse in">
								<div class="panel-body">상품정보 중계 및 판매 매체이며, 판매 업체 별로 배송비 정책이 상이합니다각 상품상세페이지에서 배송비를 확인하실 수 있습니다.</div>
							</div>
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse7"><img src="../resources/images/question.jpg">배송확인은 어떻게 하나요?</a>
								</h4>
							</div>
							<div id="collapse7" class="panel-collapse collapse in">
								<div class="panel-body">우측 상단 프로필의 [나의쇼핑]을 통해 배송단계를 한눈에 보실 수 있습니다.<br>또한 배송이 시작되면 카카오톡 알림톡 또는 SMS로 안내메시지가 발송됩니다.</div>
							</div>
						</div>					
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse8"><img src="../resources/images/question.jpg">배송은 얼마나 걸리나요?</a>
								</h4>
							</div>
							<div id="collapse8" class="panel-collapse collapse in">
								<div class="panel-body">
								상품 배송 기간은 배송 유형에 따라 출고 일자 차이가 있습니다.자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능하며, 배송 유형 별 기본 출고 기간은 아래와 같습니다.<br>
								∙ 일반 택배 / 화물 택배 : 결제 후 1~3 영업일 이내 출고됩니다.<br>
								∙ 업체 직접 배송 : 배송 지역에 따라 배송 일자가 상이할 수 있으므로 상품 상세 페이지에서 확인 해주세요.<br>
								※ 영업일은 주말, 공휴일을 제외한 기간입니다.<br>
								※ 제조사의 사정에 따라 출고일은 지연될 수 있는 점 양해 부탁드립니다.<br>	
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse9"><img src="../resources/images/question.jpg">여러 상품을 묶음 배송 받으려면 어떻게 해야하나요?</a>
								</h4>
							</div>
							<div id="collapse9" class="panel-collapse collapse in">
								<div class="panel-body">
								각 상품별로 배송처가 상이할 수 있기 때문에 묶음 배송은 어렵습니다.<br>
								단, 배송처가 같은 경우 배송처의 정책에 따라 가능 할 수 있습니다.
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse10"><img src="../resources/images/question.jpg">원하는 날짜로 맞춰서 배송을 받을 수 있나요?</a>
								</h4>
							</div>
							<div id="collapse10" class="panel-collapse collapse in">
								<div class="panel-body">각 배송처 정책에 따라 상이할 수 있습니다.</div>
							</div>
						</div>
					</div>	
						
					<!-- 취소환불 -------------------------------------------------------------------- -->
					<div class="c3">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse11"><img src="../resources/images/question.jpg">주문 취소는 어떻게 하나요?</a>
								</h4>
							</div>
							<div id="collapse11" class="panel-collapse collapse in">
								<div class="panel-body">
								판매처에서 주문을 확인하기 전이라면 언제든 취소하실 수 있으며, [나의 쇼핑 > 주문배송내역 조회 > 주문상세보기]에서 직접 주문취소하실 수 있습니다.<br>
								※ 이미 판매처에서 상품을 확인해 준비 중이라면, 직접 취소가 어렵습니다. 상세 페이지에 확인되는 판매자 연락처 또는 오늘의집 고객센터로 문의 부탁드립니다.
								</div>
							</div>
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse12"><img src="../resources/images/question.jpg">취소 후 환불은 언제되나요?</a>
								</h4>
							</div>
							<div id="collapse12" class="panel-collapse collapse in">
								<div class="panel-body">
								신용카드 및 체크카드의 경우 카드사에서 확인 절차를 거치는 관계로 평균 3~7일 영업일 이내 환불처리가 완료됩니다.<br>
								무통장 입금의 경우 평균 3영업일 이내 요청 하신 계좌로 환불됩니다.<br>	
								휴대폰 소액결제의 경우 평균 3영업일 이내 환불 또는 취소 처리가 완료됩니다.<br>		
								</div>
							</div>
						</div>	
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse13"><img src="../resources/images/question.jpg">여러 개의 상품을 주문했는데. 일부만 취소할 수 있나요</a>
								</h4>
							</div>
							<div id="collapse13" class="panel-collapse collapse in">
								<div class="panel-body">
								신용카드 및 체크카드 또는 무통장 입금의 경우 배송 상태에 따라 결제후 부분 취소가 가능하며,배송상태에 따른 취소 가능 여부는 아래와 같습니다.<br>
								- 입금대기 및 결제완료 단계: 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 > 주문배송내역 조회]에서 즉시취소가능합니다.<br>
								- 배송준비중: 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 > 고객센터 > 1:1 카톡 상담하기]로 취소 가능 여부 문의 부탁드립니다.<br>
								- 배송중 : 주문 취소가 불가능합니다. 수령후 반품 처리 부탁드립니다.<br>
								※ 단, 가상계좌로 입금 전이라면 부분 취소처리가 불가능하므로 재주문 부탁드립니다.<br>
								</div>
							</div>
						</div>	
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse14"><img src="../resources/images/question.jpg">주문건의 결제 금액을 나눠서 영수증 발행이 가능한가요?</a>
								</h4>
							</div>
							<div id="collapse14" class="panel-collapse collapse in">
								<div class="panel-body">주문하신 내역 중 일부 상품에 대해서만 분할로 영수증을 발급 받으실 수는 없습니다.</div>
							</div>
						</div>	
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse15"><img src="../resources/images/question.jpg">가상계좌 입금인을 다르게 적은경우 어떻게 해야하나요?</a>
								</h4>
							</div>
							<div id="collapse15" class="panel-collapse collapse in">
								<div class="panel-body">
								입금인이 달라도 가상계좌번호만 같으면 문제없습니다.
								</div>
							</div>
						</div>
						
										
					</div>
					
						
					<!-- 반품 교환--------------------------------- -->	
					<div class="c4">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse16"><img src="../resources/images/question.jpg">제품이 불량입니다. 반품 혹은 교환은 어떻게 하나요?</a>
								</h4>
							</div>
							<div id="collapse16" class="panel-collapse collapse in">
								<div class="panel-body">
								업체(브랜드)마다 발송처 및 반품절차가 다릅니다.<br>
								- 우측 상단 프로필 사진을 클릭 후 [나의쇼핑] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후 교환/반품 접수 후 진행 할수 있습니다. 교환/반품 접수 없이 임의로 반송한 경우에는 처리가 늦어질 수 있습니다.<br>
								- 교환/반품 접수 시 원활한 처리를 위해 불량 사진이 필요하오니, 가급적 사진을 첨부하여 주시기 바랍니다.<br>
								단, 구매확정 이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.<br>							
								</div>
							</div>
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse17"><img src="../resources/images/question.jpg">제품의 교환 또는 반품을 할 수 있나요?</a>
								</h4>
							</div>
							<div id="collapse17" class="panel-collapse collapse in">
								<div class="panel-body">
								상품을 수령하신 후 7일 이내에 교환, 반품이 가능하며, 고객님의 변심에 의한 교환/반품의 경우 배송비용이 부과될 수 있습니다.<br>
								※ 단, 아래의 경우 교환/반품이 불가능합니다.<br>							
								- 고객님의 책임 사유로 인해 상품 등이 멸실 또는 훼손된 경우<br>								
								- 개봉 및 포장이 훼손으로 상품가치가 현저히 상실된 경우<br>								
								- 시간 경과에 의해 재판매가 어려울정도로 상품 가치가 현저히 저하된 경우<br>								
								- 고객주문 확인 후 상품제작에 들어가는 주문 제작 상품<br>								
								- 직접 조립하는(DIY) 상품을 조립 한 경우<br>							
								</div>
							</div>
						</div>					
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse18"><img src="../resources/images/question.jpg">제품의 교환 또는 반품은 어떻게 신청할 수 있나요?</a>
								</h4>
							</div>
							<div id="collapse18" class="panel-collapse collapse in">
								<div class="panel-body">
								업체(브랜드)마다 발송처 및 반품절차가 다릅니다.								
								- 우측 상단 프로필 사진을 클릭 후 [나의쇼핑 > 주문 상세보기] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후 교환/반품 접수 후 진행 할수 있습니다.								
								교환/반품 접수 없이 임의로 반송한 경우에는 처리가 늦어질 수 있습니다.								
								- 반품을 보내실때는 제품이 훼손되지 않도록 안전하게 충분히 포장 부탁드립니다.								
								단, 구매확정 이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.							
								</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse19"><img src="../resources/images/question.jpg">반품 시, 사은품도 같이 반품해야 하나요?</a>
								</h4>
							</div>
							<div id="collapse19" class="panel-collapse collapse in">
								<div class="panel-body">사은품도 같이 동봉하여 반품해 주셔야 반품처리가 완료됩니다.</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse20"><img src="../resources/images/question.jpg">주문한 것과 다른 상품이 왔습니다. 어떻게 해야하나요?</a>
								</h4>
							</div>
							<div id="collapse20" class="panel-collapse collapse in">
								<div class="panel-body">
								고객센터를 통해 문의 주시면 확인 도움드리겠습니다.
								</div>
							</div>
						</div>
					</div>
					
					<!-- 로그인/회원정보 -------------------------------------------------------------------------------------- -->	
						
					<div class="c5">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse21"><img src="../resources/images/question.jpg">
										카카오 계정으로 로그인 하면 '이미 카카오로 가입하신 이메일입니다'라고 나오는데 어떻게 해야 하나요?
										</a>
								</h4>
							</div>
							<div id="collapse21" class="panel-collapse collapse in">
								<div class="panel-body">
								휴대전화 번호를 변경하셨거나 카카오톡 계정을 탈퇴하고 새로 가입하신 경우 이런 문제가 발생할 수 있습니다.이 경우 새로운 정보가 반영될 수 있도록 번거로우시더라도 고객센터로 문의 부탁드립니다.
								고객센터 0000-0000	 (운영 시간 : 평일 09:00~18:00) -  고객센터 > 고객문의 게시판 등록 
								</div>
							</div>
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse22"><img src="../resources/images/question.jpg">비밀번호 변경은 어떻게 하나요?</a>
								</h4>
							</div>
							<div id="collapse22" class="panel-collapse collapse in">
								<div class="panel-body">우측 상단 마이페이지를 클릭 후[회원정보수정- 비밀번호 변경] 페이지에서 비밀번호 변경이 가능합니다</div>
							</div>
						</div>					
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse23"><img src="../resources/images/question.jpg">회원탈퇴 후 재가입이 가능한가요?</a>
								</h4>
							</div>
							<div id="collapse23" class="panel-collapse collapse in">
								<div class="panel-body">재가입은 언제든지 가능합니다.</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse24"><img src="../resources/images/question.jpg">회원정보를 수정하고 싶은데 어떻게 해야하나요?</a>
								</h4>
							</div>
							<div id="collapse24" class="panel-collapse collapse in">
								<div class="panel-body">우측 상단 프로필 사진을 클릭 후 [마이페이지 > 회원정보수정] 페이지에서 회원 정보 수정이 가능합니다.</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse25"><img src="../resources/images/question.jpg">회원 탈퇴는 어떻게 하나요?</a>
								</h4>
							</div>
							<div id="collapse25" class="panel-collapse collapse in">
								<div class="panel-body">
								우측 상단 프로필 사진 클릭 후 [마이페이지 > 설정 > 회원정보수정] 상단의 탈퇴하기 버튼 클릭해주세요.								
								</div>
							</div>
						</div>
					</div>	
			
					<!-- 기타문의 ----------------------------------------------->	
					<div class="c6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse26"><img src="../resources/images/question.jpg">제품의 자세한 정보는 어떻게 알 수 있나요?</a>
								</h4>
							</div>
							<div id="collapse26" class="panel-collapse collapse in">
								<div class="panel-body">각 제품의 상세 페이지에서 확인 가능하며, 더욱 자세한 정보는 제품상세페이지 내 문의하기를 통해 판매 업체에 문의 가능합니다.</div>
							</div>
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse27"><img src="../resources/images/question.jpg">회원가입시 이미 가입된 이메일이라고 표시됩니다. 어떻게 해야하나요?</a>
								</h4>
							</div>
							<div id="collapse27" class="panel-collapse collapse in">
								<div class="panel-body">고객센터에 문의 글 부탁드립니다</div>
							</div>
						</div>					
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse28"><img src="../resources/images/question.jpg">현금영수증 발급을 다른 사람으로 하고 싶습니다.</a>
								</h4>
							</div>
							<div id="collapse28" class="panel-collapse collapse in">
								<div class="panel-body">타인의 명의로 현금영수증 발급을 원하실경우 상품 주문 시 발급 받으실 고객님의 정보(주민등록번호/현금영수증 카드번호/휴대폰번호)를 입력해주시면 됩니다</div>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse29"><img src="../resources/images/question.jpg">세금계산서를 받고 싶은데 어떻게 해야 하나요?</a>
								</h4>
							</div>
							<div id="collapse29" class="panel-collapse collapse in">
								<div class="panel-body">세금계산서 발급은 어려우며, 결제 시 지출증빙 또는 현금영수증 발행은 가능합니다.
								</div>
							</div>
						</div>	
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse30"><img src="../resources/images/question.jpg">상담방법과 상담가능시간 유선번호는 어떻게 되나요?</a>
								</h4>
							</div>
							<div id="collapse30" class="panel-collapse collapse in">
								<div class="panel-body">
								상담 시간은 평일 09:00 ~ 18:00 (주말 & 공휴일 제외)이며, 전화번호는 1670-0876 입니다.<br>
								우측 상단 프로필 사진을 클릭 후 [나의쇼핑 > 고객센터 > 1:1 카톡 상담하기] 를 이용하시면 상담원과 채팅으로 더욱 빠르고 편리하게 문의 가능합니다.<br>	
								</div>
							</div>
						</div>	
					
					</div>
				</div>			
			</div>
		</div>
	

	<c:import url="/foot" />
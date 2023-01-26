<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.footer-main {
margin:70px 0 0 0;
padding:0 0 60px 0;
font-family:'Noto Sans KR','Malgun Gothic',sans-serif;
font-size:14px;
line-height:1.4;
color:#333;
word-break:break-word;
}
.footer-main .footer-wrap{
	width:1170px;
	margin:0 auto;
}
.footer-main .footer-menu {
	position:relative;
	border-top:2px solid #f3f3f3;
	border-bottom:2px solid #f3f3f3;
}
.footer-main .footer-menu_list {
overflow:hidden;
}
ul {
list-style:none;
}
.footer-main .footer-menu_list li {
float:left;
height:40px;
margin:0 0 0 30px;
}
.footer-main .foot-cut {
	margin:34px 0 0 0;
	padding:26px;
	border-top:2px solid #f3f3f3;
	font-size:14px;
	line-height:160%;
	color:#8b8e92; 
}
</style>
		<!-- Footer--> 
        <footer class="py-5 bg-dark ">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
        	<div class = "footer-main" id = "footer">
        	<div class = "footer-wrap">
				<div class = "footer-menu">
					<ul class = "footer-menu_list">
						<li><a href = "">회사 소개</a></li>
						<li><a href = "">이용 약관</a></li>
						<li><a href = "">개인정보 처리방침</a></li>
						<li><a href = "">고객 관리실</a></li>
						<li><a href = "">입점 문의</a></li>
					</ul>
				</div> 
				
				  <div class = "company-info">
				  	<ul class = "address text-white">
				  		<li>서울시 강남구 대치동 665 (주)에코펀 대표자:웹이팅</li>
				  		<li>사업자 등록 번호: 133-81-22865 통신판매업신고: 2010-서울강남-0510</li>
				  		<li>에코펀 고객 센터 : 1688-3212 대표번호: (02)921-8832 A/S센터: as.greenfuniture.com</li>
				  		<br>
				  		<li class = "copyright">copyright© 2023 에코펀 Co.Ltd.All rights reserved</li>
				  	</ul>
				  </div>
				<div class = "foot-cut text-white">
					본사 판매 상품중 입점 브랜드 상품으로 표기된 상품의 경우, 판매자가 아닌 통신판매중개자 이므로 판매자로서 책임을 부담하지 않습니다<br>
					해당 상품, 거래 정보 및 거래에 대해서는 실제 판매자인 각 입점업체에게 책임이 있습니다
				</div>     	
        	</div>
        </div>
        </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!-- <script src="./resources/js/scripts.js"></script> -->
        
    </body>
</html>
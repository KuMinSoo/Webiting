<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>
	<section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:if test="${prodArr ne null and not empty prodArr}">
             		<c:forEach var="prod" items="${prodArr}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="../resources/product_images/${prod.pimage1}" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${prod.pname}</h5>
                                    <!-- Product price-->
                                    ${prod.price}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">prodDetail</a></div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
        </section>
	
	
	<%-- <div class="container" style="text-align:center">
		
		<div class="row">
        <div class="col-md-12">
           <h1 class="text-center m-4" style="margin:1em">::Product List [Admin Page]:::</h1>
           
           <table class="table table-striped" id="products">
              <thead>
                 <tr>
                    <th>상품번호</th>
                    <th>카테고리</th>
                    <th data-sort="string">상품명</th>
                    <th>이미지</th>
                    <th data-sort="string">가    격</th>
                    <th>수정|삭제</th>
                 </tr>
              </thead>
              <tbody>
              <!-- ------------------------ -->
              <c:if test="${prodArr eq null or empty prodArr}">
              	<tr>
              		<td colspan="6">등록된 상품이 없습니다</td>
              	</tr>
             </c:if>
             <c:if test="${prodArr ne null and not empty prodArr}">
             	<c:forEach var="prod" items="${prodArr}">
                 <tr>   
                    <td>${prod.pnum}</td>
                    <td>
                    ${prod.upCg_name}>${prod.downCg_name}
                    </td>
                    <td>${prod.pname}</td>
                    <td width="15%">
                    <a href="a" target="_blank">
                   	<img src="../resources/product_images/${prod.pimage1}"
                   	 style="width:90%;margin:auto" class="img-fluid">
                    </a>
                    </td>
                    <td>
                    <del>정  가: 
                    <fmt:formatNumber value="${prod.price}" pattern="###,###"/>
                    원</del> 
                    <br>
                    <b class="text-primary">판매가 :
                    <fmt:formatNumber value="${prod.saleprice}" pattern="###,###"/>
                    원</b><br>
                    <span class="badge badge-danger">${prod.percent} %할인</span>
                    </td>
                    <td>
                    <a href="javascript:edit('${prod.pnum}')">수정</a>|
                    <a href="#" onclick="remove('${prod.pnum}')">삭제</a>
                    </td>
                 </tr>
                 </c:forEach>
              </c:if>                   
            <!-- ------------------------ -->                 
              </tbody>
              
           </table>
        </div>
      </div>
		
	</div>
--%>
<c:import url="/foot" />
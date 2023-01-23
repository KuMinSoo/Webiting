<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/top"/>
	<section class="py-5">
			
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    <c:if test="${prodArr2 eq null or empty prodArr2}">
                    
                    <h2> 등록된상품이 없습니다.</h2>
                    </c:if>
                    <c:if test="${prodArr2 ne null and not empty prodArr2}">
                    <%-- <h1>${prodArr2.upCg_name}-${prodArr2.downCg_name}</h1> --%>
             		<c:forEach var="prod" items="${prodArr2}">
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
                                    <fmt:formatNumber value="${prod.saleprice}" pattern="#,###원" />
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
	<div style="text-align:center;">${pageNavi} 총 상품수 : <b><c:out value="${paging.totalCount}"/></b><br>
						<div class="text-danger"><c:out value="${paging.cpage}"/></div> 
						/ <c:out value="${paging.pageCount}"/></div>
<c:import url="/foot" />
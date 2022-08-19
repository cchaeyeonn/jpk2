<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ezen.dev.spring.vo.ProductVo" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link href="resources/css/style_css.css" rel="stylesheet" /> -->

<style>
   #container_inner{
	padding-top: 250px;
    min-height: 1040px;
    padding-bottom: 50px;
}


#p_list_info{
	text-align:left;
}

#p_list{
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.7s ease-in-out;   /* 부드러운 모션을 위해 추가*/

}

#p_list:hover{
	transform: scale(1.1);
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -ms-transform: scale(1.1);
  -o-transform: scale(1.1);
}

.img {
	width:249px;
	height:311px;
	overflow:hidden; /* 부모를 벗어나지 않고 내부 이미지만 확대 */
}  
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>${productVo.p_type}</title>
</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include> 
	
	
	
	            <div class="container">
                <!-- Portfolio Section Heading -->
                <div id="container_inner">
                <h2 id="p_list_title" class="page-section-heading text-center text-uppercase text-secondary mb-0">"${searchName}"에 대한 검색 결과입니다.</h2>
                <!-- Icon Divider -->
                <!-- <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div> -->
               <!--  Portfolio Grid Items -->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1 -->
                     <c:forEach items="${productList}" var="productVo">
	                    <div class="col-md-6 col-lg-4 mb-5" >
	                        
	                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-320 w-249">
	                                <div class="portfolio-item-caption-content text-center text-black"><!-- <i class="fas fa-plus fa-3x"></i> -->
	                                <a href="${pageContext.request.contextPath}/product_detail.do?pidx=${productVo.pidx}">
	                                <img id="p_list" class="img-fluid" src="${pageContext.request.contextPath}/resources/product_image/${productVo.p_system_filename}" alt="..."  /></a><p/>
	                                <div id="p_list_info">
	                                	<div style="color:#ababab; font-size:13px;">${productVo.p_delivery}</div>
		                                <div style="font-size:22px;">${productVo.p_name}</div>
		                          		<div style="font-weight:bold";><fmt:formatNumber value="${productVo.p_price}" pattern="#,###"/>원</div>
		                          		<div style="color:#ababab; font-size:12px;">${productVo.p_secondname}</div>
	                          		</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                   </c:forEach>
 
                </div> 
                </div>
            </div>
            
            
            
            <%-- <div class="container">
                <!-- Portfolio Section Heading -->
                <div id="container_inner">
                <h2 id="p_list_title" class="page-section-heading text-center text-uppercase text-secondary mb-0">이 상품 어때요?</h2>
                <!-- Icon Divider -->
                <!-- <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div> -->
               <!--  Portfolio Grid Items -->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1 -->
                     <c:forEach items="${productList}" var="productVo">
	                    <div class="col-md-6 col-lg-4 mb-5" >
	                        <a href="${pageContext.request.contextPath}/product_detail.do?pidx=${productVo.pidx}">
	                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
	                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-320 w-249">
	                                <div class="portfolio-item-caption-content text-center text-black"><!-- <i class="fas fa-plus fa-3x"></i> -->
		                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/product_image/${productVo.p_system_filename}" alt="..."  /><p/>
		                                ${productVo.p_name}<p/>
		                          		${productVo.p_price}원<p/>
	                                </div>
	                            </div>
	                        </div></a>
	                    </div>
                   	</c:forEach>
 
                </div> 
                </div>
            </div> --%>
	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>
        
        
</body>
</html>
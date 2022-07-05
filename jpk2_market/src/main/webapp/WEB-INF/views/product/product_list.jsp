<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ezen.dev.spring.vo.ProductVo" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>


            <div class="container">
                <!-- Portfolio Section Heading -->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">이 상품 어때요?</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
               <!--  Portfolio Grid Items -->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1 -->
                     <c:forEach items="${productList}" var="productVo">
                    <div class="col-md-6 col-lg-4 mb-5" >
                        <a href="/spring/product_detail.do?pidx=${productVo.pidx}">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i>
                                <img class="img-fluid" src="${pageContext.request.contextPath}/resources/product_image/${p_filename}" alt="..."  />
                                ${productVo.p_name}
                          		${productVo.p_price}
                           		${productVo.p_type}
                                </div>
                            </div>
                        </div></a>
                    </div>
                   </c:forEach>
 
                </div> 
            </div>

        
</body>
</html>
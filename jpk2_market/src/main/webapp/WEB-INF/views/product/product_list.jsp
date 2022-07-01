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

		<section class="page-section portfolio" id="portfolio">
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
                    <div class="col-md-6 col-lg-4 mb-5">
                        <a href="/spring/product.do" ><input type="hidden" values="p_name:1">
                        <div class="portfolio-item mx-auto" data-bs-toggle="model">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                                <img class="img-fluid" src="resources/img/k_cake.png" alt="..."  />
                           			 ${productVo.p_name}
                          			 ${productVo.p_price}
                           			 ${productVo.p_type}
                            </div>
                        </div></a>
                    </div>
                   </c:forEach>
                  <!-- <!--   Portfolio Item 2
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_egg.png" alt="..."  />
                        </div>
                    </div>
                   
					 Portfolio Item 3
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_tomato.png" alt="..." />
                        </div>
                    </div>
                    Portfolio Item 4
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_abocado.png" alt="..." />
                        </div>
                    </div>
                    Portfolio Item 5
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_chickenbreast.png" alt="..." />
                        </div>
                    </div>
                    Portfolio Item 6
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_yang.png" alt="..." />
                        </div>
                    </div>
              		 Portfolio Item 7
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_blueberry.png" alt="..." />
                        </div>
                    </div>
                     Portfolio Item 8
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_bondabug.png" alt="..." />
                        </div>
                    </div>
                     Portfolio Item 9
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <img class="img-fluid" src="resources/img/k_watermelon.png" alt="..." />
                        </div>
                    </div>-->
                </div> 
            </div>
        </section>
        
</body>
</html>
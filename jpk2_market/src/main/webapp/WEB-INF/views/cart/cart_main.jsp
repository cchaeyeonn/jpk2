<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>

	#cart_inner{
		min-height: 1040px;
		padding-top: 200px;
		padding-right:315px;
		padding-left:315px;
	}
	#product{
		padding-left:10%;
		padding-right:10%; 
		height:1000px; 
		padding-top:260px;
		}
	#product_img{
			float:left; 
			width:50%; 
			height:50%;
			}
	#product_detail{
			float:right; 
			width:50%; 
			height:50%;
			}
	#home_button{
			padding-left:10%; 
			padding-right:10%; 
			text-align:center; 
			float:center;
			}
</style>

</head>
<body>
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 	
    <form >
    <div id="cart_inner">
    <h2 style="text-align:center;"> 장바구니</h2>
    <input type="checkbox" id="select_btn">전체 선택() ㅣ 선택 삭제 <hr>
    
    <c:forEach items="${cartList}" var="cartVo">
    <input type="checkbox" id="target_btn">
    <!-- 사진 -->
    <img class="img-fluid" src="${pageContext.request.contextPath}/resources/product_image/ ${cartVo.p_system_filename}" alt="..."  />
    <!-- 상품명 -->
    ${cartVo.p_name}
    <!-- 수량 버튼 -->
    <button id="btn_minus">-</button><input type="number">number<button id="btn_plus">+</button>
    <!-- 금액 -->
    ${cartVo.p_price}원
    <!-- 삭제버튼 -->
    <button id="btn_delete">X</button>
    <hr>
    </c:forEach>
    </div>
    </form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
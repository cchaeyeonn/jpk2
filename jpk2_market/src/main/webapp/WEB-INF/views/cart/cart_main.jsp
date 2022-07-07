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
	#target{
	border-collapse : collapse;
	width:100%;
	height:100%;
    
	}	
	
</style>
<!-- jquery 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>
</head>
<body>
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 	
    <form >
    <div id="cart_inner">
    <h2 style="text-align:center;"> 장바구니</h2>
    <input type="checkbox" id="chk_all">전체 선택() ㅣ 선택 삭제 <hr>
    <table id="target">
    <c:forEach items="${cartList}" var="cartVo">
    <tr>
    <td>
    <input type="checkbox" class="del-chk">
    </td>
    <td>
    <!-- 사진 -->
    <img class="img-fluid" src="${pageContext.request.contextPath}/resources/product_image/ ${cartVo.p_system_filename}" alt="..."  />
    </td>
    <td>
    <!-- 상품명 -->
    ${cartVo.p_name}
    </td>
    <td>
    <!-- 수량 버튼 -->
    
    <input type="button" id="btn_minus" value="-">
    <input type="text"  id="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
    <input type="button" id="btn_plus" value="+"  >
   
    </td>
    <td>
    <!-- 금액 -->
    ${cartVo.p_price}원
    </td>
    <td>
    <!-- 삭제버튼 -->
    <button id="btn_delete">X</button>
    </td>
    </tr>
    </c:forEach>
    </table>
    </div>
    
   
    </form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
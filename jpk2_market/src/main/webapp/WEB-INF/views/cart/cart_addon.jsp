<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />

<title></title>



<!-- 외부 js에서 ${pageContext.request.contextPath}를 사용할 수 있게 세션에 값을 저장 -->
<script type="text/javascript" charset="utf-8">
   sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<!-- jquery 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>

</head>
<body>
    <form>
    <div id="cart_inner">
    <hr style="width:65%;">
    <div id="cart_1" style="float:left; width:60%; margin-right:103px;">   
    <table id="target">
    <c:forEach items="${cartList}" var="cartVo" varStatus="status">
    <tr id="${cartVo.pbidx}_product_target">
    <td>
    <!-- 사진 -->
    <div class="portfolio-item-caption d-flex2 align-items-center justify-content-center h-220 w-149">
    <img class="img-fluid2" src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}" alt="..."  />
    </div>
    </td>
    <td> 
    <!-- 상품명 -->
    ${cartVo.p_name}
    </td>
    <td>
    <!-- 금액 -->
    <span class="price"><input type="hidden" id="${cartVo.pbidx}_price" value="${cartVo.p_price}"> ${cartVo.p_price}원</span>
    </td>
    </tr>
    <tr>
    <td>
    ${cartVo.p_amount}
    </td>
    </tr>
    </c:forEach>
    </table>
    </div>
    </div>
     </form>
</body>
</html>
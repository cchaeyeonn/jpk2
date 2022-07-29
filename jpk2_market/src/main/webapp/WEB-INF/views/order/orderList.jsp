<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />

<title>주문 내역</title>



<!-- 외부 js에서 ${pageContext.request.contextPath}를 사용할 수 있게 세션에 값을 저장 -->
<script type="text/javascript" charset="utf-8">
   sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<!-- jquery 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>

</head>
<body>
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include>
 
    <form>
    
    <div id="cart_inner">
    <h2 style="text-align:center;">주문 내역</h2>
    <hr>
    <div id="cart_1" style="float:left; margin-right:103px;">   
    <table id="target">
    <tr>
    <td>주문 번호</td>
    <td>주문 가격</td>
    <td>결제 상태</td>
    <td>주문 일자</td>
    </tr>
   <%--  <c:forEach items="${cartList}" var="cartVo" varStatus="status"> --%>
    <tr id="${cartVo.pbidx}_product_target">
    <td>12165451</td>
    <td>
    <!-- 금액 -->
    <span class="price"><input type="hidden" id="${cartVo.pbidx}_price" value="${cartVo.p_price}"> ${cartVo.p_price}원</span>
    </td>
    <td>yes or yes</td>
    <td>주문 일자</td>
    </tr>
<%--     </c:forEach> --%>
    </table>
    </div>
    </div>
     </form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
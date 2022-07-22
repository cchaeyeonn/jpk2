<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>주문서</title>
        <!-- jQuery library (served from Google) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        
        <!-- Font Awesome icons (free version)-->
        <script src="resources/js/scripts.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<c:import url="/header.do"></c:import> 
<div id="wrap">
<h1 align="center">주문서</h1>
<form>
<div id="order-product">
<!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
주문상품<p/>
<hr>
<table>
<c:forEach items="${cartList}" var="cartVo" varStatus="status">
<tr>
<td><div><img class="img-fluid2" src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}" alt="..."  /></div></td>
<td>${cartVo.p_name}</td><td>${cartVo.p_amount}</td><td>${cartVo.p_price}</td>
</tr>
</c:forEach>
</table>
</div>
<div id="orderer-info">
<!-- 세션값에 있는 midx를 이용해서 주문자의 정보를 가져옴 -->
주문자 정보<p/>
<hr>
<table>
<tr>
<td>성함</td><td>${memberVo.member_name}</td>
</tr>
<tr>
<td>휴대폰</td><td>${memberVo.member_phone}</td>
</tr>
<tr>
<td>이메일</td><td>${memberVo.member_email}</td>
</tr>
</table>
</div>
<div id="delivery-info">
<!-- 지도 api와 ajax를 이용해서 정보를 기입하기 -->
배송정보<p/>
<hr>
</div>
<div id="pay-way">
<!-- 결제수단을 선택하고 이에따라 아래에 나타나는 창이 다르게 -->
결제 수단<p/>
<hr>
</div>
<div id="pay-term">
<!-- 단순 체크 약관 유효성 검사를 통해 체크 된 경우에만 결제가 되도록 -->
개인정보 수집/제공<p/>
<hr>
<a><input type="button" value="장바구니로 돌아가기"></a>
<a><input type="button" value="메인으로 돌아가기"></a>
</div>
</form>
</div>
<c:import url="/footer.do"></c:import>
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
</head>
<body>
<div id="wrap">
<form>
<div id="order-product">
<!-- 장바구니에 있는 물건중 체크된 물건을 가져오기 -->
</div>
<div id="orderer-info">
<!-- 세션값에 있는 midx를 이용해서 주문자의 정보를 가져옴 -->
</div>
<div id="delivery-info">
<!-- 지도 api와 ajax를 이용해서 정보를 기입하기 -->
</div>
<div id="pay-way">
<!-- 결제수단을 선택하고 이에따라 아래에 나타나는 창이 다르게 -->
</div>
<div id="pay-term">
<!-- 단순 체크 약관 유효성 검사를 통해 체크 된 경우에만 결제가 되도록 -->
</div>
</form>
</div>
</body>
</html>
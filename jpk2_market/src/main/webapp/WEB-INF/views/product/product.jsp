<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<style>
	#product{padding-left:10%; padding-right:10%; height:1000px;}
	#product_img{float:left; width:50%; height:50%;}
	#product_detail{float:right; width:50%; height:50%;}
	#home_button{padding-left:10%; padding-right:10%; text-align:center; float:center;}
</style>
</head>
<body>
<form>
<div id="product">
<div id="product_img">상품 사진</div>
<div id="product_detail">상품 제목<p/>
ex)닭가슴살
<hr>
상품 가격<p/>
ex)15000원<p/>
<a href="/spring/"><input type="button" value="장바구니"></a>
<hr>
상품 판매 단위<p/>
ex)1개
<hr>
상품 중량/용량<p/>
ex)300g
<hr>
배송 구분<p/>
ex)새벽 배송 가능
<hr>
포장 타입<p/>
ex)비닐팩
<hr>
알레르기 정보<p/>
ex)닭 뭐 뭐 어쩌구
<hr>
유통기한<p/>
ex)제조기한 후 10일 내
</div>
</div>
<div id="home_button"><a href="/spring/"><input type="button" value="메인으로"></a></div><p/>
</form>
</body>
</html>
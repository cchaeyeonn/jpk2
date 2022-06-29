<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<style>

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
	<form>
		<div id="product">
		<div id="product_img">상품 사진</div>
		<div id="product_detail">상품 제목<p/>
		${ProductVo.p_name}
		<hr>
		상품 가격<p/>
		${ProductVo.p_price}<p/>
		<a href="/spring/"><input type="button" value="장바구니"></a>
		<hr>
		상품 판매 단위<p/>
		${ProductVo.p_unit}
		<hr>
		상품 중량/용량<p/>
		${ProductVo.p_weight}
		<hr>
		배송 구분<p/>
		${ProductVo.p_delivery}
		<hr>
		포장 타입<p/>
		${ProductVo.p_package}
		<hr>
		알레르기 정보<p/>
		${ProductVo.p_allergy}
		<hr>
		유통기한<p/>
		${ProductVo.p_limitdate}
		</div>
		</div>
		<div id="home_button"><a href="/spring/"><input type="button" value="메인으로"></a></div><p/>
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
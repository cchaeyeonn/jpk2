<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />

<title>제품 상세 페이지</title>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	<form name="productAddForm" action="${pageContext.request.contextPath}/addProductProcess.do" method="post" enctype="multipart/form-data">
		<div id="product">
		<div id="product_img">상품 사진
		<input type="file" name="p_filename"></div>
		<div id="product_detail">상품 제목<p/>
		<input type="text" name="p_name">
		<hr>
		상품 부제목<p/>
		<input type="text" name="p_secondname"><p/>
		<hr>
		상품 가격<p/>
		<input type="text" name="p_price"><p/>
		<hr>
		상품 판매 단위<p/>
		<input type="text" name="p_unit">
		<hr>
		상품 중량/용량<p/>
		<input type="text" name="p_weight">
		<hr>
		배송 구분<p/>
		<input type="text" name="p_delivery">
		<hr>
		포장 타입<p/>
		<input type="text" name="p_package">
		<hr>
		알레르기 정보<p/>
		<input type="text" name="p_allergy">
		<hr>
		유통기한<p/>  
		<input type="text" name="p_limitdate">
		<hr>
		타입<p/>
		<select name="p_type">
			<option value="vegetable_fruit">채소/과일</option>
			<option value="meat">정육</option>
			<option value="fish_seafood">생선/해산물</option>
			<option value="snacks">과자</option>
			<option value="bakery">베이커리</option>
			<option value="processedfood">가공식품</option>
			<option value="etc">기타</option>
		</select>
		<hr>
		태그<p/>
		<input type="text" name="p_tag">
		</div>
		</div>
		<div id="home_button"><input type="submit" value="등록하기"></div><p/>
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
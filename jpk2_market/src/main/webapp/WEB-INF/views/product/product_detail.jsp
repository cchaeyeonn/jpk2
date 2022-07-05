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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css">
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	<form>
		<div id="product">
		<div id="product_img">상품 사진<p/>
		<img src="${pageContext.request.contextPath}/resources/product_image/${productVo.p_system_filename}"></div>
		<div id="product_detail">상품 제목<p/>
		${productVo.p_name}
		<hr>
		상품 가격<p/>
		${productVo.p_price}<p/>
		<hr>
		상품 판매 단위<p/>
		${productVo.p_unit}
		<hr>
		상품 중량/용량<p/>
		${productVo.p_weight}
		<hr>
		배송 구분<p/>
		${productVo.p_delivery}
		<hr>
		포장 타입<p/>
		${productVo.p_package}
		<hr>
		알레르기 정보<p/>
		${productVo.p_allergy}
		<hr>
		유통기한<p/>
		${productVo.p_limitdate}
		</div>
		</div>
		<div id="home_button"><a href="/spring/"><input type="button" value="메인으로"></a>
		<input type="button" id="btn-modal" value="장바구니"></div><p/>
		<!--<a href="/spring/cart_insert.do"><input type="button" value="장바구니"></a></div><p/> -->
		
	<div id="container">
        <h2>Lorem Ipsum</h2>
        <div id="lorem-ipsum"></div>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>모달</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                
            </div>
        </div>
    </div>

	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
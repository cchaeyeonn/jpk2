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
			
/* 스크롤 막기 코드1 */
html, body {
  overflow: auto;
  height: 100%;
}

.button {
  background-color: #15967d;
  color: white;
  padding: 10px;
  cursor: pointer;
}

#homebutton_1{
background-color: #15967d;
  color: white;
  padding: 10px;
  cursor: pointer;
}

/* 스크롤 막기 코드2 */
.modal-background {
  display: none;
  overflow: hidden;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .6);
}

/* 스크롤 막기 코드3 */
.modal-content {
  overflow: auto;
  width: 50%;
  height: 400px;
  padding: 2em;
  background-color: #fff;
}
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css">


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
		<div id="home_button">
		<a href="/spring/" id="homebutton_1">메인</a>
		<!-- <input type="button" id="homebutton_1" value="메인으로"></a> -->
		<!-- <input type="button" id="btn-modal" value="장바구니"> -->
		
<!-- 모달 부분 시작 -->
		<a class="open button">장바구니</a></div><p/>
		<!--<a href="/spring/cart_insert.do"><input type="button" value="장바구니"></a></div><p/> -->
		

<!-- <div class="content">
	<a class="open button">장바구니</a>
</div> -->
<div class="modal-background">
  <div class="modal-content">
    <h3>장바구니 제목</h3>
    	내용
    <a class="close button">close modal</a>
  </div>
</div>
<!-- 모달 부분 끝 -->


<!--     <div id="modal" class="modal-overlay">
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
    </div> -->
    
   


	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
</html>
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
/* 	#home_button{
			padding-left:10%; 
			padding-right:10%; 
			text-align:center; 
			float:center;
			} */
    .button box{
            display : inline-block;
    }
    #product_subject{
    font-size:13px;
    color:#8f8f8f;
    }
    #product_price{
    font-size:13px;
    margin-top:39px;
    }
    .pd_dt{
    float:left;
    width:140px;
    color:#8f8f8f;
    font-size:15px;
    }
    .pd_hr{
    margin: 1.2rem 0;
    color: inherit;
    opacity:0.05;
    width:547px;
    }
    .pd_button{
   	margin-left:430px;
   	margin-top:22px;

    }

</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	if("${productVo.p_type}"=="vegetable_fruit"){
		$("#p_type").text("야채/과일");
	}else if("${productVo.p_type}"=="meat"){
		$("#p_type").text("정육");
	}else if("${productVo.p_type}"=="fish_seafood"){
		$("#p_type").text("생선/해산물");
	}else if("${productVo.p_type}"=="bakery"){
		$("#p_type").text("베이커리");
	}else if("${productVo.p_type}"=="processedfood"){
		$("#p_type").text("가공식품");
	}else{
		$("#p_type").text("기타");
	}
})
</script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	<form name="cartAddForm" action="${pageContext.request.contextPath}/addCartProcess.do" method="post">
	   <input type="hidden"  name="pidx_pc" value="${productVo.pidx} ">
		<div id="product">
		<div id="product_img">
		<img class="img-fluid3" src="${pageContext.request.contextPath}/resources/product_image/${productVo.p_system_filename}"></div>
		<div id="product_detail"><p/>
		<h3>${productVo.p_name}</h3>
		<div id="product_subject">${productVo.p_secondname}</div>
		
		<div id="product_price"><h3>${productVo.p_price}원</h3></div>
		<hr class="pd_hr">
		<dl>
		<dt class="pd_dt">판매 단위</dt>
		<dd class="pd_dd">${productVo.p_unit}</dd>
		<dt class="pd_dt">중량/용량</dt>
		<dd>${productVo.p_weight}</dd>
		</dl>
		<hr class="pd_hr">
		
		<dl>
		<dt class="pd_dt">배송구분</dt>
		<dd>${productVo.p_delivery}</dd>
		</dl>
		<hr class="pd_hr">
		<dl>
		<dt class="pd_dt">포장타입</dt>
		<dd>${productVo.p_package}</dd>
		</dl>
		<hr class="pd_hr">
		<dl>
		<dt class="pd_dt">알레르기정보</dt>
		<dd>${productVo.p_allergy}</dd>
		</dl>
		<hr class="pd_hr">
		<dl>
		<dt class="pd_dt">유통기한</dt>
		<dd>${productVo.p_limitdate}</dd>
		</dl>
		<hr class="pd_hr">
		<dl>
		<dt class="pd_dt">타입</dt>
		<dd><span id="p_type"></span></dd>
		</dl>
		<dl>
		<dt class="pd_button">
		<a class="open button" id="homebutton_1">장바구니 담기</a>
		</dt>
		</dl>
		</div>
		</div>
		<!-- <div id="home_button"> -->
		<%-- <a href="${pageContext.request.contextPath}/" id="homebutton_1">메인</a> --%>
		<!-- <input type="button" id="homebutton_1" value="메인으로"></a> -->
		<!-- <input type="button" id="btn-modal" value="장바구니"> -->
		
<!-- 모달 부분 시작 -->

		<!-- <a class="open button" id="homebutton_1">장바구니 담기</a></div><p/> -->
		<!--<a href="/spring/cart_insert.do"><input type="button" value="장바구니"></a></div><p/> -->
		

<!-- <div class="content">
	<a class="open button">장바구니</a>
</div> -->
<div class="modal-background">
  <div class="modal-content">
  <div class="close area" style="width:10px; margin-left:367px;">X</div>
  <div id="product-info">
     ${productVo.p_name}
    <hr>
    
    <b>${productVo.p_price}원</b>
     
    <div class="button box" style="float: right;">
    <input type="button" id="btn_minus" value="-">
    <input type="text" name="p_amount" id="pop_out" value="1" readonly="readonly" style="text-align:center; width: 48px;"/>
    <input type="button" id="btn_plus" value="+">
    </div>
    </div>
    <b>합계</b>
    <input type="submit" id="btn_insert_cart" value="장바구니 담기" >
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
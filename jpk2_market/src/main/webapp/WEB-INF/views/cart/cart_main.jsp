<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>

	#cart_inner{
		min-height: 1040px;
		padding-top: 200px;
		padding-right:315px;
		padding-left:315px;
	}
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
	#target{
	border-collapse : collapse;
	width:100%;
	height:100%;
    
	}	
	.img-fluid{
	
	
	
	}
	
</style>
<!-- jquery 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>
</head>
<body>
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include>
 
 	<form>
    <div id="cart_inner">
    <h2 style="text-align:center;"> 장바구니</h2>
    <input type="checkbox" id="chk_all">전체 선택 ㅣ 
    <!--<input type="button" value="선택 삭제" id="cart_delete">-->
    <button id="cart_delete"  value="선택 삭제">선택 삭제</button><hr>
    </form>
    
       
    <table id="target">
    <c:forEach items="${cartList}" var="cartVo">
    <form>
    <script>
    $(function(){
    let number = $('#${cartVo.pbidx}_pop_out').val();
    
    $('#${cartVo.pbidx}_btn_minus').on('click',function(){
    	    number = parseInt(number)
            if(number<=1){
            alert('더이상 줄일수 없습니다.');
            number=1;
            }else{
    	
            $('#${cartVo.pbidx}_pop_out').attr('value',number-=1);   	
         }
            
            $('#${cartVo.pbidx}_pop_out').text(number);
            });

    $('#${cartVo.pbidx}_btn_plus').on('click',function(){
    	    number = parseInt(number)
    	    
            $('#${cartVo.pbidx}_pop_out').attr('value',number+=1);

    		$('#${cartVo.pbidx}_pop_out').text(number);
    	   });  
    });
    </script>
 
    <tr id="${cartVo.pbidx}_product_target">
    <td>
    <input type="checkbox" class="del-chk" value="${cartVo.pbidx}">
    </td>
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
    <!-- 수량 버튼 -->
    
    <input type="button" id="${cartVo.pbidx}_btn_minus" value="-">
    <input type="text"  id="${cartVo.pbidx}_pop_out" value="${cartVo.p_amount}" readonly="readonly" style="text-align:center;"/>
    <input type="button" id="${cartVo.pbidx}_btn_plus" value="+"  >
   
    </td>
    <td>
    <!-- 금액 -->
    ${cartVo.p_price}원
    </td>
    <td>
    <!-- 삭제버튼 -->
    <button id="btn_delete" value="${cartVo.pbidx}">X</button>
    </td>
    </tr>
    </form>
    </c:forEach>
    </table>
    </div>
    
   
   
 
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
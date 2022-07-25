<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />

<title>장바구니</title>



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
 
    <form name="orderAddForm" action="${pageContext.request.contextPath}/orderSheet.do" method="post">
    
    <div id="cart_inner">
    <h2 style="text-align:center;"> 장바구니</h2>
    
    <label for="chk_all"><input type="checkbox" id="chk_all">전체 선택</label> ㅣ 
    <!--<input type="button" value="선택 삭제" id="cart_delete">-->

    <button id="cart_delete" type="button" value="선택 삭제">선택 삭제</button>
    
    <hr style="width:65%;">
    
    
    <div id="cart_1" style="float:left; width:60%; margin-right:103px;">   
    <table id="target">
    <c:set var="total" value="0"/>
    <c:forEach items="${cartList}" var="cartVo" varStatus="status">
    <input type="hidden"  id="pidx_pc" value="${cartVo.pidx_pc} ">
    <!-- 외부 js의 경우 el및 jstl이 적용되지 않는다. 그렇기 때문에 수량관련 +-버튼 스크립트를  forEach문 안에 따로 작성했다. -->
    <script>
    $(function(){
       let number = $('#${cartVo.pbidx}_pop_out').val();
   //minus 버튼
    $("#${cartVo.pbidx}_btn_minus").click(function(){
      
      
        let midx_mc = ${cartVo.midx_mc}
        let pidx_pc = ${cartVo.pidx_pc}
       number = parseInt(number)
         if(number<=1){
         alert('더이상 줄일수 없습니다.');
         number=1;
         }else{
    
         $('#${cartVo.pbidx}_pop_out').attr('value',number-=1);      
      }
         
         $('#${cartVo.pbidx}_pop_out').text(number);
   
      
      $.ajax({
         type: "post",
         url: "${pageContext.request.contextPath}/cart_amount.do",
         data: {
            "number":number,
            "midx_mc":midx_mc,
            "pidx_pc":pidx_pc
         },
         async: false,
         success: function(data){
            if(data == "N"){
               alert("db와 연동되지 않았습니다");
            }else{
               
               location.reload();
            }
            
         },
         error: function(error){ alert("수량 수정 중 에러발생"); }
      });
      
   });


    //plus 버튼
$("#${cartVo.pbidx}_btn_plus").click(function(){
      
      
        let midx_mc = ${cartVo.midx_mc}
        let pidx_pc = ${cartVo.pidx_pc}
       number = parseInt(number)
        $('#${cartVo.pbidx}_pop_out').attr('value',number+=1);       
         $('#${cartVo.pbidx}_pop_out').text(number);
   
      
      $.ajax({
         type: "post",
         url: "${pageContext.request.contextPath}/cart_amount.do",
         data: {
            "number":number,
            "midx_mc":midx_mc,
            "pidx_pc":pidx_pc
         },
         async: false,
         success: function(data){
            if(data == "N"){
               alert("db와 연동되지 않았습니다");
            }else{
               
               location.reload();
            }
            
         },
         error: function(error){ alert("수량 수정 중 에러발생"); }
      });
      
   });
    
$("#btn_delete_${cartVo.pbidx}").click(function(){
   
   let pbidx = $("#btn_delete_${cartVo.pbidx}").val();
   

   
   $.ajax({
      type: "post",
      url: "${pageContext.request.contextPath}/cart_deleteOne.do",
      data: {
         "pbidx":pbidx
      },
      async: false,
      success: function(data){
         if(data == "N"){
            alert("해당 항목의 체크박스를 체크해주세요");
         }else{
            
            location.reload();
         }
         
      },
      error: function(error){ alert("장바구니삭제 중 에러발생"); }
   });
   
});
    
    
    
    });
    </script>
 
    <tr id="${cartVo.pbidx}_product_target">
    <td>
    <input type="checkbox" class="del-chk" name="pbidx" value="${cartVo.pbidx}">
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
    
    <input type="button" type="button" id="${cartVo.pbidx}_btn_minus" value="-">
    <input type="text"  id="${cartVo.pbidx}_pop_out" class="amount" value="${cartVo.p_amount}" readonly="readonly" style="text-align:center;"/>
    <input type="button" type="button" id="${cartVo.pbidx}_btn_plus" value="+">
   
    </td>
    <td>
    <!-- 금액 -->
    <span class="price">${cartVo.p_price}원</span>
    </td>
    <td>
    <!-- 삭제버튼 -->
    <button id="btn_delete_${cartVo.pbidx}" type="button" value="${cartVo.pbidx}">X</button>
    </td>
    </tr>
    <c:set var="total" value="${total + cartVo.p_amount*cartVo.p_price }"/>
    </c:forEach>
    </table>
    </div>
    <div id="for_order" style="height:1040px;">
    <table id="for_order_table" border="0" style="float:right; width:378px; height:238px; position: sticky; top:183px; right:0px; padding-top:80px; background-color:#fafafa;">
    <tr>
    <td>상품금액</td>
    <td id="totalprice"><c:out value="${total}"/></td>
    </tr>
    <tr>
    <td>상품할인금액</td>
    <c:set var="sale" value="0"/>
    <td id="sale"><c:out value="${sale}"/>원</td>
    </tr>
    <tr>
    <td>배송비</td>
    <c:set var="delivery_fee" value="0"/>
    <c:choose>
    <c:when test="${total == 0 }">
    <c:set var="delivery_fee" value="0"/>   
    </c:when>
    <c:when test="${total >= 50000 }">
    <c:set var="delivery_fee" value="0"/>   
    </c:when>
    <c:when test="${total < 50000 }">
    <c:set var="delivery_fee" value="3000"/>
    </c:when>
    </c:choose>
    <td id="delivery_fee"><c:out value="${delivery_fee}"/>원</td>
    </tr>
    <tr>
    <td>결제예정금액</td>
    <td>${total - sale + delivery_fee}원</td>
    </tr>
    <tr>
    <td colspan="2">
     <input type="submit" class="btn btn-outline-success" value="주문하기" style="width:378px;">
    </td>
    <td></td>
    </tr>
    </table>
    </div>
     <input type="hidden" id="total"value="${total}">
     <input type="hidden" id="sale" value="${sale}">
     <input type="hidden" id="delivery_fee" value="${delivery_fee}">
     <input type="hidden" id="final_pay" value="${total - sale + delivery_fee}">
    </div>
     </form>

    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
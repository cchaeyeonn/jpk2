<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<style>
.price_r{
   text-align:right;
}
@media screen and (max-width: 990px){
 #cart_inner{
 width:550px !important;
 padding-left:50px !important;
 padding-right:50px !important;
 margin:0px !important;
 font-size:9px !important;
 height:450px !important;
 }
 #cart_line{
 width:550px !important;
 }
 #for_order{
 width:550px !important;
 height:450px !important;
 }
 #for_order_inner{
 float:left !important;
 height:450px !important;
 }
 #for_order_table{
 width:550px !important;
 float:left !important;
 margin-left:0px !important;
 }
 #target{
 width:550px !important;
 }
 #count_button{
 padding-left:33px !important;
 }
 .price{
 display:none;
 }
}
</style>
</head>
<body>
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include>
 
    <form name="orderAddForm" action="${pageContext.request.contextPath}/orderSheet.do" method="post">
    
    <div id="cart_inner" style="width:1777px;">
    <h2 style="text-align:center; margin-left: 100px;"> 장바구니</h2>
    
    <label for="chk_all"><input type="checkbox" id="chk_all" checked>전체 선택</label> ㅣ 
    <!--<input type="button" value="선택 삭제" id="cart_delete">-->

   <!-- <input type="submit" class="btn btn-outline-success" value="주문하기"> -->
    <button id="cart_delete" type="button" value="선택 삭제">선택 삭제</button>
    
    <hr id="cart_line" style="width:82%;">
    
    
    <div id="cart_1" style="float:left; width:78%;">   
    <table id="target">
    <c:forEach items="${cartList}" var="cartVo" varStatus="status">
    <input type="hidden"  id="pidx_pc" value="${cartVo.pidx_pc} ">
    <!-- 외부 js의 경우 el및 jstl이 적용되지 않는다. 그렇기 때문에 수량관련 +-버튼 스크립트를  forEach문 안에 따로 작성했다. -->
    <script>
    $(function(){
       
    	function priceToString(price) {
    	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    	}	
    	
       var sum_price = parseInt($("#sum_price").val());
       var sale = 0;
       var delivery_fee = 0;
       var total_pay_price;
       var pbidx = ${cartVo.pbidx};
       var amount ="#"+${cartVo.pbidx}+"_pop_out";
       var price = "#"+${cartVo.pbidx}+"_price";
       if($("#chk_${cartVo.pbidx}").is(':checked')){
       sum_price += parseInt($(price).val())*parseInt($(amount).val());
       }
       $("#sum_price").val(sum_price);
       
       
      if(sum_price < 50000 && sum_price != 0){
           delivery_fee = 3000;
           $("#delivery_fee").text(priceToString(delivery_fee)+"원");
        }else{
           delivery_fee = 0;
           $("#delivery_fee").text(priceToString(delivery_fee)+"원");
        }
       
     
       total_pay_price = sum_price-sale+delivery_fee;
       
       $("#totalprice_result").text(priceToString(sum_price)+"원");
       $("#sale").text(priceToString(sale)+"원"); 
       $("#total_pay_price").text(priceToString(total_pay_price)+"원");
       
       
       let number = $('#${cartVo.pbidx}_pop_out').val();
       number = parseInt(number)
       if(number<=1){
       $("#${cartVo.pbidx}_btn_minus").prop("disabled", true);
       number=1;
       }
   //minus 버튼
    $("#${cartVo.pbidx}_btn_minus").click(function(){
      
      
        let midx_mc = ${cartVo.midx_mc}
        let pidx_pc = ${cartVo.pidx_pc}
       number = parseInt(number)
         if(number<=1){
         $("#${cartVo.pbidx}_btn_minus").prop("disabled", true);
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
               var sum_price = parseInt($("#sum_price").val());
               if(number<=1){
                    $("#${cartVo.pbidx}_btn_minus").prop("disabled", true);
                    number=1;
                    }
                
               
               
               if($("#chk_${cartVo.pbidx}").is(':checked')){
                  sum_price -=  parseInt($(price).val());   
                  $("#sum_price").val(sum_price);      
                      }
                    
               if(sum_price < 50000 && sum_price != 0){
                          delivery_fee = 3000;
                          $("#delivery_fee").text(priceToString(delivery_fee)+"원");
                       }else{
                          delivery_fee = 0;
                          $("#delivery_fee").text(priceToString(delivery_fee)+"원");
                       }
                      
                    
                      total_pay_price = sum_price-sale+delivery_fee;
                      
                      $("#totalprice_result").text(priceToString(sum_price)+"원");
                      $("#sale").text(priceToString(sale)+"원"); 
                      $("#total_pay_price").text(priceToString(total_pay_price)+"원");
                      
                      
                        
               
               
               
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
               var sum_price = parseInt($("#sum_price").val());
               if(number>=2){
                    $("#${cartVo.pbidx}_btn_minus").prop("disabled", false);}
               
               if($("#chk_${cartVo.pbidx}").is(':checked')){
                  sum_price +=  parseInt($(price).val());
                  $("#sum_price").val(sum_price);      
                      }
                    
               
               if(sum_price < 50000 && sum_price != 0){
                          delivery_fee = 3000;
                          $("#delivery_fee").text(priceToString(delivery_fee)+"원");
                       }else{
                          delivery_fee = 0;
                          $("#delivery_fee").text(priceToString(delivery_fee)+"원");
                       }
                      
                    
                      total_pay_price = sum_price-sale+delivery_fee;
                      
                      $("#totalprice_result").text(priceToString(sum_price)+"원");
                      $("#sale").text(priceToString(sale)+"원"); 
                      $("#total_pay_price").text(priceToString(total_pay_price)+"원");
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
    
var total = 0;
var sum = 0;   
$("#chk_${cartVo.pbidx}").change(function(){

   var sum_price = parseInt($("#sum_price").val());
   var sale = 0;
   var delivery_fee = 0;
   var total_pay_price;
   var pbidx = ${cartVo.pbidx};
   var amount ="#"+${cartVo.pbidx}+"_pop_out";
   var price = "#"+${cartVo.pbidx}+"_price";
   if($("#chk_${cartVo.pbidx}").is(':checked')){
   sum_price += parseInt($(price).val())*parseInt($(amount).val());
   }else{
    sum_price -= parseInt($(price).val())*parseInt($(amount).val());      
   }
   $("#sum_price").val(sum_price);
   
  if(sum_price < 50000 && sum_price != 0){
       delivery_fee = 3000;
       $("#delivery_fee").text(priceToString(delivery_fee)+"원");
    }else{
       delivery_fee = 0;
       $("#delivery_fee").text(priceToString(delivery_fee)+"원");
    }
   
   total_pay_price = sum_price-sale+delivery_fee;
   
   $("#totalprice_result").text(priceToString(sum_price)+"원");
   $("#sale").text(priceToString(sale)+"원"); 
   $("#total_pay_price").text(priceToString(total_pay_price)+"원");
   
    
});
$("#chk_all").change(function(){
  if($("#chk_all").is(':checked')){
     location.reload();
     
     
  }else{
   sum_price = 0;  
  }
   
  $("#sum_price").val(sum_price);
  
  if(sum_price < 50000 && sum_price != 0){
       delivery_fee = 3000;
       $("#delivery_fee").text(priceToString(delivery_fee)+"원");
    }else{
       delivery_fee = 0;
       $("#delivery_fee").text(priceToString(delivery_fee)+"원");
    }
   
   total_pay_price = sum_price-sale+delivery_fee;
   
   $("#totalprice_result").text(priceToString(sum_price)+"원");
   $("#sale").text(priceToString(sale)+"원"); 
   $("#total_pay_price").text(priceToString(total_pay_price)+"원");
  

});
    });
    </script>
     <style>
    @media screen and (max-width: 990px){
    #${cartVo.pbidx}_product_target{
    border-width:550px !important;
    }
    }
    </style>
    <tr id="${cartVo.pbidx}_product_target">
    <td>
    <input type="checkbox" class="del-chk" name="pbidx" id="chk_${cartVo.pbidx}" value="${cartVo.pbidx}" checked>
    </td>
    <td>
    <!-- 사진 -->
    <div class="portfolio-item-caption d-flex2 align-items-center justify-content-center h-220 w-149">
    <img class="img-fluid2" src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}" alt="..."  />
    </div>
    </td>
    <td style="min-width:70px;">
    
    <!-- 상품명 -->
    ${cartVo.p_name}
    </td>
    <td id="count_button" style="padding-left:63px; width:346px; min-width:200px;">
    <!-- 수량 버튼 -->
    <div style="border:1px solid; width:169px; color:rgb(221,223,225); height:40px;">
    <button type="button" type="button" id="${cartVo.pbidx}_btn_minus" value="-" style="border:1px; background-color:white;"><img src="resources/img/-_button.png"></button>
    <input type="text" id="${cartVo.pbidx}_pop_out" class="amount" value="${cartVo.p_amount}" readonly="readonly" style="text-align:center; width:92px; border:0px solid rgb(221,223,225); height:38px;"/>
    <button type="button" type="button" id="${cartVo.pbidx}_btn_plus" value="+" style="border:1px; background-color:white;"><img src="resources/img/+_button.png"></button>
   </div>
   
   
    </td>
    <td>
    <!-- 금액 -->
    <span class="price"><input type="hidden" id="${cartVo.pbidx}_price" value="${cartVo.p_price}"> <fmt:formatNumber value="${cartVo.p_price}" pattern="#,###"/>원</span>
    </td>
    <td>
    <!-- 삭제버튼 -->
    <button type="button" id="btn_delete_${cartVo.pbidx}"  value="${cartVo.pbidx}" style="border:1px; background-color:white;"><img src="resources/img/x_button.png"></button>
    </td>
    </tr>
    </c:forEach>
    </table>
    </div>
    <div id="for_order" style="height:1040px; width:1273px;">
    <div id="for_order_inner" style="width:330px; height:1040px; float:right;">
    <table id="for_order_table" border="0" style="float:right; width:330px; height:238px; position: sticky; top:183px; right:0px; padding-top:80px; background-color:#fafafa;">
    <tr>
    <td>상품금액</td>
    <td class="price_r" id="totalprice"><span id="totalprice_result"></span>
    <input type="hidden" id="sum_price" name="sum_price" value="0">
    </td>
    </tr>
    <tr>
    <td>상품할인금액</td>   
    <td class="price_r"><span id="sale"></span></td>
    </tr>
    <tr>
    <td>배송비</td>
    <td class="price_r"><span id="delivery_fee"></span></td>
    </tr>
    <tr>
    <td>결제예정금액</td>
    <td class="price_r"><span id="total_pay_price"></span></td>
    </tr>
    <tr>
    <td colspan="2" style="text-align:center;">
     <input type="submit" class="btn btn-outline-success" value="주문하기" style="width:330px;">
    </td>
    <td></td>
    </tr>
    </table>
    </div>
    </div>
    </div>
     </form>
     
     
    

    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
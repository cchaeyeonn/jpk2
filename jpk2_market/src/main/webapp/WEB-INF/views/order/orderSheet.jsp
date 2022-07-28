<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>주문서</title>
        <!-- jQuery library (served from Google) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        
        <!-- Font Awesome icons (free version)-->
        <script src="resources/js/scripts.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        <!-- 아임포트 api -->
        <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
        <script>
        var IMP = window.IMP;
        IMP.init("imp42068652");
        
    function requestPay() {
  
    		          if($("#member_addr_2").val() == ""){
    		           result = "상세주소를 입력해주세요";
    			       $("#result_member_addr").html(result).css("color", "red");
    		           $("#member_addr_2").focus();
    		           return false;
    		             }
 
 
    		          if($("#member_addr_1").val() == ""){
    		           result = "주소를 입력해주세요";
    			       $("#result_member_addr").html(result).css("color", "red");
    		           $("#member_addr_1").focus();
    		           return false;
    		             }
    
    
    		          if($("#member_addrcode").val() == ""){
    		           result = "주소를 입력해주세요";
    			       $("#result_member_addr").html(result).css("color", "red");
    		           $("#member_addrcode").focus();
    		           return false;
    		             }
   
    		          if(!$("input:checked[name='order_term']").is(":checked")){
    		           result = "필수 약관입니다. 동의해주세요";
    			       $("#result_order_term").html(result).css("color", "red");
    		           return false;
    		             }


    	
    	
    	
    	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000011",
          name: "노르웨이 회전 의자",
          amount: 100,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
        	  var msg = '결제가 완료되었습니다.';
        	  msg += '고유ID : ' + rsp.imp_uid;
        	  msg += '상점 거래ID : ' + rsp.merchant_uid;
        	  msg += '결제 금액 : ' + rsp.paid_amount;
        	  msg += '카드 승인번호 : ' + rsp.apply_num;
              // 결제 성공 시 로직,
              
          } else {
        	  var msg = '결제에 실패하였습니다.';
        	  msg += '에러내용 : ' + rsp.error_msg;

              // 결제 실패 시 로직,
              
          }
          alert(msg);
      });
    }
  </script>
            <!-- 카카오 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
   $(function(){
      $(document).on('click','#member_addr',function(){
      if($("#member_addr").prop("checked")){
         $("#postcode").val("${memberVo.member_addrcode}");
         $("#member_addr_1").val("${memberVo.member_addr1}");
         $("#member_addr_2").val("${memberVo.member_addr2}");
         
      }else{
         $("#postcode").val("");
         $("#member_addr_1").val("");
         $("#member_addr_2").val("");
      }
      });
   });
   </script>
   <script>
    // 카카오 주소 api 
      
    function execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               var roadAddr = data.roadAddress;
               var extraRoadAddr = '';

               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }

               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }

               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }

               document.getElementById('postcode').value = data.zonecode;   //우편번호
               document.getElementById("member_addr_1").value = roadAddr;   //도로명주소
               document.getElementById("member_addr_2").focus();         //상세주소 (창이꺼지면서 상세주소에 focus가 가도록)

              
             }
         }).open();
      };       
   function maxDate(){
   var now_utc = Date.now() // 지금 날짜를 밀리초로
                        // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
   var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
                     // new Date(now_utc-timeOff).toISOString()은 현재시간을 '2022-05-11T18:09:38.134Z'의 형식으로 반환
   var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
   document.getElementById("member_birth").setAttribute("max", today);
   };
   </script>

	<script>
	$(function(){
	var delivery_fee = 0;
	var total_fee = 0;
	if("${sum_price}" < 50000 && "${sum_price}" != 0){
        delivery_fee = 3000;
        $("#del_price").text(delivery_fee+"원");
     }else{
        delivery_fee = 0;
        $("#del_price").text(delivery_fee+"원");
     }
	total_fee = ${sum_price}+delivery_fee
	$("#total_price").text(total_fee+"원")
	})
	</script>
</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>
<div id="wrap" style="padding-top:239px; margin-left:414px; margin-right:401px;">
<h1 align="center">주문서</h1>
<form action="/spring/index.do" method="get">
<div id="order-product">
<!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
주문상품<p/>
<hr>
<table>

<tr>
<td colspan="2">상품 이름</td><td>&nbsp;&nbsp;&nbsp;</td><td>개수</td><td>&nbsp;&nbsp;&nbsp;</td><td>상품 가격</td>
</tr>
<c:forEach items="${orderList}" var="orderVo" varStatus="status">
   <script>
   $(function(){
	   $("#${orderVo.pbidx}_p_price").text("${orderVo.p_amount}"*"${orderVo.p_price}"+"원");
   })
   </script>
   
<tr>
<td><div><img class="img-fluid4" src="${pageContext.request.contextPath}/resources/product_image/${orderVo.p_system_filename}" alt="..."  /></div></td>
<td>${orderVo.p_name}</td><td>&nbsp;&nbsp;&nbsp;</td><td>${orderVo.p_amount}&nbsp;개</td><td>&nbsp;&nbsp;&nbsp;</td><td><span id="${orderVo.pbidx}_p_price"></span></td>
</tr>
</c:forEach>
</table>
</div>
<div>
결제 예정 금액<p/>
<hr>
<table>
<tr>
<td>상품 총 가격</td><td></td><td>상품 할인</td><td></td><td>배송비</td><td></td><td>총 결제 예정금액</td>
</tr>
<tr>
<td><span id="sum_price">${sum_price}원</span></td><td>-</td><td><span id="sale_price">0원</span></td><td>+</td><td><span id="del_price"></span></td><td>=</td><td><span id="total_price"></span></td>
</tr>
</table>
</div>
<div id="orderer-info">
<!-- 세션값에 있는 midx를 이용해서 주문자의 정보를 가져옴 -->
구매자 정보<p/>
<hr>
<table>
<tr>
<td>성함</td><td>${memberVo.member_name}</td>
</tr>
<tr>
<td>휴대폰</td><td>${memberVo.member_phone}</td>
</tr>
<tr>
<td>이메일</td><td>${memberVo.member_email}</td>
</tr>
</table>
</div>
<div id="delivery-info">
<!-- 지도 api와 jQuery를 이용해서 정보를 기입하기 -->
배송정보<p/>
<hr>
<div>
      배송지<p/>
      <label for="member_addr"> <input type="checkbox" id="member_addr" name="member_addr">기본 배송지 입력</label><p/>
      <input type="text" id="postcode" name="member_addrcode" placeholder="우편번호" value="" readonly>
       <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><p/>
        <input type="text" id="member_addr_1" name="member_addr1" value="" readonly placeholder="도로명주소"><input type="text" id="member_addr_2" name="member_addr2" placeholder="상세주소"><p/>
        <div style="height:20px"><span id="result_member_addr" style="font-size:12px;"></span></div>
</div>
</div>
<div id="pay-way">
<!-- 결제수단을 선택하고 이에따라 아래에 나타나는 창이 다르게 -->
결제 수단<p/>
<hr>
</div>
<div id="pay-term">
<!-- 단순 체크 약관 유효성 검사를 통해 체크 된 경우에만 결제가 되도록 -->
개인정보 수집/제공<p/>
<hr>
<div>
<label for="order_term"><input type="checkbox" id="order_term" name="order_term"><b>결제진행 필수 동의</b></label></div><p/>
<div>결제정보 수집,이용 및 처리 동의(필수) | 전자지급 결제대행 서비스 이용약관 동의(필수) </div>
 <div style="height:20px"><span id="result_order_term" style="font-size:12px;"></span></div>
 <input type="button" onclick="requestPay()" id="trigger" value="결제하기">
<a href="/spring/cart_main.do"><input type="button" value="장바구니로 돌아가기"></a>
<a href="/spring/index.do"><input type="button" value="메인으로 돌아가기"></a>
</div>
</form>
</div>
    <jsp:include page="../footer.jsp"></jsp:include>

 <!-- Bootstrap core JS-->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> 
</body>
</html>
<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>주문서</title>
<!-- jQuery library (served from Google) -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="resources/js/scripts.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet" type="text/css" />
<link
   href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
   rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<!-- 아임포트 api -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
   var member_name = "<c:out value="${memberVo.member_name}" />";
   var member_phone = "<c:out value="${memberVo.member_phone}" />";
</script>
<script src="${pageContext.request.contextPath}/resources/js/order.js "></script>

<!-- 카카오 주소 api -->
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8">
   sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script>
   function noEvent() {
      if (event.keyCode == 116) {
         event.keyCode = 2;
         return false;
      } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
         return false;
      }
   }
   document.onkeydown = noEvent;
</script>

<script>
   $(function() {
      $(document).on('click', '#member_addr', function() {
         if ($("#member_addr").prop("checked")) {
            $("#member_toMember").val("${memberVo.member_name}");
            $("#member_toMemberPhone").val("${memberVo.member_phone}");
            $("#postcode").val("${memberVo.member_addrcode}");
            $("#member_addr_1").val("${memberVo.member_addr1}");
            $("#member_addr_2").val("${memberVo.member_addr2}");

         } else {
            $("#member_toMember").val("");
            $("#member_toMemberPhone").val("");
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
         oncomplete : function(data) {
            var roadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraRoadAddr += data.bname;
            }

            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraRoadAddr += (extraRoadAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }

            if (extraRoadAddr !== '') {
               extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('postcode').value = data.zonecode; //우편번호
            document.getElementById("member_addr_1").value = roadAddr; //도로명주소
            document.getElementById("member_addr_2").focus(); //상세주소 (창이꺼지면서 상세주소에 focus가 가도록)

         }
      }).open();
   };
   function maxDate() {
      var now_utc = Date.now() // 지금 날짜를 밀리초로
      // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
      var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
      // new Date(now_utc-timeOff).toISOString()은 현재시간을 '2022-05-11T18:09:38.134Z'의 형식으로 반환
      var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
      document.getElementById("member_birth").setAttribute("max", today);
   };
</script>

<script>
   $(function() {
	   
	   function priceToString(price) {
		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
      var delivery_fee = 0;
      var total_fee = 0;
      if ("${sum_price}" < 50000 && "${sum_price}" != 0) {
         delivery_fee = 3000;
         $("#del_price").text(priceToString(delivery_fee) + "원");
      } else {
         delivery_fee = 0;
         $("#del_price").text(priceToString(delivery_fee) + "원");
      }
      total_fee = ${sum_price}+delivery_fee;
      $("#total_price").text(priceToString(total_fee) + "원");
      $("#total_price_").val(total_fee);

   })
</script>
<script>
function cart(){
   var frm = document.frmq;
   frm.action="${pageContext.request.contextPath}/cart_main.do";
   frm.method="POST";
   frm.submit();
   return;
}
</script>
<style>
.td_info_l {
   width: 255px;
}

.order_price1 {
   min-width: 130px;
   font-size: 20px;
   font-weight: 700;
}

.order_price2 {
   min-width: 60px;
}

#ordersheet_title{
   margin-top: 50px;
   text-align:center;
}

#ordersheet_hr{
   height: 3px; 
   background-color: #a3a3a3;
}
#member_addr_1{
   width:293px;
}
</style>
</head>



<body oncontextmenu="return false">
   <jsp:include page="../header.jsp"></jsp:include>



   <div id="wrap"
      style="width: 1083px; min-height: 1400px; padding-top: 239px; margin-left: 414px; margin-right: 401px;">
      <h2 id="ordersheet_title" >주문서</h2>
      <form action="${pageContext.request.contextPath}/index.do"
         method="get" name="frmq">

         <div id="order-product">
            <!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
            <b>주문상품</b>
            <hr id="ordersheet_hr">


            <table>

              <!--  <tr>
               	  <td></td>
                  <td class="td_info_l">상품 이름</td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>개수</td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>상품 가격</td>
               </tr> -->
               <c:forEach items="${orderList}" var="orderVo" varStatus="status">
                  <script>
                     $(
                           function() {
                        	   function priceToString(price) {
                       		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                       		}
                              $("#${orderVo.pbidx}_p_price").text( priceToString(
                                    "${orderVo.p_amount}"
                                          * "${orderVo.p_price}")
                                          + "원");
                           }
                           
                    
                     
                     )
                  </script>

                  <tr>
                     <td style="width:256px;">
                        <div>
                           <img class="img-fluid4"
                              src="${pageContext.request.contextPath}/resources/product_image/${orderVo.p_system_filename}"
                              alt="..." />
                        </div>
                     </td>
                     <td>${orderVo.p_name}</td>
                     <td style="width:90px;">&nbsp;&nbsp;&nbsp;</td>
                     <td>${orderVo.p_amount}&nbsp;개</td>
                     <td style="width:90px;">&nbsp;&nbsp;&nbsp;</td>
                     <td><span id="${orderVo.pbidx}_p_price"></span></td>
                  </tr>
                  
                  <input type="hidden" name="pbidx" id="${orderVo.pbidx }_pbidx" value="${orderVo.pbidx }">
                  
                  
               </c:forEach>

            </table>
         </div>

         <div id="orderer-info" style="margin-top: 50px;">
            <!-- 세션값에 있는 midx를 이용해서 주문자의 정보를 가져옴 -->
            주문자 정보
            <hr id="ordersheet_hr">
            <table>
               <tr>
                  <td class="td_info_l">성함</td>
                  <td class="td_info_r" id="member_name">${memberVo.member_name}</td>
               </tr>
               <tr>
                  <td class="td_info_l">휴대폰</td>
                  <td class="td_info_r">${memberVo.member_phone}</td>
               </tr>
               <tr>
                  <td class="td_info_l">이메일</td>
                  <td class="td_info_r">${memberVo.member_email}</td>
                  
               </tr>
            </table>
         </div>
            <input type="hidden" id ="member_email" value="${memberVo.member_email}">

         <div id="delivery-info" style="margin-top: 30px;">
            <!-- 지도 api와 jQuery를 이용해서 정보를 기입하기 -->
            배송정보
            <hr id="ordersheet_hr">
            <div>
               <table>
                  <tr>
                     <td class="td_info_l">배송지</td>
                     <td><label for="member_addr"> <input type="checkbox"
                           id="member_addr" name="member_addr">기본 배송지 입력
                     </label></td>
                  </tr>
                  <tr>
                     <td class="td_info_l"></td>
                     <td><input type="text" id="member_toMember" name="member_toMember" class="form-control" placeholder="받는 사람" ></td>
                  </tr>
                  <tr>
                     <td class="td_info_l"></td>
                     <td><input type="text" id="member_toMemberPhone" name="member_toMemberPhone" class="form-control" placeholder="받는 사람의 휴대폰 번호" ></td>
                  </tr>
                  <tr>
                     <td class="td_info_l"></td>
                     <td><input type="text" id="postcode" name="member_addrcode" placeholder="우편번호" class="form-control" value="" readonly>
                        <input type="button" class="btn btn-outline-success" onclick="execDaumPostcode()" value="우편번호 찾기">
                     <p /></td>
                  </tr>
                  <tr>
                     <td class="td_info_l"></td>
                     <td><input type="text" id="member_addr_1" name="member_addr1" value="" class="form-control" readonly placeholder="도로명주소">
                        <input type="text" id="member_addr_2" name="member_addr2" class="form-control" placeholder="상세주소">
                     <p />
                        <div style="height: 20px">
                           <span id="result_member_addr" style="font-size: 12px;"></span>
                        </div></td>
                  </tr>
                  <tr>
                     <td class="td_info_l"></td>
                     <td></td>
                  </tr>
               </table>
            </div>
         </div>


         <div style="margin-top: 30px;">
            결제 예정 금액
            <hr id="ordersheet_hr">
            <table style="text-align: center;">
               <tr>
                  <td class="td_info_l"></td>
                  <td class="order_price1">상품 총 가격</td>
                  <td class="order_price2"></td>
                  <td class="order_price1">상품 할인</td>
                  <td class="order_price2"></td>
                  <td class="order_price1">배송비</td>
                  <td class="order_price2"></td>
                  <td  class="order_price1">총 결제 예정금액</td>
               </tr>
               <tr>
                  <td class="td_info_l"></td>
                  <td class="order_price1"><span id="sum_price"><fmt:formatNumber value="${sum_price}" pattern="#,###"/>원</span></td>
                  <td class="order_price2">-</td>
                  <td class="order_price1"><span id="sale_price">0원</span></td>
                  <td class="order_price2">+</td>
                  <td class="order_price1"><span id="del_price"></span></td>
                  <td class="order_price2">=</td>
                  <td style="color:#198754;" class="order_price1"><span id="total_price"></span> <input
                     type="hidden" id="total_price_" value=""></td>
               </tr>
            </table>
         </div>



         <div id="pay-way" style="margin-top: 30px;">
            <!-- 결제수단을 선택하고 이에따라 아래에 나타나는 창이 다르게 -->
            결제 수단
            <hr id="ordersheet_hr">
            <div>
               <table>
                  <tr>
                     <td class="order_price1"></td>
                     <td class="order_price1"></td>
                     <td><label><input type="radio" name="method"
                           value="card" checked> 신용카드</label>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <!-- <td><label><input type="radio" name="method"
                           value="trans"> 실시간계좌이체</label>&nbsp;&nbsp;&nbsp;&nbsp;</td> -->
                     <td><label><input type="radio" name="method"
                           value="vbank"> 무통장 입금</label></td>

                  </tr>
               </table>
            </div>
         </div>


         <div id="pay-term" style="margin-top: 30px;">
            <!-- 단순 체크 약관 유효성 검사를 통해 체크 된 경우에만 결제가 되도록 -->
            개인정보 수집/제공
            <hr id="ordersheet_hr">

            <div style="margin-top: 30px;">

               <table>
                  <tr>
                     <td class="order_price1"></td>
                     <td class="order_price1"></td>
                     <td>
                        <div>
                           <label for="order_term"><input type="checkbox"
                              id="order_term" name="order_term"><b>결제진행 필수 동의</b></label>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="order_price1"></td>
                     <td class="order_price1"></td>
                     <td>결제정보 수집,이용 및 처리 동의(필수) | 전자지급 결제대행 서비스 이용약관 동의(필수)
                        <div style="height: 20px">
                           <span id="result_order_term" style="font-size: 12px;"></span>
                        </div>
                     </td>
                  </tr>
               </table>
            </div>

            <div style="margin-left: 38%; margin-top:2%; margin-bottom:9%;">
               <input type="button" class="btn btn-outline-success" onclick="requestPay()" id="trigger"
                  value="결제하기">
               <input type="button" class="btn btn-outline-success" onclick="cart()" value="장바구니로 돌아가기">
            </div>

         </div>
      </form>
   </div>
   <jsp:include page="../footer.jsp"></jsp:include>

   <!-- Bootstrap core JS-->

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="/js/scripts.js"></script>
   <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
   <!-- * *                               SB Forms JS                               * *-->
   <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
   <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
   <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
<script>
   history.pushState(null, null, location.href);
   window.onpopstate = function() {
      history.go(1);
   };
</script>
</html>
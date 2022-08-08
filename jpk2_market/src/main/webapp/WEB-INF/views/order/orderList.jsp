<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />
<link href="resources/css/mypage_css.css" rel="stylesheet" />

<title>주문 내역</title>



<!-- 외부 js에서 ${pageContext.request.contextPath}를 사용할 수 있게 세션에 값을 저장 -->
<script type="text/javascript" charset="utf-8">
   sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<!-- jquery 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include>
    
<form>
   <div id="orderlist_main_inner">
   <div id="mypage_center_cate">
   <div id="mypage_1">마이페이지</div>
      <div id="mypage_sub">   
      <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="open_history">주문 내역</a>
      <a href="${pageContext.request.contextPath}/memberInfo.do" class="nav-link py-3 px-0 px-lg-3" id="open_info_modify">개인 정보 수정</a>
      
      <a href="#" onclick="alert('서비스 준비중입니다.')" class="nav-link py-3 px-0 px-lg-3" id="open_coupon">쿠폰</a>
      <!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
      </div>
   </div>
 

    
    <div id="cart_inner2">
    <h5 style="margin-top: 272px;">주문 내역</h5>

   <div id="line"></div>
   <div id="orderlist_inner">
   
      <c:forEach items="${orderList}" var="orderVo" varStatus="status">  
      
       <script>
      $(function(){
         if("${orderVo.orderpay_check}"=="Y"){
            $("#${orderVo.order_id}_orderpay_check").text("결제 완료");
         }else if("${orderVo.orderpay_check}"=="W"){
            $("#${orderVo.order_id}_orderpay_check").text("결제 대기");
         }else if("${orderVo.orderpay_check}"=="F"){
            $("#${orderVo.order_id}_orderpay_check").text("결제 실패");
         }else{
            $("#${orderVo.order_id}_orderpay_check").text("주문 중 오류");
         }
      })
      </script>
             <script>
      $(function(){
         if("${orderVo.d_status}"=="Y"){
            $("#${orderVo.order_id}_orderlist_shipping").text("배송 완료");
         }else if("${orderVo.d_status}"=="N"){
            $("#${orderVo.order_id}_orderlist_shipping").text("배송 준비중");
         }else if("${orderVo.d_status}"=="W"){
            $("#${orderVo.order_id}_orderlist_shipping").text("배송중");
         }else{
            $("#${orderVo.order_id}_orderlist_shipping").text("배송 중 오류");
         }
      })
      </script>
   <div id="orderlist_inner2">
   <div id="orderlist_1">
   <span id="order_date"><b>${orderVo.order_date}</b>&nbsp;(${orderVo.order_id })</span>
   <a onClick="location.href='${pageContext.request.contextPath}/orderListDetail.do?order_id=${orderVo.order_id}'" id="order_detail">주문내역 상세보기</a>
   </div>
   <div id="orderlist_box">
   <div id="orderlist_box_left"></div>
   <%--  <img id="orderlist_img" class="img-fluid4" src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}" alt="..."  /> --%>

   <div id="orderlist_content">
<!--       <dl id="dl">
      <dt id="dt">상품명</dt>
      <dd id="dd">과일잼</dd>
      </dl> -->

      <dl id="dl">
      <dt id="dt">결제금액</dt>
      <dd id="dd">${orderVo.pay_price }</dd>
      </dl>
      
      <dl id="dl">
      <dt id="dt">결제상태</dt>
      <dd id="dd"><span id="${orderVo.order_id}_orderpay_check"></span></dd>
      </dl>
   </div>
   
   
   <div id="orderlist_box_right">
      <span id="${orderVo.order_id}_orderlist_shipping"></span>
   </div>
   </div>
   
   </div>
   
   </c:forEach>
   
   
   
   
   
   </div>


<%-- <div id="table_button" style="width:962px;">
   <table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
      <tr>
         
         <td id="td1">주문 번호</td>
         <td id="td3">주문 가격</td>
         <td id="td4">결제 상태</td>
         <td id="td5">주문 일</td>
      </tr>
      
      <c:forEach items="${orderList}" var="orderVo" varStatus="status">  
      
      <script>
      $(function(){
         if("${orderVo.orderpay_check}"=="Y"){
            $("#${orderVo.order_id}_orderpay_check").text("결제 완료");
         }else if("${orderVo.orderpay_check}"=="W"){
            $("#${orderVo.order_id}_orderpay_check").text("결제 대기");
         }else if("${orderVo.orderpay_check}"=="F"){
            $("#${orderVo.order_id}_orderpay_check").text("결제 실패");
         }else{
            $("#${orderVo.order_id}_orderpay_check").text("주문 중 오류");
         }
      })
      </script>
    
       <tr id="target"  onClick="location.href='${pageContext.request.contextPath}/orderListDetail.do?order_id=${orderVo.order_id}'">
            <td id="td1">${orderVo.order_id }</td>
             <td id="td3">
             ${orderVo.pay_price }
          </td>
            <td id="td4"><span id="${orderVo.order_id}_orderpay_check"></span></td>
          <td id="td5">${orderVo.order_date}</td>
         </tr>
         
     </c:forEach> 
    </table>
    </div> --%>
   </div>

</div>



   </form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
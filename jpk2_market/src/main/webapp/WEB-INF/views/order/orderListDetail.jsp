<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

<style>


/* #orderlist_2{
    display: flex;
    padding: 8px 0px 13px;
    -webkit-box-pack: justify;
    justify-content: space-between;
    border-bottom: 0px solid rgb(221, 223, 225) !important;
}
 */

</style>

<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link href="resources/css/mypage_css.css" rel="stylesheet" />

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
<script type="text/javascript" charset="utf-8">
   sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
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
   
</head>
<body>
   <!-- 헤더 연결 -->
   <jsp:include page="../header.jsp"></jsp:include>
   
<!--    <div id="wrap"
      style="padding-top: 239px; margin-left: 414px; margin-right: 401px;">
      <h1 align="center">주문상세내역</h1> -->
      <form>
      <div id="mypage_main_inner">
   <div id="mypage_center_cate">
   <div id="mypage_sub_title">마이페이지</div>
      <div id="mypage_sub">   
       <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="open_history">주문 내역</a>
       <a href="${pageContext.request.contextPath}/memberInfo.do" class="nav-link py-3 px-0 px-lg-3" id="open_info_modify">개인 정보 수정</a>
     
      <a href="" class="nav-link py-3 px-0 px-lg-3" id="open_coupon">쿠폰</a>
      <!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
      </div>
   </div>
      
      
          <div id="cart_inner2">
            <!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
            <h5 style="margin-top: 35px;">주문 상세 내역</h5>
            
            <div id="line"></div>
               <div id="orderlist_inner">
                  <div id="orderlist_inner2">
                  <div id="orderlist_2">
               </div>
               
                  <div id="orderlist_inner2">
      <div id="orderlist_2">
   <span id="order_date"><b>${orderVo.order_id }</b></span>
  <%--  <a onClick="location.href='${pageContext.request.contextPath}/orderListDetail.do?order_id=${orderVo.order_id}'" id="order_detail">주문내역 상세보기</a> --%>
   </div>
   
<c:forEach items="${cartList}" var="cartVo" varStatus="status"> 
   <div id="orderlistdetail_box">
  
  <div id="orderlist_box_left"></div>
    <img id="orderlist_img" class="img-fluid4" src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}" alt="..."  />
   
   <div id="orderlist_content">
      <dl id="dl">
      <dt id="dt2">상품명</dt>
      <dd id="dd2">${cartVo.p_name }</dd>
      </dl>

      <dl id="dl">
      <dt id="dt2">상품금액</dt>
      <dd id="dd2">${cartVo.p_price }&nbsp;원</dd>
      </dl>
      
      <dl id="dl">
      <dt id="dt2">수량</dt>
      <dd id="dd2">${cartVo.p_amount }&nbsp;개</dd>
      </dl>
   </div>

 
   </div>
     </c:forEach>
   </div>
               
               
               
            <%-- <table>
               <tr>
                  <td colspan="2">상품 이름</td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>개수</td>
                  <td>&nbsp;&nbsp;&nbsp;</td>
                  <td>상품 가격(개당)</td>
               </tr>
            
                  <tr>
                     <td><div>
                           <img class="img-fluid4"
                              src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}"
                              alt="..." />
                        </div></td>
                     <td>${cartVo.p_name}</td>
                     <td>&nbsp;&nbsp;&nbsp;</td>
                     <td>${cartVo.p_amount}&nbsp;개</td>
                     <td>&nbsp;&nbsp;&nbsp;</td>
                     <td>${cartVo.p_price}&nbsp;원</td>
                  </tr>
                    </div>
                    
               </c:forEach>
          
            </table> 
           
         </div> --%>
         
         
         <div id="info">
            <b>결제정보</b>
            <br>
            <hr>
            <table>
               <tr>
                  <td id="d_from">결제금액</td>
                  <td id="d_from2"><span id="total_price">${orderVo.pay_price}원</span>
               </tr>
               <tr>
                  <td id="d_from">상품할인</td>
                  <td id="d_from2"><span id="sale_price">0원</span></td>
               </tr>
               <tr>
                  <td id="d_from">결제방법</td>
                  <td id="d_from2">${orderVo.pay_way}</td>
               </tr>
            </table>
         </div>
         <div id="info">
            <!-- 세션값에 있는 midx를 이용해서 주문자의 정보를 가져옴 -->
            <b>주문정보</b>
            <br>
            <hr>
            <table>
               <tr>
                  <td id="d_from">주문번호</td>
                  <td id="d_from2">${orderVo.order_id}</td>
               </tr>
               <tr>
                  <td id="d_from">보내는 분</td>
                  <td id="d_from2">${delVo.d_from}</td>
               </tr>
               <tr>
                  <td id="d_from">결제일시</td>
                  <td id="d_from2">${orderVo.pay_findate}</td>
               </tr>
<%--                <tr>
                  <td id="d_from">결제방법</td>
                  <td id="d_from2">${orderVo.pay_way}</td>
               </tr> --%>
            </table>
         </div>
         <div id="info">
            <!-- 지도 api와 jQuery를 이용해서 정보를 기입하기 -->
            <b>배송정보</b>
            <br>
            <hr>
            <table>
               <tr>       
                  <td id="d_from">받는 분</td>
                  <td id="d_from2">${delVo.d_to}</td>
               </tr>
               <tr>
                  <td id="d_from">휴대폰</td>
                  <td id="d_from2">${delVo.d_tophone}</td>
               </tr>
               <tr>
                  <td id="d_from">주소</td>
                  <td id="d_from2">(${delVo.d_addrcode}) ${delVo.d_addr1} / ${delVo.d_addr2}
                  </td>
               </tr>
               <tr>
                   <td id="d_from">배송상태</td>
                   <td id="d_from2"><span id="${orderVo.order_id}_orderlist_shipping">${delVo.d_status}</span></td>
               </tr>
            </table>
         </div>
         <div id="info_button">
      <%--  <a href="${pageContext.request.contextPath}/refund.do"><input
            type="button" value="환불하기"></a> --%> 
            <a href="${pageContext.request.contextPath}/orderList.do">
            <input type="button" class="btn btn-outline-success" value="주문내역으로 돌아가기"></a>
            <%--  
            <a href="${pageContext.request.contextPath}/index.do">
            <input type="button" value="메인으로 돌아가기"></a> --%>
   </div>
   </div>
   </div>
   </div>
   </div>
   
   </form>
   
   

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
</html>
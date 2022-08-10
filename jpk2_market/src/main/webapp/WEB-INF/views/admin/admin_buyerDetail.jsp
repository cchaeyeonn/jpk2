<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link href="resources/css/mypage_css.css" rel="stylesheet" />
<link href="resources/css/admin.css" rel="stylesheet" />

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
         if("${productVo.d_status}"=="Y"){
            $("#${productVo.order_id}_orderlist_shipping").text("배송 완료");
         }else if("${productVo.d_status}"=="N"){
            $("#${productVo.order_id}_orderlist_shipping").text("배송 준비중");
         }else if("${productVo.d_status}"=="W"){
            $("#${productVo.order_id}_orderlist_shipping").text("배송중");
         }else{
            $("#${productVo.order_id}_orderlist_shipping").text("배송 중 오류");
         }
      })
      </script> 
      
<style>

 #admin_button_1{
     border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
} 
 #admin_button{
   border-bottom: 1px solid #f2f2f2;
}  



</style>
   
</head>
<body>
   <!-- 헤더 연결 -->
   <jsp:include page="../header.jsp"></jsp:include>
   
<!--    <div id="wrap"
      style="padding-top: 239px; margin-left: 414px; margin-right: 401px;">
      <h1 align="center">주문상세내역</h1> -->
      <form>
      <div id="admin_main_inner">
      <div id="admin_center_cate">
   <div id="admin_sub_title">관리자 페이지</div>
      <div id="admin_sub">
      <a style="cursor:pointer;"class="nav-link py-3 px-0 px-lg-3" id="admin_button" onclick=statistics()>매출통계</a>
     <!--  <input type="button" class="nav-link py-3 px-0 px-lg-3" value="매출통계" id="admin_button_1" style="background-color: white; border: none;" onclick=statistics()> -->
      <a href="${pageContext.request.contextPath}/productAdd.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">상품등록</a>
      <a href="${pageContext.request.contextPath}/adminProductList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button_1">등록한 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminOrderList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문내역</a>     <%--<a href="${pageContext.request.contextPath}/orderListDetail.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문상세페이지</a> --%>
      <a href="${pageContext.request.contextPath}/adminProductCheck.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록심사중인 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminMemberList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록된 회원 목록</a> 
      </div>
   </div>
      
            
          <div id="admin_inner">
            <!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
            <h5 style="margin-top: 53.5px;">구매자 리스트 - 주문 상세 내역</h5>
            
            <div id="line"></div>
               <div id="orderlist_inner">
                  <div id="orderlist_inner2">
                  <div id="orderlist_2">
               </div>
               
                  <div id="orderlist_inner2">
      <div id="orderlist_2">
  <%--  <a onClick="location.href='${pageContext.request.contextPath}/orderListDetail.do?order_id=${productVo.order_id}'" id="order_detail">주문내역 상세보기</a> --%>
   </div>
   <div id="orderlist_box">
  
  <div id="orderlist_box_left"></div>
    <img id="orderlist_img" class="img-fluid4" src="${pageContext.request.contextPath}/resources/product_image/${productVo.p_system_filename}" alt="..."  />
   
   <div id="orderlist_content">
      <dl id="dl">
      <dt id="dt">상품명</dt>
      <dd id="dd">${productVo.p_name }</dd>
      </dl>
      
      <dl id="dl">
      <dt id="dt">수량</dt>
      <dd id="dd">${productVo.p_amount }&nbsp;개</dd>
      </dl>
   </div>
   </div>
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
                  <td id="d_from">상품할인</td>
                  <td id="d_from2"><span id="sale_price">0원</span></td>
               </tr>
               <tr>
                  <td id="d_from">결제방법</td>
                  <td id="d_from2">${productVo.pay_way}</td>
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
                  <td id="d_from2">${productVo.order_id}</td>
               </tr>
               <tr>
                  <td id="d_from">보내는 분</td>
                  <td id="d_from2">${productVo.d_from}</td>
               </tr>
               <tr>
                  <td id="d_from">결제일시</td>
                  <td id="d_from2">${productVo.pay_findate}</td>
               </tr>
<%--                <tr>
                  <td id="d_from">결제방법</td>
                  <td id="d_from2">${productVo.pay_way}</td>
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
                  <td id="d_from2">${productVo.d_to}</td>
               </tr>
               <tr>
                  <td id="d_from">휴대폰</td>
                  <td id="d_from2">${productVo.d_tophone}</td>
               </tr>
               <tr>
                  <td id="d_from">주소</td>
                  <td id="d_from2">(${productVo.d_addrcode}) ${productVo.d_addr1} / ${productVo.d_addr2}
                  </td>
               </tr>
               <tr>
              	  <td id="d_from">배송상태</td>
              	  <td id="d_from2"><span id="${productVo.order_id}_orderlist_shipping">${productVo.d_status}</span></td>
               </tr>
            </table>
         </div>
         <div id="info_button">
      <%--  <a href="${pageContext.request.contextPath}/refund.do"><input
            type="button" value="환불하기"></a> --%> 
            <a href="${pageContext.request.contextPath}/adminBuyerList.do?pidx=${productVo.pidx }">
            <input type="button" class="btn btn-outline-success" value="구매자목록으로 돌아가기"></a>            <%--  
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
<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

<style>
#memberinfo_main_inner{
    margin-left: 324px;
    margin-top: 256px;
    min-height: 1040px;
}
   
#service_center_cate{
   
   /* padding-top:200px; */
   width:194px;
   float:left;
}
#service_1{
  padding: 5px 0 35px 1px;
    font-weight: 700;
    font-size: 26px;
    line-height: 35px;
    color: #333;
    letter-spacing: -1px;
    margin-top: -16px;
    
}

#notice_sub{
   border: 1px solid #f2f2f2;
    border-bottom: 1;
    FONT-WEIGHT: 100;
    display: block;
    overflow: hidden;
    font-size: 14px;
    line-height: 20px;
    letter-spacing: -.3px;
    padding: 0px -5px 3px 5px;
    margin-left: -6px;
    margin-right: 16px;
    margin-top: -27px;
}
#open_info_modify{
  border-bottom: 1px solid #f2f2f2;
}
#open_history{
    border-bottom: 1px solid #f2f2f2;
    border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}
#line{
    display: flex;
    flex-direction: row;
    width: 55%;
    -webkit-box-align: center;
    align-items: center;
    border-bottom: 2px solid #198754;
}
 #orderlist_inner{
/*     padding-top: 20px;
    position: relative;
    height: 100%; */
    padding-left: 190px;
} 
#orderlist_inner2{
   width: 875px;
    /* padding: 14px 20px; */
    margin-bottom: 14px;
}
#orderlist_1{
    display: flex;
    padding: 8px 0px 13px;
    -webkit-box-pack: justify;
    justify-content: space-between;
    /* border-bottom: 1px solid rgb(221, 223, 225); */
}
#order_date{
font-size: 16px;
    font-weight: 500;
    line-height: 1.31;
    color: rgb(51, 51, 51);
}
#order_detail{
    align-self: center;
    padding-right: 10px;
    line-height: 1.33;
    font-size: 12px;
    color: rgb(51, 51, 51);
    background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMCIgaGVpZ2h0PSIxMCIgdmlld0JveD0iMCAwIDEwIDEwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj4KICAgICAgICA8ZyBzdHJva2U9IiMzMzMiPgogICAgICAgICAgPHBhdGggZD0iTTAgMEw0IDQgMCA4IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTIxNS4wMDAwMDAsIC02OTkuMDAwMDAwKSB0cmFuc2xhdGUoMTk1LjAwMDAwMCwgNTczLjAwMDAwMCkgdHJhbnNsYXRlKDIzMC4wMDAwMDAsIDk2LjAwMDAwMCkgdHJhbnNsYXRlKDIwLjAwMDAwMCwgMTYuMDAwMDAwKSB0cmFuc2xhdGUoNjMwLjAwMDAwMCwgMTAuMDAwMDAwKSB0cmFuc2xhdGUoMTQ0LjAwMDAwMCwgNS4wMDAwMDApIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K) right center / 10px 10px no-repeat;
    cursor: pointer;
}
#orderlist_box{
    display: flex;
    flex-direction: row;
    -webkit-box-pack: justify;
    /* justify-content: space-between; */
    justify-content: flex-start;
    padding: 14px 0px 16px;
}
#orderlist_box_left{
    display: flex;
    flex-direction: row;
    -webkit-box-align: center;
    align-items: center;
}
#orderlist_img{
width: 60px;
    height: 78px;
    margin-right: 20px;
    background-color: rgb(245, 245, 245);
}
#orderlist_content{
    display: flex;
    flex-direction: column;
}
#dl{
    display: flex;
    padding-top: 6px;
    flex-direction: row;
    color: rgb(0, 0, 0);
    line-height: 20px;
    margin-bottom: -10px;
}
#dt{
    width: 95px;
    line-height: 1.58;
    margin-right: 10px;
    font-size: 13px;
    color: rgb(51, 51, 51);
    font-weight: normal;
    padding-bottom: 10px;
}

#dd{
flex: 1 1 0%;
    font-weight: 600;
    color: rgb(51, 51, 51);
    line-height: 1.36;
    display: -webkit-box;
    overflow: hidden;
    word-break: break-all;
    white-space: normal;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
     width: 275px;
     font-size: 16px;
}
#orderlist_shipping{
    font-size: 16px;
    font-weight: 500;
    text-align: right;
    color: rgb(51, 51, 51);
    margin-right: 20px;
}
#orderlist_box_right{
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-left: 311px;
    }
#info{
padding-top:71px;
font-size:20px;
}
#d_from{
font-size:16px;
/* padding-right: 180px; */
color: rgb(102, 102, 102);
width: 187px;
padding-bottom: 10px;

}
#d_from2{
font-size:16px;
padding-right: 180px;
color: rgb(64, 64, 64);
font-weight: 600;

}
#info_button{
padding: 81px 0px 92px 686px;
}
</style>

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
   
</head>
<body>
   <!-- 헤더 연결 -->
   <jsp:include page="../header.jsp"></jsp:include>
   
<!--    <div id="wrap"
      style="padding-top: 239px; margin-left: 414px; margin-right: 401px;">
      <h1 align="center">주문상세내역</h1> -->
      <form>
      <div id="memberinfo_main_inner">
            
          <div id="cart_inner2">
            <!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
            <h5 style="margin-top: 272px;">주문 상세 내역</h5>
            
            <div id="line"></div>
               <div id="orderlist_inner">
                  <div id="orderlist_inner2">
                  <div id="orderlist_1">
               </div>
               
                  <div id="orderlist_inner2">
      <div id="orderlist_1">
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
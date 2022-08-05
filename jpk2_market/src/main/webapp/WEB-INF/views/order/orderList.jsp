<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
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
#td1{
width:10%;

}
#td2{
width:16%;

}
#td3{
width:20%;

}
#td4{
width:8%;

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
    padding: 14px 20px;
    margin-bottom: 14px;
}
#orderlist_1{
    display: flex;
    padding: 8px 0px 13px;
    -webkit-box-pack: justify;
    justify-content: space-between;
    border-bottom: 1px solid rgb(221, 223, 225);
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
     width: 253px;
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

</style>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />

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
   <div id="memberinfo_main_inner">
   <div id="service_center_cate">
   <div id="service_1">마이페이지</div>
      <div id="notice_sub">   
      <a href="${pageContext.request.contextPath}/memberInfo.do" class="nav-link py-3 px-0 px-lg-3" id="open_info_modify">개인 정보 수정</a>
      <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="open_history">주문 내역</a>
      <a href="" class="nav-link py-3 px-0 px-lg-3" id="open_coupon">쿠폰</a>
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
      
   <div id="orderlist_inner2">
   <div id="orderlist_1">
   <span id="order_date"><b>${orderVo.order_date}</b>&nbsp;(${orderVo.order_id })</span>
   <a onClick="location.href='${pageContext.request.contextPath}/orderListDetail.do?order_id=${orderVo.order_id}'" id="order_detail">주문내역 상세보기</a>
   </div>
   <div id="orderlist_box">
   <div id="orderlist_box_left"></div>
    <img id="orderlist_img" class="img-fluid4" src="${pageContext.request.contextPath}/resources/product_image/${cartVo.p_system_filename}" alt="..."  />

   <div id="orderlist_content">
      <dl id="dl">
      <dt id="dt">상품명</dt>
      <dd id="dd">과일잼</dd>
      </dl>

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
      <span id="orderlist_shipping">배송상태</span>
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
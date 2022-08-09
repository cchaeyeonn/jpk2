<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />
<style>
#admin_main_inner{
   margin-left:317px;
   min-height:1040px;
   padding-top:178px;
}
#admin_center_cate{
   
   /* padding-top:200px; */
   width:194px;
   float:left;
}
#table_button{
   margin-left: 155px;
   
} 
#admin_1{
  padding: 5px 0 35px 1px;
    font-weight: 700;
    font-size: 26px;
    line-height: 35px;
    color: #333;
    letter-spacing: -1px;
    margin-top: 35px;
    
}
#admin_sub{
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
#open_admin{
   border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}
#admin_button{
   border-bottom: 1px solid #f2f2f2;
}

#table_title{
	width:120px;
}
#orderlist_1{
    display: flex;
    padding: 17px 0px 13px;
    -webkit-box-pack: justify;
    justify-content: flex-end;
    border-bottom: 1px solid rgb(221, 223, 225);
    float: right;
    width: 100%;
    margin-top:12px;
}
}
#order_date{
font-size: 16px;
    font-weight: 500;
    line-height: 1.31;
    color: rgb(51, 51, 51);
}
#line{
    display: flex;
    flex-direction: row;
    width: 55%;
    -webkit-box-align: center;
    align-items: center;
    border-bottom: 2px solid #198754;
}
</style>
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
   <div id="admin_center_cate">
   <div id="damin_1">관리자 페이지</div>
      <div id="damin_sub">
      <input type="button" class="nav-link py-3 px-0 px-lg-3" value="통계" id="admin_button_1" style="background-color: white; border: none;" onclick=statistics()>   
      <a href="${pageContext.request.contextPath}/productAdd.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">상품등록페이지</a>
      <a href="${pageContext.request.contextPath}/adminProductList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">내가 등록한 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminOrderList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문내역</a>     <%--<a href="${pageContext.request.contextPath}/orderListDetail.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문상세페이지</a> --%>
      <a href="${pageContext.request.contextPath}/adminProductCheck.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록심사중인 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminMemberList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록된 회원 목록</a> 
      </div>
   </div>
 

    
    <div id="admin_inner">
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
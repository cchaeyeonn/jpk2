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
width:31%;

}
#td2{
width:16%;

}
#td3{
width:20%;

}
#td4{
width:18%;

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

<div id="table_button" style="width:962px;">
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
    </div>
   </div>

</div>



   </form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
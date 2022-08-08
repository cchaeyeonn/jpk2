<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<title>관리자페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script> 
var begin_date = ${begin_date};
var end_date = ${end_date};
</script>
<script src="${pageContext.request.contextPath}/resources/js/statistics.js "></script>	
</head>
<script>
function order(){
	var frm = document.frm;
	frm.action="${pageContext.request.contextPath}/orderListDetail.do";
	frm.method="POST";
	frm.submit();
	return;
}
</script>
<script>
function statistics(){
	var frm = document.frm;
	frm.action="${pageContext.request.contextPath}/statistics.do";
	frm.method="POST";
	frm.submit();
	return;
}
</script>

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
</style>
<body>

<!-- 헤더 연결 -->
<jsp:include page="../header.jsp"></jsp:include> 
       
       
<form name="frmt" action="${pageContext.request.contextPath}/statistics.do" method="post">  
<div id="admin_main_inner">
   <div id="admin_center_cate">
   <div id="admin_1">관리자 페이지</div>
       <div id="admin_sub">   
      <input type="button" class="nav-link py-3 px-0 px-lg-3" value="통계" id="admin_button_1" style="background-color: white; border: none;" onclick=statistics()>
      <a href="${pageContext.request.contextPath}/productAdd.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">상품등록페이지</a>
      <a href="${pageContext.request.contextPath}/adminProductList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">내가 등록한 상품목록</a>
      <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문내역</a>     <%--<a href="${pageContext.request.contextPath}/orderListDetail.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문상세페이지</a> --%>
      <a href="${pageContext.request.contextPath}/adminProductCheck.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록심사중인 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminMemberList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록된 회원 목록</a> 
   </div>
   </div>


<div id="admin_inner">
<h5 style="margin-top: 150px;">매출 통계 <input type="button" value="고객별"><input type="button" value="상품별"></h5>
<div>
  <button name="filterDate" type="button" id="datefilter1" value="1">일주일</button>
  <button name="filterDate" type="button" id="datefilter2" value="2">3개월</button>
  <button name="filterDate" type="button" id="datefilter3" value="3">6개월</button>
  <button name="filterDate" type="button" id="datefilter4"  value="4">1년</button>
</div>
<input type="text" id="datepicker1" name="begin_date"> ~
<input type="text" id="datepicker2" name="end_date">
<input type="submit" value="조회">
<div id="client" style="width:962px;">
   <table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
      <tr>        
         <td>번호</td>
         <td>고객명</td>
         <td>구매수</td>
         <td>판매량</td>
         <td>단가</td>
      <!--<td>누적금액</td>
         <td>평균구매금액</td>-->
      </tr>
      
      <c:forEach items="${statisticsList}" var="statisticsVo" varStatus="status">  
      
     
    
    	<tr id="target">
   			<td id="td1">${statisticsVo.num}</td>
   			<td id="td2">
    			${statisticsVo.member_name }
    		</td>
   	 		<td id="td3">
    			구매수
    		</td>
   			<td id="td4">${statisticsVo.p_amount }</td>
    		<td id="td5">${statisticsVo.p_price }</td>
   		</tr>
   		
     </c:forEach>  
    </table>
    </div>
    <div id="product" style="width:962px;">
    <table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
      <tr>
         
         <td>번호</td>
         <td>상품명</td>
         <td>판매량</td>
         <td>단가</td>
         <td>매출</td>
         <td>매출비중</td>
      </tr>
      
    <%--   <c:forEach items="${orderList}" var="orderVo" varStatus="status">  
      
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
   			<td id="td1">${orderVo.order_id }{$product.p_name}</td>
   	 		<td id="td3">
    			${orderVo.pay_price }
    		</td>
   			<td id="td4"><span id="${orderVo.order_id}_orderpay_check"></span></td>
    		<td id="td5">${orderVo.order_date}</td>
   		</tr>
   		
     </c:forEach>  --%>
    </table>
    </div>
	</div>   

<div id="table_button" style="width:962px;">

</div>
</div>


<div id="adh_inner2">
<input id="adh_button" type="button" class="btn btn-outline-success" value="회원목록보기" onclick="location.href='${pageContext.request.contextPath}/memberList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="메인페이지" onclick="location.href='${pageContext.request.contextPath}/index.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="상품등록페이지" onclick="location.href='${pageContext.request.contextPath}/productAdd.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="내가 등록한 상품목록" onclick="location.href='${pageContext.request.contextPath}/adminProductList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="테스트 페이지1" onclick="location.href='${pageContext.request.contextPath}/orderList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="테스트 페이지2" onclick="order()"><br>
</div> 

<!--
	<a href="/spring/memberList.do">회원목록보기</a><br> 
	<a href="/spring/index.do">메인페이지</a><br>
	<a href="/spring/productAdd.do">상품등록페이지</a>-->
</div>
</form>     
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>

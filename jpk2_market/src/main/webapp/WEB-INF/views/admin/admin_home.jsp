<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />
	<title>관리자페이지</title>
	
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
  padding: 45px 0 35px 1px;
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
       
       
       
<div id="admin_main_inner">
   <div id="admin_center_cate">
   <div id="admin_1">관리자 페이지</div>
      <div id="admin_sub">   
      <input type="button" class="nav-link py-3 px-0 px-lg-3" value="통계" id="admin_button_1" style="background-color: white; border: none;" onclick=statistics()>
      <a href="${pageContext.request.contextPath}/productAdd.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">상품등록페이지</a>
      <a href="${pageContext.request.contextPath}/adminProductList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">내가 등록한 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminOrderList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문내역</a>     <%--<a href="${pageContext.request.contextPath}/orderListDetail.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문상세페이지</a> --%>
      <a href="${pageContext.request.contextPath}/adminProductCheck.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록심사중인 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminMemberList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록된 회원 목록</a> 
   </div>
   </div>


<div id="admin_inner">
    <table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
      <tr>
         <td>번호</td>
         <td>상품명</td>
         <td>판매량</td>
         <td>단가</td>
         <td>매출</td>
      </tr>
    <c:forEach items="${statisticsList}" var="statisticsVo" varStatus="status">  
      	<script>

      	$(function(){
 			
      		 let sum = 0;
      		 let sales =0;
      		 let ratio = 0;
      	    $('input[name*="sales"]').each(function(){
  
      	        if(!isNaN($(this).val())){
  
      	            sum += parseInt($(this).val());
      	            sales = ${statisticsVo.sales}
      	            ratio = sales/sum*100;
      	            ratio = ratio.toFixed(2);
      	        }
      	    });
      	    $("#${statisticsVo.num}_ratio").text(ratio+"%");
      	})
      	</script>
    	<tr id="target">
   			<td id="td1">${statisticsVo.num}</td>
   			<td id="td2">
    			${statisticsVo.p_name }
    		</td>
   	 		<td id="td3">
    			${statisticsVo.p_amount }
    		</td>
   			<td id="td4">${statisticsVo.p_price }</td>
    		<td id="td5">
    		<span>${statisticsVo.sales}원</span>
    		<input name="${statisticsVo.num}_sales" type="hidden" value="${statisticsVo.sales}">
    		</td>
   		</tr>
   		
     </c:forEach> 
    </table>
	<table class="table" id="product_t">
		<tr>
			<td id="table_title">번호</td>
			<td id="table_title">이름</td>
			<!-- <th id="table_title">부제목</th> -->
			<td id="table_title">가격</td>
			<!-- <th id="table_title">판매단위</th>
			<th id="table_title">배송</th>
			<th id="table_title">용량</th>
			<th id="table_title">포장</th>
			<th id="table_title">알러지</th>
			<th id="table_title">유통기한</th>
			<th id="table_title">타입</th>
			<th id="table_title">태그</th> -->
			<td id="table_title">승인 여부</td>
		</tr>
			<c:forEach var="productVo" items="${productList}">
			<%-- <tr>
				<td colspan="4">
					<div id="orderlist_1">
		   				<a style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/admin_productDetail.do?pidx=${productVo.pidx}'" ><b>등록한 상품 상세보기</b></a>
						<a id="inner_detail_button" style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/adminBuyerList.do?pidx=${productVo.pidx}'" >상품을 구매한 사람들</a>
		   				<a id="inner_detail_button" style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/admin_productDetail.do?pidx=${productVo.pidx}'" >&nbsp;&nbsp;등록한 상품 상세보기</a>
		   			</div>
	   			</td>
   			</tr> --%>
   
			<form action="${pageContext.request.contextPath}/adminProductDelyn.do">
				<tr>
					<td id="td_center">${productVo.pidx}</td><td id="td_center">${productVo.p_name }</td><%-- <td>${productVo.p_secondname}</td> --%><td id="td_center">${productVo.p_price }&nbsp;원</td><%-- <td>${productVo.p_unit }</td><td>${productVo.p_delivery }</td>
					<td>${productVo.p_weight }</td><td>${productVo.p_package }</td><td>${productVo.p_allergy }</td><td>${productVo.p_limitdate }</td>
					<td>${productVo.p_type }</td><td>${productVo.p_tag }</td> --%><td id="td_center">${productVo.p_admincheck }</td>
				</tr>
			</form>
		</c:forEach>	
	</table>
</div>   
<div id="table_button" style="width:962px;">
<table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
<tr>
<!-- <td></td> -->
<td id="notice_td1">구분</td>
<td id="notice_td2">제목</td>
<td id="notice_td4">작성자</td>

</tr>
<c:forEach items="${noticeList}" var="noticeVo">
          
<tr>
<%-- <td id="stable_1">${noticeVo.nidx}</td> --%>
<td id="stable_2">[${noticeVo.n_category}]</td>
<td id="stable_3"><a href="/spring/notice_detail.do?nidx=${noticeVo.nidx}">${noticeVo.n_title}</a></td>
<%-- <td id="stable_4">${noticeVo.n_content}</td> --%>
<td>관리자</td>
</tr>
 </c:forEach>
</table>
</div>
</div>
<%-- <div id="admin_home_inner">     

<h3>  관리자 페이지입니다 </h3>

<hr/>

<div id="adh_inner2">
<input id="adh_button" type="button" class="btn btn-outline-success" value="회원목록보기" onclick="location.href='${pageContext.request.contextPath}/memberList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="메인페이지" onclick="location.href='${pageContext.request.contextPath}/index.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="상품등록페이지" onclick="location.href='${pageContext.request.contextPath}/productAdd.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="내가 등록한 상품목록" onclick="location.href='${pageContext.request.contextPath}/adminProductList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="테스트 페이지1" onclick="location.href='${pageContext.request.contextPath}/orderList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="테스트 페이지2" onclick="order()"><br>
</div> --%>

<!--
	<a href="/spring/memberList.do">회원목록보기</a><br> 
	<a href="/spring/index.do">메인페이지</a><br>
	<a href="/spring/productAdd.do">상품등록페이지</a>-->
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>

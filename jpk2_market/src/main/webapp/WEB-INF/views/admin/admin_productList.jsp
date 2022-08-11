<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="resources/css/style_css.css" rel="stylesheet" />
<link href="resources/css/admin.css" rel="stylesheet" />

<title>등록한 상품 목록</title>

<style>

/* #table_button{
   margin-left: 155px;
   
}  */

/* #apl_table_title{
	width: 103px;
    border-bottom: 2px solid #b3b3b3;
}
 */

/* #apl_line{
    display: flex;
    flex-direction: row;
    width: 59%;
    -webkit-box-align: center;
    align-items: center;
    border-bottom: 2px solid #198754;
} */
/* #product_t{
width:95%
} */
/* #td_center{
padding-top: 17px;
} */


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
<script>
function statistics(){
	var frm = document.frm;
	frm.action="${pageContext.request.contextPath}/statistics.do";
	frm.method="POST";
	frm.submit();
	return;
}
</script>
</head>
<body>
<!-- 헤더 연결 -->
<jsp:include page="../header.jsp"></jsp:include> 



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

     <h5 style="margin-top: 52px;">등록한 상품 목록</h5>

   <div id="apl_line"></div>
	
	<div id="table_button"  style="width:944px; margin-top:5px; text-align:center; font-size: 14px;">

	<table class="table" id="product_t">
		<tr>
			<td id="apl_table_title">번호</td>
			<td id="apl_table_title">이름</td>
			<!-- <th id="table_title">부제목</th> -->
			<td id="apl_table_title">가격</td>
			<!-- <th id="table_title">판매단위</th>
			<th id="table_title">배송</th>
			<th id="table_title">용량</th>
			<th id="table_title">포장</th>
			<th id="table_title">알러지</th>
			<th id="table_title">유통기한</th>
			<th id="table_title">타입</th>
			<th id="table_title">태그</th> -->
			<td id="apl_table_title">승인 여부</td>
			<td id="apl_table_title"></td>
			<td id="apl_table_title"></td>
		</tr>
			<c:forEach var="productVo" items="${productList}">
			<%-- <tr>
				<td colspan="4">
					<div id="orderlist_3">
		   				<a style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/admin_productDetail.do?pidx=${productVo.pidx}'" ><b>등록한 상품 상세보기</b></a>
						<a id="inner_detail_button" style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/adminBuyerList.do?pidx=${productVo.pidx}'" >상품을 구매한 사람들</a>
		   				<a id="inner_detail_button" style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/admin_productDetail.do?pidx=${productVo.pidx}'" >&nbsp;&nbsp;등록한 상품 상세보기</a>
		   			</div>
	   			</td>
   			</tr> --%>
   
			<form action="${pageContext.request.contextPath}/adminProductDelyn.do">
				<tr>
					<td id="td_center">${productVo.pidx}</td><td id="td_center">${productVo.p_name }</td><%-- <td>${productVo.p_secondname}</td> --%><td id="td_center"><fmt:formatNumber value="${productVo.p_price }" pattern="#,###"/>&nbsp;원</td><%-- <td>${productVo.p_unit }</td><td>${productVo.p_delivery }</td>
					<td>${productVo.p_weight }</td><td>${productVo.p_package }</td><td>${productVo.p_allergy }</td><td>${productVo.p_limitdate }</td>
					<td>${productVo.p_type }</td><td>${productVo.p_tag }</td> --%><td id="td_center">${productVo.p_admincheck }</td><td><a id="inner_detail_button" style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/adminBuyerList.do?pidx=${productVo.pidx}'" >&nbsp;&nbsp;구매자 리스트</a><br>
		   			<a id="inner_detail_button" style="cursor:pointer; margin-top:20px;"onClick="location.href='${pageContext.request.contextPath}/admin_productDetail.do?pidx=${productVo.pidx}'" >&nbsp;&nbsp;상품 상세보기</a></td><td id="td_center"><input type="hidden" name="pidx" value="${productVo.pidx}"><input style="font-size: 12px;" type="submit" class="btn btn-secondary btn-sm" value="삭제"></a></td>
				</tr>
			</form>
		</c:forEach>	
	</table>
</div>
</div>
</div>

<%-- <div id="ad_productlist_inner">
	<h3>상품목록</h3>
	<hr/>
	<table id="product_t">
		<tr>
			<th>상품번호</th><th>상품이름</th><th>상품부제목</th><th>상품가격</th><th>상품판매단위</th><th>상품배송</th><th>상품용량</th>
			<th>상품포장</th><th>알러지</th><th>상품유통기한</th><th>상품타입</th><th>상품태그</th><th>상품삭제</th>
		</tr>
			<c:forEach var="productVo" items="${productList}">
			<form action="/spring/adminProductDelyn.do">
				<tr>
					<td>${productVo.pidx}</td><td>${productVo.p_name }</td><td>${productVo.p_secondname}</td><td>${productVo.p_price }</td><td>${productVo.p_unit }</td><td>${productVo.p_delivery }</td>
					<td>${productVo.p_weight }</td><td>${productVo.p_package }</td><td>${productVo.p_allergy }</td><td>${productVo.p_limitdate }</td>
					<td>${productVo.p_type }</td><td>${productVo.p_tag }</td><td><input type="hidden" name="pidx" value="${productVo.pidx}"><input type="submit" value="삭제"></a></td>
				</tr>
			</form>
		</c:forEach>	
	</table>
	
	<input id="adl_button" type="button" class="btn btn-outline-success" value="관리자 메인페이지" onclick="location.href='/spring/admin.do'"><br>
	
</div> --%>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
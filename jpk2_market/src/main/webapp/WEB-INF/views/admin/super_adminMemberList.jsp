<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="resources/css/style_css.css" rel="stylesheet" />

<title>등록된 회원 목록</title>

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

</head>
<script>
function statistics(){
	var frm = document.frm;
	frm.action="${pageContext.request.contextPath}/statistics.do";
	frm.method="POST";
	frm.submit();
	return;
}
</script>
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

     <h5 style="margin-top: 52px;">등록된 회원 목록</h5>

   <div id="line"></div>
	
	<div id="table_button"  style="width:913px; margin-top:25px; text-align:center; font-size: 14px;">

	<table id="product_t">
		<tr>
			<th id="table_title">회원번호</th>
			<th id="table_title">이름</th>
			<th id="table_title">아이디</th>
			<th id="table_title">비밀번호</th>
			<th id="table_title">회원등급</th>
			<th id="table_title">전화번호</th>
			<th id="table_title">이메일</th>
			<th id="table_title">가입일시</th>
			<th id="table_title">회원탈퇴여부</th>
			<th id="table_title">회원탈퇴일</th>
			<th id="table_title">회원정지</th>
			<th id="table_title">관리자임명</th>
		</tr>
			<c:forEach var="memberVo" items="${memberList}">
			   <tr>
			   <td colspan="13"><div id="orderlist_1">
   </div></td>
   </tr>
   
			<form>
			<tr>
			<td>${memberVo.midx }</td><td>${memberVo.member_name}</td><td>${memberVo.member_id}</td><td>${memberVo.member_pw}</td>
			<td>${memberVo.member_grade}</td><td>${memberVo.member_phone}</td><td>${memberVo.member_email}</td>
			<td>${memberVo.member_joindate}</td><td>${memberVo.member_delyn}</td><td>${memberVo.member_delyndate}</td>
			<td><input type="button" value="회원정지" onclick="location.href='${pageContext.request.contextPath}/adminMemberDelyn.do?midx=${memberVo.midx}'"></td>
			<td><input type="button" value="관리자임명" onclick="location.href='${pageContext.request.contextPath}/adminMemberUp.do?midx=${memberVo.midx}&member_grade=${memberVo.member_grade}'"></td>
			</tr>
			</form>
		</c:forEach>	
	</table>
</div>
</div>
</div>

<!-- <div id="ad_productlist_inner">
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
	
</div> -->

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
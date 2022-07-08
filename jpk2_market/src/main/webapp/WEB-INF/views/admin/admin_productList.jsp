<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	#ad_productlist_inner{
		min-height:1040px;
		padding-top:230px;
		text-align:center;
}

	#adl_button{
	padding: 20px;
    border-radius: 34px;
    margin: 20px;
	}

</style>
<title>내가 등록한 상품 목록</title>
</head>
<body>
<!-- 헤더 연결 -->
<jsp:include page="../header.jsp"></jsp:include> 

<div id="ad_productlist_inner">
<h3>상품목록</h3>
<hr/>
<table border="2px" width="80%">
	<tr>
		<th>상품이름</th><th>상품가격</th><th>상품판매단위</th><th>상품배송</th><th>상품용량</th>
		<th>상품포장</th><th>알러지</th><th>상품유통기한</th><th>상품타입</th><th>상품태그</th>
	</tr>
<c:forEach var="productVo" items="${productList}">
	<tr>
		<td>${productVo.p_name }</td><td>${productVo.p_price }</td><td>${productVo.p_unit }</td><td>${productVo.p_delivery }</td><td>${productVo.p_weight }</td>
		<td>${productVo.p_package }</td><td>${productVo.p_allergy }</td><td>${productVo.p_limitdate }</td>
		<td>${productVo.p_type }</td><td>${productVo.p_tag }</td>
	</tr>
</c:forEach>	
</table>

<input id="adl_button" type="button" class="btn btn-outline-success" value="관리자 메인페이지" onclick="location.href='/spring/admin.do'"><br>
	
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
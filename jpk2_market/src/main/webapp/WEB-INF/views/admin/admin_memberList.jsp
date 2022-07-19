<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	#ad_memberlist_inner{
		min-height:1040px;
		padding-top:230px;
		text-align:center;
		margin-left:320px;
		margin-right:320px;
}

	#memberlist_table{
		padding-left:285px;
	}

	#adl_button{
	padding: 20px;
    border-radius: 34px;
    margin: 20px;
	}
 
</style>
<title>회원 목록</title>
</head>
<body>
<!-- 헤더 연결 -->
<jsp:include page="../header.jsp"></jsp:include> 

<div id="ad_memberlist_inner">
<h3>회원목록</h3>
<hr/>
<div id="memberlist_table">
<table border="1px" stlye="text-align:center;">
	<tr>
		<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>회원등급</th>
		<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제일</th>
	</tr>
	
 	<c:forEach var="memberVo" items="${memberList}">
		<tr>
			<td>${memberVo.member_id}</td><td>${memberVo.member_name}</td><td>${memberVo.member_id}</td>
			<td>${memberVo.member_pw}</td><td>${memberVo.member_grade}</td><td>${memberVo.member_phone}</td>
			<td>${memberVo.member_joindate}</td><td>${memberVo.member_delyn}</td><td>${memberVo.member_delyndate}</td>
		</tr>
	</c:forEach> 
</table>
</div>

<input id="adl_button" type="button" class="btn btn-outline-success" value="관리자 메인페이지" onclick="location.href='${pageContext.request.contextPath}/admin.do'"><br>
<input id="adl_button" type="button" class="btn btn-outline-success" value="상품아 나와라" onclick="location.href='${pageContext.request.contextPath}/productList.do'"><br>

<!-- 	<a href="/spring/admin.do">관리자 메인페이지</a>
	<a href="/spring/productList.do">상품아 나와라</a> -->
	
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
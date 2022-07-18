<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>관리자페이지</title>
	
<style>
	#admin_home_inner{
		min-height:1040px;
		padding-top:230px;
		text-align:center;
		
	}
	
	#adh_button{
	padding: 20px;
    border-radius: 34px;
    margin: 20px;
	}
	
</style>
</head>
<body>

<!-- 헤더 연결 -->
<jsp:include page="../header.jsp"></jsp:include> 
       
       
<div id="admin_home_inner">       
<h2>Hello, Administrator!</h2>

<h3>  관리자 페이지입니다 </h3>

<hr/>

<div id="adh_inner2">
<input id="adh_button" type="button" class="btn btn-outline-success" value="회원목록보기" onclick="location.href='${pageContext.request.contextPath}/memberList.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="메인페이지" onclick="location.href='${pageContext.request.contextPath}/index.do'"><br>
<input id="adh_button" type="button" class="btn btn-outline-success" value="상품등록페이지" onclick="location.href='${pageContext.request.contextPath}/productAdd.do'"><br>
<input id="adl_button" type="button" class="btn btn-outline-success" value="내가 등록한 상품목록" onclick="location.href='${pageContext.request.contextPath}/adminProductList.do'"><br>
</div>

<!--
	<a href="/spring/memberList.do">회원목록보기</a><br> 
	<a href="/spring/index.do">메인페이지</a><br>
	<a href="/spring/productAdd.do">상품등록페이지</a>-->
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>

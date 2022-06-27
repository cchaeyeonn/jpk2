<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 홈페이지</title>
</head>
<body>

	<h3>갤러리 홈입니다...</h3>
	<a href="/spring/home.do">메인페이지</a>
	<hr/>
	<!--  
	<div><img src="${pageContext.request.contextPath}/resources/upload/${fileName}"/></div>
	<div>${content}</div>
	-->
	
	<c:forEach var="fileName" items="${fileNames}">
		<div style="float:left;margin-left:10px;margin-top:7px;">
			<img src="${pageContext.request.contextPath}/resources/upload/${fileName}" style="width:300px;height:200px;"/>
		</div>
	</c:forEach>
	
</body>
</html>
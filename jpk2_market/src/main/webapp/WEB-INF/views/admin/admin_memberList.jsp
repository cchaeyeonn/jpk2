<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>

<h3>회원목록</h3>
<hr/>

<table border="1px">
	<tr>
		<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>회원등급</th>
		<th>전화번호</th><th>가입일시</th><th>삭제여부</th><th>삭제일</th>
	</tr>
	
	<c:forEach var="memberVo" items="${memberList}">
		<tr>
			<td>${memberVo.member_idx}</td><td>${memberVo.member_name}</td><td>${memberVo.member_id}</td>
			<td>${memberVo.member_pw}</td><td>${memberVo.member_grade}</td><td>${memberVo.member_phone}</td>
			<td>${memberVo.member_regdate}</td><td>${memberVo.member_delyn}</td><td>${memberVo.member_deldate}</td>
		</tr>
	</c:forEach>
</table>
	<a href="/spring/admin.do">관리자 메인페이지</a>
</body>
</html>
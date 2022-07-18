<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
	<h3>회원정보</h3>
	<table border="1px">
		<tr>
			<td>아이디</td>
			<!-- JSP페이지에서는 Controller에서 생성된 Model객체를 EL을 이용해서 사용 가능 -->
			<td>${memberVo.member_id}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${memberVo.member_pw}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${memberVo.member_name}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${memberVo.member_phone}</td>
		</tr>
	</table><p/>
	<a href="${pageContext.request.contextPath}/updateMember.do">정보수정</a>&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/deleteMember.do">회원탈퇴</a>

</body>
</html>
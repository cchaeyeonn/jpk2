<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
#memberInfo_inner{
	min-height:1040px;
	margin-left:315px;
	padding-top:260px;
}

</style>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id="memberInfo_inner">
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
	
	</div>

	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	
</body>
</html>
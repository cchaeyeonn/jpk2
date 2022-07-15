<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<style>

#join_1{
   /*  margin-left: 804px;
    padding-top: 193px;
    width: 100%; */
    
    padding-top:235px;
    /* min-height:1040px; */
   justify-content: center;
   caption-side: bottom;
    border-collapse: collapse;
    display: flex;
    /* justify-content: space-around; */
/*  text-align:center; */
}

 .checkbox_group{
   margin: 0 254px 0 701px;
    padding-block: 20px;
}

#join_button{
   margin: 0 649px 0 812px;
    padding-block: 20px;
} 

</style>
<title>회원 가입</title>

    <!-- 카카오 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- jquery 스크립트 -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <!-- js파일 연결  -->
   <script src="${pageContext.request.contextPath}/resources/js/join.js "></script>
</head>

<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div style="margin: 100px;">
		<br>
		<h3>안녕하세요, ${memberVo.member_name} 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="${pageContext.request.contextPath}/login.do">로그인 페이지로 이동하기</a>
	</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
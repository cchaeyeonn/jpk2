<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/join_login.css" rel="stylesheet" />


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

<div id="joinfin-inner">
<div style="margin: 100px;">
		<br>
		<h3>안녕하세요. ${member_name} 님</h3>
		<br>
		<p>주문하신 상품의</p>
		<br>
		<p>결제가 정상적으로 이루어 졌습니다.</p>
		<br> <a href="${pageContext.request.contextPath}/index.do">메인으로 이동하기</a>
		<a href="${pageContext.request.contextPath}/orderList.do">주문내역 확인하기</a>
	</div>
</div>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<titlef>faq 상세</title>
<style>



</style>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css"> --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	<form name="insertnotice_form" action="/spring/faq_writeProcess.do" method="post">
	   <input type="hidden"  name="fidx" value="${faqVo.fidx} ">
		<div id="notice">
		
		<div id="notice_detail">
		
		<table>
		<tr>
		<td>번호</td><td>${faqVo.fidx}</td>
		<td></td><td>${faqVo.f_category}</td>
		<td>제목</td><td>${faqVo.f_title}</td>
		<td>내용</td><td>${faqVo.f_content}</td>
		</tr>
		
		
		</table>
		</div>
		</div>
		<div id="home_button">
		<a href="/spring/" id="homebutton_1">메인</a>
		<!-- <input type="button" id="homebutton_1" value="메인으로"></a> -->
		<!-- <input type="button" id="btn-modal" value="장바구니"> -->
		


   


	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
<%-- <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script> --%>
</html>
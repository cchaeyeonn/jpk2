<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>


<style>

#notice_inner{
   min-height:1040px;
   padding-top:200px;

}

</style>


</head>
<body>


	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>


	<div id="notice_inner">
	
	<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/notice_board.do">공지사항</a>
	<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/faq_board.do">자주하는 질문</a>
	<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/qna_board.do">1:1 문의</a>
	
	
	
	</div>


	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	
</body>
</html>
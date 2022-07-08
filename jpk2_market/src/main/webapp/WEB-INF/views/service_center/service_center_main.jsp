<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>service_center_main</title>

<style>

#service_center_cate{

	padding-top:200px;
	width:155px;
	float:left;

}

#service_board{
	min-height:1040px;
	float:right;
}

</style>

</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>


	<div id="service_center_cate">
	
		<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/notice_board.do">공지사항</a>
		<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/faq_board.do">자주하는 질문</a>
		<a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/qna_board.do">1:1 문의</a>
	
	</div>
	
	<div id="service_board"></div>
		<jsp:include page="../service_center/notice_board.jsp"></jsp:include>
		<jsp:include page="../service_center/qna_board.jsp"></jsp:include>
		<jsp:include page="../service_center/faq_board.jsp"></jsp:include>
	</div>

	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>



</body>
</html>
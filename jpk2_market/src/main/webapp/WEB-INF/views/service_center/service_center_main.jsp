<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>service_center_main</title>

<style>

#servive_main_inner{
margin-left:200px;
}

#service_center_cate{

	padding-top:200px;
	width:155px;
	float:left;

}
#service_board{
min-height:1040px;
}
#service_board_inner{
}

</style>

</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/service_modal.js"></script>
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/service_modal.css"> --%>

<div id="servive_main_inner">
	<div id="service_center_cate">
	
		<a class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
		<a class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
		<a class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a>
	
	</div>
	
	<div id="service_board">
		<div id="service_board_inner">
		</div>
		
<%--	<div id="notice_modal" style="background-color:gray; margin-left:150px;">
		<h3>공지</h3>
			<jsp:include page="../service_center/notice_board.jsp"></jsp:include>
		</div>
		 <div id="faq_modal" style="background-color:gray; margin-left:150px;">
		<h3>공지2</h3>
			<jsp:include page="../service_center/faq_board.jsp"></jsp:include>
		</div>
		<div id="qna_modal" style="background-color:gray; margin-left:150px;">
		<h3>공지3</h3>
			<jsp:include page="../service_center/qna_board.jsp"></jsp:include>
		</div> --%>
		
		<div>
		<c:import url="/notice_board.do">
            <c:param name="nidx" value="${nidx}"/>
            <c:param name="n_category" value="${n_category}"/>
            <c:param name="n_title" value="${n_title}"/>
            <c:param name="n_content" value="${n_content}"/>
            <c:param name="n_writedate" value="${n_writedate}"/>
            <c:param name="midx_mn" value="${midx_mn}"/>
        </c:import> 
		</div>
		
	</div>
</div>

	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>



</body>
</html>
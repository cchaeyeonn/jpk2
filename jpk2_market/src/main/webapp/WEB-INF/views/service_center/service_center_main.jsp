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
		
		
		<div>
		<!-- 공지사항 연결 -->
		<c:import url="/notice_board.do">
            <c:param name="nidx" value="${nidx}"/>
            <c:param name="n_category" value="${n_category}"/>
            <c:param name="n_title" value="${n_title}"/>
            <c:param name="n_content" value="${n_content}"/>
            <c:param name="n_writedate" value="${n_writedate}"/>
            <c:param name="midx_mn" value="${midx_mn}"/>
        </c:import> 
        
        <!-- faq 연결 -->
        <c:import url="/faq_board.do">
            <c:param name="fidx" value="${fidx}"/>
            <c:param name="f_category" value="${f_category}"/>
            <c:param name="f_title" value="${f_title}"/>
            <c:param name="f_content" value="${f_content}"/>
            <c:param name="f_delyn" value="${f_delyn}"/>
        </c:import> 
        
        <!-- qna 연결 -->
        <c:import url="/qna_board.do">
            <c:param name="qidx" value="${qidx}"/>
            <c:param name="q_category" value="${q_category}"/>
            <c:param name="q_title" value="${q_title}"/>
            <c:param name="q_content" value="${q_content}"/>
            <c:param name="q_writedate" value="${q_writedate}"/>
            <c:param name="q_delyn" value="${q_delyn}"/>
            <c:param name="q_originqiex" value="${q_originqiex}"/>
            <c:param name="q_depth" value="${q_depth}"/>
            <c:param name="q_level_" value="${q_level_}"/>
            <c:param name="q_redate" value="${q_redate}"/>
            <c:param name="q_redelyn" value="${q_redelyn}"/>
            <c:param name="midx_mq" value="${midx_mq}"/>
            
        </c:import> 
		</div>
		
	</div>
</div>

	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>



</body>
</html>
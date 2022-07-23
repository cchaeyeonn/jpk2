<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/service_center.css" rel="stylesheet" />

<title>Faq 글작성</title>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	
		<div id="servive_main_inner">
			<div id="service_center_cate">
	
			<a href="/spring/notice_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
			<a href="/spring/faq_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
			<!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
		
			</div>
			
			<form name="update" method="POST" action="${pageContext.request.contextPath}/faq_updateprocess.do?fidx=${faqVo.fidx}">
			
			<table class="table table-hover">
			
			<tr>
			<td>카테고리</td><td></td>
			</tr>
			
			<tr>
			<td>제목</td><td><input name="f_title" value="${faqVo.f_title}" type="text" ></td>
			</tr>
			
			<tr>
			<td>내용</td><td><input name="f_content" value="${faqVo.f_content}" type="text" ></td>
			</tr>
			
			
			</table>
			<input type="submit" class="btn btn-outline-info" value="완료"/>
			<input type="reset" class="btn btn-outline-into" value="리셋"/>
			</form>
			
			<%-- <div>카테고리</div>
			<div>제목 :</div>
			<div><input name="f_title" value="${faqVo.f_title}" type="text" ></div>
			<div>내용 :</div>
			<div><input name="f_content" value="${faqVo.f_content}" type="text" ></div>
			
			<div> --%>
			
		</div>
		
	
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
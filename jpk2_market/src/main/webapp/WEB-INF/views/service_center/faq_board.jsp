<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/service_center.css" rel="stylesheet" />


<title>자주하는 질문</title>


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
	
	
<div id="faq_inner">
<h3>자주하는 질문</h3>
	
<div id="table_button">
<table border="1" style="text-align:center" class="table table-hover">
<tr>
<td>번호</td>
<td>카테고리</td>
<td>제목</td>
<td>내용</td>

</tr>
<c:forEach items="${faqList}" var="faqVo">
          
<tr>
<td id="stable_1">${faqVo.fidx}</td>
<td id="stable_2">${faqVo.f_category}</td>
<td id="stable_3"><a href="/spring/faq_detail.do?fidx=${faqVo.fidx}">${faqVo.f_title}</a></td>
<td id="stable_4">${faqVo.f_content}</td>
</tr>
 </c:forEach>
</table>


<% 
   long grade = 0L;
  if (session.getAttribute("member_grade") != null) {grade = (long)session.getAttribute("member_grade");}
  if ( grade >= 1){out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline;' href='"+request.getContextPath()+"/faq_wirte.do'>글쓰기</a>");}
  
  %>
</div>
</div>
</div>
	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>
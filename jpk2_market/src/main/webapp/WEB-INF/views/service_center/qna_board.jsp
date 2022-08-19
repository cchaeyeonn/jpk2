<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

<style>

	#service_center_cate{
	
		padding-top:200px;
		width:155px;
		float:left;
	
	}
	
	#servive_main_inner{
	margin-left:200px;
	min-height:1040px;
	}
	
	#qna_inner{
	padding-top:200px; 
	}
	
	 #table_button{
	margin-left:155px;
	} 

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>
	
<div id="servive_main_inner">
	<div id="service_center_cate">
	
		<a href="${pageContext.request.contextPath}/notice_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/faq_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
		<a href="${pageContext.request.contextPath}/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a>
	
	</div>
	
	
<div id="qna_inner">
<h3>1:1 문의</h3>
</div>	

<div id="table_button">
<table border="1" class="table table-hover">
<tr>
<td>번호</td>
<td>카테고리</td>
<td>제목</td>
<td>내용</td>

</tr>
<c:forEach items="${qnaList}" var="qnaVo">
          
<tr>
<td>${qnaVo.qidx}</td>
<td>${qnaVo.q_category}</td>
<td>${qnaVo.q_title}</td>
<td>${qnaVo.q_content}</td>
</tr>
 </c:forEach>
</table>

<% 
   long grade = 0L;
  if (session.getAttribute("member_grade") != null) {grade = (long)session.getAttribute("member_grade");}
  if ( grade == 0){out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/qna_write.do'>글쓰기</a>");}%>
  
  
  </div>
  </div>
  <!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
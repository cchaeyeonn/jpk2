<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

<style>


</style>

</head>
<body>


<div id="qna_inner">
<h3>1:1 문의</h3>
</div>	

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
  
</body>
</html>
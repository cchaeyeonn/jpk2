<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>


<style>
#notice_inner{
/* 	min-height:1040px;*/
	padding-top:200px; 
	}
</style>



</head>
<body>

<div id="notice_inner">
<h3>공지사항</h3>
</div>	

<table border="1">
<tr>
<td>번호</td>
<td>카테고리</td>
<td>제목</td>
<td>내용</td>

</tr>
<c:forEach items="${noticeList}" var="noticeVo">
          
<tr>
<td>${noticeVo.nidx}</td>
<td>${noticeVo.n_category}</td>
<td>${noticeVo.n_title}</td>
<td>${noticeVo.n_content}</td>
</tr>
 </c:forEach>
</table>

<% 
   long grade = 0L;
  if (session.getAttribute("member_grade") != null) {grade = (long)session.getAttribute("member_grade");}
  if ( grade >= 1){out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/notice_wirte.do'>글쓰기</a>");}%>

	

</body>
</html>
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

	

</body>
</html>
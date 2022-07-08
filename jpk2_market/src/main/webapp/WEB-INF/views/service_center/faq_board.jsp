<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>

<style>

#faq_inner{
/*    min-height:1040px;
   padding-top:200px; */

}

</style>

</head>
<body>

<div id="faq_inner">
<h3>자주하는 질문</h3>
</div>	

<table border="1">
<tr>
<td>번호</td>
<td>카테고리</td>
<td>제목</td>
<td>내용</td>

</tr>
<c:forEach items="${faqList}" var="faqVo">
          
<tr>
<td>${faqVo.fidx}</td>
<td>${faqVo.f_category}</td>
<td>${faqVo.f_title}</td>
<td>${faqVo.f_content}</td>
</tr>
 </c:forEach>
</table>

</body>
</html>
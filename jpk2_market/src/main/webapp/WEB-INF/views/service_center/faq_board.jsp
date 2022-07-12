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
   margin-left:154px;

}
#ftable_1{
	width:50px;
}

#ftable_2{
	width:200px;
}

#ftable_3{
	width:300px;
}

#ftable_4{
	width:400px;
}

</style>

</head>
<body>

<div id="faq_inner">
<h3>자주하는 질문</h3>
	

<table border="1" style="text-align:center">
<tr>
<td>번호</td>
<td>카테고리</td>
<td>제목</td>
<td>내용</td>

</tr>
<c:forEach items="${faqList}" var="faqVo">
          
<tr>
<td id="ftable_1">${faqVo.fidx}</td>
<td id="ftable_2">${faqVo.f_category}</td>
<td id="ftable_3"><a href="/spring/faq_detail.do?fidx=${faqVo.fidx}">${faqVo.f_title}</a></td>
<td id="ftable_4">${faqVo.f_content}</td>
</tr>
 </c:forEach>
</table>
</div>

<% 
   long grade = 0L;
  if (session.getAttribute("member_grade") != null) {grade = (long)session.getAttribute("member_grade");}
  if ( grade >= 1){out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/faq_wirte.do'>글쓰기</a>");}
  
  %>

</body>
</html>
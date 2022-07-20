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
   padding-top:200px; 
   margin-left:154px;*/

}

	#service_center_cate{
	
		padding-top:200px;
		width:155px;
		float:left;
	
	}
	
	#servive_main_inner{
	margin-left:200px;
	min-height:1040px;
	}
	
	#faq_inner{
	padding-top:200px; 
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

 
#table_button{
	margin-left:155px;
} 

</style>

</head>
<body>


	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>
	
<div id="servive_main_inner">
	<div id="service_center_cate">
	
		<a href="/spring/notice_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
		<a href="/spring/faq_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
		<a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a>
	
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
<td id="ftable_1">${faqVo.fidx}</td>
<td id="ftable_2">${faqVo.f_category}</td>
<td id="ftable_3"><a href="/spring/faq_detail.do?fidx=${faqVo.fidx}">${faqVo.f_title}</a></td>
<td id="ftable_4">${faqVo.f_content}</td>
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
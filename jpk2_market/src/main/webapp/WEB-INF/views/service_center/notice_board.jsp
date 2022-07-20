<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>


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
	
#notice_inner{
/* 	min-height:1040px;*/
	padding-top:200px; 
	/* margin-left: 155px; */
	}
	
	
	
 #table_button{
	margin-left: 155px;
} 
	
#ntable_1{
	width:50px;
}

#ntable_2{
	width:200px;
}

#ntable_3{
	width:300px;
}

#ntable_4{
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
	
<div id="notice_inner">
<h3>공지사항</h3>
</div>	

<div id="table_button">
<table border="1" style="text-align:center" class="table table-hover">
<tr>
<td></td>
<td>구분</td>
<td>제목</td>
<td>내용</td>

</tr>
<c:forEach items="${noticeList}" var="noticeVo">
          
<tr>
<td id="ntable_1">${noticeVo.nidx}</td>
<td id="ntable_2">[${noticeVo.n_category}]</td>
<td id="ntable_3"><a href="/spring/notice_detail.do?nidx=${noticeVo.nidx}">${noticeVo.n_title}</a></td>
<td id="ntable_4">${noticeVo.n_content}</td>
</tr>
 </c:forEach>
</table>

<% 
   long grade = 0L;
  if (session.getAttribute("member_grade") != null) {grade = (long)session.getAttribute("member_grade");}
  if ( grade >= 1){out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline;' href='"+request.getContextPath()+"/notice_write.do'>글쓰기</a>");}%>

</div>	

</div>
	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	
</body>
</html>
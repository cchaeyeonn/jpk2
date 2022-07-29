<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/service_center.css" rel="stylesheet" />


<title>공지사항</title>
<style>
#service_1{
  padding: 5px 0 35px 1px;
    font-weight: 700;
    font-size: 26px;
    line-height: 35px;
    color: #333;
    letter-spacing: -1px;
    margin-top: 35px;
}

#notice_sub{
	border: 1px solid #f2f2f2;
    border-bottom: 1;
    FONT-WEIGHT: 100;
    display: block;
    overflow: hidden;
    font-size: 14px;
    line-height: 20px;
    letter-spacing: -.3px;
    padding: 0px -5px 3px 5px;
    margin-left: -6px;
    margin-right: 16px;
    margin-top: -27px;
}
#open_notice{
	border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}
#open_faq{
	border-bottom: 1px solid #f2f2f2;
}
#td1{
width:10%;
}
#td2{
width:16%;
}
#td3{
width:20%;
}
#td4{
width:3%;
}


</style>



</head>
<body>
	<!-- 헤더 연결 -->
	<jsp:include page="../header.jsp"></jsp:include>
	
<div id="servive_main_inner">
	<div id="service_center_cate">
	<div id="service_1">고객센터</div>
		<div id="notice_sub">	
		<a href="${pageContext.request.contextPath}/notice_board.do" class="nav-link py-3 px-0 px-lg-3" id="open_notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/faq_board.do" class="nav-link py-3 px-0 px-lg-3" id="open_faq">자주하는 질문</a>
		<!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
		</div>
	</div>


<div id="notice_inner">
<h5 style="margin-top: 52px;">공지사항</h5>
</div>	

<div id="table_button" style="width:962px;">
<table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
<tr>
<!-- <td></td> -->
<td id="td1">구분</td>
<td id="td2">제목</td>
<!-- <td id="td3">내용</td> -->
<td id="td4">작성자</td>

</tr>
<c:forEach items="${noticeList}" var="noticeVo">
          
<tr>
<%-- <td id="stable_1">${noticeVo.nidx}</td> --%>
<td id="stable_2">[${noticeVo.n_category}]</td>
<td id="stable_3"><a href="/spring/notice_detail.do?nidx=${noticeVo.nidx}">${noticeVo.n_title}</a></td>
<<<<<<< HEAD
<%-- <td id="stable_4">${noticeVo.n_content}</td> --%>
<td>${noticeVo.member_name}</td>
=======
<td id="stable_4">${noticeVo.n_content}</td>
<td>관리자</td>
>>>>>>> branch 'master' of https://github.com/cchaeyeonn/jpk2.git
</tr>
 </c:forEach>
</table>

<% 
   long grade = 0L;
  if (session.getAttribute("member_grade") != null) {grade = (long)session.getAttribute("member_grade");}
  if ( grade >= 1){out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline; float: right;' href='"+request.getContextPath()+"/notice_write.do'>글쓰기</a>");}%>

</div>	

</div>
	<!-- 푸터 연결 -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
	
</body>
</html>
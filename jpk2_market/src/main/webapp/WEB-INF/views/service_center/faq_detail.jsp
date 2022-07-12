<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<titlef>faq 상세</title>
<style>
   
    #faq_detail{
    padding-top:200px;
    margin-left:320px;
    margin-top:100px;
    min-height:1040px;
    }
    
    #fd_table1{
    	width:200px;
    }
    
    #fd_table2{
    	width:200px;
    }
    
    #fd_table3{
    	width:400px;
    	    }
    
    #fd_table4{
    	width:600px;
    }
    


</style>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css"> --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	<form name="insertfaq_form" action="/spring/faq_writeProcess.do" method="post">
	   <input type="hidden"  name="fidx" value="${faqVo.fidx} ">
		<div id="faq">
		
		<div id="faq_detail">
		
		<table id="faq_table">
		<tr>
		<td id="fd_table1">번호</td><td>${faqVo.fidx}</td>
		<td id="fd_table2"></td><td>${faqVo.f_category}</td>
		<td id="fd_table3">제목</td><td>${faqVo.f_title}</td>
		<td id="fd_table4">내용</td><td>${faqVo.f_content}</td>
		</tr>
		
		
		</table>
		</div>
		</div>
		<div id="home_button">
		<a href="/spring/" id="homebutton_1">메인</a>
		<!-- <input type="button" id="homebutton_1" value="메인으로"></a> -->
		<!-- <input type="button" id="btn-modal" value="장바구니"> -->
		


   


	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
<%-- <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script> --%>
</html>
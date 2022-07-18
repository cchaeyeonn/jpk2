<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세</title>
<style>

/* 	#product{
		padding-left:10%;
		padding-right:10%; 
		height:1000px; 
		padding-top:260px;
		}
	#product_img{
			float:left; 
			width:50%; 
			height:50%;
			}
	#product_detail{
			float:right; 
			width:50%; 
			height:50%;
			}
	#home_button{
			padding-left:10%; 
			padding-right:10%; 
			text-align:center; 
			float:center;
			}
    .button box{
            display : inline-block;
    
    
    } */
    
    #notice_detail{
    padding-top:200px;
    margin-left:320px;
    margin-top:100px;
    min-height:1040px;
    }
    
    #nd_table1{
    	width:150px;
    }

    

    

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css"> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/cart.js "></script> --%>

</head>
<body>


    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	<form name="insertnotice_form" action="/spring/notice_writeProcess.do" method="post">
	   <input type="hidden"  name="nidx" value="${noticeVo.nidx} ">
		<div id="notice">
		
			<div id="notice_detail">
			
				<table id="notice_table">
				<tr>
				<td id="nd_table1">번호</td><td>${noticeVo.nidx}</td>
				</tr>
				<tr>
				<td id="nd_table1">구분</td><td>[${noticeVo.n_category}]</td>
				</tr>
				<tr>
				<td id="nd_table1">제목</td><td>${noticeVo.n_title}</td>
				</tr>
				<tr>
				<td id="nd_table1">내용</td><td>${noticeVo.n_content}</td>
				</tr>
				<tr>
				<td><a href="/spring/" id="homebutton_1">메인</a>
				<c:if test="${member_grade != null}">
				<c:if test="${member_grade >= 1}">
					<a class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline;' href='/spring/notice_update.do?nidx=${noticeVo.nidx}'>수정하기</a>
					
					<a class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline;' href='/spring/notice_delyn.do?nidx=${noticeVo.nidx}'>삭제하기</a>
				</c:if>
		    </c:if>
				
				</td>
				</tr>
				
				
				</table>
				
			<!-- class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline;' -->


			
			</div>
		</div>


   


	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
<%-- <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script> --%>
</html>
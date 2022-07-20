<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faq 글작성</title>
<style>

/* 	#product{
		padding-left:10%;
		padding-right:10%; 
		height:1500px; 
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
			} */
			
	#faq_main_inner{
		min-height:1040px;
		padding-top:300px;
		margin-left:320px;
	}
			
</style>
</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	
		<div id="faq_main_inner">
			
			<form name="update" method="POST" action="${pageContext.request.contextPath}/faq_updateprocess.do?fidx=${faqVo.fidx}">
			
			<div>카테고리</div>
			<div>제목 :</div>
			<div><input name="f_title" value="${faqVo.f_title}" type="text" ></div>
			<div>내용 :</div>
			<div><input name="f_content" value="${faqVo.f_content}" type="text" ></div>
			
			<div>
			<input type="submit" class="btn btn-outline-info" value="완료"/>
			<input type="reset" class="btn btn-outline-into" value="리셋"/>
			</div>
			</form>
			
			
			
		</div>
		
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
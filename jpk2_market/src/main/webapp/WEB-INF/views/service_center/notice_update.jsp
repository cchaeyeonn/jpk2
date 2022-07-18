<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글작성</title>
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
			
	#notice_main_inner{
		min-height:1040px;
		padding-top:300px;
		margin-left:320px;
	}
			
</style>
</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	
		<div id="notice_main_inner">
			
			<form name="update" method="POST" action="${pageContext.request.contextPath}/notice_updateprocess.do?nidx=${noticeVo.nidx}">
			
			<div>카테고리</div>
			<div>제목 :</div>
			<div><input name="n_title" value="${noticeVo.n_title}" type="text" ></div>
			<div>내용 :</div>
			<div><input name="n_content" value="${noticeVo.n_content}" type="text" ></div>
			
			<div>
			<input type="submit" class="btn btn-outline-info" value="완료"/>
			<input type="reset" class="btn btn-outline-into" value="리셋"/>
			</div>
			</form>
			
			<%-- <form name="notice_modify_Form" action="/spring/notice_modifyProcess.do" method="post" >
			<table>
			<tr>
				<td>카테고리</td>
				<td><select name="n_category">
					<option value="배송">배송</option>
					<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
			<td>제목</td>
			<td><input type="text" name="n_title">${noticeVo.n_title}</td>
			</tr>
			<tr>
			<td>내용</td>
			<td><input type="text" name="n_content">${noticeVo.n_content}</td>
			</tr>
			<tr>
			<td><input type="submit" value="작성하기"></td>
			</tr>
			</table> --%>
			
		</div>
		
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
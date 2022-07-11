<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문 글작성</title>
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
		padding-top:500px;
	}
			
</style>
</head>
<body>
    <form name="faq_write_Form" action="/spring/faq_writeProcess.do" method="post" >
    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	
		<div id="faq_main_inner">
			<table><!-- enctype="multipart/form-data" -->
			<tr>
				<td>카테고리</td>
				<td><select name="f_category">
					<option value="배송">배송</option>
					<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
			<td>제목</td>
			<td><input type="text" name="f_title"></td>
			</tr>
			<tr>
			<td>내용</td>
			<td><input type="text" name="f_content"></td>
			</tr>
			
			</table>
		</div>
		<div id="faq_write_button"><input type="submit" value="작성하기"></div><p/>
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
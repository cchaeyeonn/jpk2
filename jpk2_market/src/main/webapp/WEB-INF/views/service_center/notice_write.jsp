<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		padding-top:500px;
	}
			
</style>
</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	
		<div id="notice_main_inner">
			
			<form name="notice_write_Form" action="/spring/notice_wirteProcess.do" method="post" >
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
			<td><input type="text" name="n_title"></td>
			</tr>
			<tr>
			<td>내용</td>
			<td><input type="text" name="n_content"></td>
			</tr>
			</table>
			
		</div>
		<div id="notice_write_button"><input type="submit" value="작성하기"></div><p/>
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
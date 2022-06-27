<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 페이지</title>
</head>
<body>
	<h3>파일업로드</h3>
	
	<form method="post" action="/spring/fileUploadProcess.do" enctype="multipart/form-data">
		<table border="1px">
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="file" name="uploadFile" multiple/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="파일업로드"/>&nbsp;|&nbsp;
					<input type="reset" value="취소"/>&nbsp;|&nbsp;
					<input type="button" value="메인페이지" onclick="document.location.href='/spring/home.do'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
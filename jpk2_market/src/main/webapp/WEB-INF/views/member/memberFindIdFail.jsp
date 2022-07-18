<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>아이디찾기</title>
<style>
	#findId {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findId_1 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findId_2 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findId_3 {
	margin:auto; 
	padding:0px 0px 0px 0px; 
	float:center; 
	Width:25%; 
	text-align:right; 
	font-size:8px;
	}
	#findId_4 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findId_content {
	padding-top:260px;
	min-height:1040px;
	}
</style>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="findId_content">
<form name="frm">
<div id="findId">
<div id="findId_1">
일치하는 정보가 존재하지 않습니다.
</div>
<div id="findId_2">
다시 확인하시고 입력해주시기 바랍니다.
</div>
<div id="findId_3">
</div>
<div id="findId_4">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='findId.do'">
<input type="button" class="btn btn-outline-success" value="홈으로" onclick="location.href='index.do'">
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
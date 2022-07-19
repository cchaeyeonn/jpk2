<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>비밀번호찾기</title>
<style>
	#findPw {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findPw_1 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findPw_2 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findPw_3 {
	margin:auto; 
	padding:0px 0px 0px 0px; 
	float:center; 
	Width:25%; 
	text-align:right; 
	font-size:8px;
	}
	#findPw_4 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#findPw_content {
	padding-top:260px;
	min-height:1040px;
	}
</style>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="findPw_content">
<form name="frm">
<div id="findPw">
<div id="findPw_1">
일치하는 정보가 존재하지 않습니다.
</div>
<div id="findPw_2">
다시 확인하시고 입력해주시기 바랍니다.
</div>
<div id="findPw_3">
</div>
<div id="findPw_4">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='findPw.do'">
<input type="button" class="btn btn-outline-success" value="홈으로" onclick="location.href='index.do'">
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
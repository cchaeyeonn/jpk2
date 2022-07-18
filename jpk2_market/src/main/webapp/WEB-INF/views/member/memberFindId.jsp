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

<script>
  function check(){  
  var fm = document.frm;   
  if (fm.member_name.value==""){
  		alert("이름을 입력해주세요");
  		fm.member_name.focus();
  		return;
  }else if (fm.member_email.value==""){
  		alert("이메일을 입력해주세요");
  		fm.member_email.focus();
  		return;
  }
  		fm.action = "<%=request.getContextPath()%>/findIdProcess.do";
  		fm.method = "post";
  		fm.submit();  
  
    return;
  }  
  </script>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="findId_content">
<form name="frm">
<div id="findId">
<div id="findId_1">
정보를 입력해 주세요
</div>
<div id="findId_2">
<p><input type="text" class="form-control" name="member_name" size="30" placeholder="이름을 입력해주세요"></p>
<p><input type="text" class="form-control" name="member_email" size="30" placeholder="이메일주소를 입력해주세요"></p>
</div>
<div id="findId_3">
</div>
<div id="findId_4">
<input type="button" class="btn btn-outline-success" value="확인" onclick="check();">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='index.do'">
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
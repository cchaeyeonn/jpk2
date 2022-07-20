<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>비밀번호 변경</title>
<style>
	#updatePw {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#updatePw_1 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#updatePw_2 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#updatePw_3 {
	margin:auto; 
	padding:0px 0px 0px 0px; 
	float:center; 
	Width:25%; 
	text-align:right; 
	font-size:8px;
	}
	#updatePw_4 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#updatePw_content {
	padding-top:260px;
	min-height:1040px;
	}
</style>

<script>
  function check(){  
  var fm = document.frm;   
  if (fm.now_pw.value==""){
  		alert("비밀번호를 입력해주세요");
  		fm.now_pw.focus();
  		return;
  }else if (fm.member_pw1.value==""){
  		alert("변경할 비밀번호를 입력해주세요");
  		fm.member_pw1.focus();
  		return;
  }else if (fm.member_pw2.value==""){
  		alert("변경할 비밀번호를 입력해주세요");
  		fm.member_pw2.focus();
  		return;
  }else if (fm.member_pw1.value!=fm.member_pw2.value){
	  	alert("비밀번호가 일치하지않습니다");
	  	fm.member_pw1.value="";
	  	fm.member_pw2.value="";
	  	fm.member_pw1.focus();
	  	return;
  }
	  	
  		fm.action = "<%=request.getContextPath()%>/updatePwProcess.do";
  		fm.method = "post";
  		fm.submit();  
  
    return;
  }  
  </script>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="updatePw_content">
<form name="frm">
<div id="updatePw">
<div id="updatePw_1"> 현재 비밀번호
<p><input type="text" class="form-control" name="now_pw" size="30" placeholder="현재 비밀번호를 입력해주세요"></p>
</div>
<div id="updatePw_2"> 변경할 비밀번호
<p><input type="text" class="form-control" name="member_pw1" size="30" placeholder="변경할 비밀번호를 입력해주세요"></p>
<p><input type="text" class="form-control" name="member_pw2" size="30" placeholder="변경할 비밀번호를 다시 입력해주세요"></p>
</div>
<div id="updatePw_3">
</div>
<div id="updatePw_4">
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
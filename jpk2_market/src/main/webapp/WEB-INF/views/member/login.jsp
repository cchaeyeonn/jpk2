<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#login {margin:auto; padding:0px 20px 0px 20px; float:center; Width:60%; text-align:center;}
	#login_1 {margin:auto; padding:0px 20px 0px 20px; float:center; Width:60%; text-align:center;}
	#login_2 {margin:auto; padding:0px 20px 0px 20px; float:center; Width:60%; text-align:center;}
	#login_3 {margin:auto; padding:0px 0px 0px 0px; float:center; Width:25%; text-align:right; font-size:8px;}
	#login_4 {margin:auto; padding:0px 20px 0px 20px; float:center; Width:60%; text-align:center;}
</style>
<script>
  function check(){  
  var fm = document.frm;   
  if (fm.memberId.value==""){
  		alert("아이디를 입력해주세요");
  		fm.memberId.focus();
  		return;
  }else if (fm.memberPw.value==""){
  		alert("비밀번호를 입력해주세요");
  		fm.memberPwd.focus();
  		return;
  }
  		fm.action = "";
  		fm.method = "post";
  		fm.submit();  
  
    return;
  }  
  </script>
</head>
<body>
<form name="frm">
<div id="login">
<div id="login_1">
로그인
</div>
<div id="login_2">
<p><input type="text" name="memberId" size="30" placeholder="아이디를 입력해주세요"></p>
<p><input type="password" name="memberPw" size="30" placeholder="비밀번호를 입력해주세요"></p>
</div>
<div id="login_3">
<!-- <p><input type="button" value="아이디찾기" onclick=""> 
|
<input type="button" value="비밀번호찾기" onclick=""></p> -->
<a>아이디 찾기</a> | <a>비밀번호 찾기</a></div>
<div id="login_4">
<p><input type="button" value="로그인" onclick="check();"></p>
<input type="button" value="회원가입" onclick="">
</div>
</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
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
</HEAD>
<BODY>
<form name="frm">
<div>
로그인
</div>
<div>
<p><input type="text" name="memberId" size="30" placeholder="아이디를 입력해주세요"></p>
<input type="password" name="memberPw" size="30" placeholder="비밀번호를 입력해주세요">
<!-- <p><input type="button" value="아이디찾기" onclick=""> 
|
<input type="button" value="비밀번호찾기" onclick=""></p> -->
<p><a>아이디찾기</a>|<a>비밀번호찾기</a></p>
</div>
<div>
<input type="button" value="로그인" onclick="check();"> 
<input type="button" value="회원가입" onclick="">
</div>
</form>
</body>
</html>
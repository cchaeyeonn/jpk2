<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/join_login.css" rel="stylesheet" />


<title>로그인</title>
<style>
/* 	#login_inner{
		margin-left:33%;
		margin-right:33%;
	}

	#login_1 {
	text-align:center;
	}

	#login_3 {
	text-align:right; 
	}
	#login_4 {
	text-align:center;
	}
	#login_content {
	padding-top:260px;
	min-height:1040px;
	} */
</style>

<script>
  function check(){  
  var fm = document.frm;   
  if (fm.member_id.value==""){
  		alert("아이디를 입력해주세요");
  		fm.member_id.focus();
  		return;
  }else if (fm.member_pw.value==""){
  		alert("비밀번호를 입력해주세요");
  		fm.member_pw.focus();
  		return;
  }
  		fm.action = "<%=request.getContextPath()%>/loginProcess.do";
  		fm.method = "post";
  		fm.submit();  
  
    return;
  }  
  </script>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="login_content">
	<div id="login_inner">
		<form name="frm">
			<div id="login">
				<div id="login_1">
					<h3>로그인</h3>
				</div>
				<div id="login_2">
					<p><input type="text" class="form-control" name="member_id" size="30" placeholder="아이디를 입력해주세요"></p>
					<p><input type="password" class="form-control" name="member_pw" size="30" placeholder="비밀번호를 입력해주세요"></p>
				</div>
				<div id="login_3">
					<!-- <p><input type="button" value="아이디찾기" onclick=""> 
					|
					<input type="button" value="비밀번호찾기" onclick=""></p> -->
					<a href="findId.do">아이디 찾기</a> | <a href="findPw.do">비밀번호 찾기</a>
				</div>
				<div id="login_4">
					<input type="button" class="btn btn-outline-success" value="로그인" onclick="check();">
					<input type="button" class="btn btn-outline-success" value="회원가입" onclick="location.href='join.do'"><p/>
				</div>
			</div>
		</form>
	</div>
</div> 

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
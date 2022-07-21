<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>로그인</title>
<style>
	#login {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#login_1 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#login_2 {
	margin:auto; 
	padding:17px 20px 0px 337px; 
	float:center; 
	Width:60%; 
	text-align:center;
	margin-left: 65px;
	}
	#login_3 {
	margin:auto; 
	padding:10px 0px 25px 0px; 
	float:center; 
	Width:20%; 
	text-align:right; 
	font-size:18px;
	}
	#login_4 {
	margin:auto; 
	padding:0px 20px 0px 20px; 
	float:center; 
	Width:60%; 
	text-align:center;
	}
	#login_content {
	padding-top:260px;
	min-height:1040px;
	}
</style>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script>
$(function() {
$('#login').click(function() {
		var captcha = 1;
		$.ajax({
            url: '/spring/verifyRecaptcha.do',
            type: 'post',
            data: {
                recaptcha: $("#g-recaptcha-response").val()
            },
            success: function(data) {
                switch (data) {
                    case 0:
                        console.log("자동 가입 방지 봇 통과");
                        captcha = 0;
                		break;
                    case 1:
                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                        break;
                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		break;
                }
            }
        });
		if(captcha != 0) {
			return false;
		} 
});
});
</script>
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
<a href="findId.do">아이디 찾기</a> | <a href="findPw.do">비밀번호 찾기</a></div>
<div id="login_4">

<input type="button" class="btn btn-outline-success" id="login" value="로그인" onclick="check();">
<input type="button" class="btn btn-outline-success" value="회원가입" onclick="location.href='join.do'"><p/>
<div class="g-recaptcha" data-sitekey="6LeBRQkhAAAAACTyIP4B7vc9o1dUHQwpBd80IsGn"></div>
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
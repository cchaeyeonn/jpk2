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
    <!-- jquery 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).on('click','#trigger',function(){if($("#member_id").val() != "",$("#member_email").val() != ""){
        $("#trigger").hide();
        }});
</script>

<script>
  function check(){  
  var fm = document.frm;   
  if (fm.member_id.value==""){
  		alert("아이디를 입력해주세요");
  		fm.member_id.focus();
  		return;
  }else if (fm.member_email.value==""){
  		alert("이메일을 입력해주세요");
  		fm.member_email.focus();
  		return;
  }
  		fm.action = "<%=request.getContextPath()%>/findPwProcess.do";
  		fm.method = "post";
  		fm.submit();  
  
    return;
  }  
  </script>
</head>
<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="findPw_content">
<form name="frm">
<div id="findPw">
<div id="findPw_1">
정보를 입력해 주세요
</div>
<div id="findPw_2">
<p><input type="text" class="form-control" id="member_id" name="member_id" size="30" placeholder="아이디를 입력해주세요"></p>
<p><input type="text" class="form-control" id="member_id" name="member_email" size="30" placeholder="이메일주소를 입력해주세요"></p>
</div>
<div id="findPw_3">
</div>
<div id="findPw_4">
<input type="button" id="trigger" class="btn btn-outline-success" value="확인" onclick="check();">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='index.do'">
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
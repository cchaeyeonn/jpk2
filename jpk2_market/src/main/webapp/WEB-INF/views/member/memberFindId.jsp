<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
	href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css'
	rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'
	rel='stylesheet'>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>아이디찾기</title>
<style>

	@import
	url('https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Poppins&display=swap')
	;

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box
}

body {
	background-color: #eee;
	height: 100vh;
	font-family: 'Poppins', sans-serif;
}

#body_inner {
	padding-top: 178px;
}

.wrapper {
	max-width: 500px;
	border-radius: 10px;
	margin: 50px auto;
	padding: 30px 40px;
	box-shadow: 20px 20px 80px rgb(206, 206, 206)
}

#wrapper_inner {
	min-height: 650px;
	padding-top: 80px;
}

.h2 {
	font-family: 'Kaushan Script', cursive;
	font-size: 3.5rem;
	font-weight: bold;
	/* color: #400485; */
	/* color:#198754; */
	font-style: italic
}

.h4 {
	font-family: 'Poppins', sans-serif
}

.input-field1 {
	border-radius: 6px 6px 0 0;
	padding: 5px;
	display: flex;
	align-items: center;
	cursor: pointer;
	border: 1px solid #c3c3c3;
	color: #c3c3c3;
}

.input-field2 {
	border-radius: 0 0 6px 6px;
	padding: 5px;
	display: flex;
	align-items: center;
	cursor: pointer;
	border: 1px solid #c3c3c3;
	color: #c3c3c3;
}

.input-field1:hover {
	/* color: #198754; */
	color: #959595;
	border: 1px solid #959595;
}

.input-field2:hover {
	/* color: #198754; */
	color: #959595;
	border: 1px solid #959595;
}

input {
	border: none;
	outline: none;
	box-shadow: none;
	width: 100%;
	padding: 0px 2px;
	font-family: 'Poppins', sans-serif
}


a {
	text-decoration: none;
	color: #400485;
	font-weight: 700
}

a:hover {
	text-decoration: none;
	color: #7b4ca0
}


.btn.btn-block {
	background-color: #198754;
	color: #fff
}

.btn.btn-block:hover {
	/* background-color: #55268be0 */
	background-color: #198754;
	/*background-color: #90b990;*/
	color: #fff
}

@media ( max-width : 575px) {
	.wrapper {
		margin: 10px
	}
}

@media ( max-width :424px) {
	.wrapper {
		padding: 30px 10px;
		margin: 5px
	}
/* 	.option {
		position: relative;
		padding-left: 22px
	}
	.option label.text-muted {
		font-size: 0.95rem
	}
	.checkmark {
		position: absolute;
		top: 2px
	}
	.option .checkmark:after {
		top: 50%
	}
	#forgot {
		font-size: 0.95rem
	} */
}

</style>

<script>
  function check(){  
  var fm = document.frme;   
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


<body oncontextmenu='return false' class='snippet-body'>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>
	<div id="body_inner">
		<div id="wrapper_inner">
			<div class="wrapper bg-white">
				<div class="h2 text-center">아이디 찾기</div>
				<div class="h4 text-muted text-center pt-2"></div>
				
				<form name="frme">
					<div class="form-group">
						<div class="input-field1">
							<!-- <span class="far fa-user p-2"></span> -->
								<!-- <input type="text" name="member_id" placeholder="아이디를 입력해주세요" required class=""> -->
								<input type="text" name="member_name" size="30" placeholder="이름을 입력해주세요">
								
						</div>
					</div>
					<div class="form-group">
						<div class="input-field2">
							<!-- <span class="fas fa-lock p-2"></span>  -->
							<!-- <input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요" required class=""> -->
							<input type="text" name="member_email" size="30" placeholder="이메일주소를 입력해주세요">
							
								<!-- <i class="far fa-eye-slash"></i> -->
								
							
							
						</div>
					</div>
					
					<!-- <div class="d-flex align-items-start">
						<div class="ml-auto">
							<a style="font-size: 12px; color: #545454;" href="findId.do">아이디
								찾기</a> | <a style="font-size: 12px; color: #545454;"
								href="findPw.do">비밀번호 찾기</a>
						</div>
					</div> -->
					
					<!-- <input type="button" class="btn btn-block text-center my-3" value="로그인" onclick="check_login();"> -->
					<input type="button" class="btn btn-outline-success" value="확인" onclick="check();">
					<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='login.do'">
					<!-- <input style="margin-top: -6px !important; background-color: white; border-color: black; border: 1px solid; color: black;"
						type="button" class="btn btn-block text-center my-3" value="회원가입"
						onclick="location.href='join.do'">
					<p /> -->
			
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'></script>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>



<!-- 헤더연결 -->
<%-- <jsp:include page="../header.jsp"></jsp:include> --%>


<!-- <div id="findId_content">
<form name="frm">
<div id="findId">
<div id="findId_1">
<h3>아이디 찾기</h3>
</div>
<div id="findId_2">
<p><input type="text" class="form-control" name="member_name" size="30" placeholder="이름을 입력해주세요"></p>
<p><input type="text" class="form-control" name="member_email" size="30" placeholder="이메일주소를 입력해주세요"></p>
</div>
<div id="findId_3">
</div>
<div id="findId_4">
<input type="button" class="btn btn-outline-success" value="확인" onclick="check();">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='login.do'">
</div>
</div>
</form>
</div> -->

<!-- 푸터 연결 -->
<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


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
	/* background: linear-gradient(to top, #fff 10%, rgba(93, 42, 141, 0.4) 90%)
		no-repeat */
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
	font-style: italic
}

.h4 {
	font-family: 'Poppins', sans-serif
}


input {
	border: none;
	outline: none;
	box-shadow: none;
	width: 100%;
	padding: 0px 2px;
	font-family: 'Poppins', sans-serif
}

.fa-eye-slash.btn {
	border: none;
	outline: none;
	box-shadow: none
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
	border-radius: 20px;
	background-color: #198754;
	color: #fff
}

.btn.btn-block:hover {
	background-color: #198754;
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

}

	
</style>
</head>

<body oncontextmenu='return false' class='snippet-body'>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>
	<div id="body_inner">
		<div id="wrapper_inner">
			<div class="wrapper bg-white">
				<div class="h2 text-center">${memberVo.member_name}님의 아이디</div>
				<div class="h4 text-muted text-center pt-2"></div>
				
				<form name="frm">
					<div class="form-group">
						<div id="findId_1">
							${memberVo.member_name}님의 아이디는
						</div>
					</div>
					<div class="form-group">
						<div id="findId_2">
							${memberVo.member_id}입니다.
						</div>

					</div>
 				
					<input type="button" class="btn btn-outline-success" value="로그인" onclick="location.href='login.do'">
					<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='index.do'">
			
				</form>
			</div>
		</div>
	</div>
	<script type='text/javascript'></script>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>




<%-- <body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="findId_content">
<form name="frm">
<div id="findId">
<div id="findId_1">
${memberVo.member_name}님의 아이디는
</div>
<div id="findId_2">
${memberVo.member_id}입니다.
</div>
<div id="findId_3">
</div>
<div id="findId_4">
<input type="button" class="btn btn-outline-success" value="로그인" onclick="location.href='login.do'">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='index.do'">
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body> --%>
</html>
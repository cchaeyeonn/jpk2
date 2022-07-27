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

<body oncontextmenu='return false' class='snippet-body'>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>
	<div id="body_inner">
		<div id="wrapper_inner">
			<div class="wrapper bg-white">
				<div class="h2 text-center">:(</div>
				<div class="h4 text-muted text-center pt-2"></div>
				
				<form name="frm">
					<div class="form-group">
						<div >
							일치하는 정보가 존재하지 않습니다.
							<!-- <span class="far fa-user p-2"></span>
								<input type="text" name="member_id" placeholder="아이디를 입력해주세요" required class="">
								<input type="text" name="member_name" size="30" placeholder="이름을 입력해주세요"> -->
								
						</div>
					</div>
					<div class="form-group">
						<div >
							다시 확인하시고 입력해주시기 바랍니다.
							<!-- <span class="fas fa-lock p-2"></span> 
							<input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요" required class="">
							<input type="text" name="member_email" size="30" placeholder="이메일주소를 입력해주세요">
							
								<i class="far fa-eye-slash"></i> -->
								
							
							
						</div>
					</div>
					<!--<div class="d-flex align-items-start">
						<div class="ml-auto">
							<a style="font-size: 12px; color: #545454;" href="findId.do">아이디
								찾기</a> | <a style="font-size: 12px; color: #545454;"
								href="findPw.do">비밀번호 찾기</a>
						</div>
					</div> -->
					
					<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='findId.do'">
					<input type="button" class="btn btn-outline-success" value="비밀번호 찾기" onclick="location.href='findPw.do'">
					
			
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
일치하는 정보가 존재하지 않습니다.
</div>
<div id="findId_2">
다시 확인하시고 입력해주시기 바랍니다.
</div>
<div id="findId_3">
</div>
<div id="findId_4">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='findId.do'">
<input type="button" class="btn btn-outline-success" value="홈으로" onclick="location.href='index.do'">
</div>
</div>
</form>
</div> -->

<!-- 푸터 연결 -->
<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<style>

#join_content{
 padding-top:260px;
 height:1040px;
 text-align:center;
}

</style>
<title>회원 가입</title>

    <!-- 카카오 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- jquery 스크립트 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- js파일 연결  -->
	<script src="${pageContext.request.contextPath}/resources/js/join.js "></script>
</head>

<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>

<h3>회원정보를 입력해주세요</h3>

<div id="join_content">
<form name="joinForm" action="/spring/joinProcess.do" method="post">
	<label>아이디&nbsp;<input type="email" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)"></label>
	
	<div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div>
	<label>비밀번호&nbsp;<input type="password" name="member_pw"  value="" maxlength="20" placeholder="비밀번호"></label><br>    
	<label>비밀번호확인&nbsp;<input type="password" name="member_pw2"  value="" maxlength="20" placeholder="비밀번호 확인"></label><p/>   
	<label>이름&nbsp;<input type="text" name="member_name" maxlength="40" value="" placeholder="이름"></label><p/>
	<label>이메일&nbsp;<input type="email" name="member_email" maxlength="80" value="" placeholder="이메일"></label>
	
	<div style="height:20px"><span id="result_checkEmail" style="font-size:12px;"></span></div>	
	<label>휴대폰&nbsp;<input type="text" name="member_phone"  value="" autocomplete="off" placeholder="휴대폰 번호"></label><p/>
	<input type="text" id="postcode" name="postcode" placeholder="우편번호" disabled>
    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    <label>주소&nbsp;<input type="text" id="member_addr_1" name="member_addr1" placeholder="도로명주소" disabled>
    <input type="text" id="member_addr_2" name="member_addr2" placeholder="상세주소"></label><p/>
    <label>성별&nbsp;<input type="radio" name="member_gender" value="m"> 남자 </label>
    <label><input type="radio" name="member_gender" value="f"> 여자 </label><p/>
    <label>생년월일&nbsp;<input type ="date" name="member_birth" value="2022-01-01"></label>
    <hr>
    <div class="checkbox_group">
    <label><input type="checkbox" id="chk_all">&nbsp;이용약관에 대해 전체 동의합니다. 선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</label><p/>
	<label><input type="checkbox" class="del-chk" name="member_term1" value="1">&nbsp;이용약관 동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
	<label><input type="checkbox" class="del-chk" name="member_term2" value="1">&nbsp;개인정보 수집·이용동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
	<label><input type="checkbox" class="del-chk" value="1">&nbsp;본인은 만 14세 이상입니다.(필수)</label><p/>
	</div>
	<input type="submit" value="가입하기">
	<a href="/spring/"><input type="button" value="뒤로가기"></a>
</form> 
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
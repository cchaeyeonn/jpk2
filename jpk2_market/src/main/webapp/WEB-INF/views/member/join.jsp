<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<style>

#join_content{
 padding-top:260px;
 min-height:1040px;
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


   아이디&nbsp;<label><input type="email" class="form-control" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)"></label>
   <div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div>
   비밀번호&nbsp;<label><input type="password" class="form-control" name="member_pw" id="member_password1" value="" maxlength="20" placeholder="비밀번호"></label><br>
   <div style="height:20px"><span id="result_password1" style="font-size:12px;"></span></div>     
   비밀번호확인&nbsp;<label><input type="password" class="form-control" name="member_pw2" id="member_password2" value="" maxlength="20" placeholder="비밀번호 확인"></label><p/>
   <div style="height:20px"><span id="result_password2" style="font-size:12px;"></span></div>   
   이름&nbsp;<label><input type="text" class="form-control" id="member_name" name="member_name" maxlength="40" value="" placeholder="이름"></label><p/>
   <div style="height:20px"><span id="result_name" style="font-size:12px;"></span></div>
   이메일&nbsp;<label><input type="email" class="form-control" id="member_email" name="member_email" maxlength="80" value="" placeholder="이메일"></label>   
   <div style="height:20px"><span id="result_checkEmail" style="font-size:12px;"></span></div>   
   휴대폰&nbsp;<label><input type="text" class="form-control" id="member_phone" name="member_phone"  value="" autocomplete="off" placeholder="휴대폰 번호"></label><p/>
   <div style="height:20px"><span id="result_phone" style="font-size:12px;"></span></div>
   
   <input type="text" id="postcode" class="" name="postcode" placeholder="우편번호" disabled>
    <input type="button" onclick="execDaumPostcode()" class="btn btn-outline-success" value="우편번호 찾기"><br>
    주소&nbsp;<label><input type="text" id="member_addr_1" class="form-control" name="member_addr1" placeholder="도로명주소">
    <input type="text" id="member_addr_2" class="form-control" name="member_addr2" placeholder="상세주소"></label><p/>
    <div style="height:20px"><span id="result_addr" style="font-size:12px;"></span></div>
    성별&nbsp;<label><input type="radio" class="custom-control custom-radio" name="member_gender" value="m"> 남자 </label>
    <label><input type="radio" class="custom-control custom-radio" name="member_gender" value="f"> 여자 </label><p/>
    <div style="height:20px"><span id="result_gender" style="font-size:12px;"></span></div>
    생년월일&nbsp;<label><input type ="date" class="form-control" id="member_birth" name="member_birth" value="" onclick="maxDate()"></label>
    <div style="height:20px"><span id="result_birth" style="font-size:12px;"></span></div>
    <hr>
    
    <div class="checkbox_group">
    <label><input type="checkbox" id="chk_all" name="member_termall">&nbsp;이용약관에 대해 전체 동의합니다. 선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</label><p/>
   <label><input type="checkbox" class="del-chk" name="member_term1" value="1">&nbsp;이용약관 동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
   <label><input type="checkbox" class="del-chk" name="member_term2" value="1">&nbsp;개인정보 수집·이용동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
   <label><input type="checkbox" class="del-chk" value="1" name="member_term3">&nbsp;본인은 만 14세 이상입니다.(필수)</label><p/>
   </div>
   <div style="height:20px"><span id="result_term" style="font-size:12px;"></span></div>
   <input type="submit" class="btn btn-outline-success" id="submit" value="가입하기">
   <a href="/spring/"><input type="button" class="btn btn-outline-success" value="뒤로가기"></a>
</form> 
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
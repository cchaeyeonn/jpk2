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
    <script>
     function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
         

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
              }
          }).open();
       }
     </script>
    <!-- jquery 스크립트 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 아이디 중복검사 스크립트 -->
	<script>
		$(function(){
			
			$("#checkId").click(function(){
				
				let member_id = $("#member_id").val();
				
				$.ajax({
					type:'post',
					url:"/spring/checkId.do",
					data: {"member_id":member_id},
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 아이디입니다.";
							$("#result_checkId").html(result).css("color", "green");
							$("#member_pw").trigger("focus");
						}else{
							result = "이미 사용중인 아이디입니다.";
							$("#result_checkId").html(result).css("color", "red");
							$("#member_id").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
			
			});
			
		});

	</script>
	<!-- 이메일 중복검사 스크립트 -->
	<script>
		$(function(){
			
			$("#checkEmail").click(function(){
				
				let member_email = $("#member_email").val();
				
				$.ajax({
					type:'post',
					url:"/spring/checkEmail.do",
					data: {"member_email":member_email},
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 이메일입니다.";
							$("#result_checkEmail").html(result).css("color", "green");
							$("#member_email").trigger("focus");
						}else{
							result = "이미 사용중인 이메일입니다.";
							$("#result_checkEmail").html(result).css("color", "red");
							$("#member_email").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
			
			});
			
		});

	</script>

</head>

<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>

<h3>회원정보를 입력해주세요</h3>

<div id="join_content">
<form name="joinForm" action="/spring/joinProcess.do" method="post">
	<label>아이디 <input type="email" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)" />
	<input type="button" id="checkId" value="중복확인"/><br/></label>
	<div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div>
	<label>비밀번호 <input type="password" name="member_pw"  value="" maxlength="20" placeholder="비밀번호"></label>  <p/>       
	<label>비밀번호확인 <input type="password" name="member_pw2"  value="" maxlength="20" placeholder="비밀번호 확인"></label><p/>   
	<label>이름<input type="text" name="member_name" maxlength="40" value="" placeholder="이름"></label><p/>
	<label>이메일<input type="email" name="member_email" maxlength="80" value="" placeholder="이메일">
	<input type="button" id="checkEmail" value="중복확인"/></label><br/>
	<div style="height:20px"><span id="result_checkEmail" style="font-size:12px;"></span></div>	
	<label>휴대폰<input type="tel" name="member_phone"  value="" autocomplete="off" placeholder="휴대폰 번호"></label><p/>
	<label>주소
    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="roadAddress" placeholder="도로명주소">
    <input type="text" id="detailAddress" placeholder="상세주소"></label><p/>
    <label>성별<input type="radio" name="gender" value="m"> 남자 </label>
    <label><input type="radio" name="gender" value="m"> 여자 </label>
    <input type ="text" name="member_birth" value="생년월일" maxlength="10" placeholder="YYYY/MM/DD">
    <hr>
    <label><input type="radio" name="term_1">이용약관동의  전체 동의합니다. 선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</label><p/>
	<label><input type="radio" name="term_2">이용약관 동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
	<label><input type="radio" name="term_3">개인정보 수집·이용동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
	<label><input type="radio" name="term_4">본인은 만 14세 이상입니다.(필수)</label>
	<input type="submit" value="가입하기">
</form> 
</div>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/join_login.css" rel="stylesheet" />

<style>

 #join_content{
    padding-top:235px;
    min-height:1040px;
   justify-content: center;
   caption-side: bottom;
    border-collapse: collapse;
    display: flex;
}


/* 회원가입 약관 부분 시작 */
.chk_all,
.del-chk1,
.del-chk2,
.del-chk3 {
  height: 20px;
  width: 20px;
  background-color: transparent;
  border: 2px solid #000;
  border-radius: 5px;
  box-sizing: border-box;
  position: relative;
  display: inline-block;
  transition: border-color ease 0.2s;
  cursor: pointer;
}

.chk_all::before, .chk_all::after,
.del-chk1::before, .del-chk1::after,
.del-chk2::before, .del-chk2::after,
.del-chk3::before, .del-chk3::after{
  position: absolute;
  height: 0;
  width: 4px;
  background-color: #34b93d;
  box-sizing: border-box;
  display: inline-block;
  transform-origin: left top;
  border-radius: 5px;
  content: ' ';
  transition: opacity ease 0.5;
}
.chk_all::before,
.del-chk1::before,
.del-chk2::before,
.del-chk3::before{
  top: 14.4px;
  left: 8.2px;
  box-shadow: 0 0 0 1px transparent;
  transform: rotate(-135deg);
}
.chk_all::after,
.del-chk1::after,
.del-chk2::after,
.del-chk3::after{
  top: 7.4px;
  left: 1px;
  transform: rotate(-45deg);
}

input[id="chk_all"]:checked + .chk_all,
input[id="del-chk"]:checked + .del-chk1,
input[id="del-chk2"]:checked + .del-chk2,
input[id="del-chk3"]:checked + .del-chk3 {
  border-color: #34b93d;
}

input[id="chk_all"]:checked + .chk_all::after,
input[id="del-chk"]:checked + .del-chk1::after,
input[id="del-chk2"]:checked + .del-chk2::after,
input[id="del-chk3"]:checked + .del-chk3::after{
  height: 10px;
  animation: bottomcheck 0.2s ease 0s forwards;
}

input[id="chk_all"]:checked + .chk_all::before,
input[id="del-chk"]:checked + .del-chk1::before,
input[id="del-chk2"]:checked + .del-chk2::before,
input[id="del-chk3"]:checked + .del-chk3::before{
  height: 24px;
  animation: topcheck 0.4s ease 0s forwards;
}

   input[type=checkbox] {
   display: none;
}

@keyframes bottomcheck {
  0% {
    height: 0;
  }
  100% {
    height: 10px;
  }
}
@keyframes topcheck {
  0% {
    height: 0;
  }
  50% {
    height: 0;
  }
  100% {
    height: 24px;
  }
}
/* 회원가입 약관 부분 끝 */


</style>
<!-- 외부 js에서 ${pageContext.request.contextPath}를 사용할 수 있게 세션에 값을 저장 -->
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	
</script>
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




<div id="join_content">
<form name="joinForm" action="${pageContext.request.contextPath}/joinProcess.do" method="post">

   <div id="join_1">
   <h3 style="text-align:center; margin:29px;">회원가입</h3>
   <div id="star_info"><span id="star">*</span>필수입력사항</div>
   <hr style="margin-top: 0px; !important;">
   <table>
      <tbody>
         <tr>
            <td style="width:138px;">아이디<span id="star">*</span></td>
            <td style="width:268px;"><input type="email" class="form-control" name="member_id" id="member_id" value="" maxlength="80" placeholder="이메일 형식으로 입력해주세요"></td>
         </tr>
         <tr>
            <td></td>
            <td><div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>비밀번호<span id="star">*</span></td>
            <td><input type="password" class="form-control" name="member_pw" id="member_password1" value="" maxlength="20" placeholder="8~16자 영문 숫자 조합으로 입력해주세요"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_password1" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>비밀번호확인<span id="star">*</span></td>
            <td><input type="password" class="form-control" name="member_pw2" id="member_password2" value="" maxlength="20" placeholder="비밀번호를 한번 더 입력해주세요"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_password2" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>이름<span id="star">*</span></td>
            <td><input type="text" class="form-control" id="member_name" name="member_name" maxlength="40" value="" placeholder="이름을 입력해주세요"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_name" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>이메일<span id="star">*</span></td>
            <td><input type="email" class="form-control" id="member_email" name="member_email" maxlength="80" value="" placeholder="예) jpk2@naver.com"></td>
         </tr>
         <tr>
            <td></td>
            <td><div style="height:20px"><span id="result_checkEmail" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>휴대폰<span id="star">*</span></td>
            <td><input type="text" class="form-control" id="member_phone" name="member_phone"  value="" autocomplete="off" placeholder="숫자만 입력해주세요"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_phone" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>주소<span id="star">*</span></td>
<<<<<<< HEAD
            <td><input type="text" id="postcode" class="" name="postcode" placeholder="우편번호" readonly style="height:40px; width:133px; text-align:center; border-radius:9px; font-size:13px;">
=======
            <td><input type="text" id="postcode" class="" name="member_addrcode" placeholder="우편번호" readonly style="height:40px; width:133px; text-align:center; border-radius:9px; font-size:13px;">
>>>>>>> branch 'master' of https://github.com/cchaeyeonn/jpk2.git
            <input type="button" onclick="execDaumPostcode()" class="btn btn-outline-success" value="우편번호 찾기" style="margin-top:-2px; margin-left:4px;"></td><td></td>
         </tr>
         <tr><td style="height:8px;"></td><td></td></tr>
         <tr>
            <td></td>
            <td><input type="text" id="member_addr_1" class="form-control" name="member_addr1" readonly placeholder="도로명주소"><input type="text" id="member_addr_2" class="form-control" name="member_addr2" placeholder="상세주소"></td>
            <td></td>
            <td><div style="height:20px"><span id="result_addr" style="font-size:12px;"></span></div></td>
         </tr>
         <tr><td>&nbsp;</td><td></td></tr>
         <tr>
            <td>성별<span id="star">*</span></td>
            <td><input type="radio" id="custom-control custom-radio" name="member_gender" value="m"> 남자 
                <input type="radio" id="custom-control custom-radio" name="member_gender" value="f"> 여자</td>
                <td><div style="height:20px"><span id="result_gender" style="font-size:12px;"></span></div></td>
         </tr>
         <tr><td>&nbsp;</td><td></td></tr>
         <tr>
            <td>생년월일<span id="star">*</span></td>
            <td><input type ="date" class="form-control" id="member_birth" name="member_birth" value="" onclick="maxDate()"></td>
            <td><div style="height:20px"><span id="result_birth" style="font-size:12px;"></span></div></td>
         </tr>
         </table>
         
         <hr>
         <table>
		<tr>
         <td>
         <input type="checkbox" id="chk_all" name="member_termall">
         <label for="chk_all" class="chk_all"></label></td>
         <td>이용약관에 대해 전체 동의합니다.</td>
         </tr>
         
         <tr>
         <td></td>
         <td>(선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.)</td></tr>
         <tr><td>&nbsp;</td><td></td></tr>
         
         <tr>
         <td>
         <input type="checkbox" id="del-chk" class="del-chk" name="member_term1" value="1">
         <label for="del-chk" class="del-chk1"></label></td>
         <td>이용약관 동의 (필수)&nbsp;&nbsp;&nbsp;&nbsp;<span id="terms">약관보기</span></td>
         </tr>
         
         <tr>
         <td>
         <input type="checkbox" id="del-chk2" class="del-chk" name="member_term2" value="1">
         <label for="del-chk2" class="del-chk2"></label></td>
         <td>개인정보 수집·이용동의 (필수) &nbsp;&nbsp;&nbsp;&nbsp;<span id="terms">약관보기</span></td>
         </tr>
         
         <tr>
         <td>
         <input type="checkbox" id="del-chk3" class="del-chk" name="member_term3" value="1" >
         <label for="del-chk3" class="del-chk3"></label></td>
         <td>본인은 만 14세 이상입니다. (필수)</td>
         </tr>
         
         <tr>
         <td></td>
         <td><input type="submit" class="btn btn-outline-success" id="trigger"  value="가입하기" style="margin-left:117px; margin-top:22px; width:353px;"></td>
         
         
         </tr>
      </tbody>
   </table>
   </div>

<!--     <div class="checkbox_group">
    <label><input type="checkbox" id="chk_all" name="member_termall">&nbsp;이용약관에 대해 전체 동의합니다.</label><p/>
    <label>선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</label><p/>
   <label><input type="checkbox" class="del-chk" name="member_term1" value="1">&nbsp;이용약관 동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
   <label><input type="checkbox" class="del-chk" name="member_term2" value="1">&nbsp;개인정보 수집·이용동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기></label><p/>
   <label><input type="checkbox" class="del-chk" value="1" name="member_term3">&nbsp;본인은 만 14세 이상입니다.(필수)</label><p/>
   <div style="height:20px"><span id="result_term" style="font-size:12px;"></span></div>
     </div> -->
 <%--   <div id="join_button">
   <input type="submit" class="btn btn-outline-success" id="trigger"  value="가입하기">
   <a href="${pageContext.request.contextPath}/"><input type="button" class="btn btn-outline-success" value="뒤로가기"></a>
    </div> --%>
</form> 

</div>


<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
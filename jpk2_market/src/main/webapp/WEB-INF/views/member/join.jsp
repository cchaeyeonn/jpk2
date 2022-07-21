<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<style>

#join_content{

   /*  margin-left: 804px;
    padding-top: 193px;
    width: 100%; */
   /*  margin-left:297px;
    margin-right:316px; */
    padding-top:235px;
    min-height:1040px;
   justify-content: center;
   caption-side: bottom;
    border-collapse: collapse;
    display: flex;
    /* justify-content: space-around; */
/*  text-align:center; */
}

 .checkbox_group{
   margin: 0 254px 0 701px;
    padding-block: 20px;
    display:flxed;
}

#join_button{
   margin: 0 649px 0 812px;
    padding-block: 20px;
} 

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
   <h3 style="text-align:center; margin:29px;">회원정보를 입력해주세요</h3>
   <table>
      <tbody>
         <tr>
            <td>아이디</td>
            <td><input type="email" class="form-control" name="member_id" id="member_id" value="" maxlength="80" placeholder="아이디(이메일)"></td>
         </tr>
         <tr>
            <td></td>
            <td><div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>비밀번호</td>
            <td><input type="password" class="form-control" name="member_pw" id="member_password1" value="" maxlength="20" placeholder="비밀번호"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_password1" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>비밀번호확인</td>
            <td><input type="password" class="form-control" name="member_pw2" id="member_password2" value="" maxlength="20" placeholder="비밀번호 확인"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_password2" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>이름</td>
            <td><input type="text" class="form-control" id="member_name" name="member_name" maxlength="40" value="" placeholder="이름"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_name" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>이메일</td>
            <td><input type="email" class="form-control" id="member_email" name="member_email" maxlength="80" value="" placeholder="이메일"></td>
         </tr>
         <tr>
            <td></td>
            <td><div style="height:20px"><span id="result_checkEmail" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>휴대폰</td>
            <td><input type="text" class="form-control" id="member_phone" name="member_phone"  value="" autocomplete="off" placeholder="휴대폰 번호"></td>
         </tr>
         <tr>
            <td></td>   
            <td><div style="height:20px"><span id="result_phone" style="font-size:12px;"></span></div></td>
         </tr>
         
         <tr>
            <td>주소</td>
            <td><input type="text" id="postcode" class="" name="postcode" placeholder="우편번호" disabled></td>
            <td><input type="button" onclick="execDaumPostcode()" class="btn btn-outline-success" value="우편번호 찾기"></td>
         </tr>
         <tr>
            <td></td>
            <td><input type="text" id="member_addr_1" class="form-control" name="member_addr1" placeholder="도로명주소"></td>
            <td><input type="text" id="member_addr_2" class="form-control" name="member_addr2" placeholder="상세주소"></td>
            <td><div style="height:20px"><span id="result_addr" style="font-size:12px;"></span></div></td>
         </tr>
         <tr>
            <td>성별</td>
            <td><input type="radio" id="custom-control custom-radio" name="member_gender" value="m"> 남자 
                <input type="radio" id="custom-control custom-radio" name="member_gender" value="f"> 여자</td>
                <td><div style="height:20px"><span id="result_gender" style="font-size:12px;"></span></div></td>
         </tr>
         <tr>
            <td>생년월일</td>
            <td><input type ="date" class="form-control" id="member_birth" name="member_birth" value="" onclick="maxDate()"></td>
            <td><div style="height:20px"><span id="result_birth" style="font-size:12px;"></span></div></td>
         </tr>
         </table>
         
         <hr>
         <table>
         <tr>
         <td><input type="checkbox" id="chk_all" name="member_termall"></td>
         <td>이용약관에 대해 전체 동의합니다.</td>
         </tr>
         
         <tr>
         <td></td>
         <td>선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</td></tr>
         
         <tr>
         <td><input type="checkbox" class="del-chk" name="member_term1" value="1"></td>
         <td>이용약관 동의(필수)&nbsp;&nbsp;&nbsp;&nbsp;약관보기</td>
         </tr>
         
         <tr>
         <td><input type="checkbox" class="del-chk" name="member_term2" value="1"></td>
         <td>개인정보 수집·이용동의(필수) &nbsp;&nbsp;&nbsp;&nbsp;약관보기</td>
         </tr>
         
         <tr>
         <td><input type="checkbox" class="del-chk" value="1" name="member_term3"></td>
         <td>본인은 만 14세 이상입니다.(필수)</td>
         </tr>
         
         <tr>
         <td></td>
         <td><input type="submit" class="btn btn-outline-success" id="trigger"  value="가입하기"><a href="${pageContext.request.contextPath}/"><input type="button" class="btn btn-outline-success" value="뒤로가기"></a></td>
         
         
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
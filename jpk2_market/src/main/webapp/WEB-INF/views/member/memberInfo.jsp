<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  function check(){  
  var fm = document.frm1;   
	if (fm.member_pw1.value!=fm.member_pw2.value){
	  	alert("비밀번호가 일치하지않습니다");
	  	fm.member_pw1.value="";
	  	fm.member_pw2.value="";
	  	fm.member_pw1.focus();
	  	return;
  }/* else if (fm.now_pw.value==fm.member_pw1.value){
	  	alert("현재 비밀번호와 같은 비밀번호로 변경할 수 없습니다.");
	  	fm.member_pw1.value="";
	  	fm.member_pw2.value="";
	  	fm.member_pw1.focus();
	  	return;
  } */
	  	
  		fm.action = "<%=request.getContextPath()%>/updateMemberInfoProcess.do";
  		fm.method = "post";
  		fm.submit();   
  
    return;
  }  

  </script>
  <script>
   $(function(){
	 var gender = "${memberVo.member_gender}"; 
   	  if(gender=="m"){
		$(".man").prop("checked",true);
	} else if(gender=="f"){
		$(".woman").prop("checked",true);
		
	};     
	 
	
	
   });
   </script>
<style>

#open_info_modify{
   border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}
#open_history2{
    border-bottom: 1px solid #f2f2f2 !important;
}
#open_coupon{
    border-bottom: 1px solid #f2f2f2;
}
#memberinfo_td {
    padding: 0.5rem 0.5rem !important;
    background-color: var(--bs-table-bg) !important;
    border-bottom-width: 0rem !important;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg) !important;
}

</style>
<meta charset="UTF-8">

<link href="resources/css/mypage_css.css" rel="stylesheet" />

<title>회원정보</title>
</head>
<body>

   <!-- 헤더 연결 -->
   <jsp:include page="../header.jsp"></jsp:include>
   
   <div id="mypage_main_inner">
   <div id="mypage_center_cate">
   <div id="mypage_sub_title">마이페이지</div>
      <div id="mypage_sub">   
      <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="open_history2">주문 내역</a>
      <a href="${pageContext.request.contextPath}/memberInfo.do" class="nav-link py-3 px-0 px-lg-3" id="open_info_modify">개인 정보 수정</a>
      
      <a href="#" onclick="alert('서비스 준비중입니다.')" class="nav-link py-3 px-0 px-lg-3" id="open_coupon">쿠폰</a>
      </div>
   </div>
   
<div id="memberinfo_inner">
<h5 style="margin-top: 35px;">개인 정보 수정</h5>
</div>

   <div id="join_content">
<form name="frm1">

   <div id="join_1">


   <table id="memberinfo_table" border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
      <tbody>
         <tr>
            <td id="memberinfo_td" style="width:138px;">아이디</td>
            <td id="memberinfo_td" style="width:268px;"><input type="email" class="form-control" name="member_id" id="member_id" value="${memberVo.member_id }" maxlength="80" readonly></td>
         </tr>
<!--          <tr>
            <td id="memberinfo_td"></td>
            <td id="memberinfo_td"><div style="height:20px"><span id="result_checkId" style="font-size:12px;"></span></div></td>
         </tr> -->
         
         <tr>
            <td id="memberinfo_td">현재 비밀번호</td>
            <td id="memberinfo_td"><input type="password" class="form-control" name="now_pw" id="now_pw" value="" maxlength="20" placeholder="비밀번호를 입력해 주세요"></td>
         </tr>
 	     <tr>
            <td id="memberinfo_td"></td>   
            <td id="memberinfo_td"><div style="height:20px"><span id="result_checkPw" style="font-size:12px;"></span></div></td>
         </tr> 
         
         <tr>
            <td id="memberinfo_td">새 비밀번호</td>
            <td id="memberinfo_td"><input type="password" class="form-control" name="member_pw1" id="member_pw1" value="" maxlength="20" placeholder="새 비밀번호를 입력해 주세요"></td>
         </tr>
         
            <tr>
            <td id="memberinfo_td">새 비밀번호 확인</td>
            <td id="memberinfo_td"><input type="password" class="form-control" name="member_pw2" id="member_pw2" value="" maxlength="20" placeholder="새 비밀번호를 다시 입력해 주세요"></td>
         </tr>
			<tr>
            <td id="memberinfo_td"></td>   
            <td id="memberinfo_td"><div style="height:20px"><span id="result_password" style="font-size:12px;"></span></div></td>
         </tr> 
         
         <tr>
            <td id="memberinfo_td">이름</td>
            <td id="memberinfo_td"><input type="text" class="form-control" id="member_name" name="member_name" maxlength="40" value="${memberVo.member_name }" readonly></td>
         </tr>
  <!--        <tr>
            <td id="memberinfo_td"></td>   
            <td id="memberinfo_td"><div style="height:20px"><span id="result_name" style="font-size:12px;"></span></div></td>
         </tr> -->
         
         <tr>
            <td id="memberinfo_td">이메일</td>
            <td id="memberinfo_td"><input type="email" class="form-control" id="member_email" name="member_email" maxlength="80" value="${memberVo.member_email }" readonly ></td>
         </tr>
<!--          <tr>
            <td id="memberinfo_td"></td>
            <td id="memberinfo_td"><div style="height:20px"><span id="result_checkEmail" style="font-size:12px;"></span></div></td>
         </tr> -->
         
         <tr>
            <td id="memberinfo_td">휴대폰</td>
            <td id="memberinfo_td"><input type="text" class="form-control" id="member_phone" name="member_phone"  value="${memberVo.member_phone }" autocomplete="off" ></td>
         </tr>
<!--          <tr>
            <td id="memberinfo_td"></td>   
            <td id="memberinfo_td"><div style="height:20px"><span id="result_phone" style="font-size:12px;"></span></div></td>
         </tr> -->
         
         <tr>
            <td id="memberinfo_td">주소</td>
            <td id="memberinfo_td" style="width: 325px;"><input type="text" id="postcode" class="" name="member_addrcode" placeholder="우편번호" readonly style="height:37px; width:133px; text-align:center; border-radius:9px; font-size:13px;" value="${memberVo.member_addrcode}">
            <input type="button" onclick="execDaumPostcode()" class="btn btn-outline-success" value="우편번호 찾기" style="margin-top:-3px; margin-left:2px; font-size:14px; width:126px;"></td><td id="memberinfo_td"></td>
         </tr>
     <!--     <tr><td id="memberinfo_td" style="height:8px;"></td><td id="memberinfo_td"></td></tr> -->
         <tr>
            <td id="memberinfo_td"></td>
            <td id="memberinfo_td"><input type="text" id="member_addr_1" class="form-control" name="member_addr1" readonly placeholder="도로명주소" value="${memberVo.member_addr1}"><input type="text" id="member_addr_2" class="form-control" name="member_addr2" value="${memberVo.member_addr2}"></td>
            <td id="memberinfo_td"></td>
            <td id="memberinfo_td"><div style="height:20px"><span id="result_addr" style="font-size:12px;"></span></div></td>
         </tr>
     <!--     <tr><td id="memberinfo_td">&nbsp;</td><td id="memberinfo_td"></td></tr> -->
         <tr>
            <td id="memberinfo_td">성별</td>
            <td id="memberinfo_td"><input type="radio" id="custom-control custom-radio" class="man" name="member_gender" value="m"  readonly> 남자 
                <input type="radio" id="custom-control custom-radio" name="member_gender" class="woman" value="f" readonly> 여자</td>
                <td id="memberinfo_td"><div style="height:20px"><span id="result_gender" style="font-size:12px;"></span></div></td>
         </tr>
        <!--  <tr><td id="memberinfo_td">&nbsp;</td><td id="memberinfo_td"></td></tr> -->
         <tr>
            <td id="memberinfo_td">생년월일</td>
            <td id="memberinfo_td"><input type ="date" class="form-control" id="member_birth" name="member_birth" value="${memberVo.member_birth}" onclick="maxDate()" readonly></td>
            <td id="memberinfo_td"><div style="height:20px"><span id="result_birth" style="font-size:12px;"></span></div></td>
         </tr>
         </table>
         
  
        
        <!--  <td id="memberinfo_td"></td>
         <td id="memberinfo_td"><input type="submit" class="btn btn-outline-success" id="trigger"  value="가입하기" style="margin-left:117px; margin-top:22px; width:353px;"></td> -->
         <p style="padding-left: 489px;">
  		 <a><span  onclick="check();">회원정보 수정&nbsp;&nbsp;</span>|</a>&nbsp;&nbsp;
  		 <a href="${pageContext.request.contextPath}/memberDelyn.do">회원탈퇴</a></p>
       


   </div>
   </form>
   </div>
</div>
   <!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
 <script src="${pageContext.request.contextPath}/resources/js/memberUpdatePw.js "></script>
   
</body>
</html>
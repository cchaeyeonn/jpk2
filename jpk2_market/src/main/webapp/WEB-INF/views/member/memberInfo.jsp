<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
/*  #memberinfo_inner{
    min-height:1040px;
   margin-left:315px; 
   padding-top:260px;
   margin-left:33%;
   margin-right:33%;
}  
 */
#memberinfo_main_inner{
    margin-left: 324px;
    margin-top: 218px;
    min-height: 1040px;
}
   
#service_center_cate{
   
   /* padding-top:200px; */
   width:194px;
   float:left;
}
#service_1{
  padding: 5px 0 35px 1px;
    font-weight: 700;
    font-size: 26px;
    line-height: 35px;
    color: #333;
    letter-spacing: -1px;
    margin-top: -16px;
    
}

#notice_sub{
   border: 1px solid #f2f2f2;
    border-bottom: 1;
    FONT-WEIGHT: 100;
    display: block;
    overflow: hidden;
    font-size: 14px;
    line-height: 20px;
    letter-spacing: -.3px;
    padding: 0px -5px 3px 5px;
    margin-left: -6px;
    margin-right: 16px;
    margin-top: -27px;
}
#open_info_modify{
   border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}
#open_history{
    border-bottom: 1px solid #f2f2f2;
}
#open_coupon{
    border-bottom: 1px solid #f2f2f2;
}
#td1{
width:10%;

}
#td2{
width:16%;

}
#td3{
width:20%;

}
#td4{
width:3%;

}
</style>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>

   <!-- 헤더 연결 -->
   <jsp:include page="../header.jsp"></jsp:include>
   
   <div id="memberinfo_main_inner">
   <div id="service_center_cate">
   <div id="service_1">마이페이지</div>
      <div id="notice_sub">   
      <a href="${pageContext.request.contextPath}/memberInfo.do" class="nav-link py-3 px-0 px-lg-3" id="open_info_modify">개인 정보 수정</a>
      <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="open_history">주문 내역</a>
      <a href="" class="nav-link py-3 px-0 px-lg-3" id="open_coupon">쿠폰</a>
      <!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
      </div>
   </div>
   
<div id="memberinfo_inner">
<h5 style="margin-top: 272px;">회원정보</h5>
</div>

<div id="table_button" style="width:962px;">
   <table border="1" style="border-right:0px; border-left:0px; font-size: 14px; border-top: 2px solid #198754;" class="table table-hover">
      <tr>
         <td id="td1">아이디</td>
         <!-- JSP페이지에서는 Controller에서 생성된 Model객체를 EL을 이용해서 사용 가능 -->
         <td>${memberVo.member_id}</td>
      </tr>
      <tr>
         <td id="td2">이름</td>
         <td>${memberVo.member_name}</td>
      </tr>
      <tr>
         <td id="td3">이메일</td>
         <td>${memberVo.member_email}</td>
      </tr>
      <tr>
         <td id="td4">전화번호</td>
         <td>${memberVo.member_phone}</td>
      </tr>
   </table><p style="padding-left: 371px;">
   <a href="${pageContext.request.contextPath}/updatePw.do">비밀번호 변경&nbsp;&nbsp;|</a>&nbsp;&nbsp;
   <a href="${pageContext.request.contextPath}/deleteMember.do">회원탈퇴</a></p>
   
   </div>
   </div>

   <!-- 푸터 연결 -->
   <jsp:include page="../footer.jsp"></jsp:include>
   
   
</body>
</html>
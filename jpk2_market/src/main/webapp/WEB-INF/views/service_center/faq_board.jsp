<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/service_center.css" rel="stylesheet" />
<style>

#open_faq{
   border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}

</style>

</head>

<body>

   <!-- 헤더 연결 -->
   <jsp:include page="../header.jsp"></jsp:include>

   <div id="service_main_inner">
      <div id="service_center_cate">
      <div id="service_sub_title">고객센터</div>
       <div id="service_sub">
          <a href="${pageContext.request.contextPath}/notice_board.do" class="nav-link py-3 px-0 px-lg-3" id="open_notice">공지사항</a>
             <a href="${pageContext.request.contextPath}/faq_board.do" class="nav-link py-3 px-0 px-lg-3" id="open_faq">자주하는 질문</a>
           <!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
         </div>
      </div>

      <div id="faq_box">
      <h5 style="margin-top: 52px;">자주 묻는 질문(FAQ)</h5>
      
      
         
         <div class="faq-content">
            <button class="question" id="que-1">
               <span id="que-1-toggle">+</span><span>'JPK2'란 무엇인가요?</span>
            </button>
            <div class="answer" id="ans-1">-그러게 말입니다.</div>
         </div>
         <div class="faq-content">
            <button class="question" id="que-2">
               <span id="que-2-toggle">+</span><span>아이디,비밀번호를 잊어버렸습니다.</span>
            </button>
            <div class="answer" id="ans-2">
               -하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송
               됩니다.<br>
               <br> 홈 상단[로그인]&nbsp;>&nbsp;화면 아래 아이디 찾기&nbsp;|&nbsp;비밀번호 찾기<br>
               <br> [참고]<br> 가입시 기재한 메일 주소가 기억나지 않으시거나 오류가 발생하는 경우 고객센터로
               문의 바랍니다.<br> 상담시에는 고객님의 개인정보보호를 위해 기존에 사용하시던 비밀번호는 안내가 불가하며,
               개인정보 확인 후 임시비밀번호를 설정해드립니다.<br>
            </div>
         </div>
         <div class="faq-content">
            <button class="question" id="que-3">
               <span id="que-3-toggle">+</span><span>품절 된 상품은 언제 재입고 되나요?</span>
            </button>
            <div class="answer" id="ans-3">-품절 상품들은 각각 재입고 기간이 달라 정확한 안내가
               어렵습니다.</div>
         </div>
      </div>
</div> 
      <script>
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
   </div>


   <!-- 푸터 연결 -->
   <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
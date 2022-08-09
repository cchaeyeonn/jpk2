<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>공지 상세</title>

<!-- service_style 가져오기 -->
<link href="resources/css/service_center.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css"> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/cart.js "></script> --%>
<script>
$(function(){
	$("#delete_notice").click(function(){
		
		alert("글이 삭제 되었습니다.");
		
	});
});
</script>
</head>
<body>


    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
    <div id="notice_detail_inner">
    <div id="notice_detail_top">
       <div id="notice_detail_header">공지사항</div>
       <div id="notice_detail_header2">jpk2의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</div>
       </div>
       
       
    <div id="notice_detail_1">
          <div id="notice_detail_2">
          <div id="notice_detail_3">카테고리</div>
       <div id="notice_detail_4">${noticeVo.n_category}</div>
       </div>
       
       <div id="notice_detail_2">
       <div id="notice_detail_3">제목</div>
       <div id="notice_detail_4">${noticeVo.n_title}</div>
       </div>
       
     <div id="notice_detail_2">
       <div id="notice_detail_3">작성자</div>
       <div id="notice_detail_4">관리자</div>
       </div>
    <div id="notice_detail_content">
       <div>
       <p style="white-space: pre-line;">${noticeVo.n_content}</p>
       </div></div>
          <div style="padding-left: 780px; padding-top: 15px;">
               
               <c:if test="${member_grade != null}">
               <c:if test="${member_grade >= 1}">
   
                  <a class='btn btn-primary' href='/spring/notice_update.do?nidx=${noticeVo.nidx}'>수정하기</a>
                  <a class='btn btn-primary' id="delete_notice" href='/spring/notice_delyn.do?nidx=${noticeVo.nidx}'>삭제하기</a>
   
   
               </c:if>
               <div style="float: right;">
               <a href="/spring/notice_board.do" class="btn btn-primary">글목록</a>
               </div>
             </c:if>
             
            
       
       
<!--      <div id="notice_detail_7">
       <div id="notice_detail_8">
       <div id="notice_detail_title"></div>
       <div id="notice_detail_title2"></div>
       </div>
    </div> -->
     
   </div>
   </div>
   </div>
  <%--   
 <div id="servive_main_inner">
   <div id="service_center_cate">
   <div id="service_1">고객센터</div>
      <div id="notice_sub">   
      <a href="${pageContext.request.contextPath}/notice_board.do" class="nav-link py-3 px-0 px-lg-3" id="open_notice">공지사항</a>
      <a href="${pageContext.request.contextPath}/faq_board.do" class="nav-link py-3 px-0 px-lg-3" id="open_faq">자주하는 질문</a>
      <!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
      </div>
   </div> 
      <div id="notice_inner">
      <form name="insertnotice_form" action="/spring/notice_writeProcess.do" method="post">
         <input type="hidden"  name="nidx" value="${noticeVo.nidx} ">
         <div id="notice">
         
            <div id="notice_detail">
            
               <table id="notice_table" class="table table-striped" style="border:1px solid #dddddd; text-align: center; width: 1068px;">
               <thead>
                  <tr>
                     <th colspan="2" style="background-color: #eeeeee; text-align: center;" id="sd_table1">공지사항</th>
                  </tr>
               </thead>
               
               <tbody>
               <tr>
                  <td style="width:20%;" id="nd_table1">번호</td><td colspan="2">${noticeVo.nidx}</td>
               </tr>
               
               <tr>
               <td id="sd_table1">구분</td><td colspan="2">[${noticeVo.n_category}]</td>
               </tr>
               <tr>
               <td id="sd_table1">제목</td><td colspan="2">${noticeVo.n_title}</td>
               </tr>
               <tr>
               <td id="sd_table1">내용</td><td colspan="2" style="height:200px; text-align: center;">${noticeVo.n_content}</td>
               </tr>
               </tbody>
               </table>
               <div style="padding-left:929px;">
               
               <c:if test="${member_grade != null}">
               <c:if test="${member_grade >= 1}">
   
                  <a class='btn btn-primary' href='/spring/notice_update.do?nidx=${noticeVo.nidx}'>수정하기</a>
                  <a class='btn btn-primary' href='/spring/notice_delyn.do?nidx=${noticeVo.nidx}'>삭제하기</a>
   
   
               </c:if>
               <a href="/spring/notice_board.do" class="btn btn-primary">글목록</a>
             </c:if>
             </div>
            
               
            <!-- class='nav-link py-3 px-0 px-lg-3 rounded' style='display:inline;' -->
   
   
            
            </div>
         </div>
   
   
      </form>
      </div> --%>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
<%-- <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script> --%>
</html>
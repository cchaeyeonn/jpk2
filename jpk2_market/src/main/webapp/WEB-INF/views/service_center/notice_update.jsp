<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/service_center.css" rel="stylesheet" />

<title>공지사항 글작성</title>

</head>
<script>
function check(){
	
	alert("게시글이 수정되었습니다.");	
	
	
}

</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
        <div id="notice_detail_inner">
       <div id="notice_detail_top">
       <div id="notice_detail_header">공지사항 수정</div>
       
       </div>
       
       
   
      <div id="notice_detail_box">
      
         
         <form name="update" method="POST" action="${pageContext.request.contextPath}/notice_updateprocess.do?nidx=${noticeVo.nidx}">
         <table class="table table-striped">
         <tr>
            <td id="td_l">카테고리</td>
            <td><select name="n_category">
               <option value="배송">배송</option>
               <option value="기타">기타</option>
            </select></td>
         </tr>
         <tr>
         <td id="td_l">제목</td>
         <td><input type="text" name="n_title" value="${noticeVo.n_title}" class="form-control" style="width:560px;"></td>
         </tr>
         <tr>
         <td id="td_l">내용</td>
         <td><textarea input type="text" name="n_content" class="form-control" style="width:560px; height:300px;"><c:out value="${noticeVo.n_content}" /></textarea></td>
         </tr>
         <tr>
         <td></td><td style="padding-left: 525px;"><input type="submit" value="수정하기" class="btn btn-primary" onclick="check();"></td>
         </tr>
         </table>
   <%--       <table class="table table-hover">
         
         <tr>
         <td>카테고리</td><td></td>
         </tr>
         
         <tr>
         <td>제목</td><td><input name="n_title" value="${noticeVo.n_title}" type="text" ></td>
         </tr>
         
         <tr>
         <td>내용</td><td style="white-space: pre-line;"><input name="n_content" value="${noticeVo.n_content}" type="text" ></td>
         
         </tr>
         
         
         </table> --%>
         <!-- <input type="submit" class="btn btn-outline-info" value="완료"/><input type="reset" class="btn btn-outline-into" value="리셋"/> -->
         
         
<%--          <div>카테고리</div>
         <div>제목 :</div>
         <div><input name="n_title" value="${noticeVo.n_title}" type="text" ></div>
         <div>내용 :</div>
         <div><input name="n_content" value="${noticeVo.n_content}" type="text" ></div>
         
         <div>
         <input type="submit" class="btn btn-outline-info" value="완료"/>
         <input type="reset" class="btn btn-outline-into" value="리셋"/>
         </div> --%>
         
         
         </form>
         
         <%-- <form name="notice_modify_Form" action="/spring/notice_modifyProcess.do" method="post" >
         <table>
         <tr>
            <td>카테고리</td>
            <td><select name="n_category">
               <option value="배송">배송</option>
               <option value="기타">기타</option>
            </select></td>
         </tr>
         <tr>
         <td>제목</td>
         <td><input type="text" name="n_title">${noticeVo.n_title}</td>
         </tr>
         <tr>
         <td>내용</td>
         <td><input type="text" name="n_content">${noticeVo.n_content}</td>
         </tr>
         <tr>
         <td><input type="submit" value="작성하기"></td>
         </tr>
         </table> --%>
         
      </div>
      </div>
   
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/service_center.css" rel="stylesheet" />


<title>공지사항 글작성</title>


<script>
  function check(){  
  var fm = document.notice_write_Form;   
  if (fm.n_title.value==""){
  		alert("제목을 입력해주세요.");
  		fm.n_title.focus();
  		return;
  } else if (fm.n_content.value==""){
  		alert("내용을 입력해주세요.");
  		fm.n_content.focus();
  		return;
  }
  
   		fm.action = "<%=request.getContextPath()%>/notice_writeProcess.do";
  		fm.method = "post";
  		fm.submit();  
  
    return; 
  }  
  </script>
  
</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
	
<div id="servive_main_inner">
		<div id="service_center_cate">
	
		<a href="/spring/notice_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
		<a href="/spring/faq_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
		<!-- <a href="/spring/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a> -->
	
	</div>
	
		<div id="notice_main_inner">
			
			<form name="notice_write_Form" ><!-- action="/spring/notice_writeProcess.do" method="post" -->
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
			<td><input type="text" name="n_title" class="form-control" style="width:560px;"></td>
			</tr>
			<tr>
			<td id="td_l">내용</td>
			<td><textarea input type="text" name="n_content" class="form-control" style="width:560px; height:300px;"></textarea></td>
			</tr>
			<tr>
			<td></td><td><input type="button" value="작성하기" class='btn btn-primary' onclick="check();"></td>
			</tr>
			</table>
			
			
		
		
	</form>
	</div>
</div>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
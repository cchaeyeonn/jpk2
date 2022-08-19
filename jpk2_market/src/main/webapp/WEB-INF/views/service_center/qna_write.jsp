<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글작성</title>
<style>

/* 	#product{
		padding-left:10%;
		padding-right:10%; 
		height:1500px; 
		padding-top:260px;
		}
	#product_img{
			float:left; 
			width:50%; 
			height:50%;
			}
	#product_detail{
			float:right; 
			width:50%; 
			height:50%;
			}
	#home_button{
			padding-left:10%; 
			padding-right:10%; 
			text-align:center; 
			float:center;
			} */
			
	#qna_main_inner{
		min-height:1040px;
		padding-top:300px;
		margin-left:320px;
		margin-right:320px;
	}
	
		#service_center_cate{
	
		padding-top:200px;
		width:155px;
		float:left;
	
	}
	
	
			
	#td_l{
		width:20%;
	}
	
</style>

<script>
  function check(){  
  var fm = document.notice_write_Form;   
  if (fm.q_title.value==""){
  		alert("제목을 입력해주세요.");
  		fm.q_title.focus();
  		return;
  } else if (fm.q_content.value==""){
  		alert("내용을 입력해주세요.");
  		fm.q_content.focus();
  		return;
  }
  
   		fm.action = "<%=request.getContextPath()%>/qna_writeProcess.do";
  		fm.method = "post";
  		fm.submit();  
  
    return; 
  }  
  </script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
    	<div id="service_center_cate">
	
		<a href="${pageContext.request.contextPath}/notice_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
		<a href="${pageContext.request.contextPath}/faq_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
		<a href="${pageContext.request.contextPath}/qna_board.do" class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a>
	
	</div>
	
	
		<div id="qna_main_inner">
			
			<form name="notice_write_Form"><!-- action="/spring/qna_writeProcess.do" method="post" --> 
			<table class="table table-striped" style="width:100%;">
			<tr>
				<td id="td_l">카테고리</td>
				<td><select name="q_category">
					<option value="배송">배송</option>
					<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
			<td id="td_l">제목</td>
			<td><input type="text" name="q_title" class="form-control" style="width:560px;"></td>
			</tr>
			<tr>
			<td id="td_l">내용</td>
			<td><textarea input type="text" name="q_content" class="form-control" style="width:560px; height:300px;"></textarea></td>
			</tr>
			<tr>
			<td></td><td><input type="button" value="작성하기" class='btn btn-primary' onclick="check();"></td>
			</tr>
			</table>
			
		</div>
		
	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
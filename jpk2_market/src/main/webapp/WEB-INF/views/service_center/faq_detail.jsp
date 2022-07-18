<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<titlef>faq 상세</title>
<style>
   
    #faq_detail{
    padding-top:200px;
    margin-left:320px;
    margin-top:100px;
    min-height:1040px;
    }
    
    #fd_table1{
    	width:200px;
    }
    
    #fd_table2{
    	width:200px;
    }
    
    #fd_table3{
    	width:400px;
    	    }
    
    #fd_table4{
    	width:600px;
    }
    
    #service_board{
	margin-left: 154px;
	}
	#servive_main_inner{
	margin-left:200px;
	}
	
	#service_center_cate{
	
		padding-top:200px;
		width:155px;
		float:left;
	
	}
	#service_board{
	min-height:1040px;
	}
	#service_board_inner{
	}
    


</style>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/modal.css"> --%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart.js "></script>

</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
    <div id="servive_main_inner">
	<div id="service_center_cate">
	
		<a class="nav-link py-3 px-0 px-lg-3 rounded" id="open_notice">공지사항</a>
		<a class="nav-link py-3 px-0 px-lg-3 rounded" id="open_faq">자주하는 질문</a>
		<a class="nav-link py-3 px-0 px-lg-3 rounded" id="open_qna" >1:1 문의</a>
	
	</div>
	
	
	<form name="insertfaq_form" action="/spring/faq_writeProcess.do" method="post">
	   <input type="hidden"  name="fidx" value="${faqVo.fidx} ">
		<div id="faq">
		
		<div id="faq_detail">
		
		<table id="faq_table" class="table table-striped" style="border:1px solid #dddddd; text-align: center; width: 1068px;">
	<thead>
		<tr>
			<th colspan="2" style="background-color: #eeeeee; text-align: center;" id="fd_table1">faq</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td style="width:20%;"id="fd_table1">번호</td><td colspan="2">${faqVo.fidx}</td>
		</tr>
		
		<tr>
		<td id="fd_table2">카테고리</td><td colspan="2">${faqVo.f_category}</td>
		</tr>
		<tr>
		<td id="fd_table3">제목</td><td colspan="2">${faqVo.f_title}</td>
		</tr>
		<tr>
		<td id="fd_table4">내용</td><td colspan="2" style="height:200px; text-align: center;">${faqVo.f_content}</td>
		</tr>
		</tbody>
		</table>
		<div style="padding-left:929px;">
		<!-- <a href="/spring/" id="homebutton_1">메인</a> -->
		<a class='btn btn-primary' href='/spring/faq_update.do?fidx=${faqVo.fidx}'>수정하기</a>
		<a href="/spring/service_center.do" class="btn btn-primary">글목록</a>
		</div>
		
		</div>
		</div>

		<!-- <input type="button" id="homebutton_1" value="메인으로"></a> -->
		<!-- <input type="button" id="btn-modal" value="장바구니"> -->
		


   


	</form>
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
<%-- <script src="${pageContext.request.contextPath}/resources/js/modal.js"></script> --%>
</html>
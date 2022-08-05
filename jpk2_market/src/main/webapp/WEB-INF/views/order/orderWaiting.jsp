<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/join_login.css" rel="stylesheet" />


<title>주문 완료</title>

    <!-- 카카오 주소 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- jquery 스크립트 -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <!-- js파일 연결  -->
   <script src="${pageContext.request.contextPath}/resources/js/join.js "></script>
   <script>
   $(function(){
	   if(${bank_num }==null){
	  $("#vbank_info").css(display,none); 
	   
	  
	   }
   });
   </script>
   
   <style>
   #orderwaiting_inner{
   	width:100%;
   	padding-top:150px;
   }
   
   #orderfin-inner{
    margin-top: 180px;
    min-height: 1040px;
    padding-left:341px;
    padding-right:350px;
   }
   
   #orderwaiting_table{
   width:425px;
   font-weight:bold;
   }
   
   #orderwaiting_td{
   padding-bottom:10px;
   }
   </style>
</head>

<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>

<div id="orderfin-inner">
<div id="orderwaiting_inner">

	<div>
		<img style="width:160px; float:left; margin-top:66px; margin-left:166px;" src="resources/img/order_check.png">
		
		<div style="float:right; width:814px;">
			<br>
			<h3>${member_name} 님의 주문이 완료 되었습니다.</h3>
			<br>
			<p>주문이 정상적으로 이루어 졌습니다.</p>
			
			<p>주문내역 및 결제상태에 관한 안내는  <b><a style="text-decoration-line: underline; color: #198754;"href="${pageContext.request.contextPath}/orderList.do">주문내역</a></b>을 통하여 확인 가능합니다.</p>
            
			<div id="vbank_info">
				<table id="orderwaiting_table">
					<tr>
					<td id="orderwaiting_td">가상계좌 은행명</td><td>${bank_name }</td>
					</tr>
					
					<tr>
					<td id="orderwaiting_td">가상계좌 예금주</td><td>${bank_holder }</td>
					</tr>
					
					<tr>
					<td id="orderwaiting_td">가상계좌 입금계좌번호</td><td>${bank_num }</td>
					</tr>
					
					<tr>
					<td id="orderwaiting_td">가상계좌 입금기한</td><td>${bank_date }</td>
					</tr>
					
				</table>
			</div>
		</div>
	</div>
		
		
<%--  		<br> <a href="${pageContext.request.contextPath}/index.do">메인으로 이동하기</a>
		<a href="${pageContext.request.contextPath}/orderList.do">주문내역 확인하기</a> --%>
		
	</div>
</div>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- HTML5 적용 표시 -->
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/join_login.css" rel="stylesheet" />


<title>회원 가입</title>

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
</head>

<body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>

<div id="joinfin-inner">
<div style="margin: 100px;">
		<br>
		<h3>안녕하세요. ${member_name} 님</h3>
		<br>
		<p>주문하신 상품의</p>
		<br>
		<p>주문이 정상적으로 이루어 졌습니다.</p>
		<div id="vbank_info">
		<table>
		<tr>
		<td>가상계좌 은행명
		</td>
		<td>가상계좌 예금주
		</td>
		<td>가상계좌 입금계좌번호
		</td>
		<td>가상계좌 입금기한
		</td>
		</tr>
		
		<tr>
		<td>${bank_date }
		</td>
		<td>${bank_holder }
		</td>
		<td>${bank_name }
		</td>
		<td>${bank_num }
		</td>
		</tr>
		</table>
		
		</div>
		
		
		
		<br> <a href="${pageContext.request.contextPath}/index.do">메인으로 이동하기</a>
		<a href="${pageContext.request.contextPath}/orderList.do">주문내역 확인하기</a>
	</div>
</div>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>        
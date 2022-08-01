<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 링크 받아오는 부분 -->
<link rel="stylesheet" type="text/css" href="./resources/css/style.css">

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Rocket Kurly</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="resources/js/scripts.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<!-- 배너 받아오는 부분 -->
<script src="${pageContext.request.contextPath}/resources/js/banner.js"></script>




<style>

/* 드롭다운 메뉴 css */
* {
	margin: 0;
	padding: 0;
} 

/* 전체영역에서 여백을 없애줌 */
ul {
	list-style: none;
} 

/* ul li태그에 리스트 스타일을 없앰,없어도 괜찮은데 새로고침할때 li 점 기호가 보여서 집어넣음 */
#icon1 {
	list-style-image: url("resources/img/icon.png");
} 

/* 카테고리 아이콘 이미지 */
a {
	text-decoration: none;
} 

/* a태그에 텍스트 밑줄을 없애줌*/
.menu>li>a {
	padding: 0 15px;
	height: 40px;
	line-height: 40px;
	color: #fff;
}

.menu>li:hover .depth_1 {
	display: block;
}

.menu .depth_1 {
	display: none;
	position: fixed;
	left: 41px;
	background-color: white;
	border: 1px solid #0000001a;
}

.menu .depth_1 a {
	display: block;
	margin: 5px; /* padding:5px; */
	color: #fff;
}

#cart_count {
	background-color: #bbbba270;
	width: 22px;
	height: 22px;
	float: right;
	border-radius: 35px;
	text-align: center;
}
/* .container {
  display: grid;
  grid-template-columns: 1fr 3fr;
} */


</style>


<script>
function cart(){
	var frm = document.frm;
	frm.action="${pageContext.request.contextPath}/cart_main.do";
	frm.method="POST";
	frm.submit();
	return;
}
</script>


</head>
<body>
<form id="frm" name="frm">
	<!-- <div class="top_banner">
	<div class="banner_inner">
		<div class="banner_content">상단배너</div>
		<div class="close_banner">X</div>
	
	</div>
</div> -->
	<!-- Navigation-->
	<!-- 상단 로고, 로그인부분 시작-->
	<nav class="navbar navbar-expand-lg bg-white text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/spring/">JPK2</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-black rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation"
				style="color: black;">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<!-- 
                       <li>
                          <a href="#" target="_blank"> <img src="resources/img/kurly_logo.PNG" width="150" height="100" align="left">   </a></li> -->
					<!--     <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/login.do">로그인</a></li>  -->
					
					<li class="nav-item mx-0 mx-lg-1">
						<%
                           if (session.getAttribute("member_id") == null){
                                out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/join.do'>회원가입</a>");
                               }%> <% 
                             long grade = 0L;
                            if (session.getAttribute("member_grade") != null) {
                            	grade = (long)session.getAttribute("member_grade");
                            	}
                        if ( grade >= 1){
                        	out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/admin.do'>["+session.getAttribute("member_name")+"] 님</a>");
                        	}
                        else if ((session.getAttribute("member_id") != null) && grade == 0){
                        	out.print("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/memberInfo.do'>["+session.getAttribute("member_name")+"] 님</a>");
                        }
                        %>
					</li>
					
					<li class="nav-item mx-0 mx-lg-1">
						<%
                  if (session.getAttribute("member_id") == null){
                     out.println("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/login.do'>로그인</a>");
                     }else{
                     out.println("<a class='nav-link py-3 px-0 px-lg-3 rounded' href='"+request.getContextPath()+"/logout.do'>로그아웃</a>");
                     }%>
					</li>
					
					<!-- <a class="nav-link py-3 px-0 px-lg-3 rounded" href="/spring/join.do">회원가입</a></li> -->
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded"
						href="/spring/notice_board.do">고객센터</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 로고, 로그인부분 끝-->

	<input type="hidden" value="${midx}" name="midx">
	<!-- 카테고리, 장바구니 로고 시작 -->
	<div class="fixed-top2" id="innerNav_1"
		style="padding-top: 110px; height: 178px; box-shadow: 0 3px 4px 0 rgb(0 0 0 / 6%);">
		<ul class="menu" style="margin-top: 28px; width: 1323px;">
			<li style="float: left;"><a href="#">전체 카테고리</a>
				<ul class="depth_1">
					<li id="icon1"><a href="/spring/productList_type.do?type=vegetable_fruit">채소/과일</a></li>
					<li id="icon1"><a href="/spring/productList_type.do?type=meat">정육</a></li>
					<li id="icon1"><a href="/spring/productList_type.do?type=fish_seafood">생선/해산물</a></li>
					<li id="icon1"><a href="/spring/productList_type.do?type=snacks">과자</a></li>
					<li id="icon1"><a href="/spring/productList_type.do?type=bakery">베이커리</a></li>
					<li id="icon1"><a href="/spring/productList_type.do?type=processedfood">가공식품</a></li>
					<li id="icon1"><a href="/spring/productList_type.do?type=etc">기타</a></li>


				</ul></li>
			<li style="float: left;"><a href="#">신상품</a></li>
			<li style="float: left;"><a href="#">베스트</a></li>
			<li style="float: left;"><a href="#">알뜰쇼핑</a></li>
			<li style="float: left;"><a href="#">특가/혜택</a></li>
			<%-- <li><a href="/spring/cart_main.do?midx=${midx}" style="margin-left: 710px;"><input type="image" value="장바구니" src="resources/img/cart.png" width=30px; ></a></li> --%>

				
				
				<!-- 마우스 올리면 이미지 변경 onmouseover 이벤트 -->
			<li style="float: right; width: 0px;"><a
				onclick="cart(${midx});" style="float: right;" id="cartbutton">
					<img src="resources/img/cart.png"
					onmouseover="this.src='resources/img/cart2.png'; document.getElementById('cartDiv').style.display = 'block';"
					onmouseout="this.src='resources/img/cart.png'; document.getElementById('cartDiv').style.display = 'none';" alt="장바구니"
					width=30px; style="cursor: pointer;"/>
			</a> <%-- <div id="cart_count">${result_}</div></li> --%> <%if(session.getAttribute("result_") == null){
            	 session.setAttribute("result_", 0);
             }
             else{
                  if ((Integer)session.getAttribute("result_") != 0){
                     out.println("<div id='cart_count'>"+(Integer)session.getAttribute("result_")+"</div>");
                     }else{
                     }
                     }%>
	
                     </li>
		</ul>

	</div>
	<!-- 카테고리, 장바구니 로고 끝 -->
</form>
</body>
</html>
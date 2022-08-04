<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style_css.css" rel="stylesheet" />

<title>제품 추가 페이지</title>

<style>
#admin_main_inner{
   margin-left:317px;
   min-height:1040px;
   padding-top:178px;
}
#admin_center_cate{
   
   /* padding-top:200px; */
   width:194px;
   float:left;
}
#table_button{
   margin-left: 155px;
   
} 
#admin_1{
  padding: 5px 0 35px 1px;
    font-weight: 700;
    font-size: 26px;
    line-height: 35px;
    color: #333;
    letter-spacing: -1px;
    margin-top: 35px;
    
}
#admin_sub{
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
#open_admin{
   border-bottom: 1px solid #f2f2f2;
    background-color: #fafafa;
    background-size: 6px 11px;
    font-weight: 700;
    color: #198754;
}
#admin_button{
   border-bottom: 1px solid #f2f2f2;
}

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
    display:none;
}
</style>



</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
    
    <div id="admin_main_inner">
   <div id="admin_center_cate">
   <div id="admin_1">관리자 페이지</div>
      <div id="admin_sub">   
      <a href="${pageContext.request.contextPath}/admin.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">통계</a>
      <a href="${pageContext.request.contextPath}/productAdd.do" class="nav-link py-3 px-0 px-lg-3" id="open_admin">상품등록페이지</a>
      <a href="${pageContext.request.contextPath}/adminProductList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">내가 등록한 상품목록</a>
      <a href="${pageContext.request.contextPath}/orderList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문내역</a>
      <input type="button" class="nav-link py-3 px-0 px-lg-3" value="주문상세페이지" id="admin_button" style="background-color: white; border: none;" onclick="order()">
     <%--<a href="${pageContext.request.contextPath}/orderListDetail.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문상세페이지</a> --%>
      </div>
   </div>

	
	<div id="admin_inner">
	
		<div id="table_button" style="width:962px;">
			<form name="productAddForm" action="${pageContext.request.contextPath}/addProductProcess.do" method="post" enctype="multipart/form-data">
			<table>
				<div id="product">
					<div id="product_img">상품 사진
						<input type="file" name="p_filename">
					</div>
					
					<!-- <div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
					    <label for="file">파일찾기</label> 
					    <input type="file" id="file">
					</div> -->
					
					<div id="product_detail">상품 제목<p/>
						<input type="text" class="form-control" name="p_name">
						<hr>
						상품 부제목<p/>
						<input type="text" class="form-control" name="p_secondname"><p/>
						<hr>
						상품 가격<p/>
						<input type="text" class="form-control" name="p_price"><p/>
						<hr>
						상품 판매 단위<p/>
						<input type="text" class="form-control" name="p_unit">
						<hr>
						상품 중량/용량<p/>
						<input type="text" class="form-control" name="p_weight">
						<hr>
						배송 구분<p/>
						<input type="text" class="form-control" name="p_delivery">
						<hr>
						포장 타입<p/>
						<input type="text" class="form-control" name="p_package">
						<hr>
						알레르기 정보<p/>
						<input type="text" class="form-control" name="p_allergy">
						<hr>
						유통기한<p/>  
						<input type="text" class="form-control" name="p_limitdate">
						<hr>
						타입<p/>
						<select name="p_type">
							<option value="vegetable_fruit">채소/과일</option>
							<option value="meat">정육</option>
							<option value="fish_seafood">생선/해산물</option>
							<option value="snacks">과자</option>
							<option value="bakery">베이커리</option>
							<option value="processedfood">가공식품</option>
							<option value="etc">기타</option>
						</select>
						<hr>
						태그<p/>
						<input type="text" class="form-control" name="p_tag">
					</div>
				</div>
					<div id="home_button"><input type="submit" value="등록하기"></div><p/>
				</table>
			</form>
		</div>
	</div>
	</div>
    
    
	
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
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

#input_half{
	width:50%;
	display:inline !important; 
}
</style>
<script>
function statistics(){
	var frm = document.frm;
	frm.action="${pageContext.request.contextPath}/statistics.do";
	frm.method="POST";
	frm.submit();
	return;
}
</script>
<script>
  function check(){  
  var fm = document.frm2;   
	if (fm.p_name.value=="";){
		alert("상품제목을 입력해주세요");
		fm.p_name.focus();
		return false;
	}else if(fm.p_price.value=="";){
		alert("상품가격을 입력해주세요");
		fm.p_price.focus();
		return false;
	}else if(fm.p_unit.value=="";){
		alert("상품판매단위를 입력해주세요");
		fm.p_unit.focus();
		return false;
	}else if(fm.p_weight1.value=="";){
		alert("상품중량/용량을 입력해주세요");
		fm.p_weight.focus();
		return false;
	}else if(fm.p_allergy.value=="";){
		alert("상품의 알레르기 정보를 입력해주세요");
		fm.p_allergy.focus();
		return false;
	}else if(fm.p_limitdate.value=="";){
		alert("상품의 유통기한 정보를 입력해주세요");
		fm.p_limitdate.focus();
		return false;
	}else if(fm.p_allergy.value=="";){
		alert("상품의 알레르기 정보를 입력해주세요");
		fm.p_allergy.focus();
		return false;
	}else if(fm.p_tag.value=="";){
		alert("상품의 태그 정보를 선택해주세요");
		fm.p_tag.focus();
		return false;
	}
  		fm.action = "<%=request.getContextPath()%>/addProductProcess.do";
  		fm.method = "post";
  		fm.submit();   
  
    return;
  }  
  </script>
</head>
<body>

    <!-- 헤더 연결 -->
    <jsp:include page="../header.jsp"></jsp:include> 
    
    
    <div id="admin_main_inner">
   <div id="admin_center_cate">
   <div id="admin_1">관리자 페이지</div>
      <div id="admin_sub">   
      <input type="button" class="nav-link py-3 px-0 px-lg-3" value="통계" id="admin_button_1" style="background-color: white; border: none;" onclick=statistics()>
      <a href="${pageContext.request.contextPath}/productAdd.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">상품등록페이지</a>
      <a href="${pageContext.request.contextPath}/adminProductList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">내가 등록한 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminOrderList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문내역</a>     <%--<a href="${pageContext.request.contextPath}/orderListDetail.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">주문상세페이지</a> --%>
      <a href="${pageContext.request.contextPath}/adminProductCheck.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록심사중인 상품목록</a>
      <a href="${pageContext.request.contextPath}/adminMemberList.do" class="nav-link py-3 px-0 px-lg-3" id="admin_button">등록된 회원 목록</a> 
   </div>
   </div>
	<div id="admin_inner">
		<div id="table_button" style="width:962px; min-height:1186px;">
			<form name="frm2" action="${pageContext.request.contextPath}/addProductProcess.do" method="post" enctype="multipart/form-data">
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
						<br>
						상품 부제목
						<input type="text" class="form-control" name="p_secondname">
						
						<br>
						상품 가격
						<input type="number" class="form-control" name="p_price">
						<br>
						
						상품 판매 단위
						<br>
						<input type="number" class="form-control" id="input_half" name="p_unit">개
						<br><br>
						
						상품 중량/용량
						<br>
						<input type="number" class="form-control" id="input_half"  name="p_weight1">
						<select name="p_weight2">
							<option value="KG">KG</option>
							<option value="L">L</option>
						</select>
						<br><br>
						
						배송 구분
						<select name="p_delivery">
							<option value="새벽배송">새벽배송</option>
							<option value="낮배송">낮배송</option>
							<option value="일반택배">일반택배</option>
						</select>
						<br><br>
						
						포장 타입
						<select name="p_package">
							<option value="박스">박스</option>
							<option value="비닐팩">비닐팩</option>
							<option value="신선포장">신선포장</option>
						</select>
						<br><br>
						
						알레르기 정보
						<input type="text" class="form-control" name="p_allergy">
						<br>
						
						유통기한
						<input type="text" class="form-control" name="p_limitdate">
						<br>
						
						타입<br>
						<select name="p_type">
							<option value="vegetable_fruit">채소/과일</option>
							<option value="meat">정육</option>
							<option value="fish_seafood">생선/해산물</option>
							<option value="snacks">과자</option>
							<option value="bakery">베이커리</option>
							<option value="processedfood">가공식품</option>
							<option value="etc">기타</option>
						</select>
						<br><br>
						
						태그
						<input type="text" class="form-control" name="p_tag">
					</div>
				</div>
					<div id="home_button"><input type="submit" class="btn btn-outline-success" value="등록하기"></div><p/>
				</table>
			</form>
		</div>
	</div>
	</div>
    
    
	
    <!-- 푸터 연결 -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
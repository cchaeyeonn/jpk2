<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>주문서</title>
        <!-- jQuery library (served from Google) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        
        <!-- Font Awesome icons (free version)-->
        <script src="resources/js/scripts.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8">
     sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>
<div id="wrap" style="padding-top:239px; margin-left:414px; margin-right:401px;">
<h1 align="center">주문상세내역</h1>
<form>
<div id="order-product">
<!-- 장바구니에 있는 물건중 체크된 물건을 가져와서 foreach -->
주문상품<p/>
<hr>
<table>
<tr>
<td colspan="2">상품 이름</td><td>&nbsp;&nbsp;&nbsp;</td><td>개수</td><td>&nbsp;&nbsp;&nbsp;</td><td>상품 가격</td>
</tr>
<c:forEach items="${CartList}" var="cartVo" varStatus="status">  
<tr>
<td><div><img class="img-fluid4" src="${pageContext.request.contextPath}/resources/product_image/${orderVo.p_system_filename}" alt="..."  /></div></td>
<td>${cartVo.p_name}</td><td>&nbsp;&nbsp;&nbsp;</td><td>${cartVo.p_amount}&nbsp;개</td><td>&nbsp;&nbsp;&nbsp;</td><td><span id="${cartVo.pbidx}_p_price"></span></td>
</tr>
</c:forEach>
</table>
</div>
<div>
결제 금액<p/>
<hr>
<table>
<tr>
<td>상품 총 가격</td><td></td><td>상품 할인</td><td></td><td>배송비</td><td></td><td>총 결제 금액</td>
</tr>
<tr>
<td><span id="sum_price"></span></td><td>-</td><td><span id="sale_price">0원</span></td><td>+</td><td><span id="del_price"></span></td><td>=</td>
<td><span id="total_price">${orderVo.pay_price}원</span>
</td>
</tr>
</table>
</div>
<div id="orderer-info">
<!-- 세션값에 있는 midx를 이용해서 주문자의 정보를 가져옴 -->
주문 정보<p/>
<hr>
<table>
<tr>
<td>주문 번호</td><td id="d_from">${orderVo.order_id}</td>
</tr>
<tr>
<td>보내는 사람</td><td id="d_from">${delVo.d_from}</td>
</tr>
<tr>
<td>결제 일시</td><td>${orderVo.pay_findate}</td>
</tr>
</table>
</div>
<div id="delivery-info">
<!-- 지도 api와 jQuery를 이용해서 정보를 기입하기 -->
배송정보<p/>
<hr>
<table>
<tr>
<td>주문 번호</td><td id="d_from">${orderVo.order_id}</td>
</tr>
<tr>
<td>보내는 사람</td><td id="d_from">${delVo.d_from}</td>
</tr>
<tr>
<td>결제 일시</td><td>${orderVo.pay_findate}</td>
</tr>
</table>
</div>
<div id="pay-way">
<!-- 결제수단을 선택하고 이에따라 아래에 나타나는 창이 다르게 -->
결제 수단<p/>
<hr>
<div>
임의 수단
</div>
</div>
<div id="pay-term">
 <div style="height:20px"><span id="result_order_term" style="font-size:12px;"></span></div>
<a href="${pageContext.request.contextPath}/orderList.do"><input type="button" value="주문내역으로 돌아가기"></a>
<a href="${pageContext.request.contextPath}/index.do"><input type="button" value="메인으로 돌아가기"></a>
</div>
</form>
</div>
    <jsp:include page="../footer.jsp"></jsp:include>

 <!-- Bootstrap core JS-->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> 
</body>
</html>
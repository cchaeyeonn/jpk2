<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- footer CSS -->
<link rel="stylesheet" href="./resources/css/footertest.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<style>
body{
	min-width:350px;
}
#topButton {
	position: fixed;
	right: 2%;
	bottom: 135px;
	display: none;
	z-index: 999;
}

#index_inner {
	min-height: 350px;
}
@media screen and (max-width: 990px) {
  #footer {
    display: none;
  }
} 
</style>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "dad7feba-6892-48d8-9eda-7ea66af7c6c3"
  });
</script>
<!-- End Channel Plugin -->
<!-- topbutton 스크립트 시작 -->
<script>
     
      
      $(window).scroll(function() {
          // top button controll
          if ($(this).scrollTop() > 300) { 	//500만큼 내려가면 topbutton 보임
              $('#topButton').fadeIn();
          } else {
              $('#topButton').fadeOut();
          }
      });
      
      
      $(document).ready(function() {
           // Top Button click event handler
           $("#topButtonImg").click(function() {
             $('html, body').animate({scrollTop:0}, '300'); //버튼을 누르면 제일 위까지 부드럽게 올라옴
           });
         });
      
      </script>
<!-- topbutton 스크립트 끝 -->


</head>
<body>




	<!-- 누르면 상단으로 가는 top버튼 시작 -->
	<div id="topButton" style="cursor: pointer">
		<img src="resources//img/upbutton_ori.png" id="topButtonImg" style="width:58px; margin-right:7px;">
	</div>
	<!-- 누르면 상단으로 가는 top버튼 끝 -->



	<!-- Footer-->
	<div id="footer" style="padding-top: 40px;">
	<hr style="color:#eee;">
		<div class="footer-top">
			<div class="inner_footer">
				<div class="footer_cc">
				
					<h2 class="tit_cc">고객센터</h2>
					<div class="cc_view cc_call">
						<h3>
							<span class="tit">1234-5678</span>
						</h3>
						<dl class="list">
							<dt>365고객센터</dt>
							<dd>오전 7시 - 오후 7시</dd>
						</dl>
					</div>
					<div class="cc_view cc_kakao">
						<h3>
							<a class="tit" href="#none" onclick="alert('서비스 준비중입니다.')">카카오톡 문의</a>
						</h3>

						<dl class="list">
							<dt>365고객센터</dt>
							<dd>오전 7시 - 오후 7시</dd>
						</dl>
					</div>
					<div class="cc_view cc_qna">
						<h3>
							<a href="#none" class="tit" onclick="alert('서비스 준비중입니다.')">1:1 문의</a>
						</h3>
						<dl class="list">
							<dt>24시간 접수 가능</dt>
							<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
						</dl>
					</div>
				</div>
				<div class="company">
					<ul class="list">
						<li><a style="text-decoration: none;" class="link" href="#" onclick="alert('서비스 준비중입니다.')">소개</a></li>
						<li><a style="text-decoration: none;" class="link" href="#" onclick="alert('서비스 준비중입니다.')">소개영상</a></li>
						<li><a style="text-decoration: none;" class="link" href="#" onclick="alert('서비스 준비중입니다.')">이용약관</a></li>
						<li><a style="text-decoration: none;" class="link emph"
							href="#" onclick="alert('서비스 준비중입니다.')">개인정보처리방침</a></li>
						<li><a style="text-decoration: none;" class="link" href="#" onclick="alert('서비스 준비중입니다.')">이용안내</a></li>
					</ul>
					법인명 (상호) : Fresh Market <span class="bar">I</span> 사업자등록번호 : 123-45-678910
					 <br> 통신판매업 : 제 2022-0627-0831 호 <span
						class="bar">I</span> 개인정보보호책임자 : Fresh Market <br> 주소 : 전북 전주시 <span
						class="bar">I</span> 대표이사 : Fresh Market <br> 팩스: 070 - 7500 - 6098 <span
						class="bar">I</span> 이메일 : <a style="text-decoration: none;"
						href="#none" class="link">Fresh Market@help.com</a> <br>

					<ul class="list_sns">
						<li><a href="https://instagram.com/" class="link_sns"
							target="_blank"><img
								src="https://res.kurly.com/pc/ico/1810/ico_instagram.png"
								alt="인스타그램 바로가기"></a></li>
						<li><a href="http://blog.naver.com/" class="link_sns"
							target="_blank"><img
								src="https://res.kurly.com/pc/ico/1810/ico_blog.png"
								alt="네이버블로그 바로가기"></a></li>
						<li><a
							href="https://www.youtube.com/"
							class="link_sns lst" target="_blank"><img
								src="https://res.kurly.com/pc/ico/1810/ico_youtube.png"
								alt="유튜브 바로가기"></a></li>
					</ul>
				</div>
			</div>

		</div>
		<div class="footer_indemnification_clause">
			<p class="txt">Fresh Market에서 판매되는 상품 중에는 Fresh Market에 입점한 개별 판매자가 판매하는
				마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.</p>
			<p class="txt">마켓플레이스(오픈마켓) 상품의 경우 컬리는 통신판매중개자로서 통신판매의 당사자가 아닙니다.
				컬리는 해당 상품의 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.</p>
			<em class="copy">&copy; jpk2 CORP. ALL RIGHTS RESERVED</em>
		</div>
	</div>
</body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
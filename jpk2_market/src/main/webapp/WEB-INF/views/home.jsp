<!DOCTYPE html>
<html lang="UTF-8">
  <head>
  <%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿test5</title>

     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	-->
<!-- 	<style>
	.container {
  display: grid;
  grid-template-columns: 1fr 3fr;
}
	</style> -->
	
	<!-- css 받아오는 부분 -->
	<link rel="stylesheet" type="text/css" href="resources/css2/style.css">
	
    
   
    
  </head>
  <body>
<div id="wrap">
	<div class="container">
		<div class="b-example-divider"></div>
		
			<jsp:include page="header.jsp"></jsp:include>
			
	
	</div>
	<div id="main">
		<div id="main-inner">
			
		</div>
	
	</div>
		<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	
	<!-- <footer id="footer" class="bd-footer py-5 mt-5 bg-light">
  <div class="container py-5">
    <div class="row">
      <div class="col-lg-3 mb-3">
        <a class="d-inline-flex align-items-center mb-2 link-dark text-decoration-none" href="/" aria-label="Bootstrap">
          <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" class="d-block me-2" viewBox="0 0 118 94" role="img"><title>Bootstrap</title><path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z" fill="currentColor"/></svg>
          <span class="fs-5">Bootstrap</span>
        </a>
        <ul class="list-unstyled small text-muted">
          <li class="mb-2"> <a href="/docs/5.1/about/team/">Bootstrap 팀</a>이 <a href="https://github.com/twbs/bootstrap/graphs/contributors">기여자 분들</a>의 도움으로 세상의 모든 사랑을 받아 디자인되고 빌드되었습니다.</li>
          <li class="mb-2"><a href="https://github.com/alexkoala">@alexkoala</a>, <a href="https://github.com/jjulee">@jjulee</a>, <a href="https://github.com/hwang1588">@hwang1588</a>님이 한국어로 번역해주셨습니다.</li>
          <li class="mb-2">코드 라이선스는 <a href="https://github.com/twbs/bootstrap/blob/main/LICENSE" target="_blank" rel="license noopener">MIT</a>이며 문서 라이선스는 <a href="https://creativecommons.org/licenses/by/3.0/" target="_blank" rel="license noopener">CC BY 3.0</a>입니다.</li>
          <li class="mb-2">현재 v5.1.3입니다.</li>
        </ul>
      </div>
      <div class="col-6 col-lg-2 offset-lg-1 mb-3">
        <h5>링크</h5>
        <ul class="list-unstyled">
          <li class="mb-2"><a href="/">홈</a></li>
          <li class="mb-2"><a href="/docs/5.1/">문서</a></li>
          <li class="mb-2"><a href="/docs/5.1/examples/">예시</a></li>
          <li class="mb-2"><a href="https://themes.getbootstrap.com/">테마(영어)</a></li>
          <li class="mb-2"><a href="https://blog.getbootstrap.com/">블로그(영어)</a></li>
        </ul>
      </div>
      <div class="col-6 col-lg-2 mb-3">
        <h5>가이드</h5>
        <ul class="list-unstyled">
          <li class="mb-2"><a href="/docs/5.1/getting-started/">시작하기</a></li>
          <li class="mb-2"><a href="/docs/5.1/examples/starter-template/">스타터 템플릿</a></li>
          <li class="mb-2"><a href="/docs/5.1/getting-started/webpack/">Webpack</a></li>
          <li class="mb-2"><a href="/docs/5.1/getting-started/parcel/">Parcel</a></li>
        </ul>
      </div>
      <div class="col-6 col-lg-2 mb-3">
        <h5>프로젝트</h5>
        <ul class="list-unstyled">
          <li class="mb-2"><a href="https://github.com/twbs/bootstrap">Bootstrap 5</a></li>
          <li class="mb-2"><a href="https://github.com/twbs/bootstrap/tree/v4-dev">Bootstrap 4</a></li>
          <li class="mb-2"><a href="https://github.com/twbs/icons">Icons</a></li>
          <li class="mb-2"><a href="https://github.com/twbs/rfs">RFS</a></li>
          <li class="mb-2"><a href="https://github.com/twbs/bootstrap-npm-starter">npm 스타터</a></li>
        </ul>
      </div>
      <div class="col-6 col-lg-2 mb-3">
        <h5>커뮤니티</h5>
        <ul class="list-unstyled">
          <li class="mb-2"><a href="https://github.com/twbs/bootstrap/issues">이슈</a></li>
          <li class="mb-2"><a href="https://github.com/twbs/bootstrap/discussions">토론</a></li>
          <li class="mb-2"><a href="https://github.com/sponsors/twbs">후원사</a></li>
          <li class="mb-2"><a href="https://opencollective.com/bootstrap">Open Collective</a></li>
          <li class="mb-2"><a href="https://bootstrap-slack.herokuapp.com/">Slack</a></li>
          <li class="mb-2"><a href="https://stackoverflow.com/questions/tagged/bootstrap-5">Stack Overflow</a></li>
          <li class="mb-2"><a href="https://github.com/arumduri"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="navbar-nav-svg d-inline-block align-text-top" viewBox="0 0 16 16" role="img"><title>한국어 번역에 참여하기</title><path fill="currentColor" d="M4.545 6.714 4.11 8H3l1.862-5h1.284L8 8H6.833l-.435-1.286H4.545zm1.634-.736L5.5 3.956h-.049l-.679 2.022H6.18z"/><path fill="currentColor" d="M0 2a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v3h3a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-3H2a2 2 0 0 1-2-2V2zm2-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H2zm7.138 9.995c.193.301.402.583.63.846-.748.575-1.673 1.001-2.768 1.292.178.217.451.635.555.867 1.125-.359 2.08-.844 2.886-1.494.777.665 1.739 1.165 2.93 1.472.133-.254.414-.673.629-.89-1.125-.253-2.057-.694-2.82-1.284.681-.747 1.222-1.651 1.621-2.757H14V8h-3v1.047h.765c-.318.844-.74 1.546-1.272 2.13a6.066 6.066 0 0 1-.415-.492 1.988 1.988 0 0 1-.94.31z"/></svg> 한국어 번역</a></li>
        </ul>
      </div>
    </div>
  </div>
</footer> -->
   
</div>
 <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
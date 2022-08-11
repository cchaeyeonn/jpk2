<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	
	<title>Fresh Market</title>
	
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
        


	<script type="text/javascript">
  function chatChannel() {
    Kakao.Channel.chat({
      channelPublicId: '_ZeUTxl',
    })
  }
</script>
      <!-- 이미지 슬라이드 스크립트 -->
      <script>
      	$(document).ready(function () {
    	        $('.bxslider').bxSlider({ // 클래스명 주의!
    	            auto: true, // 자동으로 애니메이션 시작
    	            speed: 500,  // 애니메이션 속도
    	            pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
    	            mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
    	            /* autoControls: true, // 시작 및 중지버튼 */
    	            pager: true, // 페이지 표시 보여짐
    			    autoHover: true   // 마우스 호버시 정지 여부
    	        });
    	    });
      
      </script>
      
		<!-- 이미지 슬라이드 css -->    
		<style>
		.bx-wrapper {
	         position: relative;
	         margin-bottom: 60px;
	         padding: 0;
	         -ms-touch-action: pan-y;
	         touch-action: pan-y;
	         -moz-box-shadow: 0 0 5px #ffffff !important;
	         -webkit-box-shadow: 0 0 5px #ffffff !important;
	         box-shadow: 0 0 5px #ffffff !important;
	         border: 9px solid #fff !important;
	         background: #fff;
         }
		.bx-wrapper .bx-prev {
			left: 265px;
			background: url("resources/img/controls.png") 0 -32px no-repeat
		}
		
		.bx-wrapper .bx-prev:focus, .bx-wrapper .bx-prev:hover {
			background-position: 0 0
		}
		
		.bx-wrapper .bx-next {
			right: 262px;
			background: url("resources/img/controls.png") -43px -32px no-repeat
		}
		
		.bx-wrapper .bx-next:focus, .bx-wrapper .bx-next:hover {
			background-position: -43px 0
		}
		

   
    </style>

      
</head>
    
<body id="page-top">
    
	<!-- 헤더 연결 -->
	<jsp:include page="header.jsp"></jsp:include> 
       
        
	<!-- 헤더 카테고리와 이미지 슬라이드 구역 시작 -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
		<!-- <img class="k_nava" src="resources/img/k_tpk.PNG" alt="..."  style="width: 1150px;  height: 380px;"/> -->
            
		<!-- Masthead Avatar Image-->
		<!-- <img class="" src="resources/assets/img/avataaars.svg" alt="..." /> -->
                
		<!-- Masthead Heading-->
		<!-- <h1 class="masthead-heading text-uppercase mb-0">Hello, JPK2 Market</h1> -->
		<!-- Icon Divider-->
		<!-- <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
		</div>
		Masthead Subheading
		<p class="masthead-subheading font-weight-light mb-0">Rocket Kurly</p> -->
                
                
		</div>
            
	<!-- 이미지 슬라이드  -->
	<ul class="bxslider">
		<li><img style="width:100%;" src="resources/img/main_1.png" /></li>
		<li><img style="width:100%;" src="resources/img/main_2.png" /></li>
		<li><img style="width:100%;" src="resources/img/main_3.png" /></li>
		<!-- <li><img src="/images/pic4.jpg" /></li> -->
	</ul>

	</header>
	<!-- 헤더 카테고리와 이미지 슬라이드 구역 끝 -->
       
	<div id="index_inner">
		<c:import url="/productList.do">
			<c:param name="p_name" value="${p_name}"/>
			<c:param name="p_price" value="${p_price}"/>
			<c:param name="p_type" value="${p_type}"/>
		</c:import>
           
	</div>      
        
        

        

        <!-- Contact Section -->
 			<!-- <section class="page-section" id="contact">
            <div class="container">
                Contact Section Heading
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact Me</h2>
                Icon Divider
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                Contact Section Form
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        * * * * * * * * * * * * * * *
                        * * SB Forms Contact Form * *
                        * * * * * * * * * * * * * * *
                        This form is pre-integrated with SB Forms.
                        To make this form functional, sign up at
                        https://startbootstrap.com/solution/contact-forms
                        to get an API token!
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            Name input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">Full name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                            </div>
                            Email address input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">Email address</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            Phone number input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                            </div>
                           
 							Message input
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">Message</label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                            </div>
                            Submit success message
                           
                            This is what your users will see when the form
                            has successfully submitted
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    To activate this form, sign up at
                                    <br />
                                    <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            Submit error message
                           
                            This is what your users will see when there is
                            an error submitting the form
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            Submit Button
                            <button class="btn btn-primary btn-xl disabled" id="submitButton" type="submit">Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </section> -->
        
<!--         <div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_tqFzxj"
  data-title="consult"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div> -->
        
	<!-- 푸터 연결 -->
	<jsp:include page="footer.jsp"></jsp:include>
        
        
        
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
    	<!-- 이미지 슬라이드 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<!--     <script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script> -->
</html>
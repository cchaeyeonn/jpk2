<!DOCTYPE html>
<html lang="utf-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Rocket Kurly</title>
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
        
        <!-- 이미지 슬라이드 -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

      <!-- 이미지 슬라이드 스크립트-->
      <script>
      $(document).ready(function(){
           $('.bxslider').bxSlider();
         });
      </script>
      
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
   
   
   
   
      #topButton {
      position: fixed; 
      right: 2%; 
      bottom: 50px; 
      display: none; 
      z-index: 999;
      }
      
      #index_inner{
      min-height: 1040px;
      }

      </style>
      
      
      <!-- topbutton 스크립트 시작 -->
      <script>
      
      $(window).scroll(function() {
          // top button controll
          if ($(this).scrollTop() > 500) {
              $('#topButton').fadeIn();
          } else {
              $('#topButton').fadeOut();
          }
      });
      
      
      $(document).ready(function() {
           // Top Button click event handler
           $("#topButtonImg").click(function() {
             $('html, body').animate({scrollTop:0}, '300');
           });
         });

      
      </script>
      <!-- topbutton 스크립트 끝 -->
      
    </head>
    
    <body id="page-top">
    
       <!-- 헤더 연결 -->
       <jsp:include page="header.jsp"></jsp:include> 
       
       

        <!-- 누르면 상단으로 가는 top버튼 시작 -->
        <div id="topButton" style="cursor: pointer"><img src="resources//img/topbutton.png" id="topButtonImg"></div>
        <!-- 누르면 상단으로 가는 top버튼 끝 -->
        
        <!-- Masthead-->
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
              <li><img src="resources/img/main_1.png" /></li>
              <li><img src="resources/img/main_2.png" /></li>
              <li><img src="resources/img/main_3.png" /></li>
            <!--   <li><img src="/images/pic4.jpg" /></li> -->
         </ul>

        </header>
       
        <div id="index_inner">
           <c:import url="/productList.do">
                      <c:param name="p_name" value="${p_name}"/>
                      <c:param name="p_price" value="${p_price}"/>
                      <c:param name="p_type" value="${p_type}"/>
           </c:import>
           
        </div>
        
        
        


        
        <!-- Contact Section -->
 <!--        <section class="page-section" id="contact">
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
</html>
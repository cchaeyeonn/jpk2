<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link
   href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css'
   rel='stylesheet'>
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'
   rel='stylesheet'>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>비밀번호찾기</title>
<style>
   /* #findPw {
   margin:auto; 
   padding:0px 20px 0px 20px; 
   float:center; 
   Width:60%; 
   text-align:center;
   }
   #findPw_1 {
   margin:auto; 
   padding:0px 20px 0px 20px; 
   float:center; 
   Width:60%; 
   text-align:center;
   }
   #findPw_2 {
   margin:auto; 
   padding:17px 20px 0px 339px; 
   float:center; 
   Width:60%; 
   text-align:center;
   margin-left:65px;
   }
   #findPw_3 {
   margin:auto; 
   padding:0px 0px 0px 0px; 
   float:center; 
   Width:25%; 
   text-align:right; 
   font-size:8px;
   }
   #findPw_4 {
   margin:auto; 
   padding:0px 20px 0px 20px; 
   float:center; 
   Width:60%; 
   text-align:center;
   }
   #findPw_content {
   padding-top:260px;
   min-height:1040px;
   } */
   
   
   @import
   url('https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Poppins&display=swap')
   ;

* {
   padding: 0;
   margin: 0;
   box-sizing: border-box
}

body {
   background-color: #eee;
   height: 100vh;
   font-family: 'Poppins', sans-serif;
}

#body_inner {
   padding-top: 178px;
}

.wrapper {
   max-width: 500px;
   border-radius: 10px;
   margin: 50px auto;
   padding: 30px 40px;
   box-shadow: 20px 20px 80px rgb(206, 206, 206)
}

#wrapper_inner {
   min-height: 650px;
   padding-top: 80px;
}

.h2 {
   font-family: 'Kaushan Script', cursive;
   font-size: 3.5rem;
   font-weight: bold;
   /* color: #400485; */
   /* color:#198754; */
   font-style: italic
}

.h4 {
   font-family: 'Poppins', sans-serif
}

.input-field1 {
   border-radius: 6px 6px 0 0;
   padding: 5px;
   display: flex;
   align-items: center;
   cursor: pointer;
   border: 1px solid #c3c3c3;
   color: #c3c3c3;
}

.input-field2 {
   border-radius: 0 0 6px 6px;
   padding: 5px;
   display: flex;
   align-items: center;
   cursor: pointer;
   border: 1px solid #c3c3c3;
   color: #c3c3c3;
}

.input-field1:hover {
   /* color: #198754; */
   color: #959595;
   border: 1px solid #959595;
}

.input-field2:hover {
   /* color: #198754; */
   color: #959595;
   border: 1px solid #959595;
}

.findpw_input {
   border: none;
   outline: none;
   box-shadow: none;
   width: 100%;
   padding: 0px 2px;
   font-family: 'Poppins', sans-serif
}

#input_cover{
	padding-left: 293px;
}


a {
   text-decoration: none;
   color: #400485;
   font-weight: 700
}

a:hover {
   text-decoration: none;
   color: #7b4ca0
}


.btn.btn-block {
   background-color: #198754;
   color: #fff
}

.btn.btn-block:hover {
   /* background-color: #55268be0 */
   background-color: #198754;
   /*background-color: #90b990;*/
   color: #fff
}

@media ( max-width : 575px) {
   .wrapper {
      margin: 10px
   }
}

@media ( max-width :424px) {
   .wrapper {
      padding: 30px 10px;
      margin: 5px
   }
/*    .option {
      position: relative;
      padding-left: 22px
   }
   .option label.text-muted {
      font-size: 0.95rem
   }
   .checkmark {
      position: absolute;
      top: 2px
   }
   .option .checkmark:after {
      top: 50%
   }
   #forgot {
      font-size: 0.95rem
   } 
}*/

    

</style>
    <!-- jquery 스크립트(항상 최신버전의 제이쿼리를 사용한다) -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script>
  function check(){  
  var fm = document.frms;   
  if (fm.member_name.value==""){
        alert("이름 입력해주세요");
        fm.member_id.focus();
        return;
  }else if (fm.member_email.value==""){
        alert("이메일을 입력해주세요");
        fm.member_email.focus();
        return;
  }
        fm.action = "<%=request.getContextPath()%>/findPwProcess.do";
        fm.method = "post";
        fm.submit();  
  
    return;
  }  
</script>
  
  
<script>
$(document).on('click','#trigger',function(){if($("#member_name").val() != "",$("#member_email").val() != ""){
        $("#trigger").hide();
        }});
</script>

<script>
$(document).on('click','#trigger',function(){if($("#member_name").val() != "",$("#member_email").val() != ""){
        $("#toloading").show();
        }});
</script>

<!-- <script type="text/javascript">
function doloading(){
	var con = document.getElementById("toloading");
	alert(con.style.display);
	if(con.style.display == "none"){
		con.style.display == "block";
	}
	else{
		con.style.display = "none";
	}
}

</script> -->

</head>


<body oncontextmenu='return false' class='snippet-body'>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>




   <div id="body_inner">
      <div id="wrapper_inner">
         <div class="wrapper bg-white">
            <div class="h2 text-center">비밀번호 찾기</div>
            <div class="h4 text-muted text-center pt-2"></div>
            
            <form name="frms">
               <div class="form-group">
                  <div class="input-field1">
                     <!-- <span class="far fa-user p-2"></span> -->
                        <!-- <input type="text" name="member_id" placeholder="아이디를 입력해주세요" required class=""> -->
                        <input type="text" id="member_name" class="findpw_input" name="member_name" size="30" placeholder="이름 입력해주세요">
                        
                  </div>
               </div>
               <div class="form-group">
                  <div class="input-field2">
                     <!-- <span class="fas fa-lock p-2"></span>  -->
                     <!-- <input type="password" name="member_pw" placeholder="비밀번호를 입력해주세요" required class=""> -->
                     <input type="text" id="member_email" class="findpw_input" name="member_email" size="30" placeholder="이메일주소를 입력해주세요">
                     
                         <!-- <i class="far fa-eye-slash"></i> -->
                        
                     
                     
                  </div>
               </div>
               
               <!-- <div class="d-flex align-items-start">
                  <div class="ml-auto">
                     <a style="font-size: 12px; color: #545454;" href="findId.do">아이디
                        찾기</a> | <a style="font-size: 12px; color: #545454;"
                        href="findPw.do">비밀번호 찾기</a>
                  </div>
               </div> -->
               
               <div id="input_cover">
               <input style="margin-top:20px;" type="button" id="trigger" class="btn btn-outline-success" value="확인" onclick="check();">
               <input style="margin-top:20px;" type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='login.do'">
               <input type="image" src="resources/img/loadingbar.gif" id="toloading" style="display:none; margin-top:7px; padding-left: 190px; padding-right: 193px; pointer-events: none;"class="btn btn-outline-success">
               </div>
         
            </form>
         </div>
      </div>
   </div>
   <script type='text/javascript'></script>
<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>



<%-- <body>
<!-- 헤더연결 -->
<jsp:include page="../header.jsp"></jsp:include>


<div id="findPw_content">
<form name="frm">
<div id="findPw">
<div id="findPw_1">
<h3>비밀번호 찾기</h3>
</div>
<div id="findPw_2">
<p><input type="text" class="form-control" id="member_id" name="member_id" size="30" placeholder="아이디를 입력해주세요"></p>
<p><input type="text" class="form-control" id="member_id" name="member_email" size="30" placeholder="이메일주소를 입력해주세요"></p>
</div>
<div id="findPw_3">
</div>
<div id="findPw_4">
<input type="button" id="trigger" class="btn btn-outline-success" value="확인" onclick="check();">
<input type="button" class="btn btn-outline-success" value="뒤로" onclick="location.href='login.do'">
</div>
</div>
</form>
</div>

<!-- 푸터 연결 -->
<jsp:include page="../footer.jsp"></jsp:include>
</body> --%>
</html>
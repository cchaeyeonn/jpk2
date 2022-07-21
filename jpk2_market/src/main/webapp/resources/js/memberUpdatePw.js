
 
 // 비밀번호 일치 스크립트 이하 제이쿼리 활용 -->
	
		$(function(){
			

			var ctx = getContextPath();
            function getContextPath() {
            return sessionStorage.getItem("contextpath");
            }
 
 			$("#now_pw").focusout(function(){
				
				let now_pw = $("#now_pw").val();

				$.ajax({
					type:'post',
					url:ctx+"/checkPw.do",
					data: {"now_pw":now_pw},				
					success: function(data){
						if(data == "N"){
							result = "현재 비밀번호가 일치하지 않습니다.";
							$("#result_checkPw").html(result).css("color", "red");
							$("#now_pw").val("").trigger("focus");
						}else{
							result = "";
							$("#result_checkId").html(result).css("color", "red");
							$("#member_id").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
			
			});
 
 
  // 비밀번호 형식 유효성 검사( 8 ~ 16자 영문, 숫자 조합으로만 입력 되는지 검사를 한다.)
          $("#member_pw1").focusout(function(){
          if(!reg.test($("#member_pw1").val())){
           result = "8 ~ 16자 영문, 숫자 조합으로만 입력 되어야 합니다";
	       $("#result_password").html(result).css("color", "red");
	       $("#member_pw1").val("");
	       $("#member_pw2").val("");
           $("#member_pw1").focus();
           }
           
          else if(reg.test($("#member_password1").val())){
        	  result = " ";
   	       $("#result_password").html(result).css("color", "white");
          }
           return false;
             
          });
          
});
          
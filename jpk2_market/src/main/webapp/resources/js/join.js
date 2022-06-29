/**
 *   join 페이지 관련 스크립트 관리 파일입니다.
 
 */
 
 
  // 카카오 주소 api 
   
     function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;	//우편번호
                document.getElementById("member_addr_1").value = roadAddr;	//도로명주소
                document.getElementById("member_addr_2").focus();			//상세주소 (창이꺼지면서 상세주소에 focus가 가도록)

               
              }
          }).open();
       }
    
    
  
	
	// 아이디 중복검사 스크립트 -->
	
		$(function(){
			
			 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
             let reg = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);

			
			
			
			
			$("#member_id").focusout(function(){
				
				let member_id = $("#member_id").val();
				
				$.ajax({
					type:'post',
					url:"/spring/checkId.do",
					data: {"member_id":member_id},				
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 아이디입니다.";
							$("#result_checkId").html(result).css("color", "green");
							$("#member_pw").trigger("focus");
						}else{
							result = "이미 사용중인 아이디입니다.";
							$("#result_checkId").html(result).css("color", "red");
							$("#member_id").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
			
			});
			
			// 이메일 중복검사 스크립트 -->
			
			$("#member_email").focusout(function(){
				
				let member_email = $("#member_email").val();
				
				$.ajax({
					type:'post',
					url:"/spring/checkEmail.do",
					data: {"member_email":member_email},
					success: function(data){
						if(data == "N"){
							result = "사용 가능한 이메일입니다.";
							$("#result_checkEmail").html(result).css("color", "green");
							$("#member_memberphone").trigger("focus");
						}else{
							result = "이미 사용중인 이메일입니다.";
							$("#result_checkEmail").html(result).css("color", "red");
							$("#member_email").val("").trigger("focus");
						}
					},
					error: function(error){alert(error);}
				});
			
			});
			
				
          // 약관 전체 체크 박스관련 스크립트 
          $(document).on('click','#chk_all',function(){
	       if($('#chk_all').is(':checked')){
		    $('.del-chk').prop('checked',true);
		     }else{
		    	$('.del-chk').prop('checked',false);
			  }
               });
          $(document).on('click','.del-chk',function(){
	      if($('input[class=del-chk]:checked').length==$('.del-chk').length){
	    	$('#chk_all').prop('checked',true);
		   }else{
			$('#chk_all').prop('checked',false);
			}
            });

		  // 유효성 검사
		  // 아이디 유효성 검사
		  $(document).on('click','.btn btn-outline-success',function(){
		  if($("#member_id").val() == ""){
           result = "아이디를 입력해주세요";
	       $("#result_checkId").html(result).css("color", "red");
           $("#member_id").focus();
           return false;
          }
          
          // 아이디 형식 유효성 검사
          if(!getMail.test($("#member_id").val())){
           result = "이메일 형식으로 입력하세요";
	       $("#result_checkId").html(result).css("color", "red");
           $("#member_id").focus();
           return false;
          }

          // 비밀번호 유효성 검사
	      if($("#member_pw").val() == ""){
           result = "비밀번호를 입력하세요";
	       $("#result_password1").html(result).css("color", "red");
           $("#member_password1").focus();
           return false;
             }
      
          // 비밀번호 형식 유효성 검사( 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자가 되는지 검사를 한다.)
          
          if(!reg.test($("#member_password1").val())){
           result = "영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자가 되어야 합니다";
	       $("#result_password1").html(result).css("color", "red");
           $("#member_password1").focus();
           return false;
             }
             
          // 비밀번호가 아이디와 같지 않도록 하는 유효성 검사
          if($("#member_id").val() == $("#member_password1").val()){
             result = "아이디와 비밀번호가 같습니다";
	       $("#result_password1").html(result).css("color", "red");
           $("#member_password1").focus();
                     return false;
           }
 
          // 비밀번호 확인란  공백 유효성 검사
          if($("#member_password2").val() == ""){
           result = "비밀번호 확인란을 입력해주세요";
	       $("#result_password2").html(result).css("color", "red");
           $("#member_password2").focus();
           return false;
             }
	
           // 비밀번호 확인 유효성 검사
		   if($("#member_password1").val() != $("#member_password2").val()){
              result = "비밀번호가 서로 다릅니다";
	          $("#result_password2").html(result).css("color", "red");
              $("#member_password1").val("");
              $("#member_password2").val("");
              $("#member_password1").focus();
              return false;
               }	
			// 이름 유효성 검사
			if($("#member_name").val() == ""){
              result = "이름을 입력해주세요";
	          $("#result_name").html(result).css("color", "red");
              $("#member_name").focus();
              return false;
          }
			// 이메일 유효성 검사
			if($("#member_email").val() == ""){
              result = "이메일을 입력해주세요";
	          $("#result_checkEmail").html(result).css("color", "red");
              $("#member_email").focus();
              return false;
          }
			// 이메일 형식 유효성 검사
			if(!getMail.test($("#member_email").val())){
           result = "이메일 형식으로 입력하세요";
	       $("#result_checkEmail").html(result).css("color", "red");
           $("#member_email").focus();
           return false;
          }
           // 핸드폰 번호 유효성 검사
          
			if($("#member_phone").val() == ""){
              result = "핸드폰 번호를 입력해주세요";
	          $("#result_phone").html(result).css("color", "red");
              $("#member_phone").focus();
              return false;
          }
		   // 주소 유효성 검사
		    if($("#member_addr_1").val() == ""){
              result = "주소를 입력해주세요";
	          $("#result_addr").html(result).css("color", "red");
              return false;
          }
		    if($("#member_addr_2").val() == ""){
              result = "주소를 입력해주세요";
	          $("#result_addr").html(result).css("color", "red");
              return false;
          }
            //성별 유효성 검사
		   	if($("input[name=member_gender]:radio:checked").length < 1){
			  result = "성별을 선택하세요";
	          $("#result_gender").html(result).css("color", "red");
              return false;
			
			
		 }
			//생년월일이 오늘이 최대값이 되도록 설정
			var now_utc = Date.now();
			var timeOff = new Date().getTimezoneOffset()*60000;
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("date").setAttribute("max", today);
			
		   
		    //생년월일 유효성 검사
		     if($("#member_birth").val() == "2022-01-01"){
              result = "생년월일을 입력해주세요";
	          $("#result_birth").html(result).css("color", "red");
              return false;
          }
			//약관 유효성 검사
			if (!$("input:checked[Name='member_termall']").is(":checked")){
			  result = "약관을 동의해주세요";
	          $("#result_term").html(result).css("color", "red"); 
		     return false;
	      }else if (!$("input:checked[Name='member_term1']").is(":checked")){
			  result = "약관을 동의해주세요";
	          $("#result_term").html(result).css("color", "red"); 
		   return false;
	      }
	      else if (!$("input:checked[Name='member_term2']").is(":checked")){
			  result = "약관을 동의해주세요";
	          $("#result_term").html(result).css("color", "red"); 
		   return false;
	      }
	      else if (!$("input:checked[Name='member_term3']").is(":checked")){
			  result = "약관을 동의해주세요";
	          $("#result_term").html(result).css("color", "red"); 
		   return false;
	      }

         });
			
		});


	


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
       };       
    function maxDate(){
    var now_utc = Date.now() // 지금 날짜를 밀리초로
								// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
							// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("member_birth").setAttribute("max", today);
    };
       

    
  
	
	// 아이디 중복검사 스크립트 이하 제이쿼리 활용 -->
	
		$(function(){
			
			 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
             let reg = RegExp(/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/);

			var ctx = getContextPath();
            function getContextPath() {
            return sessionStorage.getItem("contextpath");
            }
			
			
			
			$("#member_id").focusout(function(){
				
				let member_id = $("#member_id").val();
				
				if(member_id == ""){
					 result = "아이디를 입력해주세요";
	     			  $("#result_checkId").html(result).css("color", "red");    			      
					  return false;
					
				}
				$.ajax({
					type:'post',
					url:ctx+"/checkId.do",
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
				
				if(member_email == ""){
					 result = "이메일을 입력해주세요";
	     			  $("#result_checkEmail").html(result).css("color", "red");
					  return false;
					
				}
				
				$.ajax({
					type:'post',
					url:ctx+"/checkEmail.do",
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
	       if($('#chk_all').is(':checked')){   //$("선택요소").is("비교할 요소 또는 표현식) : 특정요소가 선택요소와 관련값 또는 현재의 상태 등을 확인 후 Boolean 값 true, false로 반환
		    $('.del-chk').prop('checked',true); //prop(): ()안에 값이 하나일 경우 속성값을 가져오고 두개일 경우 첫번째 값에 두번째 값을 부여한다. 속성값 관련 메소드로 보면 된다.
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
		 
          // 아이디 형식 유효성 검사
          $(document).on('click','#trigger',function(){   
		  if(member_id == ""){
					 result = "아이디를 입력해주세요";
	     			  $("#result_checkId").html(result).css("color", "red");
					  return false;
					
				}else if(!getMail.test($("#member_id").val())){
           result = "이메일 형식으로 입력하세요";
	       $("#result_checkId").html(result).css("color", "red");
	       $("#member_id").val("");
           return false;
          }
          });
          
          
           
          // 비밀번호 유효성 검사
          $(document).on('click','#trigger',function(){
	      if($("#member_password1").val() == ""){
           result = "비밀번호를 입력하세요";
	       $("#result_password1").html(result).css("color", "red");
           return false;
             }
            });
          // 비밀번호 형식 유효성 검사( 8 ~ 16자 영문, 숫자 조합으로만 입력 되는지 검사를 한다.)
          $("#member_password1").focusout(function(){
          if(!reg.test($("#member_password1").val())){
           result = "8 ~ 16자 영문, 숫자 조합으로만 입력 되어야 합니다";
	       $("#result_password1").html(result).css("color", "red");
	       $("#member_password1").val("");
	       $("#member_password2").val("");
           }
           
          else if(reg.test($("#member_password1").val())){
        	  result = " ";
   	       $("#result_password1").html(result).css("color", "white");
          }
           return false;
             
          });
          
          $("#member_password1").focusout(function(){
          if(reg.test($("#member_password1").val())){
        	  result = "";
          } return false;
            });
             
          // 비밀번호가 아이디와 같지 않도록 하는 유효성 검사
          $(document).on('click','#trigger',function(){
          if($("#member_id").val() == $("#member_password1").val()){
             result = "아이디와 비밀번호가 같습니다";
	       $("#result_password1").html(result).css("color", "red");
	       $("#member_password1").val("");
                     return false;
           }
           });
           
 
          // 비밀번호 확인란  공백 유효성 검사
           $(document).on('click','#trigger',function(){
          if($("#member_password2").val() == ""){
           result = "비밀번호 확인란을 입력해주세요";
	       $("#result_password2").html(result).css("color", "red");
           return false;
             }
             });
	
           // 비밀번호 확인 유효성 검사
           $("#member_password2").focusout(function(){
		   if($("#member_password1").val() != $("#member_password2").val()){
              result = "비밀번호가 서로 다릅니다";
	          $("#result_password2").html(result).css("color", "red");
              $("#member_password1").val("");
              $("#member_password2").val("");
               }
		   else if($("#member_password1").val() == $("#member_password2").val()){
			   result = "비밀번호가 일치합니다.";
		          $("#result_password2").html(result).css("color", "green");
		       
		              
		   }
		   return false;
               });	
			// 이름 유효성 검사
			$("#member_name").focusout(function(){
			if($("#member_name").val() == ""){
              result = "이름을 입력해주세요";
	          $("#result_name").html(result).css("color", "red");
	          $("#member_name").val("");
          }
			else if($("#member_name").val() != ""){
				result = "이름이 참 멋지시네요.";
				$("#result_name").html(result).css("color", "green");
			}return false;
          });
          
           $(document).on('click','#trigger',function(){
         	 if($("#member_name").val() == ""){
              result = "이름을 입력해주세요";
	          $("#result_name").html(result).css("color", "red");
	          $("#member_name").val("");
              return false;
          }
			});
			// 이메일 형식 유효성 검사
			$(document).on('click','#trigger',function(){
			if(member_email == ""){
					 result = "이메일을 입력해주세요";
	     			  $("#result_checkEmail").html(result).css("color", "red");
					  return false;
					
				}else if(!getMail.test($("#member_email").val())){
           result = "이메일 형식으로 입력하세요";
	       $("#result_checkEmail").html(result).css("color", "red");
	       $("#member_email").val("");
           return false;
          }
          });
           // 핸드폰 번호 유효성 검사
          $("#member_phone").focusout(function(){
			if($("#member_phone").val() == ""){
              result = "핸드폰 번호를 입력해주세요";
	          $("#result_phone").html(result).css("color", "red");

              return false;
          }
          });
           // 핸드폰 번호 형식 유효성 검사
           
           $("#member_phone").on('keydown', function(e){
          // 숫자만 입력받기
        	   var trans_num = $(this).val().replace(/-/gi,'');
        	   var k = e.keyCode;
				
        	   if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
        	   {
        		   e.preventDefault();
        	   }
           }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        	   
        if($(this).val() == '')
        	return;

        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != '')
        {
        	
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                    result = " ";
	                $("#result_phone").html(result).css("color", "red");
                }
                else
                {
                    result = "유효하지 않은 전화번호 입니다.";
	                $("#result_phone").html(result).css("color", "red");

                }
            }
            
            
            else 
            {
                result = "유효하지 않은 전화번호 입니다.";
	                $("#result_phone").html(result).css("color", "red");
	                $("#member_phone").val("");

              }
            
            
           }
       });
         
          $(document).on('click','#trigger',function(){
          	if($("#member_phone").val() == ""){
              result = "핸드폰 번호를 입력해주세요";
	          $("#result_phone").html(result).css("color", "red");

              return false;
          }
          });
          
          
          
		   // 주소 유효성 검사
		    $(document).on('click','#trigger',function(){
		    if($("#postcode").val() == ""){
              result = "주소를 입력해주세요";
	          $("#result_addr").html(result).css("color", "red");
              return false;
          }
		   $(document).on('click','#trigger',function(){
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
          });
          
          $("#member_addr_2").focusout(function(){
		   if($("#member_addr_2").val() != ""){
				result = "";
				$("#result_addr").html(result).css("color", "green");
			}return false;
		   
		   
		  }); 
            //성별 유효성 검사
            $(document).on('click','#trigger',function(){
		   	if($("input[name=member_gender]:radio:checked").length < 1){
			  result = "성별을 선택하세요";
	          $("#result_gender").html(result).css("color", "red");
	          return false;

		 }
			else if($("input[name=member_gender]:radio:checked").length == 1){
				  result = " ";
		          $("#result_gender").html(result).css("color", "red");
		          
			} 
		});	
			$("input:radio[name=member_gender]").click(function(){
               if($("input[name=member_gender]:radio:checked").length == 1){
				  result = " ";
		          $("#result_gender").html(result).css("color", "red");
		          
				
				}
			});
		   
		    //생년월일 유효성 검사
		    $("#member_birth").focusout(function(){
             if($("#member_birth").val() != ""){
              result = " ";
	          $("#result_birth").html(result).css("color", "red");
            return false;
          }
          });
		    
		    
            $(document).on('click','#trigger',function(){
		     if($("#member_birth").val() == ""){
              result = "생년월일을 입력해주세요";
	          $("#result_birth").html(result).css("color", "red");
	          return false;
          }
          });
          
            
			//약관 유효성 검사
			$(document).on('click','#trigger',function(){
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
	      
	      $("#chk_all").click(function(){
		   result = "";
	          $("#result_term").html(result).css("color", "red"); 
		  	//로딩중 버튼이 사라짐
	   $(document).on('click','#trigger',function(){
	   if($("input:checked[Name='member_termall']").is(":checked",true), !getMail.test($("#member_email").val()), $("#member_birth").val() != "",
         $("#member_phone").val()!="", $("#postcode").val() != "", $("#member_addr_1").val() != "", $("#member_addr_2").val() != "",
         $("#member_email").val() != "", $("#member_name").val() != "", $("#member_password1").val() != "",
         $("#member_password2").val() != "",$("#member_id").val() != ""){
         $("#trigger").hide();
         $("#toloading").show();
         }});
		
	});


		


	      

         });
			
		


	


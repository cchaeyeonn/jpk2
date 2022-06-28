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
			
			$("#member_id").focusout(function(){
				alert("jquery");
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

			
			
			
		});


	


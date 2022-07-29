$(function(){

  var ctx = getContextPath();
  
  
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
  
  
  
}
});
		var IMP = window.IMP;
        IMP.init("imp42068652");
        var inputValue;

    function requestPay() {
     
    
 		          inputValue = $("input:radio[name='method']:checked").val();
  		          price = $("#total_price_").val();
                  addr1 = $("#member_addr_1").val();
                  addr2 = $("#member_addr_2").val();
                  postcode = $("#postcode").val();
    		          if($("#member_addr_2").val() == ""){
    		           result = "상세주소를 입력해주세요";
    			       $("#result_member_addr").html(result).css("color", "red");
    		           $("#member_addr_2").focus();
    		           return false;
    		             }
 
 
    		          if($("#member_addr_1").val() == ""){
    		           result = "주소를 입력해주세요";
    			       $("#result_member_addr").html(result).css("color", "red");
    		           $("#member_addr_1").focus();
    		           return false;
    		             }
    
    
    		          if($("#member_addrcode").val() == ""){
    		           result = "주소를 입력해주세요";
    			       $("#result_member_addr").html(result).css("color", "red");
    		           $("#member_addrcode").focus();
    		           return false;
    		             }
   
    		          if(!$("input:checked[name='order_term']").is(":checked")){
    		           result = "필수 약관입니다. 동의해주세요";
    			       $("#result_order_term").html(result).css("color", "red");
    		           return false;
    		             }


    	
    	
    	
    	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: inputValue,
          merchant_uid: 'merchant_' + new Date().getTime(),
          name: "이니시스_jpk2",
          amount: price,
          buyer_email: "kick8057@naver.com",
          buyer_name: member_name,
          buyer_tel: "010-4457-8057",
          buyer_addr: addr1+addr2,
          buyer_postcode: postcode
      }, function (rsp) { // callback
          if (rsp.success) {
        	// 결제 성공 시 로직,
        	  var msg = '결제가 완료되었습니다.';
        	  
        	
        	
        	
        	
        	
              
              
          } else {
        	// 결제 실패 시 로직,
        	  var msg = '결제에 실패하였습니다.';
        	  msg += '에러내용 : ' + rsp.error_msg;

              
              
          }
          alert(msg);
      });
    }

	    		

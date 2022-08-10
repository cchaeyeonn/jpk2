$(function(){

  var ctx = getContextPath();
  var sum_price=0;
  sum_price = $("#for_price").val()*$('#pop_out').val();
  
 
	
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
  let new_sum_price = priceToString(sum_price);  
   $('#for_sum_price').text(new_sum_price+"원");
  
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
 
  let number = $('#pop_out').val();
    	    number = parseInt(number)
            if(number<=1){
            $('#btn_minus').prop("disabled", true);
            number=1;
            }
 
 
 
 
	
// 카트삭제 ajax
$("#cart_delete").click(function(){
			
			let cart_idx_arr = new Array();
			
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 cart_idx값을 배열에 저장
			$("input[class='del-chk']:checked").each(function(index, item){
				cart_idx_arr[index] = $(item).val();
				
			});
			
			$.ajax({
				type: "post",
				url: ctx+"/cart_delete.do",
				data: {
					"cart_idx_arr": cart_idx_arr,
					
				},
				async: false,
				success: function(data){
					if(data == "N"){
						alert("장바구니삭제 실패!");
					}else{
						location.reload();
						
						
						
					}
					
				},
				error: function(error){ alert("체크박스를 체크해주세요"); }
			});
			
		});		
		
				
		
	
	
	
	
	
	
	
//체크박스 전체 동작 관련 스크립트 
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
	      
// + - 버튼 


$('#btn_minus').on('click',function(){
	        let number = $('#pop_out').val();
    	    number = parseInt(number)
            if(number<=1){
            $('#btn_minus').prop("disabled", true);
            number=1;
            }else{
    	
            $('#pop_out').attr('value',number-=1);   	
         }
            if(number<=1){
            $('#btn_minus').prop("disabled", true);
            number=1;
            }
            $('#pop_out').text(number);
            sum_price = $("#for_price").val()*$('#pop_out').val();
            let new_sum_price = priceToString(sum_price);
  			$('#for_sum_price').text(new_sum_price+"원");
            });

    $('#btn_plus').on('click',function(){
	       let number = $('#pop_out').val();
    	    number = parseInt(number)
    	    if(number>=2){
                    $('#btn_minus').prop("disabled", false);
                    $('#pop_out').attr('value',number+=1);
                    }else{
            $('#pop_out').attr('value',number+=1);
             }
             if(number>=2){
                    $('#btn_minus').prop("disabled", false);
                    
                    }
    		$('#pop_out').text(number);
    		sum_price = $("#for_price").val()*$('#pop_out').val();
  			 let new_sum_price = priceToString(sum_price);
  			$('#for_sum_price').text(new_sum_price+"원");
    	   });
	   








	    		
  });
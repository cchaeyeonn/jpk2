$(function(){

  var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
 
  var index = $("#pbidx").val();
  var cart_delete_idx = "#btn_delete_" + index;
 
 
 
 
	
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
						
						$("tr:has(input:checked)").remove();
						
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
let number = $('#pop_out').val();

$('#btn_minus').on('click',function(){
	
    	    number = parseInt(number)
            if(number<=1){
            alert('더이상 줄일수 없습니다.');
            number=1;
            }else{
    	
            $('#pop_out').attr('value',number-=1);   	
         }
            
            $('#pop_out').text(number);
            
            });

    $('#btn_plus').on('click',function(){
    	    number = parseInt(number)
    	    
            $('#pop_out').attr('value',number+=1);

    		$('#pop_out').text(number);
    		
    	   });
	   








	    		
  });
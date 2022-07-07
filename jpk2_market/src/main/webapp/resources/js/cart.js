$(function(){
	
	
	
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
	    
        $('#pop_out').attr('value',number-=1);
        
        $('#pop_out').text(number);
        });

$(document).on('click','#btn_plus',function(){
	    number = parseInt(number)
        $('#pop_out').attr('value',number+=1);


		$('#pop_out').text(number);
	   });  
	    	
	    		
  });
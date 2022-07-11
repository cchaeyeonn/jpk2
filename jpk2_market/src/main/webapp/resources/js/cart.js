$(function(){
	
// 카트삭제 ajax
$("#cart_delete").click(function(){
			
			let cart_idx_arr = new Array();
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 member_idx값을 배열에 저장
			$("input:checked").each(function(index, item){
				cart_idx_arr[index] = $(item).val();
			});
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/cart_delete.do",
				data: {
					"cart_idx_arr": cart_idx_arr
				},
				success: function(data){
					if(data == "N"){
						alert("장바구니삭제 실패!");
					}else{
						//회원목록에서 삭제 체크된 회원정보를 테이블에서 삭제하기
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){ alert("장바구니삭제 중 에러발생"); }
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

$(document).on('click','#btn_plus',function(){
	    number = parseInt(number)
	    
        $('#pop_out').attr('value',number+=1);


		$('#pop_out').text(number);
	   });  
	   
   
	   
	   
	    	
	    		
  });
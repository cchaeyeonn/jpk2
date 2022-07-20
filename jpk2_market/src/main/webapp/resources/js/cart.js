$(function(){

  var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
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
						//회원목록에서 삭제 체크된 회원정보를 테이블에서 삭제하기
						$("tr:has(input:checked)").remove();
						
					}
					Calc();
				},
				error: function(error){ alert("체크박스를 체크해주세요"); }
			});
			
		});		
		
$("#btn_delete").click(function(){
			
			let pbidx = $("#btn_delete").val();
			
		
			
			$.ajax({
				type: "post",
				url: ctx+"/cart_deleteOne.do",
				data: {
					"pbidx":pbidx
				},
				async: false,
				success: function(data){
					if(data == "N"){
						alert("해당 항목의 체크박스를 체크해주세요");
					}else{
						
						//회원목록에서 삭제 체크된 회원정보를 테이블에서 삭제하기
						/*$("tr:has(input:checked)").remove();*/
					}
					Calc();
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
            Calc();
            });

    $('#btn_plus').on('click',function(){
    	    number = parseInt(number)
    	    
            $('#pop_out').attr('value',number+=1);

    		$('#pop_out').text(number);
    		Calc();
    	   });
	   
 //계산 스크립트
    function Calc(){
	 var amount = new Array();
	 var price = new Array();  
	 var one_price = new Array();
	 var totalprice = 0;
	   amount = document.querySelectorAll(".amount");
	   price = document.querySelectorAll(".price");
	    for(var i=0; i < amount.length; i++){
	    	one_price[i] = amount[i].value()*price[i].value();
	    	totalprice += one_price[i];
		 
		
      	}
      	alert(totalprice);
	 $('#totalprice').text(totalprice);  
	}   
	
 //로드 시 계산 스크립트 적용
 $(document).ready(function(){	
    Calc();  	    	




})







	    		
  });
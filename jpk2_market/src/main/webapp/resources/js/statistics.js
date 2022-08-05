
    $(function() {
		
		
        $("#datepicker1, #datepicker2").datepicker({
            minDate: new Date('2020-01-01'),
			maxDate : 0,
			showOn:"button",
        	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
        	buttonImageOnly: true,
        	changeMonth:true,
        	changeYear:true,
        	nextText:"다음",
        	prevText:"이전"
        	
			
			
        });
        $('#datepicker1').datepicker('setDate', '2022-01-01');
        $('#datepicker2').datepicker('setDate', 'today');
         
         
         
          $("#datefilter1").click(function(){
       		 $('#datepicker2').datepicker('setDate', 'today');
        	 $('#datepicker1').datepicker('setDate', '-7D');
        });
          $("#datefilter2").click(function(){
       		 $('#datepicker2').datepicker('setDate', 'today');
        	 $('#datepicker1').datepicker('setDate', '-3M');
        });
          $("#datefilter3").click(function(){
       		 $('#datepicker2').datepicker('setDate', 'today');
        	 $('#datepicker1').datepicker('setDate', '-6M');
        });
          $("#datefilter4").click(function(){
       		 $('#datepicker2').datepicker('setDate', 'today');
        	 $('#datepicker1').datepicker('setDate', '-1Y');
        });
    });


  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });

 
  
  
  
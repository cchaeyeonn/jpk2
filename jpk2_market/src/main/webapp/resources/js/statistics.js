
       
$(function(){
	
	$(".datepicker").datepicker({dateFormat:"yy-mm-dd"});
	
	});
	
function maxDate(){
    var now_utc = Date.now() // 지금 날짜를 밀리초로
								// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
							// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("endDate").setAttribute("max", today);
    };	
	
	

	
dateFormatter = function(newDay, today){
	
	let year = newDay.getFullYear();
	let month = newDay.getMonth()+1;
	let date = newDay.getDate();
	
	
	//기존 날짜와 새로운 날짜가 다를 경우
	if(today){
		let todayDate = today.getDate();
		
		if(date != todayDate){
			if(month==0) year -=1;
			month = (month + 11) % 12;
			date = new Date(year, month, 0).getDate(); //해당 달의 마지막 날짜를 반환
			
		}
		
	}
	
	month = ("0"+month).slice(-2);
	date = ("0"+date).slice(-2);
	
	return year + "-" + month + "-" + date
	
	
};
	
	document.getElementsByName("filterDate").forEach( e =>{
		e.addEventListener("click", function(){
			alert("a");
			let endDate = new Date($("#endDate").val());
			let newDate = new Date($("#endDate").val());
			
			
			switch(this.value){
				case '1':
					new Date.setDate(newDate.getDate() -7)
					newDate = dateFormatter(newDate)
					break;
				case '2':
					new Date.setMonth(newDate.getMonth() -3)
					newDate = dateFormatter(newDate, endDate)
					break;
				case '3':
					new Date.setMonth(newDate.getMonth() -6)
					newDate = dateFormatter(newDate, endDate)
					break;
				case '4':
					new Date.setFullYear(newDate.getFullyYear() -1)
					newDate = dateFormatter(newDate, endDate)
					break;
				
			};
			
			$("#strtDate").val(newDate);
			
			
			
		});
		
		
		
		
	});

	
	
	
	
	
	
	
	
	
	

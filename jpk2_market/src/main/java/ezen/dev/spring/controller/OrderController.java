package ezen.dev.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class OrderController {
	
	@GetMapping("/orderSheet.do")//get諛⑹떇 �슂泥� 泥섎━
	public String orderSheet() {
		return "order/orderSheet";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

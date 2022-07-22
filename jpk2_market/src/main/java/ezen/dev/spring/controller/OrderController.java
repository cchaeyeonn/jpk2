package ezen.dev.spring.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.service.CartService;
import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.service.OrderService;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.OrderVo;


@Controller
public class OrderController {
	
	private OrderService orderService;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	private MemberService memberService;
	
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	private CartService cartService;
	
	
	@GetMapping("/orderSheet1.do")
	public String orderSheet1() {
		return "order/orderSheet";
	}
	
	
	@PostMapping("/orderSheet.do")
	public String orderSheet(CartVo cartVo, Model model, HttpServletRequest request, @RequestParam("pbidx") int pbidx) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		MemberVo memberVo = memberService.getMemberInfo(member_id);
		Integer midx =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		HashMap<String, Integer> CartInfo = new HashMap<String, Integer>();
		CartInfo.put("midx", midx);
		CartInfo.put("pbidx", pbidx);
		List<CartVo> cartList = cartService.getSomeCartList(CartInfo);
		model.addAttribute(memberVo);
		model.addAttribute(cartList);
		
		return"order/orderSheet";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

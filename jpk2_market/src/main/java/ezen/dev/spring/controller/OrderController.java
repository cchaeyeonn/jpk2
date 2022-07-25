package ezen.dev.spring.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

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
	public String orderSheet(CartVo cartVo, OrderVo orderVo, Model model, HttpServletRequest request, @RequestParam("pbidx") Integer[] pbidx) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		MemberVo memberVo = memberService.getMemberInfo(member_id);

		/*
		 * List<Integer> pbidxList = pbidxArr.stream() .map(s->Integer.parseInt(s))
		 * .collect(Collectors.toList());
		 */
		for(Integer mmm : pbidx) {
		System.out.println("pbidx: "+ mmm);}

		List<Integer> pbidxList = Arrays.asList(pbidx);
		List<OrderVo> orderList = cartService.getSomeCartList(pbidxList);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("orderList", orderList);
		
		return"order/orderSheet";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

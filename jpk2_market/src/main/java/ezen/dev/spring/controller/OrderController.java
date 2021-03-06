package ezen.dev.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	
	private CartService cartService;
	
	@Autowired
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}
	
	
	@PostMapping("/orderSheet.do")
	public String orderSheet(CartVo cartVo, OrderVo orderVo, Model model, HttpServletResponse response, HttpServletRequest request, @RequestParam(value="pbidx", required=false) Integer[] pbidx, @RequestParam("sum_price") String sum_price) throws IOException {
		
		if(pbidx!=null) {
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
		model.addAttribute("sum_price", sum_price);
		
		return"order/orderSheet";}
	else{
		response.setContentType("text/html;??charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('????????? ????????? ????????? ?????????.'); history.back();}</script>");
		out.flush();
		return null;
	}
	
		
	
	
	
	}
	@GetMapping("/orderList.do")
	public String orderList() {
		
		return "order/orderList";
	}
	
	@PostMapping("/orderListDetail.do")
	public String orderListDetail() {
		
		return "order/orderListDetail";
	}
	
	@PostMapping("/orderSuccess.do")
	public String orderSuccess() {
		
		
		
		return "order/orderSuccess";
	}
	
	@PostMapping("/orderWaitng.do")
	public String orderWaiting() {
		
		
		
		return "order/orderWaiting";
	}
	
	
	
	
	
	
	
	
	
	
}

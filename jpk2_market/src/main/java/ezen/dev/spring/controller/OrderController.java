package ezen.dev.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

		List<Integer> pbidxList = new ArrayList<>( Arrays.asList(pbidx));
		List<OrderVo> orderList = cartService.getSomeCartList(pbidxList);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("orderList", orderList);
		model.addAttribute("sum_price", sum_price);
		session.setAttribute("pbidxList", pbidxList);
		return"order/orderSheet";}
	else{
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>window.onload = function(){alert('결제할 상품을 선택해 주세요.'); history.back();}</script>");
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
	public String orderSuccess(@RequestParam("pay_method") String pay_method, 
			@RequestParam("pay_amount") int paid_amount,@RequestParam("pay_findate") Long pay_at,
			@RequestParam("status") String pay_status,@RequestParam("merchant_uid") String merchant_uid,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		

			List<Integer> pbidxList = (List<Integer>)session.getAttribute("pbidxList");
			ArrayList<Integer> pidx_pc_arr = new ArrayList<Integer>();
			pidx_pc_arr = (ArrayList<Integer>) session.getAttribute("pidx_pc_arr");
		System.out.println(pay_method);
		System.out.println(paid_amount);
		System.out.println(pay_at);
		System.out.println(pay_status);
		System.out.println(merchant_uid);
		
		int midx_mo=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		Long pay_findate = pay_at *1000;
		Date date = new Date(pay_findate);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date_ = format.format(date);
		System.out.println(date_);
		String orderpay_check;
		if(pay_status.equals("paid")) {
			 orderpay_check = "Y"; 
			
			
		}else {
			 orderpay_check = "N";
		};
		
		
		OrderVo orderVo = new OrderVo();
		
		for(int i=0; i<pbidxList.size();i++) {
		
		
		orderVo.setPay_way(pay_method);
		orderVo.setP_price(paid_amount);
		orderVo.setPay_findate(date_);
		orderVo.setP_check(orderpay_check);
		orderVo.setMidx_mo(midx_mo);
		orderVo.setPbidx_co(pbidxList.get(i));	
		orderVo.setOrder_id(merchant_uid);
		orderService.add_order(orderVo);
		}
		cartService.del_cart(midx_mo);
		int count = cartService.cart_count(midx_mo);
		session.setAttribute("result_", count);
		pbidxList.removeAll(pbidxList);
		for(Integer mmm : pbidxList) {
			System.out.println("pbidx: "+ mmm);}
		session.setAttribute("pbidxList", pbidxList);
		pidx_pc_arr.removeAll(pidx_pc_arr);
		for(Integer mmm : pidx_pc_arr) {
			System.out.println("pidx: "+ mmm);}
		session.setAttribute("pidx_pc_arr", pidx_pc_arr);
		
		
		return "order/orderSuccess";
	}
	
	@PostMapping("/orderWaitng.do")
	public String orderWaiting() {
		
		
		
		return "order/orderWaiting";
	}
	
	
	
	
	
	
	
	
	
	
}

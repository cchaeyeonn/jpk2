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
import ezen.dev.spring.service.DelService;
import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.service.OrderService;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.DelVo;
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
	
	private DelService delService;
	
	@Autowired
	public void setDelService(DelService delService) {
		this.delService = delService;
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
	public String orderList(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer midx =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		List<OrderVo> orderList = orderService.getOrderList(midx);		
		model.addAttribute("orderList", orderList);
		
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
			@RequestParam("addr1") String addr1,@RequestParam("addr2") String addr2,@RequestParam("addrcode") String addrcode,
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
		DelVo delVo = new DelVo();
		for(int i=0; i<pbidxList.size();i++) {
		
		
		orderVo.setPay_way(pay_method);
		orderVo.setP_price(paid_amount);
		orderVo.setPay_findate(date_);
		orderVo.setP_check(orderpay_check);
		orderVo.setMidx_mo(midx_mo);
		orderVo.setPbidx_co(pbidxList.get(i));	
		orderVo.setOrder_id(merchant_uid);
		orderService.add_order(orderVo);
		cartService.del_cart(orderVo);
		int oidx = orderService.getoidx(orderVo);
		delVo.setOidx_od(oidx);
		delVo.setD_addr1(addr1);
		delVo.setD_addr2(addr2);
		delVo.setD_addrcode(addrcode);
		delService.add_Del(delVo);
		}
		
		int count = cartService.cart_count(midx_mo);
		session.setAttribute("result_", count);
		pbidxList.removeAll(pbidxList);
		session.setAttribute("pbidxList", pbidxList);
		pidx_pc_arr = cartService.cart_pidx_pc(midx_mo);
		for(Integer mmm : pidx_pc_arr) {
			System.out.println("pidx: "+ mmm);}
		session.setAttribute("pidx_pc_arr", pidx_pc_arr);
		
		
	
		return "order/orderSuccess";
	}
	
	@PostMapping("/orderWaiting.do")
	public String orderWaiting(@RequestParam("pay_method") String pay_method, 
			@RequestParam("pay_amount") int paid_amount,@RequestParam("pay_findate") Long pay_at,
			@RequestParam("status") String pay_status,@RequestParam("merchant_uid") String merchant_uid,
			@RequestParam("addr1") String addr1,@RequestParam("addr2") String addr2,@RequestParam("addrcode") String addrcode,
			@RequestParam("vbank_num") String vbank_num,@RequestParam("vbank_name") String vbank_name,
			@RequestParam("vbank_holder") String vbank_holder,@RequestParam("vbank_date") String vbank_date,
			HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		

		List<Integer> pbidxList = (List<Integer>)session.getAttribute("pbidxList");
		ArrayList<Integer> pidx_pc_arr = new ArrayList<Integer>();
		pidx_pc_arr = (ArrayList<Integer>) session.getAttribute("pidx_pc_arr");
	System.out.println(pay_method);
	System.out.println(paid_amount);
	System.out.println(pay_at);
	System.out.println(pay_status);
	System.out.println(merchant_uid);
	System.out.println(vbank_date);
	
	int midx_mo=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
	Long pay_findate = pay_at *1000;
	
	Date date = new Date(pay_findate);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date_ = format.format(date);

	System.out.println(date_);
	String orderpay_check;
	if(pay_status.equals("paid")) {
		 orderpay_check = "Y"; 
		
		
	}else if(pay_status.equals("ready")){
		 orderpay_check = "W";
		
	}else if(pay_status.equals("failed")){
		 orderpay_check = "F";
			
	} else{
		 orderpay_check = "N";
	};
	
	
	OrderVo orderVo = new OrderVo();
	DelVo delVo = new DelVo();
	for(int i=0; i<pbidxList.size();i++) {
	
	
	orderVo.setPay_way(pay_method);
	orderVo.setP_price(paid_amount);
	orderVo.setPay_findate(date_);
	orderVo.setP_check(orderpay_check);
	orderVo.setMidx_mo(midx_mo);
	orderVo.setPbidx_co(pbidxList.get(i));	
	orderVo.setOrder_id(merchant_uid);
	orderVo.setVbank_date(vbank_date);
	orderVo.setVbank_holder(vbank_holder);
	orderVo.setVbank_name(vbank_name);
	orderVo.setVbank_num(vbank_num);
	
	orderService.add_order(orderVo);
	cartService.del_cart(orderVo);
	int oidx = orderService.getoidx(orderVo);
	delVo.setOidx_od(oidx);
	delVo.setD_addr1(addr1);
	delVo.setD_addr2(addr2);
	delVo.setD_addrcode(addrcode);
	delService.add_Del(delVo);
	}
	
	int count = cartService.cart_count(midx_mo);
	session.setAttribute("result_", count);
	pbidxList.removeAll(pbidxList);
	for(Integer mmm : pbidxList) {
		System.out.println("pbidx: "+ mmm);}
	session.setAttribute("pbidxList", pbidxList);
	pidx_pc_arr = cartService.cart_pidx_pc(midx_mo);
	for(Integer mmm : pidx_pc_arr) {
		System.out.println("pidx: "+ mmm);}
	session.setAttribute("pidx_pc_arr", pidx_pc_arr);
		
		
	model.addAttribute("bank_date", vbank_date);
	model.addAttribute("bank_holder", vbank_holder);
	model.addAttribute("bank_name", vbank_name);
	model.addAttribute("bank_num", vbank_num);
		
		
		
		
		
		
		return "order/orderWaiting";
	}
	
	
	
	
	
	
	
	
	
	
}

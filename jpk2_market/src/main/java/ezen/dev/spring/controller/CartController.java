package ezen.dev.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.service.CartService;
import ezen.dev.spring.service.ProductService;
import ezen.dev.spring.vo.CartVo;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Controller
public class CartController {
	
	private CartService cartService;
	
	@Autowired 
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	

	@GetMapping("/cart_main.do")
	public String cart_main(Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		CartVo cartVo = cartService.getCartInfo(member_id);
		//Spring MVC占쎈퓠占쎄퐣 Controller占쎈퓠占쎄퐣 占쎄문占쎄쉐占쎈┷占쎈뮉 Model揶쏆빘猿쒙옙�뮉 �뀎怨뺣뼊(JSP占쎈읂占쎌뵠筌욑옙)占쎈퓠占쎄퐣 筌〓챷�� 揶쏉옙占쎈뮟
		model.addAttribute("cartVo", cartVo);
		
		return "cart/cartmain";
	}
	
	

	
	
	
	}


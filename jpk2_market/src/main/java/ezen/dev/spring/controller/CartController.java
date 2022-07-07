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
		Integer midx =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		List<CartVo> cartList = cartService.getCartList(midx);		
		model.addAttribute("cartList", cartList);
		
		return "cart/cart_main";
	}
	
	

	
	
	
	}


package ezen.dev.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;

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
	
	private ProductService productService;
	@Autowired 
	public void setProductService(ProductService productService) {
		this.productService = productService;
		
	}
	


	@GetMapping("/cart_main.do")
	public String cart_main(Model model, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		Integer midx =Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		
		List<CartVo> cartList = cartService.getCartList(midx);		
		model.addAttribute("cartList", cartList);
		
		return "cart/cart_main";
	}
	
	@PostMapping("/addCartProcess.do")
	public String productAddProcess( Integer pidx_pc , String p_amount, Integer midx_mc,  Model model, HttpServletRequest request)  {
		
		HttpSession session = request.getSession();
		
		int result=0;
		
		midx_mc=Integer.parseInt(String.valueOf(session.getAttribute("midx")));
		int p_amount_ = Integer.parseInt(p_amount);
		CartVo cartVo = new CartVo();
		cartVo.setP_amount(p_amount_);
		cartVo.setMidx_mc(midx_mc);
		cartVo.setPidx_pc(pidx_pc);
		
		String pidx_pc_=Integer.toString(pidx_pc);
		
        ProductVo productVo = productService.getProductInfo(pidx_pc_);
		
		model.addAttribute("productVo",productVo);

		result = cartService.addCart(cartVo);
		String viewPage="product/product_detail";

		if(result ==1) {
			model.addAttribute("p_amount",p_amount_);
			model.addAttribute("midx_mc",midx_mc);
			model.addAttribute("pidx_pc",pidx_pc);
			
			
			
			viewPage = "product/product_detail";
		}
		return viewPage;
	}
	

	
	
	
	}


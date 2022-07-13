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
	// 컨트롤러 - Service - dao는 반드시 1:1:1 매칭이 되어야 하는것은 아니다.
	// 지금처럼 한 컨트롤러에 2개의 서비스를 연결하는것도 가능하다. 주로 사용하는 Service는 생성자방식, 사용 빈도수가 낮은 Service는 set방식으로 객체 주입을 한다.


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
		//session 값은  object형으로 Integer형으로 바꾸기 위해 String을 거치고 parseInt를 통해 Integer로 바꾼다.
		int p_amount_ = Integer.parseInt(p_amount);
		//String형인 P_amount를 int형으로 바꾼다.
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


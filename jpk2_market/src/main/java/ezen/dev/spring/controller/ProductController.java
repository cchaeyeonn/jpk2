package ezen.dev.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.service.ProductService;
import ezen.dev.spring.vo.MemberVo;
import ezen.dev.spring.vo.ProductVo;

@Controller
public class ProductController {
	
	private ProductService productService;
	
	@Autowired 
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	

	@GetMapping("/product.do") public String product()
	{ return "product/product_detail"; }

	@RequestMapping(value="/Product.do")
	public String ProductInfo(Model model, HttpServletRequest request) {
		//占쎌돳占쎌뜚占쎌젟癰귣�占쏙옙 揶쏉옙占쎌죬占쎌궎疫뀐옙 占쎌맄占쎈퉸 占쎄쉭占쎈�▼첎�빘猿쒙옙肉� 占쏙옙占쎌삢占쎈쭆 member_id 占쎌뵠占쎌뒠
		HttpSession session = request.getSession();
		String p_name = (String)session.getAttribute("p_name");
		
		ProductVo productVo = productService.getProductInfo(p_name);
		model.addAttribute("productVo", productVo);
		
		return "product/product";
	}
	
	
}

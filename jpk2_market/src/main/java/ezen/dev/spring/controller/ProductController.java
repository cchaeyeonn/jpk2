package ezen.dev.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	

	@GetMapping("/product_detail.do")
	public String product_Detail(@RequestParam String pidx, Model model, HttpServletRequest request){
		
		
//		String pidx = (String)session.getAttribute("productVo.pidx");

		ProductVo productVo = productService.getProductInfo(pidx);
		
		model.addAttribute("productVo",productVo);
		
		return "product/product_detail";
	}

	
	@GetMapping("/productList.do")
	public String getProductList(Model model) {
		
		List<ProductVo> productList = productService.getProductList();
		
		model.addAttribute("productList",productList);
		
		return "product/product_list";
		}
	
	}


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

	
	@GetMapping("/productList.do")
	public String getMemberList(Model model) {
		
		List<ProductVo> productList = productService.getProductList();
		//紐⑤뜽媛앹껜�뿉 �쉶�썝紐⑸줉�쓣 異붽��븿
		model.addAttribute("productList",productList);
		
		return "product/product_list";
	}


	
	
}

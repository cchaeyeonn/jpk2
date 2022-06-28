package ezen.dev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import ezen.dev.spring.service.AdminService;
import ezen.dev.spring.service.ProductService;
import ezen.dev.spring.vo.MemberVo;

@Controller
public class ProductController {
	
	private ProductService productService;
	
	@Autowired 
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	@GetMapping("/product.do")//get방식 요청 처리
	public String product() {
		return "product/product";
	}
	
	
	
	
}
